package dev.utaa.linimal.extension.features.browser;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import dev.utaa.linimal.extension.config.LinimalConfig;

/** トーク内のリンク専用の bytecode hook からだけ呼び出す外部ブラウザ起動処理です。 */
public final class ExternalBrowserHooks {
    private static final Uri GENERIC_BROWSER_URI = Uri.parse("https://example.invalid/");

    private ExternalBrowserHooks() {
    }

    /**
     * トーク内のリンクを押したときの hook です。{@code action} は referrer の action enum で、
     * {@link ExternalBrowserPolicy#isEligibleChatLinkAction} が認めたものだけを外部へ渡します。
     * 外部ブラウザを起動できなければ false を返し、LINE の元の navigation を続行させます。
     */
    public static boolean tryOpenChatLinkExternally(Context context, Uri uri, Object action) {
        try {
            if (!(action instanceof Enum)
                    || !ExternalBrowserPolicy.isEligibleChatLinkAction(((Enum<?>) action).name())) {
                return false;
            }
            return tryOpenNormalLinkExternally(context, uri);
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * 外部ブラウザの明示 Activity を起動できた場合だけ true を返します。
     * それ以外は何も変更せず false を返し、LINE の元の navigation を続行させます。
     */
    public static boolean tryOpenNormalLinkExternally(Context context, Uri uri) {
        try {
            if (context == null
                    || uri == null
                    || !LinimalConfig.get().isExternalBrowserOverrideEnabled()
                    || !ExternalBrowserPolicy.isEligibleScheme(uri.getScheme())
                    || ExternalBrowserPolicy.isKnownLineWebHost(uri.getHost())) {
                return false;
            }

            PackageManager packageManager = context.getPackageManager();
            if (packageManager == null) {
                return false;
            }

            List<ResolveInfo> specificHandlers = queryHandlers(packageManager, browserIntent(uri));
            Set<String> genericBrowserComponents = componentKeys(
                    queryHandlers(packageManager, browserIntent(GENERIC_BROWSER_URI)));
            List<ExternalBrowserPolicy.Candidate> candidates = new ArrayList<>();
            for (ResolveInfo resolveInfo : specificHandlers) {
                ActivityInfo activityInfo = resolveInfo == null ? null : resolveInfo.activityInfo;
                if (activityInfo == null
                        || !genericBrowserComponents.contains(componentKey(
                                activityInfo.packageName, activityInfo.name))) {
                    continue;
                }
                candidates.add(new ExternalBrowserPolicy.Candidate(
                        activityInfo.packageName,
                        activityInfo.name,
                        activityInfo.exported,
                        activityInfo.enabled));
            }

            List<ExternalBrowserPolicy.Candidate> external =
                    ExternalBrowserPolicy.externalCandidates(context.getPackageName(), candidates);
            if (external.isEmpty()) {
                return false;
            }

            List<Intent> explicitIntents = new ArrayList<>();
            for (ExternalBrowserPolicy.Candidate candidate : external) {
                Intent intent = browserIntent(uri);
                intent.setComponent(new ComponentName(
                        candidate.getPackageName(), candidate.getClassName()));
                if (!(context instanceof Activity)) {
                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                }
                explicitIntents.add(intent);
            }

            Intent launchIntent;
            if (explicitIntents.size() == 1) {
                launchIntent = explicitIntents.get(0);
            } else {
                Intent first = explicitIntents.get(0);
                Intent[] alternatives = explicitIntents.subList(1, explicitIntents.size())
                        .toArray(new Intent[0]);
                launchIntent = Intent.createChooser(first, null);
                launchIntent.putExtra(Intent.EXTRA_INITIAL_INTENTS, alternatives);
                if (!(context instanceof Activity)) {
                    launchIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                }
            }

            context.startActivity(launchIntent);
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static Intent browserIntent(Uri uri) {
        Intent intent = new Intent(Intent.ACTION_VIEW, uri);
        intent.addCategory(Intent.CATEGORY_BROWSABLE);
        return intent;
    }

    private static List<ResolveInfo> queryHandlers(PackageManager packageManager, Intent intent) {
        List<ResolveInfo> handlers = packageManager.queryIntentActivities(
                intent, PackageManager.MATCH_DEFAULT_ONLY);
        return handlers == null ? new ArrayList<ResolveInfo>() : handlers;
    }

    private static Set<String> componentKeys(List<ResolveInfo> handlers) {
        Set<String> components = new HashSet<>();
        for (ResolveInfo resolveInfo : handlers) {
            ActivityInfo activityInfo = resolveInfo == null ? null : resolveInfo.activityInfo;
            if (activityInfo != null) {
                components.add(componentKey(activityInfo.packageName, activityInfo.name));
            }
        }
        return components;
    }

    private static String componentKey(String packageName, String className) {
        return String.valueOf(packageName) + '/' + String.valueOf(className);
    }
}
