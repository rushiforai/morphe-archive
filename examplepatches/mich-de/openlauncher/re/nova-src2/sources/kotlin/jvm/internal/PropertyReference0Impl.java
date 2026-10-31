package kotlin.jvm.internal;

import com.tiktok.appevents.edp.TTEDPEventConstants;

/* loaded from: classes.dex */
public class PropertyReference0Impl extends PropertyReference0 {
    public PropertyReference0Impl(Class cls) {
        super(CallableReference.NO_RECEIVER, cls, TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, "<v#0>", 0);
    }

    @Override // kotlin.reflect.KProperty0
    public Object get() {
        return getGetter().call(new Object[0]);
    }
}
