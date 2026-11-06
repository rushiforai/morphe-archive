package slick.android;

import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.RelativeSizeSpan;
import android.text.style.StrikethroughSpan;
import android.util.TypedValue;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

public final class InlineEdits {
  private static final Map<Object, Binding> bindings = new WeakHashMap<>();

  private static final class Binding {
    WeakReference<Object> model;
    final WeakReference<TextView> text;

    Binding(TextView text) {
      this.text = new WeakReference<>(text);
    }
  }

  public static void bind(Object holder, Object model) {
    try {
      Object root = Host.get(holder, "itemView");
      String type = root.getClass().getName();
      if (!type.equals("slack.widgets.messages.MessageLayout")
          && !type.equals("slack.features.messagedetails.messages.widgets.MessageDetailsLayout"))
        return;
      LinearLayout content = (LinearLayout) Host.get(root, "content");
      Binding binding = bindings.get(holder);
      TextView text = binding == null ? null : binding.text.get();
      if (text == null) {
        text = new TextView(content.getContext());
        text.setVisibility(View.GONE);
        text.setAlpha(0.62f);
        text.setPadding(
            0, Math.round(4 * content.getResources().getDisplayMetrics().density), 0, 0);
        content.addView(text, 0, new LinearLayout.LayoutParams(-1, -2));
        bindings.put(holder, binding = new Binding(text));
      }
      TextView body = null;
      try {
        body = (TextView) Host.get(holder, "messageText");
      } catch (NoSuchFieldException e) {
        try {
          body = (TextView) Host.get(holder, "fallbackMessageText");
        } catch (NoSuchFieldException ignored) {
        }
      }
      if (body != null) {
        DeletedText.bind(body, InlineHistory.isDeleted(model));
        text.setTextColor(body.getTextColors());
        text.setTypeface(body.getTypeface());
        text.setTextSize(TypedValue.COMPLEX_UNIT_PX, body.getTextSize());
        text.setLineSpacing(body.getLineSpacingExtra(), body.getLineSpacingMultiplier());
        text.setLetterSpacing(body.getLetterSpacing());
        text.setIncludeFontPadding(body.getIncludeFontPadding());
      }
      binding.model = new WeakReference<>(model);
      update(binding, true);
    } catch (ReflectiveOperationException | RuntimeException e) {
      Archive.failed(e);
    }
  }

  private static void update(Binding binding, boolean rebind) throws ReflectiveOperationException {
    TextView text = binding.text.get();
    Object model = binding.model == null ? null : binding.model.get();
    if (text == null) return;
    List<String> versions =
        model == null ? Collections.emptyList() : InlineHistory.editTexts(model);
    if (versions == null && !rebind) return;
    CharSequence history = historyText(versions == null ? Collections.emptyList() : versions);
    if (!android.text.TextUtils.equals(text.getText(), history)) text.setText(history);
    int v = history.length() == 0 ? View.GONE : View.VISIBLE;
    if (text.getVisibility() != v) text.setVisibility(v);
  }

  static CharSequence historyText(List<String> versions) {
    if (versions.isEmpty()) return "";
    SpannableStringBuilder text = new SpannableStringBuilder();
    for (String v : versions) {
      if (text.length() > 0) text.append('\n');
      span(text, v.isEmpty() ? "(empty message)" : v, new StrikethroughSpan());
      span(text, " (edited)", new RelativeSizeSpan(0.85f));
    }
    return text;
  }

  private static void span(SpannableStringBuilder text, String s, Object what) {
    int start = text.length();
    text.append(s);
    text.setSpan(what, start, text.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
  }

  static void refresh() {
    for (Binding b : new ArrayList<>(bindings.values())) {
      try {
        update(b, false);
      } catch (ReflectiveOperationException | RuntimeException e) {
        Archive.failed(e);
      }
    }
  }
}
