package com.instabridge.ai.tools.bii;

import android.content.Intent;
import android.net.Uri;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;
import kotlin.collections.EmptySet;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import x8.h;

@Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\"\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001By\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012&\b\u0002\u0010\u0004\u001a \u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u0007\u0018\u00010\u0005\u00120\b\u0002\u0010\b\u001a*\u0012\u0004\u0012\u00020\u0003\u0012 \u0012\u001e\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u00050\u0006\u0012\u000e\b\u0002\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00030\n¢\u0006\u0004\b\u000b\u0010\fJ\u001c\u0010\u0015\u001a\u00020\u00162\u0014\u0010\u0017\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0006J\t\u0010\u0018\u001a\u00020\u0003HÆ\u0003J'\u0010\u0019\u001a \u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u0007\u0018\u00010\u0005HÆ\u0003J1\u0010\u001a\u001a*\u0012\u0004\u0012\u00020\u0003\u0012 \u0012\u001e\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u00050\u0006HÆ\u0003J\u000f\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u00030\nHÆ\u0003J}\u0010\u001c\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032&\b\u0002\u0010\u0004\u001a \u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u0007\u0018\u00010\u000520\b\u0002\u0010\b\u001a*\u0012\u0004\u0012\u00020\u0003\u0012 \u0012\u001e\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u00050\u00062\u000e\b\u0002\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00030\nHÆ\u0001J\u0013\u0010\u001d\u001a\u00020\u001e2\b\u0010\u001f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010 \u001a\u00020!HÖ\u0001J\t\u0010\"\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR/\u0010\u0004\u001a \u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u0007\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R9\u0010\b\u001a*\u0012\u0004\u0012\u00020\u0003\u0012 \u0012\u001e\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u00050\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0017\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00030\n¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014¨\u0006#"}, d2 = {"Lcom/instabridge/ai/tools/bii/IntentTemplate;", b.f42142b, "action", b.f42142b, "dataUri", "Lkotlin/Function1;", b.f42142b, "Landroid/net/Uri;", "extras", "categories", b.f42142b, "<init>", "(Ljava/lang/String;Lkotlin/jvm/functions/Function1;Ljava/util/Map;Ljava/util/Set;)V", "getAction", "()Ljava/lang/String;", "getDataUri", "()Lkotlin/jvm/functions/Function1;", "getExtras", "()Ljava/util/Map;", "getCategories", "()Ljava/util/Set;", "render", "Landroid/content/Intent;", "params", "component1", "component2", "component3", "component4", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final /* data */ class IntentTemplate {
    public static final int $stable = 8;

    @NotNull
    private final String action;

    @NotNull
    private final Set<String> categories;

    @Nullable
    private final Function1<Map<String, ? extends Object>, Uri> dataUri;

    @NotNull
    private final Map<String, Function1<Map<String, ? extends Object>, Object>> extras;

    /* JADX WARN: Multi-variable type inference failed */
    public IntentTemplate(@NotNull String action, @Nullable Function1<? super Map<String, ? extends Object>, ? extends Uri> function1, @NotNull Map<String, ? extends Function1<? super Map<String, ? extends Object>, ? extends Object>> extras, @NotNull Set<String> categories) {
        Intrinsics.g(action, "action");
        Intrinsics.g(extras, "extras");
        Intrinsics.g(categories, "categories");
        this.action = action;
        this.dataUri = function1;
        this.extras = extras;
        this.categories = categories;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ IntentTemplate copy$default(IntentTemplate intentTemplate, String str, Function1 function1, Map map, Set set, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = intentTemplate.action;
        }
        if ((i5 & 2) != 0) {
            function1 = intentTemplate.dataUri;
        }
        if ((i5 & 4) != 0) {
            map = intentTemplate.extras;
        }
        if ((i5 & 8) != 0) {
            set = intentTemplate.categories;
        }
        return intentTemplate.copy(str, function1, map, set);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getAction() {
        return this.action;
    }

    @Nullable
    public final Function1<Map<String, ? extends Object>, Uri> component2() {
        return this.dataUri;
    }

    @NotNull
    public final Map<String, Function1<Map<String, ? extends Object>, Object>> component3() {
        return this.extras;
    }

    @NotNull
    public final Set<String> component4() {
        return this.categories;
    }

    @NotNull
    public final IntentTemplate copy(@NotNull String action, @Nullable Function1<? super Map<String, ? extends Object>, ? extends Uri> dataUri, @NotNull Map<String, ? extends Function1<? super Map<String, ? extends Object>, ? extends Object>> extras, @NotNull Set<String> categories) {
        Intrinsics.g(action, "action");
        Intrinsics.g(extras, "extras");
        Intrinsics.g(categories, "categories");
        return new IntentTemplate(action, dataUri, extras, categories);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof IntentTemplate)) {
            return false;
        }
        IntentTemplate intentTemplate = (IntentTemplate) other;
        return Intrinsics.b(this.action, intentTemplate.action) && Intrinsics.b(this.dataUri, intentTemplate.dataUri) && Intrinsics.b(this.extras, intentTemplate.extras) && Intrinsics.b(this.categories, intentTemplate.categories);
    }

    @NotNull
    public final String getAction() {
        return this.action;
    }

    @NotNull
    public final Set<String> getCategories() {
        return this.categories;
    }

    @Nullable
    public final Function1<Map<String, ? extends Object>, Uri> getDataUri() {
        return this.dataUri;
    }

    @NotNull
    public final Map<String, Function1<Map<String, ? extends Object>, Object>> getExtras() {
        return this.extras;
    }

    public int hashCode() {
        int iHashCode = this.action.hashCode() * 31;
        Function1<Map<String, ? extends Object>, Uri> function1 = this.dataUri;
        return this.categories.hashCode() + h.c(this.extras, (iHashCode + (function1 == null ? 0 : function1.hashCode())) * 31, 31);
    }

    @NotNull
    public final Intent render(@NotNull Map<String, ? extends Object> params) {
        Uri uri;
        Intrinsics.g(params, "params");
        Intent intent = new Intent(this.action);
        Function1<Map<String, ? extends Object>, Uri> function1 = this.dataUri;
        if (function1 != null && (uri = (Uri) function1.invoke(params)) != null) {
            intent.setData(uri);
        }
        for (Map.Entry<String, Function1<Map<String, ? extends Object>, Object>> entry : this.extras.entrySet()) {
            String key = entry.getKey();
            Object objInvoke = entry.getValue().invoke(params);
            if (objInvoke != null) {
                if (objInvoke instanceof String) {
                    intent.putExtra(key, (String) objInvoke);
                } else if (objInvoke instanceof Integer) {
                    intent.putExtra(key, ((Number) objInvoke).intValue());
                } else if (objInvoke instanceof Long) {
                    intent.putExtra(key, ((Number) objInvoke).longValue());
                } else if (objInvoke instanceof Boolean) {
                    intent.putExtra(key, ((Boolean) objInvoke).booleanValue());
                } else if (objInvoke instanceof Double) {
                    intent.putExtra(key, ((Number) objInvoke).doubleValue());
                } else if (objInvoke instanceof Float) {
                    intent.putExtra(key, ((Number) objInvoke).floatValue());
                } else if (objInvoke instanceof Object[]) {
                    String[] strArr = objInvoke instanceof String[] ? (String[]) objInvoke : null;
                    if (strArr != null) {
                        intent.putExtra(key, strArr);
                    }
                } else {
                    intent.putExtra(key, objInvoke.toString());
                }
            }
        }
        Iterator<String> it = this.categories.iterator();
        while (it.hasNext()) {
            intent.addCategory(it.next());
        }
        return intent;
    }

    @NotNull
    public String toString() {
        return "IntentTemplate(action=" + this.action + ", dataUri=" + this.dataUri + ", extras=" + this.extras + ", categories=" + this.categories + ')';
    }

    public IntentTemplate(String str, Function1 function1, Map map, Set set, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i5 & 2) != 0 ? null : function1, (i5 & 4) != 0 ? b70.h.f17594a : map, (i5 & 8) != 0 ? EmptySet.f71734a : set);
    }
}
