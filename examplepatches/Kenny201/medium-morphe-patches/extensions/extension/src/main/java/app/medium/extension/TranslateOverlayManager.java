package app.medium.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

public class TranslateOverlayManager {
    private static final String TAG = "TranslateOverlayManager";
    private static final int BUTTON_ID = 0x7f099999;
    private static final Handler mainHandler = new Handler(Looper.getMainLooper());

    public static View wrapArticleView(final View articleView) {
        if (articleView == null) return null;
        try {
            Context context = articleView.getContext();
            FrameLayout container = new FrameLayout(context);
            container.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
            container.addView(articleView, new FrameLayout.LayoutParams(-1, -1));

            TextView fab = createFabButton(context);
            fab.setOnClickListener(v -> onTranslateButtonClicked(context, articleView));
            container.addView(fab);
            Log.d(TAG, "Article view wrapped with Translate button!");
            return container;
        } catch (Exception e) {
            Log.e(TAG, "Error wrapping article view", e);
            return articleView;
        }
    }

    public static void attachTranslateButton(final Activity activity) {
        if (activity == null) return;
        mainHandler.post(() -> {
            try {
                ViewGroup rootView = (ViewGroup) activity.getWindow().getDecorView().findViewById(android.R.id.content);
                if (rootView == null || rootView.findViewById(BUTTON_ID) != null) return;

                TextView fab = createFabButton(activity);
                fab.setOnClickListener(v -> onTranslateButtonClicked(activity, activity.getWindow().getDecorView()));
                rootView.addView(fab);
            } catch (Exception e) {
                Log.e(TAG, "Error attaching translate button", e);
            }
        });
    }

    private static TextView createFabButton(Context context) {
        TextView fab = new TextView(context);
        fab.setId(BUTTON_ID);
        fab.setText("🌐 Перевести");
        fab.setTextColor(Color.WHITE);
        fab.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        fab.setPadding(36, 20, 36, 20);
        fab.setGravity(Gravity.CENTER);

        GradientDrawable bg = new GradientDrawable();
        bg.setColor(Color.parseColor("#008080"));
        bg.setCornerRadius(60f);
        fab.setBackground(bg);

        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(-2, -2);
        params.gravity = Gravity.BOTTOM | Gravity.END;
        params.setMargins(0, 0, 48, 160);
        fab.setLayoutParams(params);
        return fab;
    }

    private static void onTranslateButtonClicked(final Context context, final View targetView) {
        Toast.makeText(context, "Перевод статьи...", Toast.LENGTH_SHORT).show();
        List<TextView> textViews = new ArrayList<>();
        findTextViews(targetView, textViews);

        if (textViews.isEmpty()) {
            Toast.makeText(context, "Текст статьи не найден", Toast.LENGTH_SHORT).show();
            return;
        }

        StringBuilder sb = new StringBuilder();
        for (TextView tv : textViews) {
            sb.append(tv.getText().toString()).append("\n\n");
        }

        MediumTranslator.translateTextAsync(sb.toString(), MediumTranslator.getTargetLanguage(), new MediumTranslator.TranslationCallback() {
            @Override
            public void onSuccess(final String translatedText) {
                mainHandler.post(() -> showTranslationDialog(context, translatedText));
            }

            @Override
            public void onError(final Exception e) {
                mainHandler.post(() -> Toast.makeText(context, "Ошибка: " + e.getMessage(), Toast.LENGTH_LONG).show());
            }
        });
    }

    private static void findTextViews(View view, List<TextView> list) {
        if (view instanceof TextView) {
            TextView tv = (TextView) view;
            CharSequence cs = tv.getText();
            if (cs != null && cs.length() > 15) list.add(tv);
        } else if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) findTextViews(group.getChildAt(i), list);
        }
    }

    private static void showTranslationDialog(Context context, String translatedText) {
        AlertDialog.Builder builder = new AlertDialog.Builder(context);
        builder.setTitle("🌐 Перевод статьи");

        ScrollView scrollView = new ScrollView(context);
        LinearLayout container = new LinearLayout(context);
        container.setOrientation(LinearLayout.VERTICAL);
        container.setPadding(40, 30, 40, 30);

        TextView tv = new TextView(context);
        tv.setText(translatedText);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        tv.setTextColor(Color.BLACK);
        tv.setLineSpacing(1.2f, 1.2f);
        container.addView(tv);

        scrollView.addView(container);
        builder.setView(scrollView);
        builder.setPositiveButton("Закрыть", null);
        builder.create().show();
    }
}