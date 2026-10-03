package app.aidan.extension.aftership;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.List;

public final class CopyTrackingBridge {
    private static final String TAG = "CopyTrackingBridge";
    private static final String TAG_BUTTON = "copy_tracking_button";
    private static final String TAG_TEXT = "copy_tracking_text";

    private static final int ID_MULTI_DELETE = 0x7f0a0303; // R.id.multi_delete
    private static final int ID_MULTI_MARK_TV = 0x7f0a0306; // R.id.multi_mark_tv
    private static final int ID_MULTI_DELETE_TV = 0x7f0a0304; // R.id.multi_delete_tv

    private CopyTrackingBridge() {}

    /**
     * Adds or updates the multi-selection Copy button to mirror the delete button's
     * visibility and enabled state. Call on the UI thread. A null activity or missing
     * container is ignored, and failures while updating the controls are suppressed.
     */
    public static void onUpdateButtons(Activity activity, boolean isDeleteVisible, boolean isDeleteEnabled) {
        if (activity == null) {
            return;
        }

        try {
            View multiDelete = activity.findViewById(ID_MULTI_DELETE);
            if (multiDelete == null) {
                return;
            }

            ViewGroup parent = (ViewGroup) multiDelete.getParent();
            if (parent == null) {
                return;
            }

            FrameLayout copyFrameLayout = parent.findViewWithTag(TAG_BUTTON);
            TextView copyTextView = null;

            if (copyFrameLayout == null) {
                copyFrameLayout = new FrameLayout(activity);
                copyFrameLayout.setTag(TAG_BUTTON);

                LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1.0f);
                copyFrameLayout.setLayoutParams(lp);

                copyTextView = new TextView(activity);
                copyTextView.setTag(TAG_TEXT);
                copyTextView.setText("Copy");
                copyTextView.setSingleLine(true);
                copyTextView.setGravity(Gravity.CENTER);

                FrameLayout.LayoutParams textLp = new FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT,
                        Gravity.CENTER
                );
                copyTextView.setLayoutParams(textLp);

                // Clone styling from sibling TextView (multi_mark_tv or multi_delete_tv)
                TextView siblingTextView = activity.findViewById(ID_MULTI_MARK_TV);
                if (siblingTextView == null) {
                    siblingTextView = activity.findViewById(ID_MULTI_DELETE_TV);
                }

                if (siblingTextView != null) {
                    copyTextView.setTextSize(TypedValue.COMPLEX_UNIT_PX, siblingTextView.getTextSize());
                    copyTextView.setTypeface(siblingTextView.getTypeface());
                    ColorStateList colors = siblingTextView.getTextColors();
                    if (colors != null) {
                        copyTextView.setTextColor(colors);
                    }
                }

                copyFrameLayout.addView(copyTextView);

                // Insert immediately before multiDelete
                int deleteIndex = parent.indexOfChild(multiDelete);
                if (deleteIndex >= 0) {
                    parent.addView(copyFrameLayout, deleteIndex);
                } else {
                    parent.addView(copyFrameLayout);
                }

                copyFrameLayout.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        if (v.isEnabled()) {
                            copySelectedTrackingNumbers(activity);
                        }
                    }
                });
            } else {
                copyTextView = copyFrameLayout.findViewWithTag(TAG_TEXT);
            }

            copyFrameLayout.setVisibility(isDeleteVisible ? View.VISIBLE : View.GONE);
            copyFrameLayout.setEnabled(isDeleteEnabled);
            if (copyTextView != null) {
                copyTextView.setEnabled(isDeleteEnabled);
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed in onUpdateButtons", t);
        }
    }

    /**
     * Copies trimmed, distinct selected tracking numbers in selection order, separated
     * by newlines, when a clipboard service is available. With at least one number,
     * shows a confirmation and attempts to exit selection mode. Missing selection data
     * and reflection or clipboard failures are suppressed.
     */
    private static void copySelectedTrackingNumbers(Activity activity) {
        try {
            // 1. Resolve TrackingListFragment: field 'd' on HomeActivity (LY6/b;)
            Field trackingListFragmentField = findFieldInHierarchy(activity.getClass(), "d");
            if (trackingListFragmentField == null) {
                Log.w(TAG, "Field 'd' not found on Activity");
                return;
            }
            trackingListFragmentField.setAccessible(true);
            Object trackingListFragment = trackingListFragmentField.get(activity);
            if (trackingListFragment == null) {
                Log.w(TAG, "TrackingListFragment is null");
                return;
            }

            // 2. Resolve TrackingListTabFragment: invoke c3() on TrackingListFragment (LY6/i;)
            Method c3Method = trackingListFragment.getClass().getDeclaredMethod("c3");
            c3Method.setAccessible(true);
            Object trackingListTabFragment = c3Method.invoke(trackingListFragment);
            if (trackingListTabFragment == null) {
                Log.w(TAG, "TrackingListTabFragment is null");
                return;
            }

            // 3. Resolve presenter: read field 'f3878p' or 'p' in TrackingListTabFragment or its superclasses (H2.c)
            Field presenterField = findFieldInHierarchy(trackingListTabFragment.getClass(), "f3878p", "p");
            if (presenterField == null) {
                Log.w(TAG, "Presenter field not found on TrackingListTabFragment");
                return;
            }
            presenterField.setAccessible(true);
            Object presenter = presenterField.get(trackingListTabFragment);
            if (presenter == null) {
                Log.w(TAG, "Presenter is null");
                return;
            }

            // 4. Query selected items: invoke calculateMultiSelectedItems() on presenter (List<?>)
            Method calculateMethod = findMethodInHierarchy(presenter.getClass(), "calculateMultiSelectedItems");
            if (calculateMethod == null) {
                Log.w(TAG, "calculateMultiSelectedItems method not found on Presenter");
                return;
            }
            calculateMethod.setAccessible(true);
            Object selectedItemsObj = calculateMethod.invoke(presenter);
            if (!(selectedItemsObj instanceof List)) {
                Log.w(TAG, "calculateMultiSelectedItems returned null or non-List");
                return;
            }

            List<?> selectedItems = (List<?>) selectedItemsObj;
            if (selectedItems.isEmpty()) {
                return;
            }

            LinkedHashSet<String> trackingNumbers = new LinkedHashSet<>();
            for (Object item : selectedItems) {
                if (item == null) {
                    continue;
                }
                String trackingNumber = extractTrackingNumber(item);
                if (trackingNumber != null && !trackingNumber.trim().isEmpty()) {
                    trackingNumbers.add(trackingNumber.trim());
                }
            }

            if (trackingNumbers.isEmpty()) {
                return;
            }

            StringBuilder sb = new StringBuilder();
            for (String num : trackingNumbers) {
                if (sb.length() > 0) {
                    sb.append("\n");
                }
                sb.append(num);
            }
            String joined = sb.toString();

            ClipboardManager cm = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
            if (cm != null) {
                ClipData clip = ClipData.newPlainText("Tracking Number", joined);
                cm.setPrimaryClip(clip);
            }

            int count = trackingNumbers.size();
            String toastText = count == 1
                    ? "Tracking number copied to clipboard"
                    : count + " tracking numbers copied to clipboard";
            Toast.makeText(activity, toastText, Toast.LENGTH_SHORT).show();

            // 5. Dismiss selection mode: invoke j0() on TrackingListFragment
            try {
                Method j0Method = trackingListFragment.getClass().getDeclaredMethod("j0");
                j0Method.setAccessible(true);
                j0Method.invoke(trackingListFragment);
            } catch (Throwable t) {
                Log.w(TAG, "Failed to invoke j0() on TrackingListFragment", t);
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed in copySelectedTrackingNumbers", t);
        }
    }

    /**
     * Returns the tracking-number field if nonblank, falling back to the title/number
     * field, without trimming the result. Returns null if neither yields a nonblank
     * string; field access failures are ignored.
     */
    private static String extractTrackingNumber(Object item) {
        // Ll6/d; (ShipmentItemEntity) -> field 'f24646p' or 'p' (tracking number), fallback to 'f24642c' or 'c' (title/number)
        try {
            Field pField = findFieldInHierarchy(item.getClass(), "f24646p", "p");
            if (pField != null) {
                pField.setAccessible(true);
                Object pVal = pField.get(item);
                if (pVal instanceof String && !((String) pVal).trim().isEmpty()) {
                    return (String) pVal;
                }
            }
        } catch (Throwable ignored) {
        }

        try {
            Field cField = findFieldInHierarchy(item.getClass(), "f24642c", "c");
            if (cField != null) {
                cField.setAccessible(true);
                Object cVal = cField.get(item);
                if (cVal instanceof String && !((String) cVal).trim().isEmpty()) {
                    return (String) cVal;
                }
            }
        } catch (Throwable ignored) {
        }

        return null;
    }

    /**
     * Finds a candidate field in the nearest declaring class, excluding Object.
     * Exact names take priority within each class, followed by names ending in a dot
     * or dollar sign plus a candidate name. Returns null if no field matches.
     *
     * @throws SecurityException if reflection access is denied
     */
    private static Field findFieldInHierarchy(Class<?> clazz, String... candidateNames) {
        Class<?> current = clazz;
        while (current != null && current != Object.class) {
            for (String name : candidateNames) {
                try {
                    return current.getDeclaredField(name);
                } catch (NoSuchFieldException ignored) {
                }
            }
            // Fallback: check all declared fields in case of prefix/obfuscation variance
            Field[] declaredFields = current.getDeclaredFields();
            for (Field field : declaredFields) {
                for (String name : candidateNames) {
                    if (field.getName().equals(name) || field.getName().endsWith("." + name) || field.getName().endsWith("$" + name)) {
                        return field;
                    }
                }
            }
            current = current.getSuperclass();
        }
        return null;
    }

    /**
     * Returns the first method with the given name in the nearest declaring class,
     * excluding Object, or null if absent. Parameter types are not checked.
     *
     * @throws SecurityException if reflection access is denied
     */
    private static Method findMethodInHierarchy(Class<?> clazz, String methodName) {
        Class<?> current = clazz;
        while (current != null && current != Object.class) {
            for (Method method : current.getDeclaredMethods()) {
                if (method.getName().equals(methodName)) {
                    return method;
                }
            }
            current = current.getSuperclass();
        }
        return null;
    }
}
