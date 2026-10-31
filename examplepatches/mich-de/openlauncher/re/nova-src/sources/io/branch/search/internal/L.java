package io.branch.search.internal;

import java.util.Collection;
import java.util.concurrent.ConcurrentLinkedQueue;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class L extends Lambda implements Function0<Collection<JSONObject>> {

    /* renamed from: a, reason: collision with root package name */
    public static final L f62805a = new L();

    public L() {
        super(0);
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return new ConcurrentLinkedQueue();
    }
}
