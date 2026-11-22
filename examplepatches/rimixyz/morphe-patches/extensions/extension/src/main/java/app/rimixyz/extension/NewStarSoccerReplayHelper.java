package app.rimixyz.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.net.Uri;
import android.opengl.GLES10;
import android.os.Build;
import android.os.Environment;
import android.provider.MediaStore;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.Surface;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.TimeUnit;

/**
 * Replays aprimorados + exportação nativa de replays para MP4 (H.264) e GIF animado
 * no New Star Soccer 4.34 (Android 6–16, zero dependências externas).
 *
 * Arquitetura confirmada no DEX:
 *  - Os quadros do replay são gravados a 60 FPS em `c_TBall.m_replayFrames`,
 *    `c_TMatchPlayer.m_replayFrames`, `c_MatchArrow.m_replayFrames` e `c_GSMatchChanceAddons`.
 *  - `c_TMatch.m_UpdateReplay()` roda na Main Thread (via `BBAndroidGame$GameTimer`) e aplica o
 *    quadro `int(WatchReplay.Frame)`.
 *  - `BBAndroidGame.onDrawFrame(GL10)` roda na GLThread e desenha o frame via `RenderGame()`.
 *  - `AndroidGame.onWindowFocusChanged(false)` pausa a GLThread se um AlertDialog estiver aberto;
 *    por isso o progresso de exportação usa um overlay filho em `android.R.id.content` (sem roubar
 *    foco da janela e fora do backbuffer OpenGL capturado por `GLES10.glReadPixels`).
 *  - `c_MinigameHud.m_ReplayOptions` (`controlpanel.uih`) é ocultado durante a captura para gerar
 *    vídeos e GIFs limpos em tela cheia, sem barra de controles nem botões.
 */
@SuppressWarnings("unused")
public final class NewStarSoccerReplayHelper {

    private static final String TAG = "RimiNSSReplay";
    private static final String GAME_PKG = "com.newstargames.newstarsoccer.";

    private static final String GADGET_STUDIO = "watchreplay.studio";
    private static final String GADGET_EXIT = "watchreplay.exit";

    private static final String PREFS_NAME = "rimi_nss_replays";
    private static final String KEY_SPEED = "speed";
    private static final String KEY_LOOP = "loop";
    private static final String KEY_SHOW_SLOMO_FX = "show_slomo_fx";
    private static final String KEY_OFFER_ALL = "offer_all_chances";

    private static final float[] SPEED_PRESETS = {0.25f, 0.5f, 0.75f, 1.0f, 1.5f, 2.0f};
    private static final String[] SPEED_LABELS = {
            "0.25x (Super lenta)",
            "0.5x (Câmera lenta)",
            "0.75x (Lenta suave)",
            "1.0x (Normal)",
            "1.5x (Rápida)",
            "2.0x (Muito rápida)"
    };

    private static final int REQ_SAVE_MP4 = 0x5255;
    private static final int REQ_SAVE_GIF = 0x5256;

    private static final int MODE_MP4_30 = 1;
    private static final int MODE_MP4_60 = 2;
    private static final int MODE_MP4_SLOMO = 3;
    private static final int MODE_GIF = 4;

    private static final int STATE_IDLE = 0;
    private static final int STATE_WARMUP = 1;
    private static final int STATE_PREP_FRAME = 2;
    private static final int STATE_WAIT_CAPTURE = 3;
    private static final int STATE_FINISHING = 4;

    private static final int[] POISON_PILL = new int[0];

    // Preferências em cache para leitura rápida no loop de 60Hz.
    private static volatile boolean prefsLoaded = false;
    private static volatile float prefSpeed = 1.0f;
    private static volatile boolean prefLoop = true;
    private static volatile boolean prefShowSloMoFx = false;
    private static volatile boolean prefOfferAllChances = false;

    // Estado da sessão ativa de exportação.
    private static final Object EXPORT_LOCK = new Object();
    private static final Object GL_LOCK = new Object();
    private static volatile int exportState = STATE_IDLE;
    private static volatile boolean exportCancelled = false;
    private static volatile boolean exportCancelToast = false;
    private static volatile String exportErrorMessage = null;
    private static volatile int exportMode = MODE_MP4_30;
    private static volatile float exportFrameStep = 2.0f;
    private static volatile int exportTargetFps = 30;
    private static volatile float exportCurrentFrame = 0.0f;
    private static volatile float exportTotalFrames = 0.0f;
    private static volatile int exportExpectedCount = 1;
    private static volatile int exportCapturedCount = 0;
    private static volatile int warmupTicksRemaining = 0;

    // Estado original do replay salvo antes da exportação para restauração limpa.
    private static float savedFrame = 0.0f;
    private static float savedSpeed = 1.0f;
    private static float savedPaused = 0.0f;
    private static float savedLoop = 1.0f;

    // Recursos da captura GL (acessados apenas na GLThread durante uma sessão ativa).
    private static boolean glSessionReady = false;
    private static int glSurfW = 0;
    private static int glSurfH = 0;
    private static int glOutW = 0;
    private static int glOutH = 0;
    private static ByteBuffer glReadBuf = null;
    private static byte[] glRawBytes = null;
    private static int[] glSxTable = null;
    private static int[] glSyRowBase = null;
    private static boolean glBoxDownscale = false;

    private static ArrayBlockingQueue<int[]> freeBuffers = null;
    private static ArrayBlockingQueue<int[]> encodeQueue = null;
    private static Thread encoderThread = null;

    // UI de progresso (Main Thread).
    private static View progressOverlay = null;
    private static TextView progressLabel = null;
    private static ProgressBar progressBar = null;

    // Arquivo temporário pronto aguardando salvamento via SAF ou Galeria.
    private static volatile File pendingExportFile = null;
    private static volatile String pendingExportMime = null;
    private static volatile String pendingExportName = null;

    // Cache de reflexão para evitar lookups repetidos a 60 FPS.
    private static Class<?> clsTMatch;
    private static Class<?> clsTweakFloat;
    private static Field fldTweakValue;
    private static Field fldReplayFrame;
    private static Field fldReplaySpeed;
    private static Field fldReplayLength;
    private static Field fldReplayLoop;
    private static Field fldReplayPaused;
    private static Field fldAllowReplay;
    private static Method mtdTweakGet;
    private static Method mtdTweakSet;
    private static Method mtdGetGameView;

    private NewStarSoccerReplayHelper() {}

    // =========================================================================
    // Pontos de entrada chamados pelo bytecode injetado
    // =========================================================================

    /**
     * Chamado em `c_TMatch.m_StartReplay()` após os tweaks `WatchReplay.*` serem inicializados
     * e antes da checagem de onboarding (`Player.ReplayActive < 3`).
     */
    public static void onReplayStarted() {
        try {
            ensurePrefsLoaded();
            ensureReflectionReady();
            setTMatchTweak(fldReplaySpeed, prefSpeed);
            setTMatchTweak(fldReplayLoop, prefLoop ? 1.0f : 0.0f);
            setNamedTweak("WatchReplay", "ReplayScan", prefShowSloMoFx ? 1.0f : 0.0f);
        } catch (Throwable t) {
            Log.e(TAG, "onReplayStarted failed", t);
        }
    }

    /**
     * Chamado no início de `c_MatchChance.m_ShowWatchReplay()`.
     * Se o usuário ativou "Replay em todos os lances", libera o botão de replay para qualquer
     * lance que tenha quadros gravados (gols, assistências, chutes na trave, defesas, etc.).
     */
    public static void beforeShowWatchReplay() {
        try {
            ensurePrefsLoaded();
            if (!prefOfferAllChances) {
                return;
            }
            if (getRecordedReplayFrameCount() > 10) {
                ensureReflectionReady();
                if (fldAllowReplay != null) {
                    fldAllowReplay.setBoolean(null, true);
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "beforeShowWatchReplay failed", t);
        }
    }

    /**
     * Chamado no início de `c_TMatch.m_UpdateReplay()` na Main Thread.
     */
    public static void beforeUpdateReplay() {
        try {
            int state = exportState;
            if (state == STATE_IDLE) {
                if (!prefLoop && prefsLoaded) {
                    // controlpanel.uih reativa Loop=1 ao soltar o slider; mantém preferência do usuário.
                    float pressing = getNamedTweak("WatchReplay", "PressingTimeline", 0.0f);
                    if (pressing == 0.0f) {
                        ensureReflectionReady();
                        if (getTMatchTweak(fldReplayLoop, 1.0f) != 0.0f) {
                            setTMatchTweak(fldReplayLoop, 0.0f);
                        }
                    }
                }
                return;
            }

            ensureReflectionReady();
            setTMatchTweak(fldReplayPaused, 1.0f);
            setTMatchTweak(fldReplayFrame, exportCurrentFrame);

            if (state == STATE_WARMUP) {
                if (warmupTicksRemaining > 0) {
                    warmupTicksRemaining--;
                } else {
                    exportState = STATE_WAIT_CAPTURE;
                }
            } else if (state == STATE_PREP_FRAME) {
                exportState = STATE_WAIT_CAPTURE;
            }
        } catch (Throwable t) {
            Log.e(TAG, "beforeUpdateReplay failed", t);
        }
    }

    /**
     * Chamado em `BBAndroidGame.onDrawFrame(GL10)` na GLThread logo após `RenderGame()`.
     */
    public static void afterDrawFrame(Object bbAndroidGame) {
        if (exportState != STATE_WAIT_CAPTURE) {
            return;
        }
        synchronized (GL_LOCK) {
            if (exportState != STATE_WAIT_CAPTURE) {
                return;
            }
            try {
                if (exportCancelled) {
                    finishCaptureQueue();
                    return;
                }

                View view = getGameView(bbAndroidGame);
                if (view == null) {
                    failExportFromAnyThread("Surface OpenGL indisponível.");
                    return;
                }
                int surfW = view.getWidth();
                int surfH = view.getHeight();
                if (surfW <= 0 || surfH <= 0) {
                    failExportFromAnyThread("Dimensões de tela inválidas para captura.");
                    return;
                }

                if (!glSessionReady) {
                    if (!initGlExportSession(surfW, surfH)) {
                        failExportFromAnyThread("Falha ao inicializar codificador de vídeo.");
                        return;
                    }
                } else if (surfW != glSurfW || surfH != glSurfH) {
                    failExportFromAnyThread("A tela mudou de tamanho durante a exportação.");
                    return;
                }

                glReadBuf.rewind();
                GLES10.glReadPixels(0, 0, glSurfW, glSurfH, GLES10.GL_RGBA, GLES10.GL_UNSIGNED_BYTE, glReadBuf);
                glReadBuf.rewind();
                glReadBuf.get(glRawBytes);

                int[] framePixels = freeBuffers.poll(3, TimeUnit.SECONDS);
                if (framePixels == null || framePixels == POISON_PILL) {
                    if (exportCancelled) {
                        finishCaptureQueue();
                    } else {
                        failExportFromAnyThread("Tempo esgotado aguardando o codificador.");
                    }
                    return;
                }

                convertFlipAndScale(glRawBytes, framePixels);

                if (!encodeQueue.offer(framePixels, 3, TimeUnit.SECONDS)) {
                    freeBuffers.offer(framePixels);
                    failExportFromAnyThread("Fila do codificador congestionada.");
                    return;
                }

                exportCapturedCount++;
                exportCurrentFrame += exportFrameStep;

                final int pct = Math.min(99, (exportCapturedCount * 100) / Math.max(1, exportExpectedCount));
                updateProgressOverlay(pct);

                if (exportCancelled || exportCurrentFrame > exportTotalFrames + 0.001f) {
                    finishCaptureQueue();
                } else {
                    exportState = STATE_PREP_FRAME;
                }
            } catch (Throwable t) {
                Log.e(TAG, "afterDrawFrame capture error", t);
                failExportFromAnyThread("Erro na captura OpenGL: " + t.getMessage());
            }
        }
    }

    /**
     * Chamado no início de `bb_sigui.g_HitGadget(String, String)`.
     */
    public static boolean handleHitGadget(String gadgetName) {
        if (GADGET_STUDIO.equals(gadgetName)) {
            if (exportState == STATE_IDLE) {
                openReplayStudioDialog();
            }
            return true;
        }
        if (GADGET_EXIT.equals(gadgetName)) {
            if (exportState != STATE_IDLE) {
                cancelExportInternal(false);
            }
            return false; // Permite que o jogo encerre o replay normalmente.
        }
        return false;
    }

    /**
     * Chamado no início de `bb_GSMatchUtility.g_GSButtonEndReplay()` (botão X ou Voltar do Android).
     */
    public static void onReplayEnded() {
        if (exportState != STATE_IDLE) {
            cancelExportInternal(false);
        }
    }

    /**
     * Chamado no início de `AndroidGame.onActivityResult(int, int, Intent)`.
     */
    public static boolean onActivityResult(Activity activity, int requestCode, int resultCode, Intent data) {
        if (requestCode != REQ_SAVE_MP4 && requestCode != REQ_SAVE_GIF) {
            return false;
        }
        File src = pendingExportFile;
        String name = pendingExportName;
        pendingExportFile = null;
        pendingExportMime = null;
        pendingExportName = null;

        if (resultCode != Activity.RESULT_OK || data == null || data.getData() == null) {
            deleteQuietly(src);
            showToast(activity, "Salvamento cancelado.");
            return true;
        }
        if (src == null || !src.isFile()) {
            showToast(activity, "Arquivo temporário do replay não encontrado.");
            return true;
        }

        Uri uri = data.getData();
        try {
            long bytes = copyFileToUri(activity.getContentResolver(), src, uri);
            deleteQuietly(src);
            showToast(activity, "Replay salvo! (" + formatSize(bytes) + ")");
        } catch (Throwable t) {
            Log.e(TAG, "Failed saving replay via SAF", t);
            deleteQuietly(src);
            showToast(activity, "Erro ao salvar arquivo: " + t.getMessage());
        }
        return true;
    }

    // =========================================================================
    // Menu nativo "Replay Studio"
    // =========================================================================

    private static void openReplayStudioDialog() {
        final Activity activity = getActivity();
        if (activity == null || activity.isFinishing()) {
            return;
        }
        ensurePrefsLoaded();
        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                if (activity.isFinishing()) {
                    return;
                }
                showMainStudioDialog(activity);
            }
        });
    }

    private static void showMainStudioDialog(final Activity activity) {
        String speedStr = formatSpeed(prefSpeed);
        String loopStr = prefLoop ? "Ligado" : "Desligado";
        String fxStr = prefShowSloMoFx ? "Visíveis" : "Ocultos (limpo)";
        String allStr = prefOfferAllChances ? "Todos os lances" : "Apenas gols";

        String[] items = new String[]{
                "Exportar MP4 (Normal • 30 FPS)",
                "Exportar MP4 (Alta fluidez • 60 FPS)",
                "Exportar MP4 (Câmera lenta • 0.5x)",
                "Exportar GIF animado (Loop)",
                "Velocidade do replay: " + speedStr,
                "Loop automático: " + loopStr,
                "Efeitos de câmera lenta: " + fxStr,
                "Oferecer replay em: " + allStr
        };

        new AlertDialog.Builder(activity)
                .setTitle("Replay Studio")
                .setItems(items, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        switch (which) {
                            case 0:
                                scheduleExportStart(activity, MODE_MP4_30);
                                break;
                            case 1:
                                scheduleExportStart(activity, MODE_MP4_60);
                                break;
                            case 2:
                                scheduleExportStart(activity, MODE_MP4_SLOMO);
                                break;
                            case 3:
                                scheduleExportStart(activity, MODE_GIF);
                                break;
                            case 4:
                                showSpeedPickerDialog(activity);
                                break;
                            case 5:
                                prefLoop = !prefLoop;
                                savePrefs(activity);
                                applyLiveReplaySettings();
                                showMainStudioDialog(activity);
                                break;
                            case 6:
                                prefShowSloMoFx = !prefShowSloMoFx;
                                savePrefs(activity);
                                applyLiveReplaySettings();
                                showMainStudioDialog(activity);
                                break;
                            case 7:
                                prefOfferAllChances = !prefOfferAllChances;
                                savePrefs(activity);
                                showMainStudioDialog(activity);
                                break;
                            default:
                                break;
                        }
                    }
                })
                .setNegativeButton("Fechar", null)
                .show();
    }

    private static void showSpeedPickerDialog(final Activity activity) {
        int checked = 3;
        for (int i = 0; i < SPEED_PRESETS.length; i++) {
            if (Math.abs(SPEED_PRESETS[i] - prefSpeed) < 0.02f) {
                checked = i;
                break;
            }
        }
        new AlertDialog.Builder(activity)
                .setTitle("Velocidade do replay")
                .setSingleChoiceItems(SPEED_LABELS, checked, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        prefSpeed = SPEED_PRESETS[which];
                        savePrefs(activity);
                        applyLiveReplaySettings();
                        dialog.dismiss();
                        showMainStudioDialog(activity);
                    }
                })
                .setNegativeButton("Voltar", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        showMainStudioDialog(activity);
                    }
                })
                .show();
    }

    private static void applyLiveReplaySettings() {
        try {
            ensureReflectionReady();
            setTMatchTweak(fldReplaySpeed, prefSpeed);
            setTMatchTweak(fldReplayLoop, prefLoop ? 1.0f : 0.0f);
            setNamedTweak("WatchReplay", "ReplayScan", prefShowSloMoFx ? 1.0f : 0.0f);
        } catch (Throwable t) {
            Log.e(TAG, "applyLiveReplaySettings failed", t);
        }
    }

    // =========================================================================
    // Orquestração da captura e exportação
    // =========================================================================

    private static void scheduleExportStart(final Activity activity, final int mode) {
        // Aguarda o AlertDialog fechar completamente para que AndroidGame retome o foco e a GLThread.
        View content = activity.findViewById(android.R.id.content);
        Runnable startTask = new Runnable() {
            @Override
            public void run() {
                startExportOnUiThread(activity, mode);
            }
        };
        if (content != null) {
            content.postDelayed(startTask, 150L);
        } else {
            activity.runOnUiThread(startTask);
        }
    }

    private static void startExportOnUiThread(final Activity activity, int mode) {
        synchronized (EXPORT_LOCK) {
            if (exportState != STATE_IDLE) {
                return;
            }
            try {
                ensureReflectionReady();
                float length = getTMatchTweak(fldReplayLength, 0.0f);
                if (length < 2.0f) {
                    showToast(activity, "Nenhum quadro de replay disponível para exportar.");
                    return;
                }

                // Limpa eventual arquivo temporário anterior.
                deleteQuietly(pendingExportFile);
                pendingExportFile = null;

                // Salva estado atual do replay para restaurar depois.
                savedFrame = getTMatchTweak(fldReplayFrame, 0.0f);
                savedSpeed = getTMatchTweak(fldReplaySpeed, prefSpeed);
                savedPaused = getTMatchTweak(fldReplayPaused, 0.0f);
                savedLoop = getTMatchTweak(fldReplayLoop, prefLoop ? 1.0f : 0.0f);

                exportMode = mode;
                if (mode == MODE_MP4_30) {
                    exportFrameStep = 2.0f;
                    exportTargetFps = 30;
                } else if (mode == MODE_MP4_60) {
                    exportFrameStep = 1.0f;
                    exportTargetFps = 60;
                } else if (mode == MODE_MP4_SLOMO) {
                    exportFrameStep = 1.0f;
                    exportTargetFps = 30;
                } else {
                    exportFrameStep = 4.0f;
                    exportTargetFps = 15;
                }

                exportTotalFrames = length;
                exportCurrentFrame = 0.0f;
                exportCapturedCount = 0;
                exportExpectedCount = Math.max(1, (int) Math.floor(length / exportFrameStep) + 1);
                exportCancelled = false;
                exportCancelToast = false;
                exportErrorMessage = null;
                glSessionReady = false;
                warmupTicksRemaining = 2; // 2 ticks para garantir HUD oculto antes do frame 0.

                // Oculta a barra de controles do replay (deixa o vídeo 100% limpo).
                setReplayOptionsVisible(false);
                setTMatchTweak(fldReplayPaused, 1.0f);
                setTMatchTweak(fldReplayFrame, 0.0f);

                showProgressOverlay(activity, mode);
                exportState = STATE_WARMUP;
            } catch (Throwable t) {
                Log.e(TAG, "Failed to start export", t);
                exportState = STATE_IDLE;
                setReplayOptionsVisible(true);
                removeProgressOverlay(activity);
                showToast(activity, "Erro ao iniciar exportação: " + t.getMessage());
            }
        }
    }

    private static boolean initGlExportSession(int surfW, int surfH) {
        final Activity activity = getActivity();
        if (activity == null) {
            return false;
        }
        final boolean isGif = (exportMode == MODE_GIF);
        int outW;
        int outH;
        if (isGif) {
            int maxW = Math.min(320, surfW);
            float scale = (float) maxW / (float) surfW;
            outW = Math.max(120, maxW & ~1);
            outH = Math.max(120, Math.round(surfH * scale) & ~1);
        } else {
            int shortSide = Math.min(surfW, surfH);
            int targetShort = Math.min(544, shortSide);
            float scale = (float) targetShort / (float) shortSide;
            // Múltiplos de 16 garantem compatibilidade universal com encoders H.264 Android.
            outW = Math.max(160, (Math.round(surfW * scale) & ~15));
            outH = Math.max(160, (Math.round(surfH * scale) & ~15));
        }

        glSurfW = surfW;
        glSurfH = surfH;
        glOutW = outW;
        glOutH = outH;

        glReadBuf = ByteBuffer.allocateDirect(surfW * surfH * 4);
        glRawBytes = new byte[surfW * surfH * 4];
        glSxTable = new int[outW];
        glSyRowBase = new int[outH];
        for (int dx = 0; dx < outW; dx++) {
            int sx = (int) (((long) dx * surfW) / outW);
            if (sx >= surfW) sx = surfW - 1;
            glSxTable[dx] = sx * 4;
        }
        for (int dy = 0; dy < outH; dy++) {
            int sy = (surfH - 1) - (int) (((long) dy * surfH) / outH);
            if (sy < 0) sy = 0;
            if (sy >= surfH) sy = surfH - 1;
            glSyRowBase[dy] = sy * surfW * 4;
        }
        glBoxDownscale = (surfW >= outW * 2 && surfH >= outH * 2);

        freeBuffers = new ArrayBlockingQueue<>(3);
        encodeQueue = new ArrayBlockingQueue<>(3);
        for (int i = 0; i < 3; i++) {
            freeBuffers.offer(new int[outW * outH]);
        }

        final String ext = isGif ? ".gif" : ".mp4";
        final String mime = isGif ? "image/gif" : "video/mp4";
        final String stamp = new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US).format(new Date());
        final String suffix = (exportMode == MODE_MP4_SLOMO) ? "_SlowMo" : "";
        final String suggestedName = "NSS_Replay" + suffix + "_" + stamp + ext;
        final File outFile = new File(activity.getCacheDir(), "nss_replay_export" + ext);
        deleteQuietly(outFile);

        final int fOutW = outW;
        final int fOutH = outH;
        final int fFps = exportTargetFps;
        final ArrayBlockingQueue<int[]> fFree = freeBuffers;
        final ArrayBlockingQueue<int[]> fQueue = encodeQueue;

        encoderThread = new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    if (isGif) {
                        runGifEncoder(outFile, fOutW, fOutH, fFps, fQueue, fFree);
                    } else {
                        runMp4Encoder(outFile, fOutW, fOutH, fFps, fQueue, fFree);
                    }
                    if (exportCancelled) {
                        deleteQuietly(outFile);
                        finishExportOnUiThread(activity, null, null, null, exportErrorMessage);
                    } else {
                        finishExportOnUiThread(activity, outFile, mime, suggestedName, null);
                    }
                } catch (Throwable t) {
                    Log.e(TAG, "Encoder worker failed", t);
                    deleteQuietly(outFile);
                    finishExportOnUiThread(activity, null, null, null,
                            "Falha ao codificar " + (isGif ? "GIF" : "MP4") + ": " + t.getMessage());
                }
            }
        }, "RimiNSSReplayEncoder");
        encoderThread.start();
        glSessionReady = true;
        return true;
    }

    private static void convertFlipAndScale(byte[] srcRgba, int[] dstArgb) {
        final int outW = glOutW;
        final int outH = glOutH;
        final int[] sxTable = glSxTable;
        final int[] syRowBase = glSyRowBase;
        final int rowStride = glSurfW * 4;

        if (glBoxDownscale) {
            // Filtro 2x2 simples reduz serrilhado das linhas do campo ao reduzir resolução.
            final int maxRowStart = (glSurfH - 1) * rowStride;
            final int maxColByte = (glSurfW - 1) * 4;
            for (int dy = 0; dy < outH; dy++) {
                int r0 = syRowBase[dy];
                int r1 = (r0 >= rowStride) ? (r0 - rowStride) : r0;
                int dstRow = dy * outW;
                for (int dx = 0; dx < outW; dx++) {
                    int c0 = sxTable[dx];
                    int c1 = (c0 < maxColByte) ? (c0 + 4) : c0;
                    int p00 = r0 + c0;
                    int p01 = r0 + c1;
                    int p10 = r1 + c0;
                    int p11 = r1 + c1;
                    int r = ((srcRgba[p00] & 0xFF) + (srcRgba[p01] & 0xFF)
                            + (srcRgba[p10] & 0xFF) + (srcRgba[p11] & 0xFF)) >>> 2;
                    int g = ((srcRgba[p00 + 1] & 0xFF) + (srcRgba[p01 + 1] & 0xFF)
                            + (srcRgba[p10 + 1] & 0xFF) + (srcRgba[p11 + 1] & 0xFF)) >>> 2;
                    int b = ((srcRgba[p00 + 2] & 0xFF) + (srcRgba[p01 + 2] & 0xFF)
                            + (srcRgba[p10 + 2] & 0xFF) + (srcRgba[p11 + 2] & 0xFF)) >>> 2;
                    dstArgb[dstRow + dx] = 0xFF000000 | (r << 16) | (g << 8) | b;
                }
            }
        } else {
            for (int dy = 0; dy < outH; dy++) {
                int rowBase = syRowBase[dy];
                int dstRow = dy * outW;
                for (int dx = 0; dx < outW; dx++) {
                    int p = rowBase + sxTable[dx];
                    int r = srcRgba[p] & 0xFF;
                    int g = srcRgba[p + 1] & 0xFF;
                    int b = srcRgba[p + 2] & 0xFF;
                    dstArgb[dstRow + dx] = 0xFF000000 | (r << 16) | (g << 8) | b;
                }
            }
        }
    }

    private static void finishCaptureQueue() {
        exportState = STATE_FINISHING;
        ArrayBlockingQueue<int[]> q = encodeQueue;
        if (q != null) {
            try {
                q.offer(POISON_PILL, 2, TimeUnit.SECONDS);
            } catch (InterruptedException ignored) {
                Thread.currentThread().interrupt();
            }
        }
    }

    private static void cancelExportInternal(boolean showToastMsg) {
        exportCancelled = true;
        exportCancelToast = showToastMsg;
        if (exportState == STATE_IDLE) {
            return;
        }
        exportState = STATE_FINISHING;

        boolean workerRunning = glSessionReady && encoderThread != null;
        ArrayBlockingQueue<int[]> pool = freeBuffers;
        if (pool != null) {
            pool.offer(POISON_PILL);
        }
        ArrayBlockingQueue<int[]> q = encodeQueue;
        if (q != null) {
            q.clear();
            q.offer(POISON_PILL);
        }

        if (!workerRunning) {
            // Cancelado ainda no warmup (antes do worker iniciar): limpa imediatamente na UI thread.
            final Activity activity = getActivity();
            if (activity != null) {
                finishExportOnUiThread(activity, null, null, null, null);
            } else {
                releaseGlBuffers();
                exportState = STATE_IDLE;
            }
        }
        // Quando workerRunning == true, o próprio encoderThread encerrará MediaCodec/GIF e chamará finishExportOnUiThread.
    }

    private static void failExportFromAnyThread(final String errorMessage) {
        exportErrorMessage = errorMessage;
        exportCancelled = true;
        exportCancelToast = false;
        boolean workerRunning = glSessionReady && encoderThread != null;
        finishCaptureQueue();
        if (!workerRunning) {
            final Activity activity = getActivity();
            if (activity != null) {
                finishExportOnUiThread(activity, null, null, null, errorMessage);
            } else {
                releaseGlBuffers();
                exportState = STATE_IDLE;
            }
        }
    }

    private static void finishExportOnUiThread(
            final Activity activity,
            final File outputFile,
            final String mimeType,
            final String suggestedName,
            final String errorMessage
    ) {
        final boolean showCancel = exportCancelled && exportCancelToast;
        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                removeProgressOverlay(activity);
                restoreReplayAfterExport();
                releaseGlBuffers();
                exportState = STATE_IDLE;

                if (errorMessage != null) {
                    showToast(activity, errorMessage);
                    return;
                }
                if (showCancel) {
                    showToast(activity, "Exportação cancelada.");
                    return;
                }
                if (outputFile == null || !outputFile.isFile() || outputFile.length() == 0L) {
                    return;
                }
                showExportCompleteDialog(activity, outputFile, mimeType, suggestedName);
            }
        });
    }

    private static void restoreReplayAfterExport() {
        try {
            ensureReflectionReady();
            setReplayOptionsVisible(true);
            setTMatchTweak(fldReplayFrame, savedFrame);
            setTMatchTweak(fldReplaySpeed, savedSpeed);
            setTMatchTweak(fldReplayPaused, savedPaused);
            setTMatchTweak(fldReplayLoop, savedLoop);
        } catch (Throwable t) {
            Log.e(TAG, "restoreReplayAfterExport failed", t);
        }
    }

    private static void releaseGlBuffers() {
        synchronized (GL_LOCK) {
            glSessionReady = false;
            glReadBuf = null;
            glRawBytes = null;
            glSxTable = null;
            glSyRowBase = null;
            freeBuffers = null;
            encodeQueue = null;
            encoderThread = null;
        }
    }

    // =========================================================================
    // Codificador MP4 (MediaCodec Surface + MediaMuxer)
    // =========================================================================

    private static void runMp4Encoder(
            File outFile,
            int width,
            int height,
            int fps,
            ArrayBlockingQueue<int[]> queue,
            ArrayBlockingQueue<int[]> pool
    ) throws IOException {
        MediaCodec encoder = null;
        Surface inputSurface = null;
        MediaMuxer muxer = null;
        Bitmap frameBitmap = null;
        boolean muxerStarted = false;

        try {
            encoder = MediaCodec.createEncoderByType("video/avc");
            int bitrate = (fps >= 50) ? 5_500_000 : 3_800_000;
            MediaFormat format = createAvcFormat(width, height, fps, bitrate);
            try {
                encoder.configure(format, null, null, MediaCodec.CONFIGURE_FLAG_ENCODE);
            } catch (Throwable primaryErr) {
                Log.w(TAG, "Primary AVC configure failed, retrying baseline bitrate", primaryErr);
                encoder.reset();
                MediaFormat fallback = createAvcFormat(width, height, fps, 2_000_000);
                encoder.configure(fallback, null, null, MediaCodec.CONFIGURE_FLAG_ENCODE);
            }

            inputSurface = encoder.createInputSurface();
            encoder.start();

            muxer = new MediaMuxer(outFile.getAbsolutePath(), MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4);
            MediaCodec.BufferInfo bufferInfo = new MediaCodec.BufferInfo();
            frameBitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);

            int[] trackAndCount = new int[]{-1, 0}; // [0] = trackIndex, [1] = writtenFrameIndex
            boolean[] muxerState = new boolean[]{false};

            while (true) {
                int[] pixels;
                try {
                    pixels = queue.poll(5, TimeUnit.SECONDS);
                } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt();
                    break;
                }
                if (pixels == null || pixels == POISON_PILL || exportCancelled) {
                    break;
                }

                frameBitmap.setPixels(pixels, 0, width, 0, 0, width, height);
                pool.offer(pixels);

                Canvas canvas = inputSurface.lockCanvas(null);
                try {
                    canvas.drawBitmap(frameBitmap, 0f, 0f, null);
                } finally {
                    inputSurface.unlockCanvasAndPost(canvas);
                }

                drainMediaCodec(encoder, muxer, bufferInfo, fps, trackAndCount, muxerState, false);
            }

            muxerStarted = muxerState[0];
            if (!exportCancelled) {
                encoder.signalEndOfInputStream();
                drainMediaCodec(encoder, muxer, bufferInfo, fps, trackAndCount, muxerState, true);
                muxerStarted = muxerState[0];
            }
            if (!exportCancelled && trackAndCount[1] == 0) {
                throw new IOException("Nenhum quadro foi gravado pelo codificador H.264.");
            }
        } finally {
            if (frameBitmap != null) {
                frameBitmap.recycle();
            }
            if (encoder != null) {
                try {
                    encoder.stop();
                } catch (Throwable ignored) {}
                try {
                    encoder.release();
                } catch (Throwable ignored) {}
            }
            if (inputSurface != null) {
                try {
                    inputSurface.release();
                } catch (Throwable ignored) {}
            }
            if (muxer != null) {
                if (muxerStarted) {
                    try {
                        muxer.stop();
                    } catch (Throwable ignored) {}
                }
                try {
                    muxer.release();
                } catch (Throwable ignored) {}
            }
        }
    }

    private static MediaFormat createAvcFormat(int width, int height, int fps, int bitrate) {
        MediaFormat format = MediaFormat.createVideoFormat("video/avc", width, height);
        format.setInteger(MediaFormat.KEY_COLOR_FORMAT, MediaCodecInfo.CodecCapabilities.COLOR_FormatSurface);
        format.setInteger(MediaFormat.KEY_BIT_RATE, bitrate);
        format.setInteger(MediaFormat.KEY_FRAME_RATE, fps);
        format.setInteger(MediaFormat.KEY_I_FRAME_INTERVAL, 1);
        if (Build.VERSION.SDK_INT >= 29) {
            format.setInteger("max-bframes", 0);
        }
        return format;
    }

    private static void drainMediaCodec(
            MediaCodec encoder,
            MediaMuxer muxer,
            MediaCodec.BufferInfo info,
            int fps,
            int[] trackAndCount,
            boolean[] muxerStarted,
            boolean endOfStream
    ) {
        int eosTries = 0;
        while (true) {
            int outputIndex = encoder.dequeueOutputBuffer(info, endOfStream ? 10_000L : 0L);
            if (outputIndex == MediaCodec.INFO_TRY_AGAIN_LATER) {
                if (!endOfStream) {
                    break;
                }
                eosTries++;
                if (eosTries > 300) { // Máximo ~3s aguardando EOS de codecs lentos
                    break;
                }
            } else if (outputIndex == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                if (!muxerStarted[0]) {
                    MediaFormat newFormat = encoder.getOutputFormat();
                    trackAndCount[0] = muxer.addTrack(newFormat);
                    muxer.start();
                    muxerStarted[0] = true;
                }
            } else if (outputIndex >= 0) {
                ByteBuffer encodedData = encoder.getOutputBuffer(outputIndex);
                if (encodedData != null) {
                    if ((info.flags & MediaCodec.BUFFER_FLAG_CODEC_CONFIG) != 0) {
                        info.size = 0;
                    }
                    if (info.size > 0 && muxerStarted[0]) {
                        encodedData.position(info.offset);
                        encodedData.limit(info.offset + info.size);
                        // Sobrescreve PTS com taxa constante (CFR) independente do tempo de captura.
                        info.presentationTimeUs = ((long) trackAndCount[1] * 1_000_000L) / fps;
                        trackAndCount[1]++;
                        muxer.writeSampleData(trackAndCount[0], encodedData, info);
                    }
                }
                encoder.releaseOutputBuffer(outputIndex, false);
                if ((info.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0) {
                    break;
                }
            }
        }
    }

    // =========================================================================
    // Codificador GIF animado (streaming via NewStarSoccerGifEncoder)
    // =========================================================================

    private static void runGifEncoder(
            File outFile,
            int width,
            int height,
            int fps,
            ArrayBlockingQueue<int[]> queue,
            ArrayBlockingQueue<int[]> pool
    ) throws IOException {
        FileOutputStream fos = new FileOutputStream(outFile);
        try {
            NewStarSoccerGifEncoder gif = new NewStarSoccerGifEncoder(fos, width, height, fps);
            int count = 0;
            while (true) {
                int[] pixels;
                try {
                    pixels = queue.poll(5, TimeUnit.SECONDS);
                } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt();
                    break;
                }
                if (pixels == null || pixels == POISON_PILL || exportCancelled) {
                    break;
                }
                gif.addFrame(pixels);
                pool.offer(pixels);
                count++;
            }
            if (!exportCancelled) {
                if (count == 0) {
                    throw new IOException("Nenhum quadro capturado para o GIF.");
                }
                gif.finish();
            }
        } finally {
            try {
                fos.close();
            } catch (IOException ignored) {}
        }
    }

    // =========================================================================
    // Entrega pós-exportação (Galeria MediaStore, Compartilhar, SAF)
    // =========================================================================

    private static void showExportCompleteDialog(
            final Activity activity,
            final File file,
            final String mimeType,
            final String suggestedName
    ) {
        if (activity.isFinishing()) {
            deleteQuietly(file);
            return;
        }
        final boolean isGif = "image/gif".equals(mimeType);
        final String formatLabel = isGif ? "GIF animado" : "Vídeo MP4";
        final String msg = formatLabel + " pronto!\n"
                + "Arquivo: " + suggestedName + "\n"
                + "Tamanho: " + formatSize(file.length()) + "\n"
                + "Quadros: " + exportCapturedCount;

        AlertDialog.Builder builder = new AlertDialog.Builder(activity)
                .setTitle("Replay exportado")
                .setMessage(msg)
                .setCancelable(false);

        if (Build.VERSION.SDK_INT >= 29) {
            builder.setPositiveButton("Salvar na Galeria", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    saveToGalleryAndOfferShare(activity, file, mimeType, suggestedName);
                }
            });
            builder.setNeutralButton("Salvar como...", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    launchSafSavePicker(activity, file, mimeType, suggestedName);
                }
            });
            builder.setNegativeButton("Descartar", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    deleteQuietly(file);
                }
            });
        } else {
            builder.setPositiveButton("Salvar arquivo...", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    launchSafSavePicker(activity, file, mimeType, suggestedName);
                }
            });
            builder.setNegativeButton("Descartar", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    deleteQuietly(file);
                }
            });
        }

        builder.show();
    }

    private static void saveToGalleryAndOfferShare(
            final Activity activity,
            final File file,
            final String mimeType,
            final String displayName
    ) {
        final boolean isGif = "image/gif".equals(mimeType);
        Uri collection = isGif
                ? MediaStore.Images.Media.EXTERNAL_CONTENT_URI
                : MediaStore.Video.Media.EXTERNAL_CONTENT_URI;
        String relDir = (isGif ? Environment.DIRECTORY_PICTURES : Environment.DIRECTORY_MOVIES)
                + File.separator + "NewStarSoccer";

        ContentValues values = new ContentValues();
        values.put(MediaStore.MediaColumns.DISPLAY_NAME, displayName);
        values.put(MediaStore.MediaColumns.MIME_TYPE, mimeType);
        values.put("relative_path", relDir);
        values.put("is_pending", 1);

        ContentResolver resolver = activity.getContentResolver();
        Uri itemUri = null;
        try {
            itemUri = resolver.insert(collection, values);
            if (itemUri == null) {
                throw new IOException("MediaStore retornou URI nula");
            }
            copyFileToUri(resolver, file, itemUri);
            ContentValues done = new ContentValues();
            done.put("is_pending", 0);
            resolver.update(itemUri, done, null, null);
            deleteQuietly(file);

            final Uri finalUri = itemUri;
            new AlertDialog.Builder(activity)
                    .setTitle("Salvo na Galeria")
                    .setMessage("Salvo em " + relDir + "/" + displayName + ".\nDeseja compartilhar agora?")
                    .setPositiveButton("Compartilhar", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                            Intent share = new Intent(Intent.ACTION_SEND);
                            share.setType(mimeType);
                            share.putExtra(Intent.EXTRA_STREAM, finalUri);
                            share.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
                            activity.startActivity(Intent.createChooser(share, "Compartilhar replay"));
                        }
                    })
                    .setNegativeButton("OK", null)
                    .show();
        } catch (Throwable t) {
            Log.e(TAG, "MediaStore gallery save failed, falling back to SAF", t);
            if (itemUri != null) {
                try {
                    resolver.delete(itemUri, null, null);
                } catch (Throwable ignored) {}
            }
            showToast(activity, "Abrindo seletor de arquivos...");
            launchSafSavePicker(activity, file, mimeType, displayName);
        }
    }

    private static void launchSafSavePicker(Activity activity, File file, String mimeType, String suggestedName) {
        pendingExportFile = file;
        pendingExportMime = mimeType;
        pendingExportName = suggestedName;

        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType(mimeType);
        intent.putExtra(Intent.EXTRA_TITLE, suggestedName);

        int reqCode = "image/gif".equals(mimeType) ? REQ_SAVE_GIF : REQ_SAVE_MP4;
        try {
            activity.startActivityForResult(intent, reqCode);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to open SAF picker", t);
            deleteQuietly(file);
            pendingExportFile = null;
            showToast(activity, "Não foi possível abrir o seletor de arquivos.");
        }
    }

    // =========================================================================
    // Overlay de progresso não-focável (mantém GLSurfaceView ativo!)
    // =========================================================================

    private static void showProgressOverlay(final Activity activity, int mode) {
        removeProgressOverlay(activity);

        ViewGroup content = activity.findViewById(android.R.id.content);
        if (content == null) {
            return;
        }

        int dp8 = dp(activity, 8);
        int dp14 = dp(activity, 14);
        int dp24 = dp(activity, 24);

        LinearLayout pill = new LinearLayout(activity);
        pill.setOrientation(LinearLayout.VERTICAL);
        pill.setPadding(dp14, dp8, dp14, dp8);
        pill.setFocusable(false);
        pill.setFocusableInTouchMode(false);

        GradientDrawable bg = new GradientDrawable();
        bg.setColor(0xDD181B20);
        bg.setCornerRadius(dp(activity, 14));
        bg.setStroke(dp(activity, 1), 0x66FFFFFF);
        pill.setBackground(bg);

        String labelPrefix;
        if (mode == MODE_GIF) {
            labelPrefix = "Exportando GIF";
        } else if (mode == MODE_MP4_SLOMO) {
            labelPrefix = "Exportando MP4 0.5x";
        } else if (mode == MODE_MP4_60) {
            labelPrefix = "Exportando MP4 60fps";
        } else {
            labelPrefix = "Exportando MP4";
        }

        TextView tv = new TextView(activity);
        tv.setTextColor(Color.WHITE);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        tv.setText(labelPrefix + "... 0%");
        tv.setGravity(Gravity.CENTER_HORIZONTAL);
        tv.setTag(labelPrefix);
        pill.addView(tv);

        ProgressBar pb = new ProgressBar(activity, null, android.R.attr.progressBarStyleHorizontal);
        pb.setMax(100);
        pb.setProgress(0);
        LinearLayout.LayoutParams pbLp = new LinearLayout.LayoutParams(dp(activity, 220), ViewGroup.LayoutParams.WRAP_CONTENT);
        pbLp.topMargin = dp(activity, 6);
        pb.setLayoutParams(pbLp);
        pill.addView(pb);

        Button cancelBtn = new Button(activity);
        cancelBtn.setText("Cancelar");
        cancelBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        cancelBtn.setAllCaps(false);
        cancelBtn.setTextColor(Color.WHITE);
        cancelBtn.setBackgroundColor(0x55FF3B30);
        cancelBtn.setPadding(dp14, dp(activity, 4), dp14, dp(activity, 4));
        LinearLayout.LayoutParams btnLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, dp(activity, 34));
        btnLp.gravity = Gravity.CENTER_HORIZONTAL;
        btnLp.topMargin = dp(activity, 6);
        cancelBtn.setLayoutParams(btnLp);
        cancelBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                cancelExportInternal(true);
            }
        });
        pill.addView(cancelBtn);

        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.TOP | Gravity.CENTER_HORIZONTAL
        );
        lp.topMargin = dp24;

        content.addView(pill, lp);
        progressOverlay = pill;
        progressLabel = tv;
        progressBar = pb;
    }

    private static void updateProgressOverlay(final int pct) {
        final Activity activity = getActivity();
        if (activity == null) {
            return;
        }
        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                if (progressBar != null) {
                    progressBar.setProgress(pct);
                }
                if (progressLabel != null) {
                    Object tag = progressLabel.getTag();
                    String prefix = (tag instanceof String) ? (String) tag : "Exportando";
                    progressLabel.setText(prefix + "... " + pct + "%");
                }
            }
        });
    }

    private static void removeProgressOverlay(Activity activity) {
        View overlay = progressOverlay;
        progressOverlay = null;
        progressLabel = null;
        progressBar = null;
        if (overlay != null) {
            ViewParent parent = overlay.getParent();
            if (parent instanceof ViewGroup) {
                ((ViewGroup) parent).removeView(overlay);
            }
        }
    }

    // =========================================================================
    // Persistência de preferências e utilitários
    // =========================================================================

    private static void ensurePrefsLoaded() {
        if (prefsLoaded) {
            return;
        }
        Activity activity = getActivity();
        if (activity == null) {
            return;
        }
        SharedPreferences prefs = activity.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        prefSpeed = prefs.getFloat(KEY_SPEED, 1.0f);
        prefLoop = prefs.getBoolean(KEY_LOOP, true);
        prefShowSloMoFx = prefs.getBoolean(KEY_SHOW_SLOMO_FX, false);
        prefOfferAllChances = prefs.getBoolean(KEY_OFFER_ALL, false);
        prefsLoaded = true;
    }

    private static void savePrefs(Activity activity) {
        SharedPreferences prefs = activity.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        prefs.edit()
                .putFloat(KEY_SPEED, prefSpeed)
                .putBoolean(KEY_LOOP, prefLoop)
                .putBoolean(KEY_SHOW_SLOMO_FX, prefShowSloMoFx)
                .putBoolean(KEY_OFFER_ALL, prefOfferAllChances)
                .apply();
    }

    private static void ensureReflectionReady() throws Exception {
        if (clsTMatch != null) {
            return;
        }
        clsTMatch = Class.forName(GAME_PKG + "c_TMatch");
        clsTweakFloat = Class.forName(GAME_PKG + "c_TweakValueFloat");
        fldTweakValue = clsTweakFloat.getDeclaredField("m_value");
        fldTweakValue.setAccessible(true);

        fldReplayFrame = clsTMatch.getDeclaredField("m_twk_ReplayFrame");
        fldReplayFrame.setAccessible(true);
        fldReplaySpeed = clsTMatch.getDeclaredField("m_twk_ReplaySpeed");
        fldReplaySpeed.setAccessible(true);
        fldReplayLength = clsTMatch.getDeclaredField("m_twk_ReplayLength");
        fldReplayLength.setAccessible(true);
        fldReplayLoop = clsTMatch.getDeclaredField("m_twk_ReplayLoop");
        fldReplayLoop.setAccessible(true);
        fldReplayPaused = clsTMatch.getDeclaredField("m_twk_ReplayPaused");
        fldReplayPaused.setAccessible(true);
        fldAllowReplay = clsTMatch.getDeclaredField("m_allowReplay");
        fldAllowReplay.setAccessible(true);

        mtdTweakGet = clsTweakFloat.getDeclaredMethod("m_Get", String.class, String.class);
        mtdTweakGet.setAccessible(true);
        mtdTweakSet = clsTweakFloat.getDeclaredMethod("m_Set", String.class, String.class, float.class);
        mtdTweakSet.setAccessible(true);
    }

    private static float getTMatchTweak(Field field, float fallback) {
        try {
            Object twk = field.get(null);
            if (twk != null) {
                return fldTweakValue.getFloat(twk);
            }
        } catch (Throwable ignored) {}
        return fallback;
    }

    private static void setTMatchTweak(Field field, float value) {
        try {
            Object twk = field.get(null);
            if (twk != null) {
                fldTweakValue.setFloat(twk, value);
            }
        } catch (Throwable ignored) {}
    }

    private static float getNamedTweak(String category, String name, float fallback) {
        try {
            ensureReflectionReady();
            Object twk = mtdTweakGet.invoke(null, category, name);
            if (twk != null) {
                return fldTweakValue.getFloat(twk);
            }
        } catch (Throwable ignored) {}
        return fallback;
    }

    private static void setNamedTweak(String category, String name, float value) {
        try {
            ensureReflectionReady();
            mtdTweakSet.invoke(null, category, name, value);
        } catch (Throwable ignored) {}
    }

    private static void setReplayOptionsVisible(boolean visible) {
        try {
            Class<?> hudCls = Class.forName(GAME_PKG + "c_MinigameHud");
            Field fld = hudCls.getDeclaredField("m_ReplayOptions");
            fld.setAccessible(true);
            Object gadget = fld.get(null);
            if (gadget != null) {
                Method m = gadget.getClass().getMethod(visible ? "p_Show" : "p_Hide");
                m.invoke(gadget);
            }
        } catch (Throwable t) {
            Log.e(TAG, "setReplayOptionsVisible(" + visible + ") failed", t);
        }
    }

    private static int getRecordedReplayFrameCount() {
        try {
            Class<?> ballCls = Class.forName(GAME_PKG + "c_TBall");
            Field fld = ballCls.getDeclaredField("m_replayFrames");
            fld.setAccessible(true);
            Object stack = fld.get(null);
            if (stack != null) {
                Method len = stack.getClass().getMethod("p_Length2");
                Object res = len.invoke(stack);
                if (res instanceof Integer) {
                    return (Integer) res;
                }
            }
        } catch (Throwable ignored) {}
        return 0;
    }

    private static Activity getActivity() {
        try {
            Class<?> bbCls = Class.forName(GAME_PKG + "BBAndroidGame");
            Field gameFld = bbCls.getDeclaredField("_androidGame");
            gameFld.setAccessible(true);
            Object game = gameFld.get(null);
            if (game == null) {
                return null;
            }
            Method getAct = bbCls.getDeclaredMethod("GetActivity");
            getAct.setAccessible(true);
            Object act = getAct.invoke(game);
            return (act instanceof Activity) ? (Activity) act : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static View getGameView(Object bbAndroidGame) {
        try {
            if (bbAndroidGame == null) {
                return null;
            }
            if (mtdGetGameView == null) {
                Class<?> bbCls = Class.forName(GAME_PKG + "BBAndroidGame");
                Method m = bbCls.getDeclaredMethod("GetGameView");
                m.setAccessible(true);
                mtdGetGameView = m;
            }
            Object v = mtdGetGameView.invoke(bbAndroidGame);
            if (v instanceof View) {
                return (View) v;
            }
            // Fallback: leitura direta do campo _view na classe base BBAndroidGame.
            Class<?> bbCls = Class.forName(GAME_PKG + "BBAndroidGame");
            Field viewFld = bbCls.getDeclaredField("_view");
            viewFld.setAccessible(true);
            Object fv = viewFld.get(bbAndroidGame);
            return (fv instanceof View) ? (View) fv : null;
        } catch (Throwable t) {
            Log.e(TAG, "getGameView failed", t);
            return null;
        }
    }

    private static long copyFileToUri(ContentResolver resolver, File src, Uri dst) throws IOException {
        long total = 0L;
        FileInputStream in = new FileInputStream(src);
        try {
            OutputStream out = resolver.openOutputStream(dst);
            if (out == null) {
                throw new IOException("Falha ao abrir destino de gravação.");
            }
            try {
                byte[] buf = new byte[32768];
                int n;
                while ((n = in.read(buf)) > 0) {
                    out.write(buf, 0, n);
                    total += n;
                }
                out.flush();
            } finally {
                out.close();
            }
        } finally {
            in.close();
        }
        return total;
    }

    private static void deleteQuietly(File file) {
        if (file != null && file.exists()) {
            //noinspection ResultOfMethodCallIgnored
            file.delete();
        }
    }

    private static String formatSpeed(float speed) {
        if (Math.abs(speed - Math.round(speed)) < 0.01f) {
            return String.format(Locale.US, "%.1fx", speed);
        }
        return String.format(Locale.US, "%.2fx", speed).replaceAll("0x$", "x");
    }

    private static String formatSize(long bytes) {
        if (bytes < 1024L) {
            return bytes + " B";
        }
        if (bytes < 1024L * 1024L) {
            return String.format(Locale.US, "%.1f KB", bytes / 1024.0);
        }
        return String.format(Locale.US, "%.2f MB", bytes / (1024.0 * 1024.0));
    }

    private static int dp(Context ctx, int value) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, ctx.getResources().getDisplayMetrics()));
    }

    private static void showToast(final Activity activity, final String msg) {
        if (activity == null || activity.isFinishing()) {
            return;
        }
        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                Toast.makeText(activity, msg, Toast.LENGTH_LONG).show();
            }
        });
    }
}
