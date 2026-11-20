package app.morphe.extension.chmate;

import java.util.*;

/** Board selection persisted inside the native NG item's board field. */
public final class NgBoardScope {
    private static final String INCLUDE = "@haiagaru:boards:in:";
    private static final String EXCLUDE = "@haiagaru:boards:out:";
    private static final String THREAD = "@haiagaru:thread:";
    private NgBoardScope() {}

    public static boolean matches(String scope, String board) {
        if (scope == null || scope.isEmpty()) return true;
        if (isThread(scope)) {
            FilterPosition.ThreadTarget target=FilterPosition.currentVisibleThread();
            return target!=null&&isThread(scope,target.board,target.threadId);
        }
        if (!isSelection(scope)) return scope.equals(board);
        Set<String> boards = boards(scope);
        // Malformed or empty selections must never turn into a global NG.
        if (boards.isEmpty() || board == null || board.isEmpty()) return false;
        boolean selected = boards.contains(board);
        return isExcluded(scope) ? !selected : selected;
    }

    static boolean isSelection(String scope) {
        return scope != null && (scope.startsWith(INCLUDE) || scope.startsWith(EXCLUDE));
    }

    static boolean isExcluded(String scope) { return scope != null && scope.startsWith(EXCLUDE); }

    /** Stable opaque key stored in NGWord.Item.board for a single thread. */
    static String thread(String board, long threadId) {
        if (board == null || board.isEmpty() || threadId <= 0) throw new IllegalArgumentException("Invalid thread scope");
        String encoded = android.util.Base64.encodeToString(board.getBytes(java.nio.charset.StandardCharsets.UTF_8),
                android.util.Base64.URL_SAFE | android.util.Base64.NO_WRAP | android.util.Base64.NO_PADDING);
        return THREAD + encoded + ":" + threadId;
    }

    static boolean isThread(String scope) { return scope != null && scope.startsWith(THREAD); }

    static String threadBoard(String scope){
        try{return new String(android.util.Base64.decode(scope.substring(THREAD.length()).split(":",2)[0],
                android.util.Base64.URL_SAFE|android.util.Base64.NO_WRAP|android.util.Base64.NO_PADDING),java.nio.charset.StandardCharsets.UTF_8);}
        catch(Exception malformed){return null;}
    }
    static long threadId(String scope){
        try{return Long.parseLong(scope.substring(THREAD.length()).split(":",2)[1]);}catch(Exception malformed){return -1;}
    }

    static boolean isThread(String scope, String board, long threadId) {
        if (scope == null || board == null || threadId <= 0 || !scope.startsWith(THREAD)) return false;
        return thread(board, threadId).equals(scope);
    }

    static Set<String> boards(String scope) {
        Set<String> result = new TreeSet<>();
        if (scope == null || scope.isEmpty()) return result;
        if(isThread(scope))return result;
        String value = isSelection(scope) ? scope.substring(isExcluded(scope) ? EXCLUDE.length() : INCLUDE.length()) : scope;
        for (String board : value.split(",", -1)) if (!board.isEmpty()) result.add(board);
        return result;
    }

    static String encode(boolean exclude, Collection<String> selection) {
        Set<String> clean = new TreeSet<>();
        for (String board : selection) {
            board = board.trim();
            if (board.isEmpty() || board.startsWith("@") || board.matches(".*[\\s,\\t\\r\\n].*"))
                throw new IllegalArgumentException("板IDを入力してください（URLではなく android など）");
            if (board.contains("://")) throw new IllegalArgumentException("板IDを入力してください（URLではなく android など）");
            clean.add(board);
        }
        if (clean.isEmpty()) throw new IllegalArgumentException("対象の板を1つ以上選択してください");
        if (!exclude && clean.size() == 1) return clean.iterator().next();
        return (exclude ? EXCLUDE : INCLUDE) + String.join(",", clean);
    }

    static String label(String scope) {
        if (scope == null || scope.isEmpty()) return "全板共通";
        if(isThread(scope)){
            String board=threadBoard(scope);long id=threadId(scope);
            return board!=null&&id>0?"このスレのみ: "+board+" / "+id:"このスレのみ（識別情報が不正）";
        }
        if (!isSelection(scope)) return scope;
        return (isExcluded(scope) ? "次の板以外すべて: " : "選択した板のみ: ") + String.join(", ", boards(scope));
    }
}
