package app.canada.walmart;

import android.content.Context;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * Restores the "Find item" button on linked shopping list items so users can
 * easily re-search and link a different item from Walmart's product catalog.
 */
@SuppressWarnings("unused")
public class WalmartFindItemButton {
    private static final String TAG = "WalmartFindItem";

    private static final int UNSET = -1;
    private static final int PARENT_ID = 0;

    // Tag keys to stash state on the tile View
    private static final int TAG_KEY_ACTION = 0x7e000001;
    private static final int TAG_KEY_CALLBACK = 0x7e000002;


    /**
     * Injected at every return of ListDetailTileView.setActionButton(p).
     *
     * @param tileView   The ListDetailTileView instance.
     * @param actionEnum The b40.p enum instance.
     */
    public static void onSetActionButton(View tileView, Object actionEnum) {
        if (tileView == null) return;
        try {
            tileView.setTag(TAG_KEY_ACTION, actionEnum);
            Log.i(TAG, "onSetActionButton: action=" + actionEnum + " on " + tileView);
            onTileBind(tileView, null);
        } catch (Throwable t) {
            Log.e(TAG, "Error in onSetActionButton", t);
        }
    }

    /**
     * Injected at the end of ListDetailTileView.setOnActionButtonClicked(Function1).
     *
     * @param tileView              The ListDetailTileView instance.
     * @param onActionButtonClicked The action button click callback (Function1).
     */
    public static void onTileBind(final View tileView, final Object onActionButtonClicked) {
        if (tileView == null) return;
        try {
            tileView.setTag(TAG_KEY_CALLBACK, onActionButtonClicked);
            final Object action = tileView.getTag(TAG_KEY_ACTION);
            Log.i(TAG, "onTileBind: action=" + action + ", callback=" + onActionButtonClicked);

            apply(tileView, action, onActionButtonClicked);

            // Post to layout queue to guarantee visibility and constraints after any adapter delegates finish
            tileView.post(new Runnable() {
                @Override
                public void run() {
                    try {
                        Object act = tileView.getTag(TAG_KEY_ACTION);
                        Object cb = tileView.getTag(TAG_KEY_CALLBACK);
                        apply(tileView, act, cb);
                    } catch (Throwable t) {
                        Log.e(TAG, "Error in post-apply", t);
                    }
                }
            });
        } catch (Throwable t) {
            Log.e(TAG, "Error in onTileBind", t);
        }
    }

    private static void apply(final View tileView, Object actionEnum, final Object callback) {
        if (!(tileView instanceof ViewGroup)) return;
        Context context = tileView.getContext();

        int idFindItem = resolveId(context, "lists_item_detail_find_item_button");
        int idDivider = resolveId(context, "lists_rewards_margin_view");
        int idBarrierBottom = resolveId(context, "barrier_unit_of_measure");

        View findItemBtn = tileView.findViewById(idFindItem);
        if (findItemBtn == null) {
            Log.w(TAG, "findItemBtn not found in tileView");
            return;
        }

        String actionName = actionEnum != null ? actionEnum.toString() : getActionButtonName(tileView);

        // If this item is unlinked (action is FIND_ITEM), restore default bottom-right layout
        if ("FIND_ITEM".equals(actionName)) {
            restoreDefaultLayout((ViewGroup) tileView, findItemBtn, idDivider, idBarrierBottom, context);
            findItemBtn.setVisibility(View.VISIBLE);
            return;
        }

        // For linked items (ADD_TO_CART, SHOP_SIMILAR, SEE_OPTIONS, DEALS_WPLUS, etc.):
        // Reposition strictly BELOW the bottom action button on the right!
        repositionBelowBottomAction((ViewGroup) tileView, findItemBtn, idBarrierBottom, context);

        findItemBtn.setVisibility(View.VISIBLE);
        findItemBtn.bringToFront();
        findItemBtn.setClickable(true);
        findItemBtn.setFocusable(true);
        findItemBtn.setEnabled(true);RuntimeStats.hit("Find item buttons shown");
        try {
            findItemBtn.setElevation(dpToPx(context, 4));
        } catch (Throwable ignored) {}

        // Wire click listener to trigger FIND_ITEM
        findItemBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Log.i(TAG, "Find item clicked on tile!");
                triggerFindItem(tileView, callback);
            }
        });
    }

    private static void repositionBelowBottomAction(ViewGroup parent, View findItemBtn, int idBarrierBottom, Context context) {
        try {
            ViewGroup.LayoutParams rawLp = findItemBtn.getLayoutParams();
            if (rawLp == null) {
                Log.w(TAG, "findItemBtn layoutParams is null");
                return;
            }

            // Find the bottom-right action view to anchor below
            int idAddCart = resolveId(context, "lists_item_detail_add_cart_button");
            int idDealsCta = resolveId(context, "lists_item_detail_deals_cta_button");
            int idSeeOptions = resolveId(context, "lists_item_detail_see_options_button");
            int idShop = resolveId(context, "lists_item_detail_shop_button");

            int anchorId = idAddCart;
            View anchorView = null;
            int[] candidates = new int[] { idAddCart, idDealsCta, idSeeOptions, idShop };
            for (int cid : candidates) {
                View cv = parent.findViewById(cid);
                if (cv != null && cv != findItemBtn && cv.getVisibility() == View.VISIBLE) {
                    anchorId = cid;
                    anchorView = cv;
                    break;
                }
            }

            int idFindItem = findItemBtn.getId();
            if (idFindItem == View.NO_ID) {
                idFindItem = resolveId(context, "lists_item_detail_find_item_button");
            }

            // If anchor view exists (e.g. Add to cart), place it directly above Find item
            if (anchorView != null) {
                ViewGroup.LayoutParams anchorLp = anchorView.getLayoutParams();
                if (anchorLp != null) {
                    setIntField(anchorLp, UNSET, "bottomToBottom", "l");
                    setIntField(anchorLp, idFindItem, "bottomToTop", "k");
                    if (anchorLp instanceof ViewGroup.MarginLayoutParams) {
                        ViewGroup.MarginLayoutParams amlp = (ViewGroup.MarginLayoutParams) anchorLp;
                        amlp.bottomMargin = dpToPx(context, 4);
                    }
                    anchorView.setLayoutParams(anchorLp);
                }
            }

            // Clear horizontal anchors
            setIntField(rawLp, UNSET, "leftToLeft", "e");
            setIntField(rawLp, UNSET, "leftToRight", "f");
            setIntField(rawLp, UNSET, "rightToLeft", "g");
            setIntField(rawLp, UNSET, "startToStart", "t");
            setIntField(rawLp, UNSET, "startToEnd", "s");
            setIntField(rawLp, UNSET, "endToStart", "u");

            // End-align to parent right
            setIntField(rawLp, PARENT_ID, "rightToRight", "h");
            setIntField(rawLp, PARENT_ID, "endToEnd", "v");

            // Clear vertical anchors
            setIntField(rawLp, UNSET, "topToTop", "i");
            setIntField(rawLp, UNSET, "bottomToTop", "k");
            setIntField(rawLp, UNSET, "baselineToBaseline", "m");

            // Position top of Find item button strictly below the bottom-right action button
            setIntField(rawLp, anchorId, "topToBottom", "j");

            // Position bottom of Find item button to the bottom barrier or parent
            int bottomTarget = idBarrierBottom > 0 ? idBarrierBottom : PARENT_ID;
            setIntField(rawLp, bottomTarget, "bottomToBottom", "l");
            setFloatField(rawLp, 1.0f, "verticalBias", "F");

            // Margins
            if (rawLp instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) rawLp;
                int marginEnd = dpToPx(context, 16);
                mlp.setMarginEnd(marginEnd);
                mlp.rightMargin = marginEnd;
                mlp.topMargin = dpToPx(context, 2);
                mlp.bottomMargin = dpToPx(context, 8);
                mlp.leftMargin = 0;
                mlp.resolveLayoutDirection(parent.getLayoutDirection());
            }

            findItemBtn.setLayoutParams(rawLp);
            parent.requestLayout();
            Log.i(TAG, "Repositioned findItemBtn below bottom action (anchorId=0x" + Integer.toHexString(anchorId) + ")");
        } catch (Throwable t) {
            Log.e(TAG, "Failed to reposition via LayoutParams", t);
        }
    }

    private static void restoreDefaultLayout(ViewGroup parent, View findItemBtn, int idDivider, int idBarrierBottom, Context context) {
        try {
            // Restore any anchor buttons that were placed above findItemBtn
            int idAddCart = resolveId(context, "lists_item_detail_add_cart_button");
            int idDealsCta = resolveId(context, "lists_item_detail_deals_cta_button");
            int idSeeOptions = resolveId(context, "lists_item_detail_see_options_button");
            int idShop = resolveId(context, "lists_item_detail_shop_button");
            int[] candidates = new int[] { idAddCart, idDealsCta, idSeeOptions, idShop };
            int bottomTarget = idBarrierBottom > 0 ? idBarrierBottom : PARENT_ID;
            for (int cid : candidates) {
                View cv = parent.findViewById(cid);
                if (cv != null && cv.getLayoutParams() != null) {
                    ViewGroup.LayoutParams cvLp = cv.getLayoutParams();
                    setIntField(cvLp, UNSET, "bottomToTop", "k");
                    setIntField(cvLp, bottomTarget, "bottomToBottom", "l");
                    cv.setLayoutParams(cvLp);
                }
            }

            ViewGroup.LayoutParams rawLp = findItemBtn.getLayoutParams();
            if (rawLp == null) {
                return;
            }

            // Clear horizontal anchors
            setIntField(rawLp, UNSET, "leftToLeft", "e");
            setIntField(rawLp, UNSET, "leftToRight", "f");
            setIntField(rawLp, UNSET, "rightToLeft", "g");
            setIntField(rawLp, UNSET, "startToStart", "t");
            setIntField(rawLp, UNSET, "startToEnd", "s");
            setIntField(rawLp, UNSET, "endToStart", "u");
            setIntField(rawLp, UNSET, "topToTop", "i");
            setIntField(rawLp, UNSET, "bottomToTop", "k");
            setIntField(rawLp, UNSET, "baselineToBaseline", "m");

            // Default constraints from XML
            setIntField(rawLp, PARENT_ID, "rightToRight", "h");
            setIntField(rawLp, PARENT_ID, "endToEnd", "v");
            setIntField(rawLp, idDivider, "topToBottom", "j");
            setIntField(rawLp, bottomTarget, "bottomToBottom", "l");
            setFloatField(rawLp, 1.0f, "verticalBias", "F");

            if (rawLp instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) rawLp;
                int marginEnd = dpToPx(context, 16);
                mlp.setMarginEnd(marginEnd);
                mlp.rightMargin = marginEnd;
                mlp.bottomMargin = dpToPx(context, 8);
                mlp.topMargin = 0;
                mlp.leftMargin = 0;
                mlp.resolveLayoutDirection(parent.getLayoutDirection());
            }

            findItemBtn.setLayoutParams(rawLp);
            parent.requestLayout();
            Log.i(TAG, "Restored default layout for findItemBtn via LayoutParams");
        } catch (Throwable t) {
            Log.e(TAG, "Failed to restore default layout via LayoutParams", t);
        }
    }

    private static boolean setIntField(Object obj, int val, String... names) {
        for (String name : names) {
            try {
                Field f = obj.getClass().getField(name);
                f.setInt(obj, val);
                return true;
            } catch (NoSuchFieldException ignored) {
                try {
                    Field f = obj.getClass().getDeclaredField(name);
                    f.setAccessible(true);
                    f.setInt(obj, val);
                    return true;
                } catch (Throwable ignored2) {}
            } catch (Throwable ignored) {}
        }
        return false;
    }

    private static boolean setFloatField(Object obj, float val, String... names) {
        for (String name : names) {
            try {
                Field f = obj.getClass().getField(name);
                f.setFloat(obj, val);
                return true;
            } catch (NoSuchFieldException ignored) {
                try {
                    Field f = obj.getClass().getDeclaredField(name);
                    f.setAccessible(true);
                    f.setFloat(obj, val);
                    return true;
                } catch (Throwable ignored2) {}
            } catch (Throwable ignored) {}
        }
        return false;
    }

    private static String getActionButtonName(View tileView) {
        try {
            Method m = tileView.getClass().getMethod("getActionButton");
            Object action = m.invoke(tileView);
            if (action instanceof Enum<?>) {
                return ((Enum<?>) action).name();
            }
        } catch (Throwable ignored) {}
        try {
            Field f = tileView.getClass().getDeclaredField("L");
            f.setAccessible(true);
            Object action = f.get(tileView);
            if (action instanceof Enum<?>) {
                return ((Enum<?>) action).name();
            }
        } catch (Throwable ignored) {}
        return null;
    }

    private static void triggerFindItem(View tileView, Object onActionButtonClicked) {
        Log.i(TAG, "triggerFindItem called");
        if (onActionButtonClicked == null) {
            onActionButtonClicked = tileView.getTag(TAG_KEY_CALLBACK);
        }
        if (onActionButtonClicked == null) {
            try {
                Method m = tileView.getClass().getMethod("getOnActionButtonClicked");
                onActionButtonClicked = m.invoke(tileView);
            } catch (Throwable ignored) {}
        }
        if (onActionButtonClicked == null) {
            for (Field f : tileView.getClass().getDeclaredFields()) {
                try {
                    f.setAccessible(true);
                    Object val = f.get(tileView);
                    if (val != null && val.getClass().getName().contains("Function1")) {
                        onActionButtonClicked = val;
                        Log.i(TAG, "Found callback via Function1 field: " + f.getName());
                        break;
                    }
                } catch (Throwable ignored) {}
            }
        }

        if (onActionButtonClicked == null) {
            Log.e(TAG, "No action button callback found on tileView");
            return;
        }

        try {
            ClassLoader cl = tileView.getContext().getClassLoader();
            Class<?> enumClass = null;
            try {
                enumClass = cl.loadClass("b40.p");
            } catch (Throwable ignored) {}
            if (enumClass == null) {
                Object action = tileView.getTag(TAG_KEY_ACTION);
                if (action instanceof Enum<?>) {
                    enumClass = action.getClass();
                }
            }

            Object findItemConstant = null;
            if (enumClass != null && enumClass.isEnum()) {
                for (Object c : enumClass.getEnumConstants()) {
                    if ("FIND_ITEM".equals(((Enum<?>) c).name())) {
                        findItemConstant = c;
                        break;
                    }
                }
            }

            if (findItemConstant == null) {
                Log.e(TAG, "Could not resolve FIND_ITEM enum constant");
                return;
            }

            // Look for invoke(Object) on the Kotlin Function1
            Method invokeMethod = null;
            for (Method m : onActionButtonClicked.getClass().getMethods()) {
                if ("invoke".equals(m.getName()) && m.getParameterTypes().length == 1) {
                    invokeMethod = m;
                    break;
                }
            }

            if (invokeMethod != null) {
                invokeMethod.setAccessible(true);
                Object res = invokeMethod.invoke(onActionButtonClicked, findItemConstant);
                Log.i(TAG, "triggerFindItem: Successfully invoked callback with FIND_ITEM! Result: " + res);
            } else {
                Log.e(TAG, "invoke(Object) method not found on callback: " + onActionButtonClicked.getClass().getName());
            }
        } catch (Throwable t) {
            Log.e(TAG, "Error invoking FIND_ITEM callback", t);
        }
    }

    private static int resolveId(Context context, String name) {
        try {
            int id = context.getResources().getIdentifier(name, "id", context.getPackageName());
            if (id != 0) return id;
        } catch (Throwable ignored) {}
        return 0;
    }

    private static int dpToPx(Context context, float dp) {
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP,
                dp,
                context.getResources().getDisplayMetrics()
        );
    }
}
