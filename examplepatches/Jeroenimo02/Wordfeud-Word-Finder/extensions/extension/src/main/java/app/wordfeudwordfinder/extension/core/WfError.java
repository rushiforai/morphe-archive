package app.wordfeudwordfinder.extension.core;

/** Error with a stable code (see spec section 10). */
public final class WfError extends Exception {
    private final String code;

    private WfError(String code, String message) {
        super(message == null ? code : message);
        this.code = code;
    }

    public String code() {
        return code;
    }

    public static WfError wlNet() { return new WfError("WL-NET", null); }
    public static WfError wlHttp(int status) { return new WfError("WL-HTTP-" + status, null); }
    public static WfError wlHash() { return new WfError("WL-HASH", null); }
    public static WfError wlDisk() { return new WfError("WL-DISK", null); }
    public static WfError wlNone() { return new WfError("WL-NONE", null); }
    public static WfError gsEvent(String type) { return new WfError("GS-EVENT-" + type, null); }
    public static WfError gsData(String detail) { return new WfError("GS-DATA", detail); }
    public static WfError mvSession() { return new WfError("MV-SESSION", null); }
    public static WfError mvNet() { return new WfError("MV-NET", null); }
    public static WfError mvServer(String type) { return new WfError("MV-SERVER-" + type, null); }
}
