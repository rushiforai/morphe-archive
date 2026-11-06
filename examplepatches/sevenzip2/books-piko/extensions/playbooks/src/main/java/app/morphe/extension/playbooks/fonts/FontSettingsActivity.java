package app.morphe.extension.playbooks.fonts;

import static app.morphe.extension.playbooks.shared.Text.t;

import android.app.Activity;
import android.content.ComponentName;
import android.content.ContentResolver;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.database.Cursor;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import android.provider.OpenableColumns;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.BufferedInputStream;
import java.io.InputStream;

/**
 * Picks, previews and removes the custom reader font.
 * Started from the "Books 글꼴" launcher entry or by opening/sharing a font file with Play Books.
 */
@SuppressWarnings({"unused", "deprecation"})
public class FontSettingsActivity extends Activity {
    private static final int REQUEST_PICK_BASE = 0x4f10;
    private static final String SAMPLE_TEXT =
            "가나다라마바사 아자차카타파하\nThe quick brown fox jumps over the lazy dog.\n0123456789 “”‘’ …";

    private FontStore store;
    private LinearLayout content;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        store = FontStore.get(this);

        ScrollView scrollView = new ScrollView(this);
        content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        int padding = dp(20);
        content.setPadding(padding, padding, padding, padding);
        scrollView.addView(content, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        setContentView(scrollView);
        setTitle(t("Play 북 사용자 글꼴", "Play Books custom font"));

        render();
        importFromIntent(getIntent());
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        importFromIntent(intent);
    }

    // region UI

    private void render() {
        content.removeAllViews();

        TextView title = text(t("Play 북 사용자 글꼴", "Play Books custom font"), 22);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        content.addView(title);

        content.addView(text(t(
                "선택한 TTF/OTF 글꼴이 책 본문(EPUB 리플로우)에 사용됩니다. 굵게/기울임 글꼴을 따로 지정하지 않으면 "
                        + "기본 글꼴에서 자동으로 합성됩니다.",
                "The TTF/OTF you pick is used for book text (reflowable EPUB). Bold and italic are "
                        + "synthesized from the regular face unless you add them separately."), 14));

        TextView preview = text(SAMPLE_TEXT, 20);
        preview.setPadding(0, dp(16), 0, dp(16));
        Typeface typeface = loadPreviewTypeface();
        if (typeface != null) preview.setTypeface(typeface);
        else if (store.has(FontVariant.REGULAR)) preview.setText(t("(미리보기를 표시할 수 없는 형식입니다)", "(No preview for this format)"));
        else preview.setText(t("(선택된 글꼴 없음 – 앱 기본 글꼴 사용)", "(No font picked – using the app fonts)"));
        content.addView(preview);

        addVariantRow(FontVariant.REGULAR, t("기본(Regular)", "Regular"));
        addVariantRow(FontVariant.BOLD, t("굵게(Bold) – 선택", "Bold – optional"));
        addVariantRow(FontVariant.ITALIC, t("기울임(Italic) – 선택", "Italic – optional"));
        addVariantRow(FontVariant.BOLD_ITALIC, t("굵은 기울임 – 선택", "Bold italic – optional"));

        addSpacer();

        addCheckBox(t("사용자 글꼴 사용", "Use the custom font"), store.isEnabled(),
                new Toggle() {
                    @Override
                    public void set(boolean value) {
                        store.setEnabled(value);
                    }
                });
        addCheckBox(t("글꼴 메뉴에서 무엇을 골라도 내 글꼴로 보기\n(끄면 Literata를 골랐을 때만 바뀜)",
                        "Use my font whichever font I pick in the reader\n(off: only when Literata is picked)"),
                store.replaceAllFamilies(), new Toggle() {
                    @Override
                    public void set(boolean value) {
                        store.setReplaceAllFamilies(value);
                    }
                });
        addCheckBox(t("책에 들어 있는 글꼴도 무시하고 항상 내 글꼴로 보기",
                        "Always use my font, even over the book's own fonts"),
                store.forceOverPublisherFonts(), new Toggle() {
                    @Override
                    public void set(boolean value) {
                        store.setForceOverPublisherFonts(value);
                    }
                });
        addCheckBox(t("굵은 글씨를 외곽선으로 표시 (굵게 글꼴이 없을 때)",
                        "Draw bold text with an outline (when no bold face is added)"),
                store.strokeBold(), new Toggle() {
                    @Override
                    public void set(boolean value) {
                        store.setStrokeBold(value);
                    }
                });
        addCheckBox(t("코드/고정폭 글꼴 유지", "Keep code and monospace text"),
                store.keepMonospace(), new Toggle() {
                    @Override
                    public void set(boolean value) {
                        store.setKeepMonospace(value);
                    }
                });

        addSpacer();

        Button restart = new Button(this);
        restart.setText(t("Play 북 다시 시작 (변경 사항 적용)", "Restart Play Books (apply changes)"));
        restart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                restartApp();
            }
        });
        content.addView(restart);

        content.addView(text(t(
                "리더는 글꼴과 엔진을 앱이 켜져 있는 동안 캐시합니다. 글꼴이나 설정을 바꾼 뒤에는 위 버튼으로 Play 북을 다시 시작하세요.\n"
                        + "다른 앱에서 글꼴 파일을 'Play 북'으로 열기/공유해도 기본 글꼴로 설치됩니다.",
                "The reader caches fonts and its engine while the app runs. Restart Play Books with the button "
                        + "above after changing the font or settings.\n"
                        + "You can also open or share a font file with Play Books to install it as the regular face."),
                13));
    }

    private void addVariantRow(final FontVariant variant, String label) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, dp(6), 0, dp(6));

        String name = store.displayName(variant);
        TextView description = text(label + "\n" + (name != null ? name : t("없음", "None")), 15);
        row.addView(description, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        Button pick = new Button(this);
        pick.setText(t("선택", "Pick"));
        pick.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                pickFont(variant);
            }
        });
        row.addView(pick);

        if (store.hasPickedFont(variant)) {
            Button remove = new Button(this);
            remove.setText(t("삭제", "Remove"));
            remove.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    store.delete(variant);
                    render();
                }
            });
            row.addView(remove);
        }

        content.addView(row);
    }

    private interface Toggle {
        void set(boolean value);
    }

    private void addCheckBox(String label, boolean checked, final Toggle toggle) {
        CheckBox checkBox = new CheckBox(this);
        checkBox.setText(label);
        checkBox.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        checkBox.setChecked(checked);
        checkBox.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton button, boolean isChecked) {
                toggle.set(isChecked);
                ReaderFontPatch.invalidateCache();
            }
        });
        content.addView(checkBox);
    }

    private void addSpacer() {
        View spacer = new View(this);
        content.addView(spacer, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(16)));
    }

    private TextView text(String value, int sizeSp) {
        TextView view = new TextView(this);
        view.setText(value);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sizeSp);
        view.setPadding(0, dp(4), 0, dp(4));
        return view;
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

    private Typeface loadPreviewTypeface() {
        try {
            if (store.hasPickedFont(FontVariant.REGULAR)) {
                return Typeface.createFromFile(store.file(FontVariant.REGULAR));
            }
            if (store.has(FontVariant.REGULAR)) {
                return Typeface.createFromAsset(getAssets(), FontStore.BUNDLED_REGULAR_ASSET);
            }
        } catch (Throwable throwable) {
            Log.w(FontStore.TAG, "Font preview failed", throwable);
        }
        return null;
    }

    // endregion

    // region Picking and importing

    private void pickFont(FontVariant variant) {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("*/*");
        intent.putExtra(Intent.EXTRA_MIME_TYPES, new String[]{
                "font/*", "application/x-font-ttf", "application/x-font-otf", "application/font-sfnt",
                "application/vnd.ms-opentype", "application/octet-stream",
        });
        try {
            startActivityForResult(intent, REQUEST_PICK_BASE + variant.ordinal());
        } catch (Throwable throwable) {
            Log.e(FontStore.TAG, "No document picker", throwable);
            toast(t("파일 선택기를 열 수 없습니다.", "Cannot open the file picker."));
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        int index = requestCode - REQUEST_PICK_BASE;
        if (index < 0 || index >= FontVariant.values().length) return;
        if (resultCode != RESULT_OK || data == null || data.getData() == null) return;
        importFont(FontVariant.values()[index], data.getData());
    }

    private void importFromIntent(Intent intent) {
        if (intent == null) return;
        Uri uri = null;
        if (Intent.ACTION_VIEW.equals(intent.getAction())) {
            uri = intent.getData();
        } else if (Intent.ACTION_SEND.equals(intent.getAction())) {
            Parcelable stream = intent.getParcelableExtra(Intent.EXTRA_STREAM);
            if (stream instanceof Uri) uri = (Uri) stream;
        }
        if (uri != null) {
            // Handle each incoming intent once, also across configuration changes.
            intent.setAction(Intent.ACTION_MAIN);
            importFont(FontVariant.REGULAR, uri);
        }
    }

    private void importFont(final FontVariant variant, final Uri uri) {
        final ContentResolver resolver = getContentResolver();
        final String name = displayName(resolver, uri);
        toast(t("글꼴을 가져오는 중…", "Importing font…"));

        new Thread(new Runnable() {
            @Override
            public void run() {
                String message;
                try {
                    InputStream input = new BufferedInputStream(resolver.openInputStream(uri));
                    try {
                        if (FontFiles.detectMimeType(FontFiles.peekHeader(input)) == null) {
                            message = t("TTF/OTF 글꼴 파일이 아닙니다.", "Not a TTF/OTF font file.");
                        } else {
                            store.save(variant, input, name);
                            message = t("글꼴을 저장했습니다. 'Play 북 다시 시작'을 누르세요.",
                                    "Font saved. Tap \"Restart Play Books\".");
                        }
                    } finally {
                        input.close();
                    }
                } catch (Throwable throwable) {
                    Log.e(FontStore.TAG, "Font import failed", throwable);
                    message = t("글꼴을 가져오지 못했습니다: ", "Could not import the font: ") + throwable.getMessage();
                }

                final String result = message;
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        toast(result);
                        if (!isFinishing()) render();
                    }
                });
            }
        }, "BooksPikoFontImport").start();
    }

    private static String displayName(ContentResolver resolver, Uri uri) {
        Cursor cursor = null;
        try {
            cursor = resolver.query(uri, new String[]{OpenableColumns.DISPLAY_NAME}, null, null, null);
            if (cursor != null && cursor.moveToFirst()) {
                String name = cursor.getString(0);
                if (name != null) return name;
            }
        } catch (Throwable ignored) {
            // Fall back to the last path segment.
        } finally {
            if (cursor != null) cursor.close();
        }
        String segment = uri.getLastPathSegment();
        return segment != null ? segment : "font";
    }

    private void restartApp() {
        try {
            // The "Books 글꼴" alias is a launcher entry too, so pick the app's own one.
            Intent main = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER).setPackage(getPackageName());
            for (ResolveInfo info : getPackageManager().queryIntentActivities(main, 0)) {
                if (info.activityInfo.name.startsWith(FontSettingsActivity.class.getName())) continue;
                startActivity(Intent.makeRestartActivityTask(
                        new ComponentName(info.activityInfo.packageName, info.activityInfo.name)));
                break;
            }
        } catch (Throwable throwable) {
            Log.e(FontStore.TAG, "Restart failed", throwable);
        }
        // Ends the process so the reader WebViews reload the font and the engine.
        Runtime.getRuntime().exit(0);
    }

    private void toast(String message) {
        Toast.makeText(this, message, Toast.LENGTH_LONG).show();
    }

    // endregion
}
