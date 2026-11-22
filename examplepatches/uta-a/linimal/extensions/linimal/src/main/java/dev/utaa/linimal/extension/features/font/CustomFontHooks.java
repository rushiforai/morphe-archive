package dev.utaa.linimal.extension.features.font;

import android.content.Context;
import android.net.Uri;
import android.os.ParcelFileDescriptor;

import java.io.File;

import dev.utaa.linimal.extension.config.LinimalConfig;
import dev.utaa.linimal.extension.config.LinimalConfigHealth;

/**
 * 取り込んだフォントを、LINE の公式フォント設定と同じ経路で画面に当てます。
 *
 * <p>LINE は起動時に、契約と選択を確かめた結果が true のときだけ、全 Activity にフォントのテーマを
 * 当てます。テーマのフォントは LINE 自身の provider（{@code <package>.premiumfont}）へ「選択中の
 * フォント」（ID {@code -1}）を問い合わせます。ここでは、設定が ON で取り込んだファイルがあるときに、
 * テーマを当てさせ、選択中のフォントの要求にだけ取り込んだファイルを返します。公式の選択値、契約の
 * 判定、ほかの ID の要求（公式の設定画面の確認やプレビュー）は変えません。</p>
 */
public final class CustomFontHooks {
    static final String SELECTED_FONT_ID = "-1";

    private CustomFontHooks() {
    }

    /**
     * 起動時タスクで、テーマを当てるかどうかの判定結果を受けて呼ばれます。
     * 取り込んだフォントを使えるときは true を返します。それ以外は元の結果を返します。
     */
    public static boolean shouldApplyPremiumFontTheme(boolean original) {
        try {
            Context application = FontContext.currentApplication();
            if (application == null || !isActive(application)) {
                return original;
            }
            return CustomFontGuard.beginLaunch(application) || original;
        } catch (Throwable ignored) {
            return original;
        }
    }

    /**
     * {@code PremiumFontProvider.openFile} の先頭で呼ばれます。選択中のフォントの要求なら、取り込んだ
     * ファイルを返します。null を返すと元の処理（公式の選択の解決）へ進みます。
     */
    public static ParcelFileDescriptor openSelectedFont(Uri uri) {
        try {
            Context application = FontContext.currentApplication();
            if (uri == null || application == null) {
                return null;
            }
            if (!isSelectedFontRequest(application.getPackageName(), uri.getAuthority(), uri.getLastPathSegment())) {
                return null;
            }
            if (!isActive(application)) {
                return null;
            }
            File file = CustomFontFiles.fontFile(application);
            return ParcelFileDescriptor.open(file, ParcelFileDescriptor.MODE_READ_ONLY);
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** 要求が LINE 自身の provider の「選択中のフォント」かどうか。 */
    static boolean isSelectedFontRequest(String ownPackage, String authority, String lastPathSegment) {
        if (ownPackage == null || ownPackage.isEmpty() || authority == null) {
            return false;
        }
        return authority.equals(ownPackage + FontProviderHooks.PREMIUM_FONT_AUTHORITY_SUFFIX)
                && SELECTED_FONT_ID.equals(lastPathSegment);
    }

    /** 設定が ON で、取り込んだファイルがあり、落ち続けて止めている状態でないかどうか。 */
    static boolean isActive(Context application) {
        LinimalConfig config = LinimalConfig.get();
        return config.getRuntimeHealth() == LinimalConfigHealth.OK
                && config.isCustomFontEnabled()
                && CustomFontFiles.hasFont(application)
                && !CustomFontGuard.isBlocked(application);
    }

    /** 設定画面向け。落ち続けたため止めているかどうか。 */
    public static boolean isStoppedAfterUnstableLaunches(Context context) {
        try {
            return CustomFontGuard.isBlocked(context);
        } catch (RuntimeException exception) {
            return false;
        }
    }
}
