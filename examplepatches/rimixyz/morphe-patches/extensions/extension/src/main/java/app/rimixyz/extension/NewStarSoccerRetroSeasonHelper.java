package app.rimixyz.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.opengl.GLSurfaceView;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Locale;

/**
 * Seletor de temporada/base de dados histórica para novas carreiras no New Star Soccer 4.34.
 *
 * O APK já embute bases históricas completas em {@code assets/monkey/MyData/v2011..v2026},
 * mapeadas nativamente por {@code bb_GSApp.g_GSUpdateDatabaseFolder(String)} a partir do campo
 * {@code m_gameversion} gravado em cada slot de carreira.
 *
 * Ao tocar em um slot vazio ({@code c_TPlayer.m_DoNewCareer}), este helper exibe um diálogo
 * nativo para escolher o ano da base de dados. Carreiras já existentes não são afetadas, pois
 * cada slot guarda e recarrega sua própria {@code m_gameversion}.
 */
@SuppressWarnings("unused")
public final class NewStarSoccerRetroSeasonHelper {

    private static final String TAG = "RimiNSSRetroSeason";
    private static final String GAME_PKG = "com.newstargames.newstarsoccer.";

    /**
     * Versões mapeadas nativamente por {@code bb_GSApp.g_GSUpdateDatabaseFolder}:
     *   >=233 -> v2026, >=232 -> v2025b, >=213 -> v2017, >=190 -> v2016,
     *   >=183 -> v2015b, >=179 -> v2014d, >=138 -> v2013b, <138 -> v2011.
     * (v2013c foi omitida propositalmente porque seu Nations.txt está em UTF-16LE.)
     */
    private static final String[] SEASON_VERSIONS = {
        null,     // usa bb_.g_gVersion padrão (v2026)
        "v2.32",  // v2025b (6.139 clubes)
        "v2.13",  // v2017  (5.038 clubes)
        "v1.90",  // v2016  (4.859 clubes)
        "v1.83",  // v2015b (4.682 clubes)
        "v1.79",  // v2014d (4.498 clubes)
        "v1.38",  // v2013b (4.094 clubes)
        "v1.00",  // v2011  (3.421 clubes)
    };

    private static final String[] LABELS_PT = {
        "2026 (Atual — 6.331 clubes)",
        "2025 (6.139 clubes)",
        "2017 (5.038 clubes)",
        "2016 (4.859 clubes)",
        "2015 (4.682 clubes)",
        "2014 (4.498 clubes)",
        "2013 (4.094 clubes)",
        "2011 (Clássico — 3.421 clubes)",
    };

    private static final String[] LABELS_EN = {
        "2026 (Current — 6,331 clubs)",
        "2025 (6,139 clubs)",
        "2017 (5,038 clubs)",
        "2016 (4,859 clubs)",
        "2015 (4,682 clubs)",
        "2014 (4,498 clubs)",
        "2013 (4,094 clubs)",
        "2011 (Classic — 3,421 clubs)",
    };

    private static volatile String selectedCareerVersion = null;
    private static volatile boolean bypassNextPrompt = false;

    private NewStarSoccerRetroSeasonHelper() {}

    /**
     * Chamado no início de {@code c_TPlayer.m_DoNewCareer()}.
     * Retorna {@code true} quando intercepta o fluxo para exibir o seletor de temporada,
     * ou {@code false} para deixar {@code m_DoNewCareer()} prosseguir normalmente.
     */
    public static boolean interceptNewCareer() {
        if (bypassNextPrompt) {
            bypassNextPrompt = false;
            return false;
        }

        final Activity activity = getGameActivity();
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            selectedCareerVersion = null;
            return false;
        }

        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                if (activity.isFinishing() || activity.isDestroyed()) {
                    return;
                }
                showSeasonDialog(activity);
            }
        });
        return true;
    }

    /**
     * Chamado em {@code c_TScreen_ChooseClub.m_SetUpScreen()} logo após ler {@code bb_.g_gVersion}.
     */
    public static String resolveCareerVersion(String defaultVersion) {
        String chosen = selectedCareerVersion;
        return (chosen != null && !chosen.isEmpty()) ? chosen : defaultVersion;
    }

    /**
     * Chamado em {@code c_TPlayer.m_Create()} logo após ler {@code bb_.g_gVersion}, gravando a
     * temporada escolhida em {@code m_gameversion} e limpando a seleção pendente.
     */
    public static String consumeCareerVersion(String defaultVersion) {
        String chosen = selectedCareerVersion;
        selectedCareerVersion = null;
        return (chosen != null && !chosen.isEmpty()) ? chosen : defaultVersion;
    }

    private static void showSeasonDialog(final Activity activity) {
        final boolean pt = isPortuguese();
        final String[] labels = pt ? LABELS_PT : LABELS_EN;
        final boolean[] handled = { false };

        AlertDialog dialog = new AlertDialog.Builder(activity)
            .setTitle(pt ? "Temporada da Nova Carreira" : "New Career Season")
            .setItems(labels, new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface d, int which) {
                    if (handled[0]) {
                        return;
                    }
                    handled[0] = true;
                    selectedCareerVersion = (which >= 0 && which < SEASON_VERSIONS.length)
                        ? SEASON_VERSIONS[which]
                        : null;
                    bypassNextPrompt = true;
                    postOnGameUi(new Runnable() {
                        @Override
                        public void run() {
                            invokeStaticNoArgs("c_TPlayer", "m_DoNewCareer");
                        }
                    });
                }
            })
            .setNegativeButton(pt ? "Cancelar" : "Cancel", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface d, int which) {
                    if (handled[0]) {
                        return;
                    }
                    handled[0] = true;
                    cancelAndReturnToSaveSlots();
                }
            })
            .setOnCancelListener(new DialogInterface.OnCancelListener() {
                @Override
                public void onCancel(DialogInterface d) {
                    if (handled[0]) {
                        return;
                    }
                    handled[0] = true;
                    cancelAndReturnToSaveSlots();
                }
            })
            .create();

        dialog.show();
    }

    private static void cancelAndReturnToSaveSlots() {
        selectedCareerVersion = null;
        bypassNextPrompt = false;
        postOnGameUi(new Runnable() {
            @Override
            public void run() {
                invokeStaticNoArgs("c_TScreen_SaveSlot", "m_SetUpScreen");
            }
        });
    }

    /**
     * No motor Monkey deste APK, {@code BBAndroidGame$GameTimer} executa {@code UpdateGame()} na
     * thread principal via {@code _view.postDelayed(...)}, e dispara a renderização via
     * {@code _view.requestRender()}. Postar em {@code _view} garante a mesma thread e redesenho.
     */
    private static void postOnGameUi(final Runnable action) {
        final GLSurfaceView view = getGameView();
        if (view != null) {
            view.post(new Runnable() {
                @Override
                public void run() {
                    action.run();
                    try {
                        view.requestRender();
                    } catch (Throwable ignored) {}
                }
            });
            return;
        }
        Activity activity = getGameActivity();
        if (activity != null) {
            activity.runOnUiThread(action);
        }
    }

    private static void invokeStaticNoArgs(String className, String methodName) {
        try {
            Class<?> cls = Class.forName(GAME_PKG + className);
            Method m = cls.getDeclaredMethod(methodName);
            m.setAccessible(true);
            m.invoke(null);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to invoke " + className + "." + methodName, t);
        }
    }

    private static Object getBBAndroidGame() {
        try {
            Class<?> bbGameCls = Class.forName(GAME_PKG + "BBAndroidGame");
            Method getGame = bbGameCls.getDeclaredMethod("AndroidGame");
            getGame.setAccessible(true);
            return getGame.invoke(null);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to obtain BBAndroidGame", t);
            return null;
        }
    }

    private static Activity getGameActivity() {
        try {
            Object game = getBBAndroidGame();
            if (game == null) {
                return null;
            }
            Method getAct = game.getClass().getMethod("GetActivity");
            getAct.setAccessible(true);
            return (Activity) getAct.invoke(game);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to obtain game Activity", t);
            return null;
        }
    }

    private static GLSurfaceView getGameView() {
        try {
            Object game = getBBAndroidGame();
            if (game == null) {
                return null;
            }
            Class<?> bbGameCls = Class.forName(GAME_PKG + "BBAndroidGame");
            Field viewField = bbGameCls.getDeclaredField("_view");
            viewField.setAccessible(true);
            Object v = viewField.get(game);
            return (v instanceof GLSurfaceView) ? (GLSurfaceView) v : null;
        } catch (Throwable t) {
            Log.w(TAG, "Failed to obtain BBAndroidGame._view", t);
            return null;
        }
    }

    private static boolean isPortuguese() {
        try {
            Class<?> playerCls = Class.forName(GAME_PKG + "c_TPlayer");
            Field langField = playerCls.getDeclaredField("m_opLanguage");
            langField.setAccessible(true);
            int lang = langField.getInt(null);
            if (lang == 2 || lang == 8) {
                return true;
            }
            if (lang >= 0 && lang <= 12) {
                return false;
            }
        } catch (Throwable ignored) {}
        String sysLang = Locale.getDefault().getLanguage();
        return sysLang != null && sysLang.toLowerCase(Locale.US).startsWith("pt");
    }
}
