package app.morphe.extension.chmate;

import android.app.Activity;
import android.app.DatePickerDialog;
import android.content.Intent;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemClock;
import android.text.Html;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


final class WacchoiBackgroundJob {
    private static final String ORIGIN = "http://hissi.org";
    private static final String ZZZSEARCH_URL = "https://zzzsearch.com/2ch/";
    private static final String EDGE_BOARD = "https://www.kyodemo.net/sdemo/b/e_e_liveedge/?kt=k_&j=1";
    private static final String EDGE_THREAD = "https://www.kyodemo.net/sdemo/r/e_e_liveedge/";
    private static final long MIN_INTERVAL_MS = 10_000L;
    private static final int RESPONSE_LIMIT = 2 * 1024 * 1024;
    private static final int MAX_LIST_PAGES = 10_000;
    private static final int MAX_SEARCH_DAYS = 36525;
    private static final int MAX_PROFILES = 25;
    private static final int MAX_VISIBLE_BOARDS = 120;
    private static final Pattern BOARD_LINK = Pattern.compile(
            "(?is)<a\\b[^>]*href\\s*=\\s*['\\\"]?(?:https?://(?:www\\.)?hissi\\.org)?/read\\.php/([a-z0-9_-]+)/[^>]*>(.*?)</a>");
    private static final Pattern ROW = Pattern.compile("(?is)<tr\\b[^>]*>(.*?)</tr>");
    private static final Pattern PROFILE_LINK = Pattern.compile(
            "(?is)<a\\b[^>]*?href\\s*=\\s*['\\\"]?([^\\s'\\\">]+)['\\\"]?[^>]*>(.*?)</a>");
    private static final Pattern SLIP = WacchoiSearch.SLIP;
    private static final Pattern THREAD_LINK = Pattern.compile(
            "(?i)href=['\\\"]?(https?://[a-z0-9.-]+\\.5ch\\.(?:io|net)/test/read\\.cgi/[^\\s'\\\">]+)");
    private static final Pattern EDGE_THREAD_LINK = Pattern.compile(
            "(?i)href\\s*=\\s*['\\\"](?:https?://(?:www\\.)?kyodemo\\.net)?/sdemo/r/e_e_liveedge/([0-9]{10,})/");
    private static final Pattern EDGE_BOARD_NEXT = Pattern.compile(
            "(?i)href\\s*=\\s*['\\\"]((?:https?://(?:www\\.)?kyodemo\\.net)?/sdemo/b/e_e_liveedge/[0-9]+[^'\\\"]*)['\\\"]");
    private static final Pattern EDGE_POST_START = Pattern.compile(
            "(?is)<div\\s+class=['\\\"]post\\s+p([0-9]+)\\b[^'\\\"]*['\\\"][^>]*>");
    private static final Pattern EDGE_ID = Pattern.compile(
            "(?is)<span\\s+class=['\\\"]clid['\\\"][^>]*>(.*?)</span>");
    private static final Pattern EDGE_MORE = Pattern.compile(
            "(?is)data-url=['\\\"]([^'\\\"]+)['\\\"]\\s+data-tag=['\\\"]rlist['\\\"]");
    private static final Pattern EDGE_TITLE = Pattern.compile(
            "(?is)<title>(.*?)\\s+-\\s*エッヂ</title>");


    private final android.content.Context context;
    private volatile Runnable changed;
    private final ExecutorService executor=Executors.newSingleThreadExecutor();
    private volatile Future<?> job;
    private volatile Thread worker;
    private volatile boolean cancelled;
    private volatile long lastRequestAt;
    private volatile HttpURLConnection activeConnection;
    private volatile SearchCursor resumeCursor;
    private String edgeTitleWords = "", edgeBodyWords = "";
    private boolean edgeArchive;
    private int edgeMatchMode;
    private String edgeNextBoard, edgeResumeUrl, edgeResumeTitle = "";
    private WacchoiSearch.RequestBudget requestBudget = new WacchoiSearch.RequestBudget(0);
    private int manualStartAt;
    private final Set<String> edgeVisitedBoards = new LinkedHashSet<>();
    volatile boolean running;
    volatile String status="開始しています";
    private WacchoiHistory.Session history;
    private volatile Intent searchArguments;
    void rememberArguments(Intent args){searchArguments=WacchoiSearchState.copy(args);}
    Intent searchArguments(){return WacchoiSearchState.copy(searchArguments);}
    static final class Record {
        final int kind; final String a,b,c,d;
        Record(int kind,String a,String b,String c,String d){this.kind=kind;this.a=a;this.b=b;this.c=c;this.d=d;}
    }
    private final List<Record> records=new ArrayList<>();
    WacchoiBackgroundJob(android.content.Context context,Runnable changed){this.context=context.getApplicationContext();this.changed=changed;}
    synchronized List<Record> records(){return new ArrayList<>(records);}
    boolean canResume(){return resumeCursor!=null;}
    void setListener(Runnable listener){changed=listener;}
    void start(android.content.Intent args){
        if(!FeatureSwitches.enabled("wacchoiSearchEnabled",true))return;
        if(running)return;
        rememberArguments(args);
        try { manualStartAt=Integer.parseInt(args.getStringExtra("startAt")); }
        catch(RuntimeException ignored){manualStartAt=0;}
        manualStartAt=Math.max(0,Math.min(9999,manualStartAt));
        requestBudget = new WacchoiSearch.RequestBudget(args.getIntExtra("requestLimit",0));
        history=WacchoiHistory.begin(context,args);
        running=true;cancelled=false;
        edgeTitleWords=args.getStringExtra("titleWords"); edgeBodyWords=args.getStringExtra("bodyWords");
        edgeArchive=args.getBooleanExtra("edgeArchive",true);
        edgeMatchMode=args.getIntExtra("edgeMatchMode",0);
        String four=args.getStringExtra("four");
        boolean upper=args.getBooleanExtra("upper",false);
        int limit=Math.max(1,Math.min(MAX_LIST_PAGES,args.getIntExtra("limit",100)));
        job=executor.submit(()->{
            worker=Thread.currentThread();
            String resumeId=args.getStringExtra("resumeHistory");
            if(resumeId!=null){
                try{
                    org.json.JSONObject saved=WacchoiHistory.readOne(context,resumeId);
                    org.json.JSONObject checkpoint=saved.getJSONObject("checkpoint");
                    SearchCursor cursor=SearchCursor.decode(checkpoint);
                    edgeNextBoard=SearchCursor.nullable(checkpoint,"next");edgeResumeUrl=SearchCursor.nullable(checkpoint,"url");
                    edgeResumeTitle=checkpoint.optString("title");
                    List<String> visited=SearchCursor.strings(checkpoint.optJSONArray("visited"));
                    if(visited!=null)edgeVisitedBoards.addAll(visited);
                    org.json.JSONArray results=saved.optJSONArray("results");
                    if(results!=null)for(int i=0;i<results.length();i++){
                        org.json.JSONObject r=results.optJSONObject(i);if(r!=null)add(new Record(r.optInt("kind"),r.optString("a"),r.optString("b"),r.optString("c"),r.optString("d")));
                    }
                    resumeCursor=cursor;
                    if(cursor.edgeIds!=null)runEdgeSearch(cursor.four,cursor.firstHalf,cursor.limit,cursor);
                    else runSearch(cursor.boardChoice,cursor.date,cursor.to,cursor.four,cursor.firstHalf,cursor.limit,cursor);
                }catch(Exception e){publishStatus("履歴から再開できません: "+e.getMessage());finish();}
                return;
            }
            if(args.getBooleanExtra("edge",false))runEdgeSearch(four,upper,limit,null);
            else runSearch(args.getStringExtra("boards"),args.getStringExtra("from"),args.getStringExtra("to"),four,upper,limit,null);
        });
    }
    void resume(){
        if(!FeatureSwitches.enabled("wacchoiSearchEnabled",true))return;
        SearchCursor cursor=resumeCursor;if(running||cursor==null)return;
        requestBudget.reset();
        running=true;cancelled=false;
        job=executor.submit(()->{
            worker=Thread.currentThread();
            if(cursor.edgeIds!=null)runEdgeSearch(cursor.four,cursor.firstHalf,cursor.limit,cursor);
            else runSearch(cursor.boardChoice,cursor.date,cursor.to,cursor.four,cursor.firstHalf,cursor.limit,cursor);
        });
    }
    void cancel(){
        if(!running)return;
        status="停止しています";if(history!=null)history.status(status);
        cancelled=true;
        HttpURLConnection connection=activeConnection;
        if(connection!=null)new Thread(connection::disconnect,"wacchoi-bg-close").start();
        Thread task=worker;if(task!=null)task.interrupt();
        // Remain running until the old worker exits: an immediate resume must not
        // clear cancellation while it is still publishing results or its cursor.
        changed.run();
    }
    void release(){if(running)cancel();executor.shutdownNow();}
    private void saveProgress(){if(history!=null)history.progress(resumeCursor,edgeNextBoard,edgeResumeUrl,edgeResumeTitle,edgeVisitedBoards);}
    private void finish(){saveProgress();worker=null;running=false;if(history!=null)history.status(status);changed.run();}
    private void publishStatus(String text){status=text;saveProgress();if(history!=null)history.status(text);changed.run();}
    private final Set<String> resultKeys=new LinkedHashSet<>();
    private synchronized void add(Record record){
        if(!resultKeys.add(record.kind+"\n"+record.a))return;
        if(history!=null)history.add(record.kind,record.a,record.b,record.c,record.d);
        if(records.size()<2000)records.add(record);
        else status="結果表示は2000件までです。条件を絞って検索してください。";
    }
    private void publishResult(String item,String caption){add(new Record(0,item,caption,"",""));}
    private void publishThread(HissiThreadResults.Result result){add(new Record(1,result.url,result.titleHtml,result.bodyHtml,""));}
    private void publishEdgeResult(String url,String caption,String slip,String identity){add(new Record(2,url,caption,slip,identity));}
    private void runSearch(String boardChoice, String from, String to, String four,
            boolean firstHalf, int pageLimit, SearchCursor resume) {
        int requests = 0, scanned = 0, profiles = 0, found = 0;
        boolean exhausted = true;
        Set<String> boardsDone = new LinkedHashSet<>();
        try {
            List<String> boards;
            if (resume != null) boards = resume.boards;
            else if (boardChoice.equals("*")) {
                String menu = fetch(ORIGIN + "/menu.php"); requests++;
                Matcher boardMatcher = BOARD_LINK.matcher(menu);
                boards = new ArrayList<>();
                while (boardMatcher.find()) boards.add(boardMatcher.group(1));
                boards = new ArrayList<>(new LinkedHashSet<>(boards));
                if (boards.isEmpty()) throw new IllegalStateException("Hissiの対応板一覧を読み取れませんでした");
            } else boards = new ArrayList<>(java.util.Arrays.asList(boardChoice.split(",")));

            Calendar day = Calendar.getInstance();
            day.setTime(new SimpleDateFormat("yyyyMMdd", Locale.US).parse(resume == null ? from : resume.date));
            Calendar end = Calendar.getInstance();
            end.setTime(new SimpleDateFormat("yyyyMMdd", Locale.US).parse(to));
            outer: for (; !day.after(end); day.add(Calendar.DATE, 1)) {
                String date = new SimpleDateFormat("yyyyMMdd", Locale.US).format(day.getTime());
                for (String board : boards) {
                    if (resume != null && date.equals(resume.date)
                            && boards.indexOf(board) < boards.indexOf(resume.board)) continue;
                    int page = resume != null && date.equals(resume.date) && board.equals(resume.board)
                            ? resume.page : date.equals(from)&&board.equals(boards.get(0)) ? manualStartAt : 0;
                    resumeCursor = new SearchCursor(boards, boardChoice, date, to, board, page,
                            four, firstHalf, pageLimit, null, 0);
                    if (cancelled || scanned >= pageLimit) { exhausted = false; break outer; }
                    String base = ORIGIN + "/read.php/" + board + "/" + date + "/";
                    while (!cancelled && scanned < pageLimit) {
                        resumeCursor = new SearchCursor(boards, boardChoice, date, to, board, page,
                                four, firstHalf, pageLimit, null, 0);
                        String url = base + (page == 0 ? "" : "?p=" + page);
                        String body = fetch(url); requests++; scanned++; boardsDone.add(board);
                        List<String> next = scanRows(body, base, four, firstHalf);
                        for (String result : next) {
                            if (cancelled) throw new InterruptedException("停止しました");
                            found++;
                            publishResult(result, "一致 " + date + " / " + board);
                            if (profiles < MAX_PROFILES) {
                                String profileUrl = result.substring(0, result.indexOf('\n'));
                                String profile = fetch(profileUrl); requests++; profiles++;
                                for (HissiThreadResults.Result thread : HissiThreadResults.parse(profile)) {
                                    publishThread(thread);
                                }
                            }
                        }
                        publishStatus("日付 " + date + " / 板 " + board + " / 一覧 " + scanned
                                + "ページ / 通信 " + requestBudget.used + "回 / 一致 " + found);
                        int nextNumber = WacchoiSearch.nextPage(body, page);
                        if (nextNumber < 0) break;
                        page = nextNumber;
                        resumeCursor = new SearchCursor(boards, boardChoice, date, to, board, page,
                                four, firstHalf, pageLimit, null, 0);
                        if (scanned >= pageLimit || cancelled) { exhausted = false; break outer; }
                    }
                }
            }
            if (exhausted && !cancelled) resumeCursor = null;
            String finalState = cancelled ? "停止しました" : resumeCursor != null
                    ? "ページ上限に達しました。「続きから検索」で再開できます"
                    : "検索範囲の確認が終わりました";
            publishStatus(finalState + "。対象板 " + boardsDone.size() + " / 日別一覧 " + scanned
                    + "ページ / 通信 " + requestBudget.used + "回 / 一致 " + found
                    + "。これはHissiに収録された範囲です。");
        } catch (Exception error) {
            publishStatus((cancelled ? "停止しました" : "検索を中断しました") + ": " + error.getMessage()
                    + "。通信 " + requestBudget.used + "回、一覧 " + scanned + "ページ。");
        } finally {
            finish();
        }
    }

    private void runEdgeSearch(String four, boolean firstHalf, int threadLimit, SearchCursor resume) {
        int requests = 0, scanned = 0, found = 0, unavailable = 0;
        try {
            List<String> ids = resume == null ? new ArrayList<>() : resume.edgeIds;
            if (resume == null) {
                edgeVisitedBoards.clear();
                edgeResumeUrl = null; edgeResumeTitle = "";
                String pageUrl = WacchoiSearch.edgeBoardUrl(edgeArchive, edgeTitleWords);
                Set<String> uniqueIds = new LinkedHashSet<>();
                while (pageUrl != null && uniqueIds.isEmpty() && !cancelled) {
                    if (edgeVisitedBoards.contains(pageUrl)) break;
                    String boardHtml = fetchEdge(pageUrl); requests++;
                    edgeVisitedBoards.add(pageUrl);
                    Matcher threads = EDGE_THREAD_LINK.matcher(boardHtml);
                    while (threads.find()) uniqueIds.add(threads.group(1));
                    Matcher next = EDGE_BOARD_NEXT.matcher(boardHtml);
                    String nextPage = null;
                    while (next.find()) nextPage = next.group(1).replace("&amp;", "&");
                    pageUrl = nextPage == null ? null
                            : new URL(new URL(EDGE_BOARD), nextPage).toString();
                }
                edgeNextBoard = pageUrl;
                ids.addAll(uniqueIds);
            }
            if (ids.isEmpty()) {
                throw new IllegalStateException("Kyodemoのスレ一覧からスレIDを読み取れませんでした");
            }
            int index = resume == null ? manualStartAt : resume.edgeIndex;
            for (; index < ids.size() || edgeNextBoard != null; index++) {
                if (cancelled || (threadLimit > 0 && scanned >= threadLimit)) break;
                if (index >= ids.size()) {
                    if (edgeVisitedBoards.contains(edgeNextBoard)) { edgeNextBoard = null; break; }
                    String boardHtml = fetchEdge(edgeNextBoard); requests++;
                    edgeVisitedBoards.add(edgeNextBoard);
                    Matcher links = EDGE_THREAD_LINK.matcher(boardHtml);
                    while (links.find()) if (!ids.contains(links.group(1))) ids.add(links.group(1));
                    Matcher next = EDGE_BOARD_NEXT.matcher(boardHtml);
                    String nextPage = null;
                    while (next.find()) nextPage = next.group(1).replace("&amp;", "&");
                    edgeNextBoard = nextPage == null ? null : new URL(new URL(EDGE_BOARD), nextPage).toString();
                    if (index >= ids.size()) { index--; continue; }
                }
                String id = ids.get(index);
                resumeCursor = new SearchCursor(null, "", "", "", "", 0, four,
                        firstHalf, threadLimit, ids, index);
                if (cancelled || (threadLimit > 0 && scanned >= threadLimit)) break;
                String threadUrl = EDGE_THREAD + id + "/";
                String pageUrl = edgeResumeUrl == null ? threadUrl : edgeResumeUrl;
                String title = edgeResumeUrl == null ? "" : edgeResumeTitle;
                Set<String> visitedPages = new LinkedHashSet<>();
                int threadMatches = 0;
                try {
                do {
                    if (!visitedPages.add(pageUrl)) throw new IllegalStateException("続きページが循環しています");
                    edgeResumeUrl = pageUrl; edgeResumeTitle = title;
                    requests++; String html = fetchEdge(pageUrl);
                    if (title.isEmpty()) {
                        Matcher titleMatcher = EDGE_TITLE.matcher(html);
                        if (titleMatcher.find()) title = Html.fromHtml(
                                titleMatcher.group(1), Html.FROM_HTML_MODE_LEGACY).toString().trim();
                    }
                    if (!WacchoiHistorySearch.matches(title, edgeTitleWords)) break;
                    Matcher posts = EDGE_POST_START.matcher(html);
                    List<Integer> starts = new ArrayList<>();
                    List<String> numbers = new ArrayList<>();
                    List<Integer> contentStarts = new ArrayList<>();
                    while (posts.find()) {
                        numbers.add(posts.group(1));
                        starts.add(posts.start());
                        contentStarts.add(posts.end());
                    }
                    Matcher more = EDGE_MORE.matcher(html);
                    String nextUrl = more.find()
                            ? new URL(new URL(EDGE_BOARD), more.group(1).replace("&amp;", "&")).toString()
                            : null;
                    for (int postIndex = 0; postIndex < numbers.size(); postIndex++) {
                        int end = postIndex + 1 < starts.size() ? starts.get(postIndex + 1)
                                : (nextUrl == null ? html.length() : more.start());
                        String postHtml = html.substring(contentStarts.get(postIndex), end);
                        Matcher edgeId = EDGE_ID.matcher(postHtml);
                        String identity = edgeId.find() ? Html.fromHtml(edgeId.group(1), Html.FROM_HTML_MODE_LEGACY)
                                .toString().trim() : "";
                        String wacchoi = WacchoiSearch.edgeWacchoi(postHtml);
                        if (edgeMatchMode == 0 ? !WacchoiSearch.matchesEdgeId(four, identity)
                                : !WacchoiSearch.matchesEdgeWacchoi(four, wacchoi, firstHalf)) continue;
                        String poster = "ID:" + identity + (wacchoi.isEmpty() ? "" : " / ﾜｯﾁｮｲ:" + wacchoi);
                        String postText = Html.fromHtml(WacchoiSearch.edgeBodyHtml(postHtml), Html.FROM_HTML_MODE_LEGACY)
                                .toString().replaceAll("\\s+", " ").trim();
                        if (!WacchoiHistorySearch.matches(postText, edgeBodyWords)) continue;
                        publishEdgeResult(threadUrl + "n" + numbers.get(postIndex) + "-",
                                "エッヂ「" + title + "」 " + numbers.get(postIndex) + "レス",
                                poster, poster
                                        + (postText.isEmpty() ? "" : " / " + postText));
                        threadMatches++;
                    }
                    pageUrl = nextUrl;
                    edgeResumeUrl = pageUrl; edgeResumeTitle = title;
                } while (pageUrl != null && !cancelled);
                } catch (FileNotFoundException missing) {
                    unavailable++;
                    android.util.Log.w("HaiagaruKyodemo", missing.getMessage());
                }
                if (cancelled) break;
                edgeResumeUrl = null; edgeResumeTitle = "";
                scanned++;
                found += threadMatches;
                publishStatus("Kyodemoエッヂスレ " + scanned + "/" + (threadLimit == 0 ? ids.size() : Math.min(ids.size(), threadLimit))
                        + "件 / 通信 " + requestBudget.used + "回 / 一致 " + found + " / 未収録 " + unavailable + "スレ");
                resumeCursor = new SearchCursor(null, "", "", "", "", 0, four,
                        firstHalf, threadLimit, ids, index + 1);
            }
            if (index >= ids.size() && edgeNextBoard == null) resumeCursor = null;
            else resumeCursor = new SearchCursor(null, "", "", "", "", 0, four, firstHalf, threadLimit, ids, index);
            String state = cancelled ? "停止しました" : (threadLimit > 0 && scanned >= threadLimit) && resumeCursor != null
                    ? "スレ件数上限に達しました" : "スレ一覧の走査が完了しました";
            publishStatus(state + "。Kyodemoエッヂスレ " + scanned + "/" + ids.size()
                    + "件 / 通信 " + requestBudget.used + "回 / 一致 " + found + " / 未収録 " + unavailable + "スレ"
                    + "。Kyodemoに収録されたスレが対象です。");
        } catch (Exception error) {
            publishStatus((cancelled ? "停止しました" : "エッヂ検索を中断しました") + ": "
                    + error.getMessage() + "。通信 " + requestBudget.used + "回、照合 " + scanned + "スレ。");
        } finally {
            finish();
        }
    }

    private String fetchEdge(String address) throws Exception {
        if(!FeatureSwitches.enabled("wacchoiSearchEnabled",true))throw new InterruptedException("検索は設定でオフになっています");
        requestBudget.check();
        SearchRequestPacing.await(address);
        if (cancelled || Thread.currentThread().isInterrupted())
            throw new InterruptedException("停止しました");
        HttpURLConnection connection = (HttpURLConnection) new URL(address).openConnection();
        activeConnection = connection;
        connection.setConnectTimeout(20_000); connection.setReadTimeout(30_000);
        connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Linux; Android) Haiagaru/1.0");
        lastRequestAt = SystemClock.elapsedRealtime();
        try {
            requestBudget.take();
            int code = connection.getResponseCode();
            if (code == 404) throw new FileNotFoundException("Kyodemo未収録（404）: " + address);
            if (code == 403 || code == 429 || code >= 500)
                throw new IllegalStateException("エッヂ応答 " + code + "。負荷・制限のため停止しました");
            if (code < 200 || code >= 300) throw new IllegalStateException("Kyodemo応答 " + code + ": " + address);
            byte[] bytes;
            try (InputStream in = connection.getInputStream()) { bytes = readBytes(in); }
            return new String(bytes, Charset.forName("Shift_JIS"));
        } finally { connection.disconnect(); activeConnection = null; }
    }

    private List<String> scanRows(String body, String base, String four, boolean firstHalf) {
        List<String> found = new ArrayList<>();
        Matcher rows = ROW.matcher(body);
        while (rows.find() && !cancelled) {
            String row = rows.group(1);
            String profileUrl = null;
            Matcher link = PROFILE_LINK.matcher(row);
            while (link.find()) {
                String href = link.group(1).replace("&amp;", "&");
                String path = href.split("[?#]", 2)[0];
                if (path.endsWith(".html")) {
                    profileUrl = WacchoiSearch.profileUrl(base, href);
                    if (profileUrl != null) break;
                }
            }
            if (profileUrl == null) continue;
            // Hissi has changed table columns over time. Match the full row instead of
            // assuming that the poster name/ID is always the final table cell.
            String names = Html.fromHtml(row, Html.FROM_HTML_MODE_LEGACY).toString()
                    .replace('\u00a0', ' ').replace('\u3000', ' ').trim();
            Matcher slip = SLIP.matcher(names);
            while (slip.find()) {
                if (WacchoiSearch.matchesFilter(four, slip, firstHalf)) {
                    found.add(profileUrl + "\n" + names + "\n" + slip.group());
                    break;
                }
            }
        }
        return found;
    }

    private String fetch(String address) throws Exception {
        if(!FeatureSwitches.enabled("wacchoiSearchEnabled",true))throw new InterruptedException("検索は設定でオフになっています");
        File cache = cacheFile(address);
        byte[] cached=WacchoiPageCache.read(context,cache);
        if(cached!=null)return new String(cached,Charset.forName("Shift_JIS"));
        requestBudget.check();
        SearchRequestPacing.await(address);
        if (cancelled || Thread.currentThread().isInterrupted()) throw new InterruptedException("停止しました");
        HttpURLConnection connection = (HttpURLConnection) new URL(address).openConnection();
        activeConnection = connection;
        connection.setConnectTimeout(20_000); connection.setReadTimeout(20_000);
        connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Linux; Android) Haiagaru/1.0");
        connection.setInstanceFollowRedirects(true);
        lastRequestAt = SystemClock.elapsedRealtime();
        try {
            requestBudget.take();
            int code = connection.getResponseCode();
            if (code == 403 || code == 429 || code >= 500)
                throw new IllegalStateException("Hissi応答 " + code + "。サーバー負荷のため停止しました");
            if (code < 200 || code >= 300) throw new IllegalStateException("Hissi応答 " + code);
            byte[] bytes;
            try (InputStream in = connection.getInputStream()) { bytes = readBytes(in); }
            String text = new String(bytes, Charset.forName("Shift_JIS"));
            WacchoiPageCache.write(context,cache,bytes);
            return text;
        } finally { connection.disconnect(); activeConnection = null; }
    }

    private String readText(InputStream in) throws Exception {
        return new String(readBytes(in), Charset.forName("Shift_JIS"));
    }

    private byte[] readBytes(InputStream in) throws Exception {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[8192]; int total = 0, count;
        while ((count = in.read(buffer)) != -1) {
            total += count;
            if (total > RESPONSE_LIMIT) throw new IllegalStateException("応答サイズ上限を超えました");
            out.write(buffer, 0, count);
        }
        return out.toByteArray();
    }

    private File cacheFile(String value) throws Exception {
        byte[] hash = MessageDigest.getInstance("SHA-256").digest(value.getBytes("UTF-8"));
        StringBuilder name = new StringBuilder();
        for (byte b : hash) name.append(String.format(Locale.US, "%02x", b));
        return WacchoiPageCache.file(context,name+".html");
    }

    private void trimCache(File dir) {
        long limit = WacchoiStorageLimits.scaled(context,5,1024L*1024);
        File[] files = dir.listFiles(); if (files == null) return;
        long size = 0; for (File file : files) size += file.length();
        if (size <= limit) return;
        java.util.Arrays.sort(files, Comparator.comparingLong(File::lastModified));
        for (File file : files) { if (size <= limit) break; size -= file.length(); file.delete(); }
    }

}
