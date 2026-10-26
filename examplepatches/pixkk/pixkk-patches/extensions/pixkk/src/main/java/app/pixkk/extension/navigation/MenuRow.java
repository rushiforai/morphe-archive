package app.pixkk.extension.navigation;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

import app.pixkk.extension.core.Logger;
import app.pixkk.extension.core.SettingsScreen;

/**
 * The Pixkk Patches row in the profile's side menu, right under "Settings and privacy".
 *
 * The menu's rows are built one per server-listed component, so a row of our own has no component
 * to come from. Instead the row TikTok builds for "Settings and privacy" is handed back inside a
 * wrapper, with a second row made from the same view class beside it. Everything about that class
 * is looked up by what it is (a view with a title, an icon and an accessory), not by its name.
 */
public final class MenuRow {
    private static final String SETTINGS_CELL = "content_section_cell_settings_and_privacy";
    private static final String TITLE = "Pixkk Patches";
    /** What the cell's constructor is given as its third argument everywhere TikTok builds one. */
    private static final int CELL_STYLE = 6;

    private MenuRow() {
    }

    /**
     * Called with the row TikTok just built.
     *
     * @param cell the built row
     * @param protocolName the name of the protocol of the component that built it
     * @param icon the resource id of the icon the new row shows
     * @return the view to put in the menu in its place
     */
    public static View wrap(View cell, String protocolName, int icon) {
        try {
            if (cell == null || !SETTINGS_CELL.equals(protocolName)) return cell;
            View mine = build(cell, icon);
            if (mine == null) return cell;

            // The built row stays as it is. Ours goes in beside it once it has a parent.
            cell.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                @Override
                public void onViewAttachedToWindow(View view) {
                    view.removeOnAttachStateChangeListener(this);
                    ViewGroup parent = (ViewGroup) view.getParent();
                    if (parent != null && mine.getParent() == null) {
                        parent.addView(mine, parent.indexOfChild(view) + 1, copyOf(view.getLayoutParams()));
                        // The row tidies its own parts as it is first laid out, so the look is
                        // copied over once that has happened.
                        Runnable match = () -> {
                            mirror(view, mine);
                            copyIcon(view, mine);
                        };
                        mine.post(match);
                        mine.postDelayed(match, 250);
                    }
                }

                @Override
                public void onViewDetachedFromWindow(View view) {
                }
            });
            return cell;
        } catch (Throwable ex) {
            Logger.printException(() -> "Could not add the menu row", ex);
            return cell;
        }
    }

    /** The row TikTok built has the margins the menu wants; ours takes a copy of its parameters. */
    private static ViewGroup.LayoutParams copyOf(ViewGroup.LayoutParams own) {
        if (own == null) return new ViewGroup.LayoutParams(-1, -2);
        try {
            return own.getClass().getConstructor(own.getClass()).newInstance(own);
        } catch (Throwable ex) {
            return new ViewGroup.LayoutParams(own);
        }
    }

    /**
     * TikTok adjusts margins and padding of the row's parts after it builds them. Both rows are the
     * same class, so the parts line up one for one and the adjustments carry over.
     */
    private static void mirror(View from, View to) {
        to.setPadding(from.getPaddingLeft(), from.getPaddingTop(), from.getPaddingRight(), from.getPaddingBottom());
        ViewGroup.LayoutParams a = from.getLayoutParams();
        ViewGroup.LayoutParams b = to.getLayoutParams();
        if (a instanceof ViewGroup.MarginLayoutParams && b instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams source = (ViewGroup.MarginLayoutParams) a;
            ViewGroup.MarginLayoutParams target = (ViewGroup.MarginLayoutParams) b;
            target.setMargins(source.leftMargin, source.topMargin, source.rightMargin, source.bottomMargin);
            // Margins set as start and end win over left and right once the layout is resolved.
            target.setMarginStart(source.getMarginStart());
            target.setMarginEnd(source.getMarginEnd());
            to.setLayoutParams(target);
        }
        if (from instanceof ViewGroup && to instanceof ViewGroup) {
            ViewGroup source = (ViewGroup) from;
            ViewGroup target = (ViewGroup) to;
            if (source.getChildCount() != target.getChildCount()) return;
            for (int i = 0; i < source.getChildCount(); i++) {
                mirror(source.getChildAt(i), target.getChildAt(i));
            }
        }
    }

    private static android.widget.TextView firstText(View root) {
        if (root instanceof android.widget.TextView) return (android.widget.TextView) root;
        if (root instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                android.widget.TextView found = firstText(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    /** The icon the settings row draws, with its tint, on the same part of our row. */
    private static void copyIcon(View from, View to) {
        try {
            for (Field field : from.getClass().getFields()) {
                if (!field.getType().getName().endsWith("TuxIconView")) continue;
                Object source = field.get(from);
                Object target = field.get(to);
                if (source instanceof android.widget.ImageView && target instanceof android.widget.ImageView) {
                    android.graphics.drawable.Drawable drawable = ((android.widget.ImageView) source).getDrawable();
                    // TikTok's icon drawable keeps the resource it was made from.
                    int res = drawable.getClass().getField("iconRes").getInt(drawable);
                    target.getClass().getMethod("setIconRes", int.class).invoke(target, res);
                    android.widget.TextView title = firstText(from);
                    if (title != null) {
                        target.getClass().getMethod("setTintColor", int.class)
                                .invoke(target, title.getCurrentTextColor());
                    }
                }
                return;
            }
        } catch (Throwable ex) {
            Logger.printException(() -> "Could not copy the menu row icon", ex);
        }
    }

    private static View build(View original, int icon) throws Exception {
        Context context = original.getContext();
        Class<?> cellClass = original.getClass();
        Constructor<?> constructor = cellClass.getConstructor(Context.class, AttributeSet.class, int.class);
        View cell = (View) constructor.newInstance(context, null, CELL_STYLE);

        method(cellClass, "setTitle", CharSequence.class).invoke(cell, TITLE);

        // The icon: the cell's icon holder has one int-wrapping field, the resource id.
        Method setIcon = null;
        for (Method method : cellClass.getMethods()) {
            Class<?>[] types = method.getParameterTypes();
            if (method.getName().equals("setIcon") && types.length == 1
                    && !types[0].isInterface() && types[0].getConstructors().length > 0) {
                setIcon = method;
            }
        }
        if (setIcon != null) {
            Object holder = setIcon.getParameterTypes()[0].getConstructor().newInstance();
            for (Field field : holder.getClass().getFields()) {
                // The holder's first int field is the icon's resource id; setIcon hands it to the icon view.
                if (field.getType() == int.class && field.getName().equals("LIZ")) field.set(holder, icon);
            }
            setIcon.invoke(cell, holder);
        }

        // The arrow: a second accessory of the class the original carries.
        Object accessory = cellClass.getMethod("getAccessory").invoke(original);
        if (accessory != null) {
            Object arrow = accessory.getClass().getConstructor(Context.class, AttributeSet.class)
                    .newInstance(context, null);
            for (Method method : arrow.getClass().getMethods()) {
                Class<?>[] types = method.getParameterTypes();
                if (types.length == 1 && types[0] == View.OnClickListener.class) {
                    method.invoke(arrow, (View.OnClickListener) v -> SettingsScreen.show(context));
                    break;
                }
            }
            for (Method method : cellClass.getMethods()) {
                if (method.getName().equals("setAccessory") && method.getParameterTypes().length == 1
                        && method.getParameterTypes()[0].isInstance(arrow)) {
                    method.invoke(cell, arrow);
                    break;
                }
            }
        }
        cell.setOnClickListener(v -> SettingsScreen.show(context));
        return cell;
    }

    private static Method method(Class<?> type, String name, Class<?>... parameters) throws Exception {
        return type.getMethod(name, parameters);
    }
}
