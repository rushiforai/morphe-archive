package io.branch.search.internal;

import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import org.json.JSONObject;

/* renamed from: io.branch.search.internal.f7, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final /* synthetic */ class C3146f7 extends FunctionReferenceImpl implements Function2<String, String, JSONObject> {
    public C3146f7(Object obj) {
        super(2, 0, C3112d7.class, obj, "jsonDeserializer", "jsonDeserializer(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;");
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        String p02 = (String) obj;
        String p12 = (String) obj2;
        Intrinsics.g(p02, "p0");
        Intrinsics.g(p12, "p1");
        ((C3112d7) this.receiver).getClass();
        return p12.length() == 0 ? new JSONObject() : new JSONObject(p12);
    }
}
