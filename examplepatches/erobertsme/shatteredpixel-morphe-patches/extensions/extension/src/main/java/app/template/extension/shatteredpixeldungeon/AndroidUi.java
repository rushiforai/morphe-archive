package app.template.extension.shatteredpixeldungeon;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.text.InputType;
import android.util.Log;
import android.view.View;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;

import com.watabou.noosa.Game;

/**
 * Android's own dialogs and keyboard, for input the game's text box can't handle.
 */
public final class AndroidUi {

	private static final String TAG = "AndroidUi";
	private static final String LAUNCHER = "com.shatteredpixel.shatteredpixeldungeon.android.AndroidLauncher";
	private static final int NUMBER = InputType.TYPE_CLASS_NUMBER;
	private static final int SIGNED_NUMBER = InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_FLAG_SIGNED;

	private static volatile int numberType;

	interface TextResult {
		void accept(String text);
	}

	private AndroidUi() {
	}

	/**
	 * The game's activity, or null before it exists.
	 */
	static Activity activity() {
		try {
			return (Activity) Reflect.getStatic(Reflect.require(LAUNCHER), "instance");
		} catch (Throwable e) {
			return null;
		}
	}

	/**
	 * Shows an Android dialog with a text box, so the keyboard works fully, emoji panel included. [result] runs on the game's thread with
	 * what was typed, only when the positive button is tapped.
	 */
	static void askText(String title, String message, String initial, String positive, TextResult result) {
		askText(title, message, initial, positive, InputType.TYPE_CLASS_TEXT, result);
	}

	/**
	 * Like askText, with the keyboard set up for emoji: a short message, which keyboards like Gboard and Samsung Keyboard answer with an
	 * emoji key on the main layout. Android doesn't let an app open the emoji panel itself.
	 */
	static void askEmoji(String title, String message, String initial, String positive, TextResult result) {
		askText(title, message, initial, positive, InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_SHORT_MESSAGE, result);
	}

	private static void askText(String title, String message, String initial, String positive, int inputType, TextResult result) {
		Activity activity = activity();
		if (activity == null) return;
		activity.runOnUiThread(() -> {
			if (activity.isFinishing()) return;
			EditText field = new EditText(activity);
			field.setInputType(inputType);
			field.setSingleLine(true);
			field.setText(initial == null ? "" : initial);
			field.setSelection(field.getText().length());
			AlertDialog dialog = new AlertDialog.Builder(activity)
				.setTitle(title)
				.setMessage(message)
				.setView(field)
				.setPositiveButton(positive, (shown, which) -> {
					String text = field.getText().toString();
					Game.runOnRenderThread(() -> result.accept(text));
				})
				.setNegativeButton("Cancel", null)
				.create();
			if (dialog.getWindow() != null) dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_VISIBLE);
			dialog.show();
			field.requestFocus();
		});
	}

	/**
	 * Switches the on-screen keyboard to numbers, with a minus key when [signed], until [endNumbers] is called.
	 */
	static void startNumbers(boolean signed) {
		numberType = signed ? SIGNED_NUMBER : NUMBER;
		restartKeyboard();
	}

	static void endNumbers() {
		if (numberType == 0) return;
		numberType = 0;
		restartKeyboard();
	}

	/**
	 * Called when the game's view sets up its keyboard connection, after it has chosen the keyboard type. Uses numbers while a number
	 * prompt is open.
	 */
	public static void adjustKeyboard(EditorInfo info) {
		int type = numberType;
		if (type == 0 || info == null) return;
		info.inputType = type;
	}

	/**
	 * Makes the keyboard ask the game's view for its type again, so a change takes effect while it's open.
	 */
	private static void restartKeyboard() {
		Activity activity = activity();
		if (activity == null) return;
		activity.runOnUiThread(() -> {
			try {
				View view = activity.getCurrentFocus();
				if (view == null) return;
				InputMethodManager keyboard = (InputMethodManager) activity.getSystemService(Context.INPUT_METHOD_SERVICE);
				if (keyboard != null) keyboard.restartInput(view);
			} catch (Throwable e) {
				Log.e(TAG, "Could not switch the keyboard", e);
			}
		});
	}
}
