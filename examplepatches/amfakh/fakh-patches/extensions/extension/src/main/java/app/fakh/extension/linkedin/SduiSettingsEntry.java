package app.fakh.extension.linkedin;

import java.util.List;

/**
 * Adds a "Fakh Patches" row to LinkedIn's own Settings screen, which the server sends as an SDUI
 * categoryMenu component with one row per category.
 *
 * The Notifications row is copied with its label and icon changed and its action replaced by a navigate to
 * URL action for {@link #URL}, which SettingsActivity handles. LinkedIn starts external URLs with
 * an ACTION_VIEW intent, so no click hook is needed.
 */
@SuppressWarnings("unused")
public final class SduiSettingsEntry {
    static final String URL = "fakhpatches://settings";

    private static final String MENU = "com.linkedin.sdui.impl.settings.components.categoryMenu";
    private static final String ROW_MARKER = "settings_sdui_";
    private static final String TEMPLATE = "settings_sdui_notifications";
    private static final String TEMPLATE_LABEL = "Notifications";
    private static final String LABEL = "Fakh Patches";
    /** DesignSystemImage ids (MercadoLightThemeKt.imageLookup): bellFillMedium, and settingsMedium for the row. */
    private static final int ICON_FIELD = 3;
    private static final int TEMPLATE_ICON = 240;
    private static final int ICON = 377;

    /** Field of a row component holding its tap action. */
    private static final int ACTION_FIELD = 25;
    /** Type id of the action wrapper, and its navigate to URL option, as in LinkedIn's Help Center link. */
    private static final int ACTION_TYPE = 26628;
    private static final int URL_NAVIGATION_TYPE_EXTERNAL = 1;

    private SduiSettingsEntry() {
    }

    /** Called with every SDUI component before it is transformed; returns it, or a copy with the row added. */
    public static Object inject(Object component) {
        try {
            byte[] bytes = payload(component);
            if (bytes == null || !ProtoEdit.contains(bytes, MENU) || !ProtoEdit.contains(bytes, TEMPLATE)
                    || ProtoEdit.contains(bytes, URL)) return component;
            byte[] edited = addRow(bytes);
            if (edited == null) return component;
            Object copy = component.getClass().getMethod("parseFrom", byte[].class).invoke(null, (Object) edited);
            Settings.debugLog("added settings row");
            return copy != null ? copy : component;
        } catch (Throwable t) {
            Diagnostics.error("settings row failed", t);
            return component;
        }
    }

    /**
     * Walks down to the message whose repeated field holds the rows, and inserts the copy right after
     * the template row. Returns null if the rows are not found.
     */
    private static byte[] addRow(byte[] message) {
        List<ProtoEdit.Field> fields = ProtoEdit.parse(message);
        if (fields == null) return null;
        int rows = 0;
        for (ProtoEdit.Field field : fields) {
            if (field.wireType == 2 && ProtoEdit.contains(field.data, ROW_MARKER)) rows++;
        }
        for (int i = 0; i < fields.size(); i++) {
            ProtoEdit.Field field = fields.get(i);
            if (field.wireType != 2 || !ProtoEdit.contains(field.data, TEMPLATE)) continue;
            if (rows > 1) {
                fields.add(i + 1, row(field));
            } else {
                byte[] inner = addRow(field.data);
                if (inner == null) return null;
                field.data = inner;
            }
            return ProtoEdit.write(fields);
        }
        return null;
    }

    private static ProtoEdit.Field row(ProtoEdit.Field template) {
        ProtoEdit.Field row = template.copy();
        List<ProtoEdit.Field> fields = ProtoEdit.parse(row.data);
        // A row in a list item wrapper: copy the wrapper and edit the row inside it.
        if (fields == null) return row;
        boolean direct = false;
        for (ProtoEdit.Field field : fields) if (field.number == ACTION_FIELD && field.wireType == 2) direct = true;
        if (!direct) {
            for (ProtoEdit.Field field : fields) {
                if (field.wireType == 2 && ProtoEdit.contains(field.data, TEMPLATE)) {
                    field.data = row(field).data;
                }
            }
            row.data = ProtoEdit.write(fields);
            return row;
        }
        for (int i = 0; i < fields.size(); i++) {
            if (fields.get(i).number == ACTION_FIELD) fields.set(i, action());
        }
        row.data = ProtoEdit.replaceVarint(ProtoEdit.replaceString(ProtoEdit.write(fields), TEMPLATE_LABEL, LABEL),
                ICON_FIELD, TEMPLATE_ICON, ICON);
        return row;
    }

    /** { 1: { 5: { 1: ACTION_TYPE, 2: { 2: { 1: URL, 2: External } } } }, 2: "" } */
    private static ProtoEdit.Field action() {
        return ProtoEdit.message(ACTION_FIELD,
                ProtoEdit.message(1,
                        ProtoEdit.message(5,
                                ProtoEdit.varintField(1, ACTION_TYPE),
                                ProtoEdit.message(2,
                                        ProtoEdit.message(2,
                                                ProtoEdit.string(1, URL),
                                                ProtoEdit.varintField(2, URL_NAVIGATION_TYPE_EXTERNAL))))),
                ProtoEdit.string(2, ""));
    }

    private static byte[] payload(Object component) {
        Object bytes = Proto.call(component, "toByteArray");
        return bytes instanceof byte[] ? (byte[]) bytes : null;
    }
}
