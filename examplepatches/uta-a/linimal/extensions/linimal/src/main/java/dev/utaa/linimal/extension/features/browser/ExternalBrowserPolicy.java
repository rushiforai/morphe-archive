package dev.utaa.linimal.extension.features.browser;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

/** 通常リンクを外部へ渡す前に、scheme と解決候補を保守的に検証します。 */
public final class ExternalBrowserPolicy {
    public static final class Candidate {
        private final String packageName;
        private final String className;
        private final boolean exported;
        private final boolean enabled;

        public Candidate(String packageName, String className, boolean exported, boolean enabled) {
            this.packageName = packageName;
            this.className = className;
            this.exported = exported;
            this.enabled = enabled;
        }

        public String getPackageName() {
            return packageName;
        }

        public String getClassName() {
            return className;
        }

        @Override
        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Candidate)) {
                return false;
            }
            Candidate candidate = (Candidate) other;
            return packageName != null
                    && packageName.equals(candidate.packageName)
                    && className != null
                    && className.equals(candidate.className);
        }

        @Override
        public int hashCode() {
            int result = packageName == null ? 0 : packageName.hashCode();
            return 31 * result + (className == null ? 0 : className.hashCode());
        }
    }

    private ExternalBrowserPolicy() {
    }

    /** URL の内容ではなく、通常リンク専用 caller から渡された http/https だけを許可します。 */
    public static boolean isEligibleScheme(String scheme) {
        if (scheme == null) {
            return false;
        }
        String normalized = scheme.toLowerCase(Locale.ROOT);
        return "http".equals(normalized) || "https".equals(normalized);
    }

    /**
     * トーク内で外部ブラウザへ渡すリンクの操作。本文リンク（CLICK）、リッチメッセージ（RICH_MSG）、
     * リッチメニュー（RICH_MENU）、テンプレート・Flex のカード（TEMPLATE_MSG）です。
     * 名前の分からない操作や、操作の種類を持たない経路（UNKNOWN）は元の処理へ残します。
     */
    public static boolean isEligibleChatLinkAction(String actionName) {
        return "CLICK".equals(actionName)
                || "RICH_MSG".equals(actionName)
                || "RICH_MENU".equals(actionName)
                || "TEMPLATE_MSG".equals(actionName);
    }

    /** LINE が内部 routing に使う既知の web host は、通常リンクでも元の処理へ残します。 */
    public static boolean isKnownLineWebHost(String host) {
        if (host == null) {
            return false;
        }
        String normalized = host.toLowerCase(Locale.ROOT);
        while (normalized.endsWith(".")) {
            normalized = normalized.substring(0, normalized.length() - 1);
        }
        return isHostOrSubdomain(normalized, "line.me")
                || isHostOrSubdomain(normalized, "line.naver.jp")
                || isHostOrSubdomain(normalized, "lin.ee");
    }

    /** LINE 自身や無効な Activity を除外し、元の resolver 順を維持します。 */
    public static List<Candidate> externalCandidates(
            String ownPackageName,
            List<Candidate> resolvedCandidates) {
        List<Candidate> external = new ArrayList<>();
        if (ownPackageName == null || resolvedCandidates == null) {
            return external;
        }

        Set<Candidate> seen = new HashSet<>();
        for (Candidate candidate : resolvedCandidates) {
            if (candidate == null
                    || candidate.packageName == null
                    || candidate.className == null
                    || !candidate.exported
                    || !candidate.enabled
                    || ownPackageName.equals(candidate.packageName)
                    || !seen.add(candidate)) {
                continue;
            }
            external.add(candidate);
        }
        return external;
    }

    private static boolean isHostOrSubdomain(String host, String root) {
        return root.equals(host) || host.endsWith('.' + root);
    }
}
