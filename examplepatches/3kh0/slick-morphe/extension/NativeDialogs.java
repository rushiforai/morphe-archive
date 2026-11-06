package slick.android;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;

final class NativeDialogs {
  static Dialog show(
      Context context,
      String title,
      String message,
      String[] items,
      DialogInterface.OnClickListener selection,
      String positive,
      DialogInterface.OnClickListener confirm,
      String negative,
      DialogInterface.OnClickListener cancel) {
    try {
      Class<?> type =
          Class.forName("com.google.android.material.dialog.MaterialAlertDialogBuilder");
      int theme =
          context
              .getResources()
              .getIdentifier("ThemeOverlay.SlackKit.M3.Dialog.Alert", "style", "com.Slack");
      Object builder = type.getConstructor(Context.class, int.class).newInstance(context, theme);
      Object p = Host.get(builder, "P");
      Object[] fields = {
        "mTitle",
        title,
        "mMessage",
        message,
        "mItems",
        items,
        "mOnClickListener",
        selection,
        "mPositiveButtonText",
        positive,
        "mPositiveButtonListener",
        confirm,
        "mNegativeButtonText",
        negative,
        "mNegativeButtonListener",
        cancel
      };
      for (int i = 0; i < fields.length; i += 2) Host.set(p, (String) fields[i], fields[i + 1]);
      Dialog d = (Dialog) type.getMethod("create").invoke(builder);
      d.show();
      return d;
    } catch (ReflectiveOperationException | RuntimeException e) {
      android.util.Log.e("Slick", "Native dialog unavailable", e);
      // Keep settings/restart accessible if a retained host contract fails.
      android.app.AlertDialog.Builder b =
          new android.app.AlertDialog.Builder(context)
              .setTitle(title)
              .setPositiveButton(positive, confirm)
              .setNegativeButton(negative, cancel);
      return (items != null ? b.setItems(items, selection) : b.setMessage(message)).show();
    }
  }
}
