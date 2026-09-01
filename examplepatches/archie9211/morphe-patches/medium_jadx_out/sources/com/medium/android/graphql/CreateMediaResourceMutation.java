package com.medium.android.graphql;

import com.medium.android.graphql.adapter.CreateMediaResourceMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.CreateMediaResourceMutation_VariablesAdapter;
import com.medium.android.graphql.selections.CreateMediaResourceMutationSelections;
import com.medium.android.graphql.type.Mutation;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ev6;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
import defpackage.ka1;
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.u78;
import defpackage.v78;
import defpackage.wgd;
import defpackage.y30;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\r\b\u0086\b\u0018\u0000 '2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0007()*+,-'B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\bJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\bJ'\u0010\u0012\u001a\u00020\u00112\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u0015\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u0010\u0010\u001a\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001a\u0010\bJ\u001a\u0010\u001b\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u001d\u0010\bJ\u0010\u0010\u001f\u001a\u00020\u001eHÖ\u0001¢\u0006\u0004\b\u001f\u0010 J\u001a\u0010#\u001a\u00020\u000f2\b\u0010\"\u001a\u0004\u0018\u00010!HÖ\u0003¢\u0006\u0004\b#\u0010$R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010%\u001a\u0004\b&\u0010\b¨\u0006."}, d2 = {"Lcom/medium/android/graphql/CreateMediaResourceMutation;", "Lv78;", "Lcom/medium/android/graphql/CreateMediaResourceMutation$Data;", "", "url", "<init>", "(Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "copy", "(Ljava/lang/String;)Lcom/medium/android/graphql/CreateMediaResourceMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getUrl", "Companion", "Data", "CreateMediaResource", "OnMediaResource", "MediumPost", "PreviewContent", "MediumCatalog", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CreateMediaResourceMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "f12c277346930722ebc28521581635d5ec5d7ef868b9c58493ac46d90c6b26c7";
    public static final String OPERATION_NAME = "CreateMediaResourceMutation";
    private final String url;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/CreateMediaResourceMutation$CreateMediaResource;", "", "__typename", "", "id", "onMediaResource", "Lcom/medium/android/graphql/CreateMediaResourceMutation$OnMediaResource;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/CreateMediaResourceMutation$OnMediaResource;)V", "get__typename", "()Ljava/lang/String;", "getId", "getOnMediaResource", "()Lcom/medium/android/graphql/CreateMediaResourceMutation$OnMediaResource;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class CreateMediaResource {
        private final String __typename;
        private final String id;
        private final OnMediaResource onMediaResource;

        public CreateMediaResource(String str, String str2, OnMediaResource onMediaResource) {
            str.getClass();
            str2.getClass();
            onMediaResource.getClass();
            this.__typename = str;
            this.id = str2;
            this.onMediaResource = onMediaResource;
        }

        public static /* synthetic */ CreateMediaResource copy$default(CreateMediaResource createMediaResource, String str, String str2, OnMediaResource onMediaResource, int i, Object obj) {
            if ((i & 1) != 0) {
                str = createMediaResource.__typename;
            }
            if ((i & 2) != 0) {
                str2 = createMediaResource.id;
            }
            if ((i & 4) != 0) {
                onMediaResource = createMediaResource.onMediaResource;
            }
            return createMediaResource.copy(str, str2, onMediaResource);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnMediaResource getOnMediaResource() {
            return this.onMediaResource;
        }

        public final CreateMediaResource copy(String __typename, String id, OnMediaResource onMediaResource) {
            __typename.getClass();
            id.getClass();
            onMediaResource.getClass();
            return new CreateMediaResource(__typename, id, onMediaResource);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof CreateMediaResource)) {
                return false;
            }
            CreateMediaResource createMediaResource = (CreateMediaResource) other;
            return g76.L(this.__typename, createMediaResource.__typename) && g76.L(this.id, createMediaResource.id) && g76.L(this.onMediaResource, createMediaResource.onMediaResource);
        }

        public final String getId() {
            return this.id;
        }

        public final OnMediaResource getOnMediaResource() {
            return this.onMediaResource;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.onMediaResource.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            OnMediaResource onMediaResource = this.onMediaResource;
            StringBuilder sbU = y30.u("CreateMediaResource(__typename=", str, ", id=", str2, ", onMediaResource=");
            sbU.append(onMediaResource);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/CreateMediaResourceMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/CreateMediaResourceMutation$CreateMediaResource;", "createMediaResource", "<init>", "(Lcom/medium/android/graphql/CreateMediaResourceMutation$CreateMediaResource;)V", "component1", "()Lcom/medium/android/graphql/CreateMediaResourceMutation$CreateMediaResource;", "copy", "(Lcom/medium/android/graphql/CreateMediaResourceMutation$CreateMediaResource;)Lcom/medium/android/graphql/CreateMediaResourceMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/CreateMediaResourceMutation$CreateMediaResource;", "getCreateMediaResource", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final CreateMediaResource createMediaResource;

        public Data(CreateMediaResource createMediaResource) {
            this.createMediaResource = createMediaResource;
        }

        public static Data copy$default(Data data, CreateMediaResource createMediaResource, int i, Object obj) {
            if ((i & 1) != 0) {
                createMediaResource = data.createMediaResource;
            }
            data.getClass();
            return new Data(createMediaResource);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final CreateMediaResource getCreateMediaResource() {
            return this.createMediaResource;
        }

        public final Data copy(CreateMediaResource createMediaResource) {
            return new Data(createMediaResource);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.createMediaResource, ((Data) other).createMediaResource);
        }

        public final CreateMediaResource getCreateMediaResource() {
            return this.createMediaResource;
        }

        public final int hashCode() {
            CreateMediaResource createMediaResource = this.createMediaResource;
            if (createMediaResource == null) {
                return 0;
            }
            return createMediaResource.hashCode();
        }

        public final String toString() {
            return "Data(createMediaResource=" + this.createMediaResource + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000e\u001a\u0004\u0018\u00010\u0003HÆ\u0003J)\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/CreateMediaResourceMutation$MediumCatalog;", "", "__typename", "", "id", "description", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "getDescription", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class MediumCatalog {
        private final String __typename;
        private final String description;
        private final String id;

        public MediumCatalog(String str, String str2, String str3) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.description = str3;
        }

        public static /* synthetic */ MediumCatalog copy$default(MediumCatalog mediumCatalog, String str, String str2, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = mediumCatalog.__typename;
            }
            if ((i & 2) != 0) {
                str2 = mediumCatalog.id;
            }
            if ((i & 4) != 0) {
                str3 = mediumCatalog.description;
            }
            return mediumCatalog.copy(str, str2, str3);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getDescription() {
            return this.description;
        }

        public final MediumCatalog copy(String __typename, String id, String description) {
            __typename.getClass();
            id.getClass();
            return new MediumCatalog(__typename, id, description);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof MediumCatalog)) {
                return false;
            }
            MediumCatalog mediumCatalog = (MediumCatalog) other;
            return g76.L(this.__typename, mediumCatalog.__typename) && g76.L(this.id, mediumCatalog.id) && g76.L(this.description, mediumCatalog.description);
        }

        public final String getDescription() {
            return this.description;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.description;
            return iO + (str == null ? 0 : str.hashCode());
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return ka1.v(y30.u("MediumCatalog(__typename=", str, ", id=", str2, ", description="), this.description, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0010\u001a\u0004\u0018\u00010\u0006HÆ\u0003J)\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/CreateMediaResourceMutation$MediumPost;", "", "__typename", "", "id", "previewContent", "Lcom/medium/android/graphql/CreateMediaResourceMutation$PreviewContent;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/CreateMediaResourceMutation$PreviewContent;)V", "get__typename", "()Ljava/lang/String;", "getId", "getPreviewContent", "()Lcom/medium/android/graphql/CreateMediaResourceMutation$PreviewContent;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class MediumPost {
        private final String __typename;
        private final String id;
        private final PreviewContent previewContent;

        public MediumPost(String str, String str2, PreviewContent previewContent) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.previewContent = previewContent;
        }

        public static /* synthetic */ MediumPost copy$default(MediumPost mediumPost, String str, String str2, PreviewContent previewContent, int i, Object obj) {
            if ((i & 1) != 0) {
                str = mediumPost.__typename;
            }
            if ((i & 2) != 0) {
                str2 = mediumPost.id;
            }
            if ((i & 4) != 0) {
                previewContent = mediumPost.previewContent;
            }
            return mediumPost.copy(str, str2, previewContent);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final PreviewContent getPreviewContent() {
            return this.previewContent;
        }

        public final MediumPost copy(String __typename, String id, PreviewContent previewContent) {
            __typename.getClass();
            id.getClass();
            return new MediumPost(__typename, id, previewContent);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof MediumPost)) {
                return false;
            }
            MediumPost mediumPost = (MediumPost) other;
            return g76.L(this.__typename, mediumPost.__typename) && g76.L(this.id, mediumPost.id) && g76.L(this.previewContent, mediumPost.previewContent);
        }

        public final String getId() {
            return this.id;
        }

        public final PreviewContent getPreviewContent() {
            return this.previewContent;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            PreviewContent previewContent = this.previewContent;
            return iO + (previewContent == null ? 0 : previewContent.hashCode());
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            PreviewContent previewContent = this.previewContent;
            StringBuilder sbU = y30.u("MediumPost(__typename=", str, ", id=", str2, ", previewContent=");
            sbU.append(previewContent);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u001e\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001Bi\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\f\u001a\u0004\u0018\u00010\r\u0012\b\u0010\u000e\u001a\u0004\u0018\u00010\u000f¢\u0006\u0004\b\u0010\u0010\u0011J\t\u0010!\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\"\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0010\u0010#\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0002\u0010\u0016J\u0010\u0010$\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0002\u0010\u0016J\u000b\u0010%\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010&\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010'\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010(\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010)\u001a\u0004\u0018\u00010\rHÆ\u0003J\u000b\u0010*\u001a\u0004\u0018\u00010\u000fHÆ\u0003J\u0084\u0001\u0010+\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u000fHÆ\u0001¢\u0006\u0002\u0010,J\u0013\u0010-\u001a\u00020.2\b\u0010/\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u00100\u001a\u00020\u0006HÖ\u0001J\t\u00101\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0013R\u0015\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\n\n\u0002\u0010\u0017\u001a\u0004\b\u0015\u0010\u0016R\u0015\u0010\u0007\u001a\u0004\u0018\u00010\u0006¢\u0006\n\n\u0002\u0010\u0017\u001a\u0004\b\u0018\u0010\u0016R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\u0013R\u0013\u0010\t\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u0013R\u0013\u0010\n\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\u0013R\u0013\u0010\u000b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u0013R\u0013\u0010\f\u001a\u0004\u0018\u00010\r¢\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\u001eR\u0013\u0010\u000e\u001a\u0004\u0018\u00010\u000f¢\u0006\b\n\u0000\u001a\u0004\b\u001f\u0010 ¨\u00062"}, d2 = {"Lcom/medium/android/graphql/CreateMediaResourceMutation$OnMediaResource;", "", "id", "", "iframeSrc", "iframeWidth", "", "iframeHeight", "thumbnailUrl", "thumbnailImageId", "title", "description", "mediumPost", "Lcom/medium/android/graphql/CreateMediaResourceMutation$MediumPost;", "mediumCatalog", "Lcom/medium/android/graphql/CreateMediaResourceMutation$MediumCatalog;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/CreateMediaResourceMutation$MediumPost;Lcom/medium/android/graphql/CreateMediaResourceMutation$MediumCatalog;)V", "getId", "()Ljava/lang/String;", "getIframeSrc", "getIframeWidth", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "getIframeHeight", "getThumbnailUrl", "getThumbnailImageId", "getTitle", "getDescription", "getMediumPost", "()Lcom/medium/android/graphql/CreateMediaResourceMutation$MediumPost;", "getMediumCatalog", "()Lcom/medium/android/graphql/CreateMediaResourceMutation$MediumCatalog;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "component10", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/CreateMediaResourceMutation$MediumPost;Lcom/medium/android/graphql/CreateMediaResourceMutation$MediumCatalog;)Lcom/medium/android/graphql/CreateMediaResourceMutation$OnMediaResource;", "equals", "", "other", "hashCode", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnMediaResource {
        private final String description;
        private final String id;
        private final Integer iframeHeight;
        private final String iframeSrc;
        private final Integer iframeWidth;
        private final MediumCatalog mediumCatalog;
        private final MediumPost mediumPost;
        private final String thumbnailImageId;
        private final String thumbnailUrl;
        private final String title;

        public OnMediaResource(String str, String str2, Integer num, Integer num2, String str3, String str4, String str5, String str6, MediumPost mediumPost, MediumCatalog mediumCatalog) {
            str.getClass();
            this.id = str;
            this.iframeSrc = str2;
            this.iframeWidth = num;
            this.iframeHeight = num2;
            this.thumbnailUrl = str3;
            this.thumbnailImageId = str4;
            this.title = str5;
            this.description = str6;
            this.mediumPost = mediumPost;
            this.mediumCatalog = mediumCatalog;
        }

        public static /* synthetic */ OnMediaResource copy$default(OnMediaResource onMediaResource, String str, String str2, Integer num, Integer num2, String str3, String str4, String str5, String str6, MediumPost mediumPost, MediumCatalog mediumCatalog, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onMediaResource.id;
            }
            if ((i & 2) != 0) {
                str2 = onMediaResource.iframeSrc;
            }
            if ((i & 4) != 0) {
                num = onMediaResource.iframeWidth;
            }
            if ((i & 8) != 0) {
                num2 = onMediaResource.iframeHeight;
            }
            if ((i & 16) != 0) {
                str3 = onMediaResource.thumbnailUrl;
            }
            if ((i & 32) != 0) {
                str4 = onMediaResource.thumbnailImageId;
            }
            if ((i & 64) != 0) {
                str5 = onMediaResource.title;
            }
            if ((i & 128) != 0) {
                str6 = onMediaResource.description;
            }
            if ((i & 256) != 0) {
                mediumPost = onMediaResource.mediumPost;
            }
            if ((i & 512) != 0) {
                mediumCatalog = onMediaResource.mediumCatalog;
            }
            MediumPost mediumPost2 = mediumPost;
            MediumCatalog mediumCatalog2 = mediumCatalog;
            String str7 = str5;
            String str8 = str6;
            String str9 = str3;
            String str10 = str4;
            return onMediaResource.copy(str, str2, num, num2, str9, str10, str7, str8, mediumPost2, mediumCatalog2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component10, reason: from getter */
        public final MediumCatalog getMediumCatalog() {
            return this.mediumCatalog;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getIframeSrc() {
            return this.iframeSrc;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Integer getIframeWidth() {
            return this.iframeWidth;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final Integer getIframeHeight() {
            return this.iframeHeight;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final String getThumbnailUrl() {
            return this.thumbnailUrl;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final String getThumbnailImageId() {
            return this.thumbnailImageId;
        }

        /* JADX INFO: renamed from: component7, reason: from getter */
        public final String getTitle() {
            return this.title;
        }

        /* JADX INFO: renamed from: component8, reason: from getter */
        public final String getDescription() {
            return this.description;
        }

        /* JADX INFO: renamed from: component9, reason: from getter */
        public final MediumPost getMediumPost() {
            return this.mediumPost;
        }

        public final OnMediaResource copy(String id, String iframeSrc, Integer iframeWidth, Integer iframeHeight, String thumbnailUrl, String thumbnailImageId, String title, String description, MediumPost mediumPost, MediumCatalog mediumCatalog) {
            id.getClass();
            return new OnMediaResource(id, iframeSrc, iframeWidth, iframeHeight, thumbnailUrl, thumbnailImageId, title, description, mediumPost, mediumCatalog);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnMediaResource)) {
                return false;
            }
            OnMediaResource onMediaResource = (OnMediaResource) other;
            return g76.L(this.id, onMediaResource.id) && g76.L(this.iframeSrc, onMediaResource.iframeSrc) && g76.L(this.iframeWidth, onMediaResource.iframeWidth) && g76.L(this.iframeHeight, onMediaResource.iframeHeight) && g76.L(this.thumbnailUrl, onMediaResource.thumbnailUrl) && g76.L(this.thumbnailImageId, onMediaResource.thumbnailImageId) && g76.L(this.title, onMediaResource.title) && g76.L(this.description, onMediaResource.description) && g76.L(this.mediumPost, onMediaResource.mediumPost) && g76.L(this.mediumCatalog, onMediaResource.mediumCatalog);
        }

        public final String getDescription() {
            return this.description;
        }

        public final String getId() {
            return this.id;
        }

        public final Integer getIframeHeight() {
            return this.iframeHeight;
        }

        public final String getIframeSrc() {
            return this.iframeSrc;
        }

        public final Integer getIframeWidth() {
            return this.iframeWidth;
        }

        public final MediumCatalog getMediumCatalog() {
            return this.mediumCatalog;
        }

        public final MediumPost getMediumPost() {
            return this.mediumPost;
        }

        public final String getThumbnailImageId() {
            return this.thumbnailImageId;
        }

        public final String getThumbnailUrl() {
            return this.thumbnailUrl;
        }

        public final String getTitle() {
            return this.title;
        }

        public final int hashCode() {
            int iHashCode = this.id.hashCode() * 31;
            String str = this.iframeSrc;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            Integer num = this.iframeWidth;
            int iHashCode3 = (iHashCode2 + (num == null ? 0 : num.hashCode())) * 31;
            Integer num2 = this.iframeHeight;
            int iHashCode4 = (iHashCode3 + (num2 == null ? 0 : num2.hashCode())) * 31;
            String str2 = this.thumbnailUrl;
            int iHashCode5 = (iHashCode4 + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.thumbnailImageId;
            int iHashCode6 = (iHashCode5 + (str3 == null ? 0 : str3.hashCode())) * 31;
            String str4 = this.title;
            int iHashCode7 = (iHashCode6 + (str4 == null ? 0 : str4.hashCode())) * 31;
            String str5 = this.description;
            int iHashCode8 = (iHashCode7 + (str5 == null ? 0 : str5.hashCode())) * 31;
            MediumPost mediumPost = this.mediumPost;
            int iHashCode9 = (iHashCode8 + (mediumPost == null ? 0 : mediumPost.hashCode())) * 31;
            MediumCatalog mediumCatalog = this.mediumCatalog;
            return iHashCode9 + (mediumCatalog != null ? mediumCatalog.hashCode() : 0);
        }

        public final String toString() {
            String str = this.id;
            String str2 = this.iframeSrc;
            Integer num = this.iframeWidth;
            Integer num2 = this.iframeHeight;
            String str3 = this.thumbnailUrl;
            String str4 = this.thumbnailImageId;
            String str5 = this.title;
            String str6 = this.description;
            MediumPost mediumPost = this.mediumPost;
            MediumCatalog mediumCatalog = this.mediumCatalog;
            StringBuilder sbU = y30.u("OnMediaResource(id=", str, ", iframeSrc=", str2, ", iframeWidth=");
            sbU.append(num);
            sbU.append(", iframeHeight=");
            sbU.append(num2);
            sbU.append(", thumbnailUrl=");
            ka1.C(sbU, str3, ", thumbnailImageId=", str4, ", title=");
            ka1.C(sbU, str5, ", description=", str6, ", mediumPost=");
            sbU.append(mediumPost);
            sbU.append(", mediumCatalog=");
            sbU.append(mediumCatalog);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u001f\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/CreateMediaResourceMutation$PreviewContent;", "", "__typename", "", "subtitle", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getSubtitle", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PreviewContent {
        private final String __typename;
        private final String subtitle;

        public PreviewContent(String str, String str2) {
            str.getClass();
            this.__typename = str;
            this.subtitle = str2;
        }

        public static /* synthetic */ PreviewContent copy$default(PreviewContent previewContent, String str, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = previewContent.__typename;
            }
            if ((i & 2) != 0) {
                str2 = previewContent.subtitle;
            }
            return previewContent.copy(str, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getSubtitle() {
            return this.subtitle;
        }

        public final PreviewContent copy(String __typename, String subtitle) {
            __typename.getClass();
            return new PreviewContent(__typename, subtitle);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PreviewContent)) {
                return false;
            }
            PreviewContent previewContent = (PreviewContent) other;
            return g76.L(this.__typename, previewContent.__typename) && g76.L(this.subtitle, previewContent.subtitle);
        }

        public final String getSubtitle() {
            return this.subtitle;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            String str = this.subtitle;
            return iHashCode + (str == null ? 0 : str.hashCode());
        }

        public final String toString() {
            return ev6.y("PreviewContent(__typename=", this.__typename, ", subtitle=", this.subtitle, ")");
        }
    }

    public CreateMediaResourceMutation(String str) {
        str.getClass();
        this.url = str;
    }

    public static /* synthetic */ CreateMediaResourceMutation copy$default(CreateMediaResourceMutation createMediaResourceMutation, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            str = createMediaResourceMutation.url;
        }
        return createMediaResourceMutation.copy(str);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(CreateMediaResourceMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getUrl() {
        return this.url;
    }

    public final CreateMediaResourceMutation copy(String url) {
        url.getClass();
        return new CreateMediaResourceMutation(url);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation CreateMediaResourceMutation($url: String!) { createMediaResource(url: $url) { __typename ... on MediaResource { id iframeSrc iframeWidth iframeHeight thumbnailUrl thumbnailImageId title description mediumPost { __typename id previewContent { __typename subtitle } } mediumCatalog { __typename id description } } id } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof CreateMediaResourceMutation) && g76.L(this.url, ((CreateMediaResourceMutation) other).url);
    }

    public final String getUrl() {
        return this.url;
    }

    public final int hashCode() {
        return this.url.hashCode();
    }

    @Override // defpackage.hv8
    public final String id() {
        return OPERATION_ID;
    }

    @Override // defpackage.hv8
    public final String name() {
        return OPERATION_NAME;
    }

    @Override // defpackage.m44
    public final nx1 rootField() {
        sm8 sm8VarL = lv8.l(Mutation.INSTANCE);
        List<sx1> list = CreateMediaResourceMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        CreateMediaResourceMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return ev6.x("CreateMediaResourceMutation(url=", this.url, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/CreateMediaResourceMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation CreateMediaResourceMutation($url: String!) { createMediaResource(url: $url) { __typename ... on MediaResource { id iframeSrc iframeWidth iframeHeight thumbnailUrl thumbnailImageId title description mediumPost { __typename id previewContent { __typename subtitle } } mediumCatalog { __typename id description } } id } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
