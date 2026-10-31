package com.instabridge.ai.chat.model;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import b.u4;
import b70.h;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import fq.c;
import h6.c1;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001:\u0002'(BE\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\u000e\b\u0002\u0010\t\u001a\b\u0012\u0004\u0012\u00020\n0\u0006¢\u0006\u0004\b\u000b\u0010\fJ\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0015\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000f\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006HÆ\u0003J\u000b\u0010\u0017\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000f\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\n0\u0006HÆ\u0003JK\u0010\u0019\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u00062\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\u000e\b\u0002\u0010\t\u001a\b\u0012\u0004\u0012\u00020\n0\u0006HÆ\u0001J\u0006\u0010\u001a\u001a\u00020\u001bJ\u0013\u0010\u001c\u001a\u00020\u001d2\b\u0010\u001e\u001a\u0004\u0018\u00010\u001fHÖ\u0003J\t\u0010 \u001a\u00020\u001bHÖ\u0001J\t\u0010!\u001a\u00020\u0003HÖ\u0001J\u0016\u0010\"\u001a\u00020#2\u0006\u0010$\u001a\u00020%2\u0006\u0010&\u001a\u00020\u001bR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000eR\u0017\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u000eR\u0017\u0010\t\u001a\b\u0012\u0004\u0012\u00020\n0\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0011¨\u0006)"}, d2 = {"Lcom/instabridge/ai/chat/model/BubbleContext;", "Landroid/os/Parcelable;", "query", b.f42142b, "responseText", "sources", b.f42142b, "Lcom/instabridge/ai/chat/model/BubbleContext$Source;", "openerMessage", "actions", "Lcom/instabridge/ai/chat/model/BubbleContext$Action;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/util/List;)V", "getQuery", "()Ljava/lang/String;", "getResponseText", "getSources", "()Ljava/util/List;", "getOpenerMessage", "getActions", "component1", "component2", "component3", "component4", "component5", "copy", "describeContents", b.f42142b, "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", "toString", "writeToParcel", b.f42142b, "dest", "Landroid/os/Parcel;", "flags", "Source", "Action", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class BubbleContext implements Parcelable {

    @NotNull
    private final List<Action> actions;

    @Nullable
    private final String openerMessage;

    @NotNull
    private final String query;

    @Nullable
    private final String responseText;

    @NotNull
    private final List<Source> sources;

    @NotNull
    public static final Parcelable.Creator<BubbleContext> CREATOR = new Creator();
    public static final int $stable = 8;

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    public static final class Creator implements Parcelable.Creator<BubbleContext> {
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public final BubbleContext createFromParcel(Parcel parcel) {
            Intrinsics.g(parcel, "parcel");
            String string = parcel.readString();
            String string2 = parcel.readString();
            int i5 = parcel.readInt();
            ArrayList arrayList = new ArrayList(i5);
            int iB = 0;
            int iB2 = 0;
            while (iB2 != i5) {
                iB2 = c.b(Source.CREATOR, parcel, arrayList, iB2, 1);
            }
            String string3 = parcel.readString();
            int i11 = parcel.readInt();
            ArrayList arrayList2 = new ArrayList(i11);
            while (iB != i11) {
                iB = c.b(Action.CREATOR, parcel, arrayList2, iB, 1);
            }
            return new BubbleContext(string, string2, arrayList, string3, arrayList2);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public final BubbleContext[] newArray(int i5) {
            return new BubbleContext[i5];
        }
    }

    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0006\u0010\r\u001a\u00020\u000eJ\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0012HÖ\u0003J\t\u0010\u0013\u001a\u00020\u000eHÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001J\u0016\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u000eR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u001a"}, d2 = {"Lcom/instabridge/ai/chat/model/BubbleContext$Source;", "Landroid/os/Parcelable;", TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, b.f42142b, "title", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "getUrl", "()Ljava/lang/String;", "getTitle", "component1", "component2", "copy", "describeContents", b.f42142b, "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", "toString", "writeToParcel", b.f42142b, "dest", "Landroid/os/Parcel;", "flags", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Source implements Parcelable {

        @NotNull
        private final String title;

        @NotNull
        private final String url;

        @NotNull
        public static final Parcelable.Creator<Source> CREATOR = new Creator();
        public static final int $stable = 8;

        @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
        public static final class Creator implements Parcelable.Creator<Source> {
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public final Source createFromParcel(Parcel parcel) {
                Intrinsics.g(parcel, "parcel");
                return new Source(parcel.readString(), parcel.readString());
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public final Source[] newArray(int i5) {
                return new Source[i5];
            }
        }

        public Source(@NotNull String url, @NotNull String title) {
            Intrinsics.g(url, "url");
            Intrinsics.g(title, "title");
            this.url = url;
            this.title = title;
        }

        public static /* synthetic */ Source copy$default(Source source, String str, String str2, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = source.url;
            }
            if ((i5 & 2) != 0) {
                str2 = source.title;
            }
            return source.copy(str, str2);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getUrl() {
            return this.url;
        }

        @NotNull
        /* renamed from: component2, reason: from getter */
        public final String getTitle() {
            return this.title;
        }

        @NotNull
        public final Source copy(@NotNull String url, @NotNull String title) {
            Intrinsics.g(url, "url");
            Intrinsics.g(title, "title");
            return new Source(url, title);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Source)) {
                return false;
            }
            Source source = (Source) other;
            return Intrinsics.b(this.url, source.url) && Intrinsics.b(this.title, source.title);
        }

        @NotNull
        public final String getTitle() {
            return this.title;
        }

        @NotNull
        public final String getUrl() {
            return this.url;
        }

        public int hashCode() {
            return this.title.hashCode() + (this.url.hashCode() * 31);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("Source(url=");
            sb2.append(this.url);
            sb2.append(", title=");
            return c1.t(sb2, this.title, ')');
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(@NotNull Parcel dest, int flags) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.url);
            dest.writeString(this.title);
        }
    }

    public BubbleContext(@NotNull String query, @Nullable String str, @NotNull List<Source> sources, @Nullable String str2, @NotNull List<Action> actions) {
        Intrinsics.g(query, "query");
        Intrinsics.g(sources, "sources");
        Intrinsics.g(actions, "actions");
        this.query = query;
        this.responseText = str;
        this.sources = sources;
        this.openerMessage = str2;
        this.actions = actions;
    }

    public static /* synthetic */ BubbleContext copy$default(BubbleContext bubbleContext, String str, String str2, List list, String str3, List list2, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = bubbleContext.query;
        }
        if ((i5 & 2) != 0) {
            str2 = bubbleContext.responseText;
        }
        if ((i5 & 4) != 0) {
            list = bubbleContext.sources;
        }
        if ((i5 & 8) != 0) {
            str3 = bubbleContext.openerMessage;
        }
        if ((i5 & 16) != 0) {
            list2 = bubbleContext.actions;
        }
        List list3 = list2;
        List list4 = list;
        return bubbleContext.copy(str, str2, list4, str3, list3);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getQuery() {
        return this.query;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getResponseText() {
        return this.responseText;
    }

    @NotNull
    public final List<Source> component3() {
        return this.sources;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getOpenerMessage() {
        return this.openerMessage;
    }

    @NotNull
    public final List<Action> component5() {
        return this.actions;
    }

    @NotNull
    public final BubbleContext copy(@NotNull String query, @Nullable String responseText, @NotNull List<Source> sources, @Nullable String openerMessage, @NotNull List<Action> actions) {
        Intrinsics.g(query, "query");
        Intrinsics.g(sources, "sources");
        Intrinsics.g(actions, "actions");
        return new BubbleContext(query, responseText, sources, openerMessage, actions);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof BubbleContext)) {
            return false;
        }
        BubbleContext bubbleContext = (BubbleContext) other;
        return Intrinsics.b(this.query, bubbleContext.query) && Intrinsics.b(this.responseText, bubbleContext.responseText) && Intrinsics.b(this.sources, bubbleContext.sources) && Intrinsics.b(this.openerMessage, bubbleContext.openerMessage) && Intrinsics.b(this.actions, bubbleContext.actions);
    }

    @NotNull
    public final List<Action> getActions() {
        return this.actions;
    }

    @Nullable
    public final String getOpenerMessage() {
        return this.openerMessage;
    }

    @NotNull
    public final String getQuery() {
        return this.query;
    }

    @Nullable
    public final String getResponseText() {
        return this.responseText;
    }

    @NotNull
    public final List<Source> getSources() {
        return this.sources;
    }

    public int hashCode() {
        int iHashCode = this.query.hashCode() * 31;
        String str = this.responseText;
        int iC = u4.c((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.sources);
        String str2 = this.openerMessage;
        return this.actions.hashCode() + ((iC + (str2 != null ? str2.hashCode() : 0)) * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("BubbleContext(query=");
        sb2.append(this.query);
        sb2.append(", responseText=");
        sb2.append(this.responseText);
        sb2.append(", sources=");
        sb2.append(this.sources);
        sb2.append(", openerMessage=");
        sb2.append(this.openerMessage);
        sb2.append(", actions=");
        return c.e(sb2, this.actions, ')');
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(@NotNull Parcel dest, int flags) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.query);
        dest.writeString(this.responseText);
        Iterator itK = c.k(this.sources, dest);
        while (itK.hasNext()) {
            ((Source) itK.next()).writeToParcel(dest, flags);
        }
        dest.writeString(this.openerMessage);
        Iterator itK2 = c.k(this.actions, dest);
        while (itK2.hasNext()) {
            ((Action) itK2.next()).writeToParcel(dest, flags);
        }
    }

    @Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010$\n\u0002\b\f\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B1\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u0014\b\u0002\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00030\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000f\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\u0010\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00030\u0006HÆ\u0003J5\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\u0014\b\u0002\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00030\u0006HÆ\u0001J\u0006\u0010\u0012\u001a\u00020\u0013J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0017HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001J\u0016\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u0013R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u001d\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00030\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u001f"}, d2 = {"Lcom/instabridge/ai/chat/model/BubbleContext$Action;", "Landroid/os/Parcelable;", "label", b.f42142b, "toolName", "toolArgs", b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V", "getLabel", "()Ljava/lang/String;", "getToolName", "getToolArgs", "()Ljava/util/Map;", "component1", "component2", "component3", "copy", "describeContents", b.f42142b, "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", "toString", "writeToParcel", b.f42142b, "dest", "Landroid/os/Parcel;", "flags", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Action implements Parcelable {

        @NotNull
        private final String label;

        @NotNull
        private final Map<String, String> toolArgs;

        @Nullable
        private final String toolName;

        @NotNull
        public static final Parcelable.Creator<Action> CREATOR = new Creator();
        public static final int $stable = 8;

        @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
        public static final class Creator implements Parcelable.Creator<Action> {
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public final Action createFromParcel(Parcel parcel) {
                Intrinsics.g(parcel, "parcel");
                String string = parcel.readString();
                String string2 = parcel.readString();
                int i5 = parcel.readInt();
                LinkedHashMap linkedHashMap = new LinkedHashMap(i5);
                for (int i11 = 0; i11 != i5; i11++) {
                    linkedHashMap.put(parcel.readString(), parcel.readString());
                }
                return new Action(string, string2, linkedHashMap);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public final Action[] newArray(int i5) {
                return new Action[i5];
            }
        }

        public Action(@NotNull String label, @Nullable String str, @NotNull Map<String, String> toolArgs) {
            Intrinsics.g(label, "label");
            Intrinsics.g(toolArgs, "toolArgs");
            this.label = label;
            this.toolName = str;
            this.toolArgs = toolArgs;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ Action copy$default(Action action, String str, String str2, Map map, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = action.label;
            }
            if ((i5 & 2) != 0) {
                str2 = action.toolName;
            }
            if ((i5 & 4) != 0) {
                map = action.toolArgs;
            }
            return action.copy(str, str2, map);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getLabel() {
            return this.label;
        }

        @Nullable
        /* renamed from: component2, reason: from getter */
        public final String getToolName() {
            return this.toolName;
        }

        @NotNull
        public final Map<String, String> component3() {
            return this.toolArgs;
        }

        @NotNull
        public final Action copy(@NotNull String label, @Nullable String toolName, @NotNull Map<String, String> toolArgs) {
            Intrinsics.g(label, "label");
            Intrinsics.g(toolArgs, "toolArgs");
            return new Action(label, toolName, toolArgs);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Action)) {
                return false;
            }
            Action action = (Action) other;
            return Intrinsics.b(this.label, action.label) && Intrinsics.b(this.toolName, action.toolName) && Intrinsics.b(this.toolArgs, action.toolArgs);
        }

        @NotNull
        public final String getLabel() {
            return this.label;
        }

        @NotNull
        public final Map<String, String> getToolArgs() {
            return this.toolArgs;
        }

        @Nullable
        public final String getToolName() {
            return this.toolName;
        }

        public int hashCode() {
            int iHashCode = this.label.hashCode() * 31;
            String str = this.toolName;
            return this.toolArgs.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("Action(label=");
            sb2.append(this.label);
            sb2.append(", toolName=");
            sb2.append(this.toolName);
            sb2.append(", toolArgs=");
            return c9.l(sb2, this.toolArgs, ')');
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(@NotNull Parcel dest, int flags) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.label);
            dest.writeString(this.toolName);
            Map<String, String> map = this.toolArgs;
            dest.writeInt(map.size());
            for (Map.Entry<String, String> entry : map.entrySet()) {
                dest.writeString(entry.getKey());
                dest.writeString(entry.getValue());
            }
        }

        public /* synthetic */ Action(String str, String str2, Map map, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this(str, (i5 & 2) != 0 ? null : str2, (i5 & 4) != 0 ? h.f17594a : map);
        }
    }

    public BubbleContext(String str, String str2, List list, String str3, List list2, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, (i5 & 4) != 0 ? EmptyList.f71733a : list, (i5 & 8) != 0 ? null : str3, (i5 & 16) != 0 ? EmptyList.f71733a : list2);
    }
}
