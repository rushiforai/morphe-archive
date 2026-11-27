package local.privacy;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Build;
import android.graphics.Typeface;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

/** In-app settings; no dependency on the vendor's internal setting classes. */
public final class MorpheSettingsActivity extends Activity {
    private ScrollView settingsScroll;
    private boolean initialScrollPending = true;
    private int dp(int value) {
        return (int) (value * getResources().getDisplayMetrics().density + 0.5f);
    }

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        SettingsState.init(this);
        ScrollView scroll = new ScrollView(this);
        settingsScroll = scroll;
        // Android 15 lays this platform-themed activity edge-to-edge underneath
        // its status/action bars. Reserve their height inside the scroll content.
        if (Build.VERSION.SDK_INT >= 35) scroll.setPadding(0, dp(80), 0, 0);
        scroll.setSaveEnabled(false);
        scroll.setFocusableInTouchMode(true);
        scroll.setDescendantFocusability(ViewGroup.FOCUS_BEFORE_DESCENDANTS);
        LinearLayout body = new LinearLayout(this);
        body.setOrientation(LinearLayout.VERTICAL);
        body.setPadding(dp(16), dp(12), dp(16), dp(24));
        scroll.addView(body);
        setContentView(scroll);
        getActionBar().setDisplayHomeAsUpEnabled(true);
        getActionBar().setTitle("Morphe 설정");

        if (SettingsState.supports(1)) {
            section(body, "홈 화면");
            choice(body, "hide_home_search", "검색·메뉴 영역 숨기기", "홈 화면 위쪽의 검색창과 메뉴를 감춥니다.");
            choice(body, "hide_home_recent", "최근 방문 갤러리 숨기기", "홈 화면의 최근 방문 갤러리 목록을 감춥니다.");
            choice(body, "hide_home_recommended_galleries", "추천 갤러리 숨기기", "홈 화면의 추천 갤러리 영역을 감춥니다.");
            choice(body, "hide_home_ranking", "갤러리 순위 숨기기", "홈 화면의 갤러리 순위를 감춥니다.");
            choice(body, "hide_home_live_best", "실시간 베스트 숨기기", "홈 화면의 실시간 베스트 글 목록과 필터를 감춥니다.");
            choice(body, "hide_home_recommended_posts", "추천글 숨기기", "홈 화면의 추천글 영역을 감춥니다.");
        }
        if (SettingsState.supports(2)) {
            section(body, "글 목록");
            choice(body, "hide_page_indicator", "페이지 구분 표시 숨기기", "글 목록과 검색 결과에 나타나는 ‘Page N’ 표시를 감춥니다.");
        }
        if (SettingsState.supports(4)) {
            section(body, "게시글 본문");
            choice(body, "hide_author_auto_image", "작성자 자동 짤방 숨기기", "글 맨 앞에 자동 삽입된 것으로 보이는 이미지만 숨깁니다. 일반 첨부 이미지는 유지하도록 제한하며, 판별할 수 없는 이미지는 그대로 둡니다.");
            section(body, "작성자 정보");
            choice(body, "show_author_id", "닉네임 옆에 계정 아이디 표시", "앱이 제공하는 계정 아이디를 별도 문구 없이 닉네임 바로 뒤에 표시합니다. 비회원에게는 표시되지 않습니다.");
            choice(body, "show_ip_info", "IP 대역 정보 표시", "닉네임 옆에 내장 대역표의 통신사·지역 추정을 표시합니다. 긴 문구는 오른쪽 버튼으로 전체를 볼 수 있습니다. 외부 조회는 하지 않습니다.");
            choice(body, "collapse_long_ip_info", "IP 정보 기본 접기", "긴 IP 대역 문구를 처음에는 한 줄로 줄여 보입니다. 닉네임 옆에 일부 내용이 남고, 오른쪽 버튼으로 같은 문구를 펼치거나 접습니다.");
        }
        if (SettingsState.supports(8)) {
            section(body, "광고·추적");
            choice(body, "block_app_ad_loaders", "앱 광고 배치 요청 차단", "갤러리 목록 등에 표시할 광고 배치를 서버에 요청하지 않습니다. 패치 적용 시 숨긴 광고 영역이나 제거한 광고 SDK를 복원하지는 않습니다.");
            choice(body, "block_naver_web_tracking", "네이버 웹 추적 로드 안 함", "게시글 웹 화면에 네이버 통계 스크립트를 넣지 않고, 남은 wcs.naver.com·wcs.naver.net 요청도 차단합니다. 네이버 전체 주소는 차단하지 않습니다.");
            choice(body, "block_web_ad_requests", "게시글 속 웹 광고 요청 차단", "게시글 본문 웹 화면에서 알려진 광고 전용 호스트로 향하는 하위 요청만 차단합니다.");
        }
        if (SettingsState.supports(16)) {
            section(body, "동작 및 배터리");
            choice(body, "reduce_config_refresh", "중복 새로고침 제한", "홈 화면을 떠날 때 서버 설정을 반복 확인하는 횟수를 줄입니다. 서버의 새 설정 반영이 늦어질 수 있습니다.");
        }
        if (SettingsState.supports(32)) {
            section(body, "업데이트 알림");
            choice(body, "disable_update_notice", "앱 업데이트 안내 숨기기", "디시 앱이 시작할 때 표시하는 업데이트 안내창을 숨깁니다. Morphe 패치 소스의 업데이트 확인에는 영향을 주지 않습니다.");
        }

        TextView note = new TextView(this);
        note.setText("설치된 Morphe 패치에서 지원하는 설정만 표시합니다. 홈 화면 항목은 홈으로 돌아가 새로고침하면 반영됩니다. 자짤 숨김은 글을 다시 열면 적용됩니다. IP 대역표는 오래되거나 여러 사업자가 섞인 대역에서 틀릴 수 있습니다.");
        note.setPadding(0, dp(24), 0, 0);
        body.addView(note);
        scroll.requestFocus();
        scroll.post(() -> scroll.scrollTo(0, 0));
    }

    @Override public void onWindowFocusChanged(boolean hasFocus) {
        super.onWindowFocusChanged(hasFocus);
        if (hasFocus && initialScrollPending && settingsScroll != null) {
            initialScrollPending = false;
            settingsScroll.post(() -> settingsScroll.scrollTo(0, 0));
            settingsScroll.postDelayed(() -> settingsScroll.scrollTo(0, 0), 250);
        }
    }

    @Override public boolean onNavigateUp() {
        finish();
        return true;
    }

    private void section(LinearLayout parent, String title) {
        TextView label = new TextView(this);
        label.setText(title);
        label.setTextSize(20);
        label.setPadding(0, dp(22), 0, dp(8));
        parent.addView(label);
    }

    private void choice(LinearLayout parent, String key, String title, String description) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, dp(10), 0, dp(10));
        LinearLayout labels = new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);
        TextView heading = new TextView(this);
        heading.setText(title);
        heading.setTextSize(16);
        labels.addView(heading);
        TextView detail = new TextView(this);
        detail.setText(description);
        detail.setTextSize(13);
        detail.setPadding(0, dp(4), dp(8), 0);
        labels.addView(detail);
        row.addView(labels, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        Switch toggle = new Switch(this);
        toggle.setContentDescription(title);
        toggle.setChecked(SettingsState.get(key));
        toggle.setOnCheckedChangeListener((button, checked) -> SettingsState.set(key, checked));
        row.addView(toggle);
        row.setOnClickListener(v -> toggle.setChecked(!toggle.isChecked()));
        parent.addView(row);
    }

    public static void bindSettingsShortcut(View root) {
        if (!(root instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) root;
        if (group.getChildCount() < 2 || !(group.getChildAt(1) instanceof ScrollView)) return;
        ScrollView scroll = (ScrollView) group.getChildAt(1);
        if (!(scroll.getChildAt(0) instanceof LinearLayout)) return;
        LinearLayout list = (LinearLayout) scroll.getChildAt(0);
        if (list.findViewWithTag("lumi_morphe_shortcut") != null) return;
        LinearLayout shortcut = new LinearLayout(root.getContext());
        shortcut.setTag("lumi_morphe_shortcut");
        shortcut.setOrientation(LinearLayout.VERTICAL);
        shortcut.setGravity(Gravity.CENTER_VERTICAL);
        int d = (int) (root.getResources().getDisplayMetrics().density * 14 + 0.5f);
        shortcut.setPadding(d, d, d, d);
        TextView title = new TextView(root.getContext());
        title.setText("Morphe 설정  ›");
        title.setTextSize(18);
        title.setTypeface(null, Typeface.BOLD);
        shortcut.addView(title);
        TextView summary = new TextView(root.getContext());
        summary.setText("홈 화면 · 게시글 · 작성자 정보 · 광고·추적 · 동작");
        summary.setTextSize(13);
        summary.setPadding(0, d / 3, 0, 0);
        shortcut.addView(summary);
        shortcut.setMinimumHeight(d * 7);
        shortcut.setOnClickListener(v -> root.getContext().startActivity(
                new Intent(root.getContext(), MorpheSettingsActivity.class)));
        list.addView(shortcut, 0, new LinearLayout.LayoutParams(-1, -2));
    }
}
