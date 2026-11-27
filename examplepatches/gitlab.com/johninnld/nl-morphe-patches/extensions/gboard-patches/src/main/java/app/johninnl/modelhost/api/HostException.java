package app.johninnl.modelhost.api;

public final class HostException extends Exception {
    public final String code;
    public HostException(String code) { super(code); this.code = code; }
    public HostException(String code, Throwable cause) { super(code, cause); this.code = code; }
}
