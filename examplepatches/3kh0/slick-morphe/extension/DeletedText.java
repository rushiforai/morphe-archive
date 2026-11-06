package slick.android;

import android.text.Editable;
import android.text.Spanned;
import android.text.TextWatcher;
import android.text.style.ForegroundColorSpan;
import android.widget.TextView;
import java.util.Map;
import java.util.WeakHashMap;

final class DeletedText implements TextWatcher {
  private static final Map<TextView, DeletedText> watchers = new WeakHashMap<>();
  private boolean deleted;

  private static final class Color extends ForegroundColorSpan {
    Color() {
      super(0xffe01e5a);
    }
  }

  static void bind(TextView view, boolean deleted) {
    DeletedText w = watchers.get(view);
    if (w == null) {
      if (!deleted) return;
      watchers.put(view, w = new DeletedText());
      view.addTextChangedListener(w);
    }
    w.deleted = deleted;
    CharSequence text = view.getText();
    if (text instanceof Editable) w.afterTextChanged((Editable) text);
    else view.setText(text);
  }

  @Override
  public void beforeTextChanged(CharSequence text, int start, int count, int after) {}

  @Override
  public void onTextChanged(CharSequence text, int start, int before, int count) {}

  @Override
  public void afterTextChanged(Editable text) {
    for (Color c : text.getSpans(0, text.length(), Color.class)) text.removeSpan(c);
    if (deleted && text.length() > 0)
      text.setSpan(new Color(), 0, text.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
  }
}
