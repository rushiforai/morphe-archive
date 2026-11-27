package app.jimaku.extension.gateway;

import java.util.Collections;
import java.util.Map;

/**
 * A request that gave nothing to show, or was refused. {@code code} is the gateway's stable error
 * code, or one of {@code offline} (not reachable), {@code cancelled} (the video was left),
 * {@code bad_answer} (an answer Jimaku can't read), {@code bad_video} and {@code http_<status>}, as
 * in the extension. {@code extra} carries what came with a refusal, such as the running job's video
 * for {@code busy}.
 */
public final class GatewayException extends Exception {
    public final String code;
    public final Map<String, Object> extra;

    public GatewayException(String code) {
        this(code, Collections.emptyMap());
    }

    public GatewayException(String code, Map<String, Object> extra) {
        super(code);
        this.code = code;
        this.extra = Collections.unmodifiableMap(extra);
    }

    public GatewayException(String code, Throwable cause) {
        super(code, cause);
        this.code = code;
        this.extra = Collections.emptyMap();
    }
}
