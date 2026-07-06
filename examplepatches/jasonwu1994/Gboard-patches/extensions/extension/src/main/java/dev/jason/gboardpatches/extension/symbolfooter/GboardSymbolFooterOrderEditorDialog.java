package dev.jason.gboardpatches.extension.symbolfooter;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

final class GboardSymbolFooterOrderEditorDialog {
    private static final String TAG = "GboardPatches";
    interface LabelResolver {
        String labelFor(String tabType);
    }

    interface SaveCallback {
        void onSave(List<String> reorderedVisibleOrder);
    }

    private static final String DIALOG_TITLE = "Reorder tabs";
    private static final String DIALOG_MESSAGE = "Drag the handle to move tabs.";
    private static final String SAVE_LABEL = "Save";
    private static final String CANCEL_LABEL = "Cancel";

    private GboardSymbolFooterOrderEditorDialog() {
    }

    static void show(Activity activity,
            List<String> currentOrder,
            LabelResolver labelResolver,
            SaveCallback saveCallback) {
        if (activity == null || activity.isFinishing() || isDestroyed(activity)) {
            return;
        }
        Controller controller = null;
        try {
            controller = new Controller(activity, currentOrder, labelResolver);
            AlertDialog dialog = new AlertDialog.Builder(activity)
                    .setTitle(DIALOG_TITLE)
                    .setView(controller.buildContentView())
                    .setPositiveButton(
                            SAVE_LABEL,
                            new SaveDialogClickListener(controller, saveCallback))
                    .setNegativeButton(CANCEL_LABEL, null)
                    .create();
            dialog.setOnDismissListener(new ReleaseControllerOnDismissListener(controller));
            dialog.show();
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to show expression footer reorder dialog", throwable);
            if (controller != null) {
                controller.release();
            }
        }
    }

    private static final class Controller {
        private final Activity activity;
        private final LabelResolver labelResolver;
        private final ArrayList<String> currentOrder = new ArrayList<String>();
        private final ArrayList<RowBinding> rowBindings = new ArrayList<RowBinding>();
        private final GboardSymbolFooterOrderReorderAnimator reorderAnimator;
        private final int touchSlop;

        private ScrollView scrollView;
        private LinearLayout listContainer;
        private GboardSymbolFooterOrderDragOverlay dragOverlay;
        private RowBinding draggingRow;

        Controller(Activity activity, List<String> currentOrder, LabelResolver labelResolver) {
            this.activity = activity;
            this.labelResolver = labelResolver;
            if (currentOrder != null) {
                this.currentOrder.addAll(currentOrder);
            }
            this.reorderAnimator = new GboardSymbolFooterOrderReorderAnimator(activity);
            this.touchSlop = ViewConfiguration.get(activity).getScaledTouchSlop();
        }

        View buildContentView() {
            scrollView = new ScrollView(activity);
            scrollView.setFillViewport(true);
            scrollView.setClipToPadding(false);

            LinearLayout content = new LinearLayout(activity);
            content.setOrientation(LinearLayout.VERTICAL);
            content.setPadding(dp(24), dp(8), dp(24), 0);

            TextView messageView = new TextView(activity);
            messageView.setText(DIALOG_MESSAGE);
            messageView.setTextColor(resolveColor(android.R.attr.textColorSecondary, 0xFF5F6B7A));
            messageView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
            content.addView(messageView);

            listContainer = new LinearLayout(activity);
            listContainer.setOrientation(LinearLayout.VERTICAL);
            LinearLayout.LayoutParams listParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT);
            listParams.topMargin = dp(16);
            content.addView(listContainer, listParams);

            renderRows();
            scrollView.addView(content);
            return scrollView;
        }

        List<String> currentOrder() {
            return new ArrayList<String>(currentOrder);
        }

        void release() {
            try {
                finishDrag(false);
                reorderAnimator.cancel(listContainer);
            } catch (Throwable throwable) {
                Log.w(TAG, "Failed to release expression footer reorder controller", throwable);
            }
        }

        private void renderRows() {
            if (listContainer == null) {
                return;
            }
            listContainer.removeAllViews();
            rowBindings.clear();
            for (int index = 0; index < currentOrder.size(); index++) {
                String tabType = currentOrder.get(index);
                RowBinding binding = buildRow(tabType);
                rowBindings.add(binding);
                LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT);
                if (index > 0) {
                    params.topMargin = dp(10);
                }
                listContainer.addView(binding.root, params);
            }
        }

        private RowBinding buildRow(String tabType) {
            LinearLayout root = new LinearLayout(activity);
            root.setOrientation(LinearLayout.HORIZONTAL);
            root.setGravity(Gravity.CENTER_VERTICAL);
            root.setPadding(dp(14), dp(14), dp(14), dp(14));
            root.setBackground(buildCardBackground());

            LinearLayout textColumn = new LinearLayout(activity);
            textColumn.setOrientation(LinearLayout.VERTICAL);
            LinearLayout.LayoutParams textParams = new LinearLayout.LayoutParams(
                    0,
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    1f);
            root.addView(textColumn, textParams);

            TextView titleView = new TextView(activity);
            titleView.setText(labelResolver != null ? labelResolver.labelFor(tabType) : tabType);
            titleView.setTextColor(resolveColor(android.R.attr.textColorPrimary, 0xFF101828));
            titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
            titleView.setTypeface(Typeface.DEFAULT_BOLD);
            textColumn.addView(titleView);

            TextView handleView = new TextView(activity);
            handleView.setText("\u2630");
            handleView.setGravity(Gravity.CENTER);
            handleView.setTextColor(resolveColor(android.R.attr.textColorSecondary, 0xFF5F6B7A));
            handleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18f);
            handleView.setTypeface(Typeface.DEFAULT_BOLD);
            handleView.setMinWidth(dp(36));
            handleView.setMinHeight(dp(40));
            LinearLayout.LayoutParams handleParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT);
            handleParams.setMarginStart(dp(12));
            root.addView(handleView, handleParams);

            RowBinding binding = new RowBinding(root, tabType);
            handleView.setOnTouchListener(new HandleTouchListener(binding));
            return binding;
        }

        private void startDrag(RowBinding rowBinding, float rawY) {
            try {
                if (rowBinding == null
                        || listContainer == null
                        || rowBinding.root.getParent() != listContainer) {
                    return;
                }
                GboardSymbolFooterOrderDragOverlay overlay =
                        GboardSymbolFooterOrderDragOverlay.attach(
                                listContainer,
                                rowBinding.root,
                                rawY);
                if (overlay == null) {
                    return;
                }
                draggingRow = rowBinding;
                dragOverlay = overlay;
                rowBinding.root.setAlpha(0f);
                listContainer.requestDisallowInterceptTouchEvent(true);
            } catch (Throwable throwable) {
                Log.w(TAG, "Failed to start expression footer drag", throwable);
                finishDrag(false);
            }
        }

        private void updateDrag(float rawY) {
            try {
                if (draggingRow == null || dragOverlay == null) {
                    return;
                }
                dragOverlay.updateRawY(rawY);
                maybeMoveDraggedRow();
                maybeAutoScroll(rawY);
            } catch (Throwable throwable) {
                Log.w(TAG, "Failed to update expression footer drag", throwable);
                finishDrag(false);
            }
        }

        private void finishDrag(boolean animateOverlay) {
            try {
                if (draggingRow == null) {
                    return;
                }
                RowBinding finishedRow = draggingRow;
                GboardSymbolFooterOrderDragOverlay finishedOverlay = dragOverlay;
                draggingRow = null;
                dragOverlay = null;
                if (listContainer != null) {
                    listContainer.requestDisallowInterceptTouchEvent(false);
                }
                Runnable endAction = new RestoreDraggedRowAction(finishedRow);
                if (!animateOverlay || finishedOverlay == null) {
                    if (finishedOverlay != null) {
                        finishedOverlay.remove();
                    }
                    endAction.run();
                    return;
                }
                finishedOverlay.animateTo(finishedRow.root, endAction);
            } catch (Throwable throwable) {
                Log.w(TAG, "Failed to finish expression footer drag", throwable);
            }
        }

        private void maybeMoveDraggedRow() {
            if (draggingRow == null || dragOverlay == null || listContainer == null) {
                return;
            }
            int currentIndex = listContainer.indexOfChild(draggingRow.root);
            if (currentIndex < 0) {
                return;
            }
            float dragTop = dragOverlay.topInHost();
            float dragBottom = dragOverlay.bottomInHost();
            View next = currentIndex < listContainer.getChildCount() - 1
                    ? listContainer.getChildAt(currentIndex + 1)
                    : null;
            if (next != null && dragBottom > next.getTop() + next.getHeight() * 0.6f) {
                moveRowAcross(currentIndex, currentIndex + 1);
                return;
            }
            View previous = currentIndex > 0
                    ? listContainer.getChildAt(currentIndex - 1)
                    : null;
            if (previous != null && dragTop < previous.getTop() + previous.getHeight() * 0.4f) {
                moveRowAcross(currentIndex, currentIndex - 1);
            }
        }

        private void moveRowAcross(int currentIndex, int siblingIndex) {
            try {
                if (listContainer == null
                        || currentIndex < 0
                        || siblingIndex < 0
                        || currentIndex >= listContainer.getChildCount()
                        || siblingIndex >= listContainer.getChildCount()) {
                    return;
                }
                View sibling = listContainer.getChildAt(siblingIndex);
                if (sibling == null) {
                    return;
                }
                List<GboardSymbolFooterOrderReorderAnimator.RowPosition> previousPositions =
                        reorderAnimator.capture(
                                listContainer,
                                draggingRow != null ? draggingRow.root : null);
                listContainer.removeViewAt(siblingIndex);
                listContainer.addView(sibling, currentIndex);
                Collections.swap(currentOrder, currentIndex, siblingIndex);
                Collections.swap(rowBindings, currentIndex, siblingIndex);
                updateRowSpacing();
                reorderAnimator.animateToNewLayout(
                        listContainer,
                        previousPositions,
                        draggingRow != null ? draggingRow.root : null);
            } catch (Throwable throwable) {
                Log.w(TAG, "Failed to move expression footer row", throwable);
            }
        }

        private void updateRowSpacing() {
            if (listContainer == null) {
                return;
            }
            for (int index = 0; index < listContainer.getChildCount(); index++) {
                View child = listContainer.getChildAt(index);
                ViewGroup.LayoutParams rawParams = child != null ? child.getLayoutParams() : null;
                if (!(rawParams instanceof LinearLayout.LayoutParams)) {
                    continue;
                }
                ((LinearLayout.LayoutParams) rawParams).topMargin = index > 0 ? dp(10) : 0;
                child.setLayoutParams(rawParams);
            }
        }

        private void maybeAutoScroll(float rawY) {
            if (scrollView == null) {
                return;
            }
            int[] location = new int[2];
            scrollView.getLocationOnScreen(location);
            int top = location[1];
            int bottom = top + scrollView.getHeight();
            int threshold = dp(56);
            int step = dp(16);
            if (rawY < top + threshold) {
                scrollView.smoothScrollBy(0, -step);
            } else if (rawY > bottom - threshold) {
                scrollView.smoothScrollBy(0, step);
            }
        }

        private GradientDrawable buildCardBackground() {
            GradientDrawable drawable = new GradientDrawable();
            drawable.setColor(resolveDialogSurface());
            drawable.setCornerRadius(dp(18));
            drawable.setStroke(dp(1), resolveDialogStroke());
            return drawable;
        }

        private int resolveDialogSurface() {
            return isNightMode() ? Color.parseColor("#FF161B22") : Color.WHITE;
        }

        private int resolveDialogStroke() {
            return isNightMode() ? 0x33FFFFFF : 0x140F172A;
        }

        private int resolveColor(int attr, int fallback) {
            android.util.TypedValue typedValue = new android.util.TypedValue();
            if (activity.getTheme().resolveAttribute(attr, typedValue, true)) {
                if (typedValue.type >= android.util.TypedValue.TYPE_FIRST_COLOR_INT
                        && typedValue.type <= android.util.TypedValue.TYPE_LAST_COLOR_INT) {
                    return typedValue.data;
                }
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                    try {
                        return activity.getColor(typedValue.resourceId);
                    } catch (Throwable ignored) {
                        return fallback;
                    }
                }
            }
            return fallback;
        }

        private boolean isNightMode() {
            int nightModeFlags = activity.getResources().getConfiguration().uiMode
                    & Configuration.UI_MODE_NIGHT_MASK;
            return nightModeFlags == Configuration.UI_MODE_NIGHT_YES;
        }

        private int dp(int value) {
            return Math.round(value * activity.getResources().getDisplayMetrics().density);
        }

        private final class HandleTouchListener implements View.OnTouchListener {
            private final RowBinding rowBinding;
            private float downRawX;
            private float downRawY;

            private HandleTouchListener(RowBinding rowBinding) {
                this.rowBinding = rowBinding;
            }

            @Override
            public boolean onTouch(View view, MotionEvent event) {
                if (view == null || event == null) {
                    return false;
                }
                try {
                    switch (event.getActionMasked()) {
                        case MotionEvent.ACTION_DOWN:
                            downRawX = event.getRawX();
                            downRawY = event.getRawY();
                            if (draggingRow != null) {
                                return false;
                            }
                            view.performHapticFeedback(HapticFeedbackConstants.VIRTUAL_KEY);
                            startDrag(rowBinding, downRawY);
                            return true;
                        case MotionEvent.ACTION_MOVE:
                            if (draggingRow == rowBinding) {
                                updateDrag(event.getRawY());
                                return true;
                            }
                            return Math.abs(event.getRawX() - downRawX) <= touchSlop
                                    && Math.abs(event.getRawY() - downRawY) <= touchSlop;
                        case MotionEvent.ACTION_UP:
                        case MotionEvent.ACTION_CANCEL:
                            if (draggingRow == rowBinding) {
                                finishDrag(true);
                                return true;
                            }
                            return false;
                        default:
                            return false;
                    }
                } catch (Throwable throwable) {
                    Log.w(TAG, "Expression footer drag gesture failed", throwable);
                    if (draggingRow == rowBinding) {
                        finishDrag(false);
                    }
                    return false;
                }
            }
        }
    }

    private static final class RowBinding {
        final LinearLayout root;
        final String tabType;

        RowBinding(LinearLayout root, String tabType) {
            this.root = root;
            this.tabType = tabType;
        }
    }

    private static final class SaveDialogClickListener
            implements android.content.DialogInterface.OnClickListener {
        private final Controller controller;
        private final SaveCallback saveCallback;

        SaveDialogClickListener(Controller controller, SaveCallback saveCallback) {
            this.controller = controller;
            this.saveCallback = saveCallback;
        }

        @Override
        public void onClick(android.content.DialogInterface dialogInterface, int which) {
            if (saveCallback == null || controller == null) {
                return;
            }
            try {
                saveCallback.onSave(controller.currentOrder());
            } catch (Throwable throwable) {
                Log.w(TAG, "Failed to save expression footer reorder result", throwable);
            }
        }
    }

    private static final class ReleaseControllerOnDismissListener
            implements android.content.DialogInterface.OnDismissListener {
        private final Controller controller;

        ReleaseControllerOnDismissListener(Controller controller) {
            this.controller = controller;
        }

        @Override
        public void onDismiss(android.content.DialogInterface dialogInterface) {
            try {
                if (controller != null) {
                    controller.release();
                }
            } catch (Throwable throwable) {
                Log.w(TAG, "Failed to dismiss expression footer reorder dialog", throwable);
            }
        }
    }

    private static final class RestoreDraggedRowAction implements Runnable {
        private final RowBinding rowBinding;

        RestoreDraggedRowAction(RowBinding rowBinding) {
            this.rowBinding = rowBinding;
        }

        @Override
        public void run() {
            if (rowBinding == null || rowBinding.root == null) {
                return;
            }
            rowBinding.root.setAlpha(1f);
        }
    }

    private static boolean isDestroyed(Activity activity) {
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1
                && activity.isDestroyed();
    }
}
