package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.ui.RedButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.Window;
import com.shatteredpixel.shatteredpixeldungeon.windows.WndTextInput;
import com.watabou.noosa.Game;
import com.watabou.noosa.TextInput;

import java.lang.reflect.Field;

/**
 * A number input with Min and Max buttons that apply the limits straight away. The keyboard shows numbers while it is open.
 */
final class NumberPrompt {

	private static final String TAG = "NumberPrompt";
	private static final int BUTTON_HEIGHT = 16;
	private static final int GAP = 2;

	private NumberPrompt() {
	}

	static void show(String label, int current, int min, int max, IntAction setter, Runnable after) {
		show(label, current, min, max, 0, setter, after);
	}

	/**
	 * Like the other show, for a number with [decimals] decimal places, which [current], [min], [max] and the value given to [setter] hold
	 * scaled up to whole numbers: with 2 decimals, 0.25 is 25.
	 */
	static void show(String label, int current, int min, int max, int decimals, IntAction setter, Runnable after) {
		WndTextInput input = new WndTextInput(label, null, format(current, decimals), 7, false, "Set", "Cancel") {
			@Override
			public void onSelect(boolean positive, String text) {
				if (!positive) return;
				try {
					float typed = Float.parseFloat(text.trim().replace("+", "").replace("%", ""));
					setter.run(clamp(Math.round(typed * scale(decimals)), min, max));
				} catch (NumberFormatException ignored) {
					return;
				}
				after.run();
			}

			@Override
			public void hide() {
				super.hide();
				AndroidUi.endNumbers();
			}
		};
		addLimitButtons(input, min, max, decimals, setter, after);
		Game.scene().addToFront(input);
		AndroidUi.startNumbers(min < 0);
	}

	private static int scale(int decimals) {
		return (int) Math.pow(10, decimals);
	}

	/**
	 * [value], held scaled up by [decimals] decimal places, written out with them.
	 */
	static String format(int value, int decimals) {
		if (decimals <= 0) return String.valueOf(value);
		return String.format(java.util.Locale.US, "%." + decimals + "f", value / (float) scale(decimals));
	}

	private static void addLimitButtons(Window window, int min, int max, int decimals, IntAction setter, Runnable after) {
		try {
			int width = Reflect.width(window);
			int height = Reflect.height(window);
			float half = (width - GAP) / 2f;

			RedButton minButton = new RedButton("Min (" + format(min, decimals) + ")", 7) {
				@Override
				public void onClick() {
					window.hide();
					setter.run(min);
					after.run();
				}
			};
			minButton.setRect(0, height + GAP, half, BUTTON_HEIGHT);
			window.add(minButton);

			RedButton maxButton = new RedButton("Max (" + format(max, decimals) + ")", 7) {
				@Override
				public void onClick() {
					window.hide();
					setter.run(max);
					after.run();
				}
			};
			maxButton.setRect(half + GAP, height + GAP, half, BUTTON_HEIGHT);
			window.add(maxButton);

			window.resize(width, height + GAP + BUTTON_HEIGHT);
			relayoutTextBox(window);
		} catch (Exception e) {
			Log.e(TAG, "Could not add the min and max buttons", e);
		}
	}

	/**
	 * The text box is a separate input widget placed on screen when it is laid out, so it has to be laid out again
	 * after the window moves.
	 */
	private static void relayoutTextBox(Window window) throws ReflectiveOperationException {
		Field field = Reflect.field(WndTextInput.class, "textBox");
		TextInput textBox = (TextInput) field.get(window);
		if (textBox == null) return;
		textBox.setRect(textBox.left(), textBox.top(), textBox.width(), textBox.height());
	}

	static int clamp(int value, int min, int max) {
		return Math.max(min, Math.min(max, value));
	}
}
