package app.aidan.extension.blackjack;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.text.InputType;
import android.util.Log;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.FrameLayout;
import java.io.File;
import java.io.FileInputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import org.json.JSONObject;

public final class ChipBalanceDialog {
    private static final String TAG = "ChipBalanceDialog";

    private ChipBalanceDialog() {
    }

    /**
     * Shows the chip-balance editor on Unity's activity UI thread. Does nothing if
     * the activity cannot be resolved or is finishing.
     */
    public static void show() {
        final Activity activity = getCurrentActivity();
        if (activity == null || activity.isFinishing()) {
            Log.e(TAG, "Cannot show dialog: activity is null or finishing");
            return;
        }

        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                if (activity.isFinishing()) {
                    return;
                }
                showOnMainThread(activity);
            }
        });
    }

    /**
     * Returns Unity's current activity, or null if reflection or access fails.
     */
    private static Activity getCurrentActivity() {
        try {
            Class<?> unityPlayerClass = Class.forName("com.unity3d.player.UnityPlayer");
            Field currentActivityField = unityPlayerClass.getField("currentActivity");
            return (Activity) currentActivityField.get(null);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to resolve UnityPlayer.currentActivity", t);
            return null;
        }
    }

    /**
     * Shows a balance editor initialized from saved player data; call on the UI thread.
     * Confirmation removes commas and spaces, ignores empty or invalid long values,
     * and clamps negative amounts to zero before sending the Unity update.
     */
    private static void showOnMainThread(final Activity activity) {
        long currentChips = loadCurrentChips(activity);

        final EditText input = new EditText(activity);
        input.setInputType(InputType.TYPE_CLASS_NUMBER);
        input.setText(String.valueOf(currentChips));
        input.selectAll();
        input.setSelectAllOnFocus(true);
        FrameLayout container = new FrameLayout(activity);
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        int margin = (int) (24 * activity.getResources().getDisplayMetrics().density);
        params.leftMargin = margin;
        params.rightMargin = margin;
        input.setLayoutParams(params);
        container.addView(input);

        new AlertDialog.Builder(activity)
                .setTitle("Set Chip Balance")
                .setMessage("Enter desired chip balance:")
                .setView(container)
                .setPositiveButton("Set", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        String text = input.getText().toString().trim().replace(",", "").replace(" ", "");
                        if (text.isEmpty()) {
                            return;
                        }
                        try {
                            long value = Long.parseLong(text);
                            if (value < 0L) {
                                value = 0L;
                            }
                            setChips(value);
                        } catch (NumberFormatException e) {
                            Log.e(TAG, "Failed to parse chip amount: " + text, e);
                        }
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    /**
     * Reads Credit from the first readable player-data candidate in external or internal
     * app storage. Missing files and failures while reading or parsing are skipped;
     * returns zero if no candidate succeeds.
     */
    private static long loadCurrentChips(Activity activity) {
        File[] candidates = new File[] {
                new File(activity.getExternalFilesDir(null), "SimpleStorage/PlayerData.json"),
                new File(activity.getFilesDir(), "SimpleStorage/PlayerData.json"),
                new File(activity.getFilesDir(), "PlayerData.json"),
                new File(activity.getExternalFilesDir(null), "PlayerData.json")
        };

        for (File file : candidates) {
            if (file == null || !file.exists()) {
                continue;
            }
            try {
                byte[] data = new byte[(int) file.length()];
                int read;
                try (FileInputStream fis = new FileInputStream(file)) {
                    read = fis.read(data);
                }
                if (read <= 0) {
                    continue;
                }
                String jsonStr = new String(data, 0, read, "UTF-8");
                JSONObject json = new JSONObject(jsonStr);
                JSONObject valueObj = json.getJSONObject("value");
                return valueObj.getLong("Credit");
            } catch (Throwable t) {
                Log.e(TAG, "Failed reading " + file.getAbsolutePath(), t);
            }
        }
        return 0L;
    }

    /**
     * Sends the desired absolute chip balance to the patched Unity message handler.
     * Reflection and invocation failures are suppressed; delivery is not confirmed.
     */
    private static void setChips(long amount) {
        try {
            Log.i(TAG, "Setting chips to " + amount);
            Class<?> unityPlayerClass = Class.forName("com.unity3d.player.UnityPlayer");
            Method sendMethod = unityPlayerClass.getMethod(
                    "UnitySendMessage",
                    String.class,
                    String.class,
                    String.class
            );
            sendMethod.invoke(null, "BlackjackApplication", "CheckUpdateToVersion", String.valueOf(amount));
        } catch (Throwable t) {
            Log.e(TAG, "Failed to send Unity message to update chips", t);
        }
    }
}
