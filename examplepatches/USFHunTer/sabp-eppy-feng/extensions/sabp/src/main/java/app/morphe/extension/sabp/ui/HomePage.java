package app.morphe.extension.sabp.ui;

import android.content.Context;
import android.graphics.Bitmap;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import app.morphe.extension.sabp.EppyBridge;
import app.morphe.extension.sabp.EppyPlayer;
import app.morphe.extension.sabp.EppyTheme;

/** Home: greeting, search, "Continue listening" hero card and shelves. */
public final class HomePage {
    private final Host host;
    private final Context c;
    private final EppyTheme t;
    public final ScrollView root;
    private final LinearLayout col;
    private final LinearLayout dynamic;
    private EditText search;
    private String query = "";
    private int columnsWidthPx;

    // Hero card views (updated every tick without rebuilding).
    private ProgressBar heroProgress;
    private TextView heroMeta;
    private PlayButton heroPlay;

    public HomePage(Host host) {
        this.host = host;
        this.c = host.activity();
        this.t = host.theme();
        root = new ScrollView(c);
        root.setFillViewport(true);
        root.setClipToPadding(false);
        col = Ui.column(c);
        col.setPadding(Ui.dp(c, 20), Ui.dp(c, 12), Ui.dp(c, 20), Ui.dp(c, 8));
        root.addView(col, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        col.addView(header(), new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        dynamic = Ui.column(c);
        col.addView(dynamic, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        rebuild();
    }

    /** Header in the style of the active skin. */
    private View header() {
        String name = t.userName != null ? t.userName.trim() : "";
        int iconBg = t.cardShadow ? t.surfaceContainerLow : t.surfaceContainerHigh;
        if (t.homeStyle == EppyTheme.HOME_EXPLORE) {
            LinearLayout box = Ui.column(c);
            LinearLayout row = Ui.row(c);
            row.addView(Ui.iconButton(c, t, EppyIcon.GRID, t.onSurface, iconBg, "Library", v -> host.selectTab(1)));
            TextView title = Ui.text(c, t, "Explore", 20, 600, t.onSurface);
            title.setGravity(Gravity.CENTER);
            title.setAccessibilityHeading(true);
            row.addView(title, Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            row.addView(Ui.iconButton(c, t, EppyIcon.TUNE, t.onPrimary, t.primary, "Settings", v -> host.selectTab(3)));
            box.addView(row);
            TextView fakeSearch = Ui.text(c, t, "Search book", 15, 400, t.onSurfaceVariant);
            fakeSearch.setGravity(Gravity.CENTER_VERTICAL);
            fakeSearch.setPadding(Ui.dp(c, 24), 0, Ui.dp(c, 20), 0);
            fakeSearch.setBackground(Ui.ripple(t, Ui.rounded(t.surfaceContainerLow, Ui.dp(c, 28)), Ui.dp(c, 28)));
            fakeSearch.setElevation(Ui.dp(c, 3));
            EppyIcon si = new EppyIcon(EppyIcon.SEARCH, t.onSurface);
            si.setBounds(0, 0, Ui.dp(c, 22), Ui.dp(c, 22));
            fakeSearch.setCompoundDrawables(null, null, si, null);
            fakeSearch.setOnClickListener(v -> toggleSearch());
            fakeSearch.setContentDescription("Search books");
            LinearLayout.LayoutParams sl = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Ui.dp(c, 56));
            sl.topMargin = Ui.dp(c, 20);
            box.addView(fakeSearch, sl);
            return box;
        }
        if (t.homeStyle == EppyTheme.HOME_HEADLINE) {
            LinearLayout box = Ui.column(c);
            LinearLayout row = Ui.row(c);
            row.addView(avatar(name));
            TextView hi = Ui.text(c, t, "", 16, 400, t.onSurfaceVariant);
            android.text.SpannableStringBuilder sb = new android.text.SpannableStringBuilder("Hi, ");
            int st = sb.length();
            sb.append(name.isEmpty() ? "listener" : name);
            sb.setSpan(new android.text.style.ForegroundColorSpan(t.onSurface), st, sb.length(), 0);
            hi.setText(sb);
            hi.setPadding(Ui.dp(c, 12), 0, 0, 0);
            row.addView(hi, Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            row.addView(Ui.iconButton(c, t, EppyIcon.SEARCH, t.onSurface, iconBg, "Search books", v -> toggleSearch()));
            row.addView(Ui.space(c, 8, 1));
            row.addView(Ui.iconButton(c, t, EppyIcon.TUNE, t.onSurface, iconBg, "Settings", v -> host.selectTab(3)));
            box.addView(row);
            TextView big = Ui.text(c, t, "", 34, 500, t.onSurface);
            android.text.SpannableStringBuilder h = new android.text.SpannableStringBuilder("Let's pick up\nwhere your\nstory left off");
            h.setSpan(new android.text.style.ForegroundColorSpan(EppyTheme.withAlpha(t.onSurface, 0.55f)), 0, 13, 0);
            big.setText(h);
            big.setLineSpacing(0, 1.05f);
            big.setPadding(0, Ui.dp(c, 24), 0, 0);
            big.setAccessibilityHeading(true);
            box.addView(big);
            return box;
        }
        // Greeting style (Material You, Ember, Paper).
        LinearLayout header = Ui.row(c);
        if (!t.skin.equals(EppyTheme.SKIN_MATERIAL)) header.addView(avatar(name));
        LinearLayout greet = Ui.column(c);
        if (!t.skin.equals(EppyTheme.SKIN_MATERIAL)) greet.setPadding(Ui.dp(c, 12), 0, 0, 0);
        TextView hello = Ui.text(c, t, "", t.skin.equals(EppyTheme.SKIN_MATERIAL) ? 30 : 19, t.skin.equals(EppyTheme.SKIN_MATERIAL) ? 600 : 400, t.onSurfaceVariant);
        android.text.SpannableStringBuilder sb = new android.text.SpannableStringBuilder(t.skin.equals(EppyTheme.SKIN_EMBER) ? shortGreeting() : greeting());
        if (!name.isEmpty()) {
            sb.append(", ");
            int st = sb.length();
            sb.append(name);
            sb.setSpan(new android.text.style.ForegroundColorSpan(t.onSurface), st, sb.length(), 0);
            sb.setSpan(new android.text.style.StyleSpan(android.graphics.Typeface.BOLD), st, sb.length(), 0);
        } else {
            sb.setSpan(new android.text.style.ForegroundColorSpan(t.onSurface), 0, sb.length(), 0);
        }
        hello.setText(sb);
        hello.setAccessibilityHeading(true);
        greet.addView(hello);
        if (!t.skin.equals(EppyTheme.SKIN_EMBER)) {
            TextView sub = Ui.text(c, t, t.skin.equals(EppyTheme.SKIN_PAPER) ? "We have some fantastic books for you." : "Your next chapter is waiting.", 14, 400, t.onSurfaceVariant);
            sub.setPadding(0, Ui.dp(c, 4), 0, 0);
            greet.addView(sub);
        }
        header.addView(greet, Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        header.addView(Ui.iconButton(c, t, EppyIcon.SEARCH, t.onSurface, iconBg, "Search books", v -> toggleSearch()));
        header.addView(Ui.space(c, 8, 1));
        header.addView(Ui.iconButton(c, t, EppyIcon.TUNE, t.onSurface, iconBg, "Settings", v -> host.selectTab(3)));
        return header;
    }

    private View avatar(String name) {
        TextView a = Ui.text(c, t, name.isEmpty() ? "" : name.substring(0, 1).toUpperCase(), 18, 650, t.onPrimary);
        a.setGravity(Gravity.CENTER);
        android.graphics.drawable.GradientDrawable d = new android.graphics.drawable.GradientDrawable(
                android.graphics.drawable.GradientDrawable.Orientation.TL_BR, new int[]{t.primary, t.tertiary != 0 ? t.tertiary : t.primary});
        d.setShape(android.graphics.drawable.GradientDrawable.OVAL);
        a.setBackground(d);
        if (name.isEmpty()) {
            a.setCompoundDrawablePadding(0);
            EppyIcon p = new EppyIcon(EppyIcon.PERSON, t.onPrimary);
            p.setBounds(0, 0, Ui.dp(c, 22), Ui.dp(c, 22));
            a.setCompoundDrawables(p, null, null, null);
            a.setPadding(Ui.dp(c, 13), 0, 0, 0);
        }
        a.setLayoutParams(new LinearLayout.LayoutParams(Ui.dp(c, 48), Ui.dp(c, 48)));
        a.setContentDescription("Profile. Set your name in Settings.");
        a.setOnClickListener(v -> host.selectTab(3));
        return a;
    }

    private static String shortGreeting() {
        int h = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
        if (h < 5) return "Night";
        if (h < 12) return "Morning";
        if (h < 17) return "Afternoon";
        return "Evening";
    }

    private static String greeting() {
        int h = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
        if (h < 5) return "Good night";
        if (h < 12) return "Good morning";
        if (h < 17) return "Good afternoon";
        return "Good evening";
    }

    public void setWidth(int px) {
        if (px != columnsWidthPx) {
            columnsWidthPx = px;
        }
    }

    private void toggleSearch() {
        if (search != null) {
            ViewGroup parent = (ViewGroup) search.getParent();
            if (parent != null) parent.removeView(search);
            search = null;
            query = "";
            hideKeyboard();
            rebuild();
            return;
        }
        search = new EditText(c);
        search.setHint("Search titles");
        search.setSingleLine(true);
        search.setTextColor(t.onSurface);
        search.setHintTextColor(t.onSurfaceVariant);
        search.setTypeface(EppyTheme.font(c, 400));
        search.setTextSize(16);
        search.setBackground(Ui.rounded(t.surfaceContainerHigh, Ui.dp(c, 28)));
        search.setPadding(Ui.dp(c, 20), 0, Ui.dp(c, 20), 0);
        search.setMinHeight(Ui.dp(c, 56));
        search.setCompoundDrawablePadding(Ui.dp(c, 12));
        EppyIcon icon = new EppyIcon(EppyIcon.SEARCH, t.onSurfaceVariant);
        icon.setBounds(0, 0, Ui.dp(c, 22), Ui.dp(c, 22));
        search.setCompoundDrawables(icon, null, null, null);
        search.setContentDescription("Search titles");
        search.addTextChangedListener(new TextWatcher() {
            public void beforeTextChanged(CharSequence s, int a, int b, int d) {
            }

            public void onTextChanged(CharSequence s, int a, int b, int d) {
            }

            public void afterTextChanged(Editable e) {
                query = e.toString().trim().toLowerCase(Locale.ROOT);
                rebuild();
            }
        });
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Ui.dp(c, 56));
        lp.topMargin = Ui.dp(c, 16);
        col.addView(search, 1, lp);
        search.requestFocus();
        InputMethodManager imm = (InputMethodManager) c.getSystemService(Context.INPUT_METHOD_SERVICE);
        if (imm != null) imm.showSoftInput(search, 0);
    }

    private void hideKeyboard() {
        InputMethodManager imm = (InputMethodManager) c.getSystemService(Context.INPUT_METHOD_SERVICE);
        if (imm != null) imm.hideSoftInputFromWindow(root.getWindowToken(), 0);
    }

    public boolean onBack() {
        if (search != null) {
            toggleSearch();
            return true;
        }
        return false;
    }

    public void focusSearch() {
        if (search == null) toggleSearch();
        else search.requestFocus();
    }

    /** Rebuilds the body from the current library and playback state. */
    public void rebuild() {
        dynamic.removeAllViews();
        heroProgress = null;
        heroMeta = null;
        heroPlay = null;
        EppyPlayer p = host.player();

        if (!query.isEmpty()) {
            List<EppyPlayer.Book> hits = new ArrayList<>();
            for (EppyPlayer.Book b : p.allBooks()) {
                if (b.title.toLowerCase(Locale.ROOT).contains(query)) hits.add(b);
            }
            sectionTitle(hits.isEmpty() ? "No matches" : hits.size() + (hits.size() == 1 ? " book" : " books"));
            for (EppyPlayer.Book b : hits) dynamic.addView(listRow(b));
            return;
        }

        if (p.libraryEmpty() && !p.hasSession()) {
            emptyState();
            return;
        }

        hero();

        String current = p.currentFolderUri();
        shelf("Continue listening", without(p.shelf(EppyPlayer.STATE_STARTED), current));
        shelf("Not started", p.shelf(EppyPlayer.STATE_NEW));
        shelf("Finished", p.shelf(EppyPlayer.STATE_FINISHED));
    }

    private static List<EppyPlayer.Book> without(List<EppyPlayer.Book> list, String uri) {
        ArrayList<EppyPlayer.Book> out = new ArrayList<>();
        for (EppyPlayer.Book b : list) if (uri == null || !uri.equals(b.folderUri)) out.add(b);
        return out;
    }

    private void emptyState() {
        LinearLayout box = Ui.column(c);
        box.setGravity(Gravity.CENTER_HORIZONTAL);
        box.setPadding(Ui.dp(c, 24), Ui.dp(c, 48), Ui.dp(c, 24), Ui.dp(c, 24));
        ImageView iv = new ImageView(c);
        iv.setImageDrawable(new EppyIcon(EppyIcon.HEADPHONES, t.primary));
        box.addView(iv, new LinearLayout.LayoutParams(Ui.dp(c, 72), Ui.dp(c, 72)));
        TextView h = Ui.text(c, t, host.player().isLibraryLoading() ? "Loading your library…" : "Let's find your audiobooks", 22, 600, t.onSurface);
        h.setGravity(Gravity.CENTER);
        h.setPadding(0, Ui.dp(c, 20), 0, Ui.dp(c, 8));
        box.addView(h);
        TextView s = Ui.text(c, t, "First time here? Open the classic player once to pick your audiobooks folder and grant access. Each sub-folder is one book. Then come back.", 15, 400, t.onSurfaceVariant);
        s.setGravity(Gravity.CENTER);
        box.addView(s);
        TextView btn = filledButton("Set up in classic player", v -> host.openSabp(EppyBridge.PLAYER_ACTIVITY));
        LinearLayout.LayoutParams bl = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, Ui.dp(c, 48));
        bl.topMargin = Ui.dp(c, 24);
        box.addView(btn, bl);
        TextView manager = textButton("Open library manager", v -> host.openSabp(EppyBridge.LIBRARY_ACTIVITY));
        box.addView(manager, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, Ui.dp(c, 48)));
        dynamic.addView(box, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
    }

    TextView filledButton(String label, View.OnClickListener l) {
        TextView b = Ui.text(c, t, label, 15, 600, t.onPrimary);
        b.setGravity(Gravity.CENTER);
        b.setPadding(Ui.dp(c, 24), 0, Ui.dp(c, 24), 0);
        b.setBackground(Ui.ripple(t, Ui.rounded(t.primary, Ui.dp(c, 24)), Ui.dp(c, 24)));
        b.setClickable(true);
        b.setFocusable(true);
        b.setOnClickListener(v -> {
            Ui.haptic(v, t);
            l.onClick(v);
        });
        return b;
    }

    TextView textButton(String label, View.OnClickListener l) {
        TextView b = Ui.text(c, t, label, 15, 600, t.primary);
        b.setGravity(Gravity.CENTER);
        b.setPadding(Ui.dp(c, 16), 0, Ui.dp(c, 16), 0);
        b.setBackground(Ui.ripple(t, null, Ui.dp(c, 24)));
        b.setClickable(true);
        b.setFocusable(true);
        b.setOnClickListener(l);
        return b;
    }

    /** The big "Continue listening" card for the current (or most recent) book. */
    private void hero() {
        EppyPlayer p = host.player();
        final boolean hasSession = p.hasSession();
        EppyPlayer.Book fallback = null;
        if (!hasSession) {
            List<EppyPlayer.Book> started = p.shelf(EppyPlayer.STATE_STARTED);
            if (!started.isEmpty()) fallback = started.get(0);
            else return;
        }
        final EppyPlayer.Book resume = fallback;

        LinearLayout card = Ui.column(c);
        float radius = Ui.dp(c, 28);
        int cardColor = t.homeStyle == EppyTheme.HOME_HEADLINE && t.dark ? t.primaryContainer
                : t.cardShadow ? t.surfaceContainerLow : t.surfaceContainerHigh;
        boolean onLight = t.homeStyle == EppyTheme.HOME_HEADLINE && t.dark;
        if (t.skin.equals(EppyTheme.SKIN_EMBER)) {
            android.graphics.drawable.GradientDrawable g = new android.graphics.drawable.GradientDrawable(
                    android.graphics.drawable.GradientDrawable.Orientation.TL_BR, new int[]{0xFF2A1A16, 0xFF1A1A1D});
            g.setCornerRadius(radius);
            card.setBackground(Ui.ripple(t, g, radius));
        } else {
            card.setBackground(Ui.ripple(t, Ui.rounded(cardColor, radius), radius));
        }
        if (t.cardShadow) card.setElevation(Ui.dp(c, 3));
        card.setPadding(Ui.dp(c, 16), Ui.dp(c, 16), Ui.dp(c, 16), Ui.dp(c, 16));
        card.setClickable(true);
        card.setFocusable(true);
        card.setOnClickListener(v -> {
            if (hasSession) host.openPlayer();
            else host.playBook(resume, true);
        });

        LinearLayout top = Ui.row(c);
        top.setGravity(Gravity.TOP);
        Bitmap art = hasSession ? p.cover() : resume.cover;
        ImageView cover = Ui.cover(c, t, art, 20);
        top.addView(cover, new LinearLayout.LayoutParams(Ui.dp(c, 112), Ui.dp(c, 112)));

        LinearLayout info = Ui.column(c);
        info.setPadding(Ui.dp(c, 16), Ui.dp(c, 2), 0, 0);
        TextView label = Ui.text(c, t, t.homeStyle == EppyTheme.HOME_EXPLORE ? "Book of the day" : "CONTINUE LISTENING",
                t.homeStyle == EppyTheme.HOME_EXPLORE ? 13 : 11, 600, onLight ? t.onPrimaryContainer : t.progressColor);
        label.setLetterSpacing(0.12f);
        info.addView(label);
        String titleText = hasSession ? p.bookTitle() : resume.title;
        TextView title = Ui.text(c, t, titleText != null ? titleText : "", 21, 650, onLight ? t.onPrimaryContainer : t.onSurface);
        title.setMaxLines(2);
        title.setEllipsize(android.text.TextUtils.TruncateAt.END);
        title.setPadding(0, Ui.dp(c, 8), 0, 0);
        info.addView(title);
        String ch = hasSession ? p.chapterTitle() : "Tap to resume";
        if (ch != null && ch.equals(titleText)) ch = null;
        if (ch != null) {
            TextView chapter = Ui.singleLine(Ui.text(c, t, ch, 14, 400, onLight ? EppyTheme.withAlpha(t.onPrimaryContainer, 0.7f) : t.onSurfaceVariant));
            chapter.setPadding(0, Ui.dp(c, 6), 0, 0);
            info.addView(chapter);
        }
        top.addView(info, Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        card.addView(top);

        LinearLayout bottom = Ui.row(c);
        bottom.setPadding(0, Ui.dp(c, 16), 0, 0);
        LinearLayout progressCol = Ui.column(c);
        heroProgress = new ProgressBar(c, null, android.R.attr.progressBarStyleHorizontal);
        heroProgress.setMax(1000);
        heroProgress.setProgressDrawable(pillProgress());
        progressCol.addView(heroProgress, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Ui.dp(c, 8)));
        heroMeta = Ui.text(c, t, "", 13, 500, onLight ? EppyTheme.withAlpha(t.onPrimaryContainer, 0.7f) : t.onSurfaceVariant);
        heroMeta.setPadding(0, Ui.dp(c, 8), 0, 0);
        progressCol.addView(heroMeta);
        bottom.addView(progressCol, Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        heroPlay = new PlayButton(c);
        heroPlay.apply(t);
        heroPlay.setOnClickListener(v -> {
            Ui.haptic(v, t);
            if (hasSession) host.player().playPause();
            else host.playBook(resume, false);
        });
        LinearLayout.LayoutParams pl = new LinearLayout.LayoutParams(Ui.dp(c, 56), Ui.dp(c, 56));
        pl.leftMargin = Ui.dp(c, 16);
        bottom.addView(heroPlay, pl);
        card.addView(bottom);

        LinearLayout.LayoutParams cl = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cl.topMargin = Ui.dp(c, 24);
        dynamic.addView(card, cl);
        if (!hasSession) {
            heroProgress.setVisibility(View.GONE);
            heroMeta.setText("Resume where you left off");
        }
        tick();
    }

    android.graphics.drawable.Drawable pillProgress() {
        float r = Ui.dp(c, 4);
        android.graphics.drawable.GradientDrawable track = Ui.rounded(t.dark ? t.surfaceContainerHighest : t.surfaceContainerHigh, r);
        android.graphics.drawable.GradientDrawable fill = Ui.rounded(t.progressColor, r);
        android.graphics.drawable.ClipDrawable clip = new android.graphics.drawable.ClipDrawable(fill, Gravity.START, android.graphics.drawable.ClipDrawable.HORIZONTAL);
        android.graphics.drawable.LayerDrawable ld = new android.graphics.drawable.LayerDrawable(new android.graphics.drawable.Drawable[]{track, clip});
        ld.setId(0, android.R.id.background);
        ld.setId(1, android.R.id.progress);
        return ld;
    }

    /** Cheap per-second refresh of the hero card. */
    public void tick() {
        EppyPlayer p = host.player();
        if (heroPlay != null) heroPlay.setPlaying(p.isPlaying(), true);
        if (heroProgress != null && p.hasSession()) {
            float prog = p.bookProgress();
            if (prog >= 0) {
                heroProgress.setProgress(Math.round(prog * 1000));
                int rem = p.bookRemainingSeconds();
                heroMeta.setText(Math.round(prog * 100) + "% completed" + (rem >= 0 ? " · " + Ui.duration(rem) + " left" : ""));
            } else {
                long d = p.durationMs();
                heroProgress.setProgress(d > 0 ? (int) (p.positionMs() * 1000 / d) : 0);
                heroMeta.setText(d > 0 ? Ui.duration((d - p.positionMs()) / 1000) + " left in chapter" : "");
            }
        }
    }

    private void sectionTitle(String s) {
        TextView tv = Ui.text(c, t, s, 20, 600, t.onSurface);
        tv.setAccessibilityHeading(true);
        tv.setPadding(0, Ui.dp(c, 28), 0, Ui.dp(c, 12));
        dynamic.addView(tv);
    }

    private void shelf(String title, List<EppyPlayer.Book> books) {
        if (books.isEmpty()) return;
        LinearLayout head = Ui.row(c);
        TextView tv = Ui.text(c, t, title, 20, 600, t.onSurface);
        tv.setAccessibilityHeading(true);
        head.addView(tv, Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        TextView count = Ui.text(c, t, String.valueOf(books.size()), 14, 500, t.onSurfaceVariant);
        head.addView(count);
        head.setPadding(0, Ui.dp(c, 28), 0, Ui.dp(c, 12));
        dynamic.addView(head);

        HorizontalScrollView hs = new HorizontalScrollView(c);
        hs.setHorizontalScrollBarEnabled(false);
        hs.setClipToPadding(false);
        LinearLayout row = Ui.row(c);
        row.setGravity(Gravity.TOP);
        int shown = Math.min(books.size(), 30);
        for (int i = 0; i < shown; i++) {
            View card = bookCard(books.get(i), 132);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(Ui.dp(c, 132), ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.rightMargin = Ui.dp(c, 14);
            row.addView(card, lp);
        }
        hs.addView(row);
        dynamic.addView(hs, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
    }

    /** Cover + two-line title card used by shelves and the library grid. */
    View bookCard(EppyPlayer.Book b, int sizeDp) {
        LinearLayout card = Ui.column(c);
        ImageView cover = Ui.cover(c, t, b.cover, 20);
        if (t.cardShadow) cover.setElevation(Ui.dp(c, 4));
        LinearLayout.LayoutParams cvl = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Ui.dp(c, sizeDp));
        cvl.setMargins(0, Ui.dp(c, 2), 0, 0);
        card.addView(cover, cvl);
        boolean paper = t.skin.equals(EppyTheme.SKIN_PAPER);
        TextView title = Ui.text(c, t, paper ? b.title.toUpperCase(Locale.ROOT) : b.title, paper ? 12 : 14, paper ? 600 : 500, t.onSurface);
        if (paper) {
            title.setLetterSpacing(0.06f);
            title.setGravity(Gravity.CENTER);
        }
        title.setMaxLines(2);
        title.setEllipsize(android.text.TextUtils.TruncateAt.END);
        title.setPadding(Ui.dp(c, 2), Ui.dp(c, 8), Ui.dp(c, 2), 0);
        card.addView(title);
        card.setBackground(Ui.ripple(t, null, Ui.dp(c, 20)));
        card.setClickable(true);
        card.setFocusable(true);
        card.setContentDescription(b.title + ", " + stateName(b.state) + ". Double-tap to play.");
        card.setOnClickListener(v -> {
            Ui.haptic(v, t);
            host.playBook(b, true);
        });
        card.setOnLongClickListener(v -> {
            bookSheet(b);
            return true;
        });
        return card;
    }

    View listRow(EppyPlayer.Book b) {
        LinearLayout row = Ui.row(c);
        row.setPadding(0, Ui.dp(c, 8), 0, Ui.dp(c, 8));
        row.setMinimumHeight(Ui.dp(c, 72));
        ImageView cover = Ui.cover(c, t, b.cover, 12);
        row.addView(cover, new LinearLayout.LayoutParams(Ui.dp(c, 56), Ui.dp(c, 56)));
        LinearLayout texts = Ui.column(c);
        texts.setPadding(Ui.dp(c, 16), 0, 0, 0);
        texts.addView(Ui.singleLine(Ui.text(c, t, b.title, 16, 500, t.onSurface)));
        float pr = b.progress();
        String sub = stateName(b.state);
        if (b.length > 0 && b.state == EppyPlayer.STATE_STARTED && pr >= 0) {
            sub = Math.round(pr * 100) + "% · " + Ui.duration(Math.max(0, b.length - b.position)) + " left";
        } else if (b.length > 0 && b.state == EppyPlayer.STATE_NEW) {
            sub = "Not started · " + Ui.duration(b.length);
        }
        TextView s = Ui.text(c, t, sub, 13, 400, t.onSurfaceVariant);
        s.setPadding(0, Ui.dp(c, 4), 0, 0);
        texts.addView(s);
        if (pr > 0 && b.state == EppyPlayer.STATE_STARTED) {
            android.widget.ProgressBar bar = new android.widget.ProgressBar(c, null, android.R.attr.progressBarStyleHorizontal);
            bar.setMax(1000);
            bar.setProgress(Math.round(pr * 1000));
            bar.setProgressTintList(android.content.res.ColorStateList.valueOf(t.primary));
            bar.setProgressBackgroundTintList(android.content.res.ColorStateList.valueOf(t.surfaceContainerHighest));
            LinearLayout.LayoutParams bl = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Ui.dp(c, 4));
            bl.topMargin = Ui.dp(c, 6);
            texts.addView(bar, bl);
        }
        row.addView(texts, Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        row.setBackground(Ui.ripple(t, null, Ui.dp(c, 16)));
        row.setClickable(true);
        row.setFocusable(true);
        row.setContentDescription(b.title + ", " + sub);
        row.setOnClickListener(v -> host.playBook(b, true));
        row.setOnLongClickListener(v -> {
            bookSheet(b);
            return true;
        });
        return row;
    }

    static String stateName(int state) {
        switch (state) {
            case EppyPlayer.STATE_STARTED:
                return "In progress";
            case EppyPlayer.STATE_FINISHED:
                return "Finished";
            default:
                return "Not started";
        }
    }

    void bookSheet(EppyPlayer.Book b) {
        new Sheet(host.overlayRoot(), t, b.title)
                .item(EppyIcon.PLAY, "Play", stateName(b.state), () -> host.playBook(b, true))
                .item(EppyIcon.FOLDER, "Open in library manager", "Mark finished, edit, delete files", () -> host.openSabp(EppyBridge.LIBRARY_ACTIVITY))
                .show();
    }
}
