package com.medium.android.graphql;

import com.medium.android.graphql.adapter.CreateQuoteMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.CreateQuoteMutation_VariablesAdapter;
import com.medium.android.graphql.fragment.HighlightDataWithGroup;
import com.medium.android.graphql.selections.CreateQuoteMutationSelections;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.graphql.type.StreamItemQuoteType;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
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
@Metadata(d1 = {"\u0000\\\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\u0000\n\u0002\b\u0011\b\u0086\b\u0018\u0000 =2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0003>?=B=\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b\u0012\u0006\u0010\n\u001a\u00020\b\u0012\f\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00030\u000b¢\u0006\u0004\b\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000f\u0010\u0010J\u000f\u0010\u0011\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0011\u0010\u0010J\u000f\u0010\u0012\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0012\u0010\u0010J'\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u0015\u0010\u001d\u001a\b\u0012\u0004\u0012\u00020\u00020\u001cH\u0016¢\u0006\u0004\b\u001d\u0010\u001eJ\u000f\u0010 \u001a\u00020\u001fH\u0016¢\u0006\u0004\b \u0010!J\u0010\u0010\"\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\"\u0010\u0010J\u0010\u0010#\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b#\u0010\u0010J\u0010\u0010$\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b$\u0010%J\u0010\u0010&\u001a\u00020\bHÆ\u0003¢\u0006\u0004\b&\u0010'J\u0010\u0010(\u001a\u00020\bHÆ\u0003¢\u0006\u0004\b(\u0010'J\u0016\u0010)\u001a\b\u0012\u0004\u0012\u00020\u00030\u000bHÆ\u0003¢\u0006\u0004\b)\u0010*JR\u0010+\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u00062\b\b\u0002\u0010\t\u001a\u00020\b2\b\b\u0002\u0010\n\u001a\u00020\b2\u000e\b\u0002\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00030\u000bHÆ\u0001¢\u0006\u0004\b+\u0010,J\u0010\u0010-\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b-\u0010\u0010J\u0010\u0010.\u001a\u00020\bHÖ\u0001¢\u0006\u0004\b.\u0010'J\u001a\u00101\u001a\u00020\u00172\b\u00100\u001a\u0004\u0018\u00010/HÖ\u0003¢\u0006\u0004\b1\u00102R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u00103\u001a\u0004\b4\u0010\u0010R\u0017\u0010\u0005\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0005\u00103\u001a\u0004\b5\u0010\u0010R\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u00106\u001a\u0004\b7\u0010%R\u0017\u0010\t\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u00108\u001a\u0004\b9\u0010'R\u0017\u0010\n\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\n\u00108\u001a\u0004\b:\u0010'R\u001d\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00030\u000b8\u0006¢\u0006\f\n\u0004\b\f\u0010;\u001a\u0004\b<\u0010*¨\u0006@"}, d2 = {"Lcom/medium/android/graphql/CreateQuoteMutation;", "Lv78;", "Lcom/medium/android/graphql/CreateQuoteMutation$Data;", "", "targetPostId", "targetPostVersionId", "Lcom/medium/android/graphql/type/StreamItemQuoteType;", "quoteType", "", "startOffset", "endOffset", "", "targetParagraphNames", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/type/StreamItemQuoteType;IILjava/util/List;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "component3", "()Lcom/medium/android/graphql/type/StreamItemQuoteType;", "component4", "()I", "component5", "component6", "()Ljava/util/List;", "copy", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/type/StreamItemQuoteType;IILjava/util/List;)Lcom/medium/android/graphql/CreateQuoteMutation;", "toString", "hashCode", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getTargetPostId", "getTargetPostVersionId", "Lcom/medium/android/graphql/type/StreamItemQuoteType;", "getQuoteType", "I", "getStartOffset", "getEndOffset", "Ljava/util/List;", "getTargetParagraphNames", "Companion", "Data", "CreateQuote", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CreateQuoteMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "2e264805d2b31fd665ff3dcbf6e507a44a975ff3438c2e31311d654d00f36e30";
    public static final String OPERATION_NAME = "CreateQuoteMutation";
    private final int endOffset;
    private final StreamItemQuoteType quoteType;
    private final int startOffset;
    private final List<String> targetParagraphNames;
    private final String targetPostId;
    private final String targetPostVersionId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/CreateQuoteMutation$CreateQuote;", "", "__typename", "", "id", "highlightDataWithGroup", "Lcom/medium/android/graphql/fragment/HighlightDataWithGroup;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/HighlightDataWithGroup;)V", "get__typename", "()Ljava/lang/String;", "getId", "getHighlightDataWithGroup", "()Lcom/medium/android/graphql/fragment/HighlightDataWithGroup;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class CreateQuote {
        private final String __typename;
        private final HighlightDataWithGroup highlightDataWithGroup;
        private final String id;

        public CreateQuote(String str, String str2, HighlightDataWithGroup highlightDataWithGroup) {
            str.getClass();
            str2.getClass();
            highlightDataWithGroup.getClass();
            this.__typename = str;
            this.id = str2;
            this.highlightDataWithGroup = highlightDataWithGroup;
        }

        public static /* synthetic */ CreateQuote copy$default(CreateQuote createQuote, String str, String str2, HighlightDataWithGroup highlightDataWithGroup, int i, Object obj) {
            if ((i & 1) != 0) {
                str = createQuote.__typename;
            }
            if ((i & 2) != 0) {
                str2 = createQuote.id;
            }
            if ((i & 4) != 0) {
                highlightDataWithGroup = createQuote.highlightDataWithGroup;
            }
            return createQuote.copy(str, str2, highlightDataWithGroup);
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
        public final HighlightDataWithGroup getHighlightDataWithGroup() {
            return this.highlightDataWithGroup;
        }

        public final CreateQuote copy(String __typename, String id, HighlightDataWithGroup highlightDataWithGroup) {
            __typename.getClass();
            id.getClass();
            highlightDataWithGroup.getClass();
            return new CreateQuote(__typename, id, highlightDataWithGroup);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof CreateQuote)) {
                return false;
            }
            CreateQuote createQuote = (CreateQuote) other;
            return g76.L(this.__typename, createQuote.__typename) && g76.L(this.id, createQuote.id) && g76.L(this.highlightDataWithGroup, createQuote.highlightDataWithGroup);
        }

        public final HighlightDataWithGroup getHighlightDataWithGroup() {
            return this.highlightDataWithGroup;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.highlightDataWithGroup.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            HighlightDataWithGroup highlightDataWithGroup = this.highlightDataWithGroup;
            StringBuilder sbU = y30.u("CreateQuote(__typename=", str, ", id=", str2, ", highlightDataWithGroup=");
            sbU.append(highlightDataWithGroup);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/CreateQuoteMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/CreateQuoteMutation$CreateQuote;", "createQuote", "<init>", "(Lcom/medium/android/graphql/CreateQuoteMutation$CreateQuote;)V", "component1", "()Lcom/medium/android/graphql/CreateQuoteMutation$CreateQuote;", "copy", "(Lcom/medium/android/graphql/CreateQuoteMutation$CreateQuote;)Lcom/medium/android/graphql/CreateQuoteMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/CreateQuoteMutation$CreateQuote;", "getCreateQuote", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final CreateQuote createQuote;

        public Data(CreateQuote createQuote) {
            this.createQuote = createQuote;
        }

        public static Data copy$default(Data data, CreateQuote createQuote, int i, Object obj) {
            if ((i & 1) != 0) {
                createQuote = data.createQuote;
            }
            data.getClass();
            return new Data(createQuote);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final CreateQuote getCreateQuote() {
            return this.createQuote;
        }

        public final Data copy(CreateQuote createQuote) {
            return new Data(createQuote);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.createQuote, ((Data) other).createQuote);
        }

        public final CreateQuote getCreateQuote() {
            return this.createQuote;
        }

        public final int hashCode() {
            CreateQuote createQuote = this.createQuote;
            if (createQuote == null) {
                return 0;
            }
            return createQuote.hashCode();
        }

        public final String toString() {
            return "Data(createQuote=" + this.createQuote + ")";
        }
    }

    public CreateQuoteMutation(String str, String str2, StreamItemQuoteType streamItemQuoteType, int i, int i2, List<String> list) {
        str.getClass();
        str2.getClass();
        streamItemQuoteType.getClass();
        list.getClass();
        this.targetPostId = str;
        this.targetPostVersionId = str2;
        this.quoteType = streamItemQuoteType;
        this.startOffset = i;
        this.endOffset = i2;
        this.targetParagraphNames = list;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ CreateQuoteMutation copy$default(CreateQuoteMutation createQuoteMutation, String str, String str2, StreamItemQuoteType streamItemQuoteType, int i, int i2, List list, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            str = createQuoteMutation.targetPostId;
        }
        if ((i3 & 2) != 0) {
            str2 = createQuoteMutation.targetPostVersionId;
        }
        if ((i3 & 4) != 0) {
            streamItemQuoteType = createQuoteMutation.quoteType;
        }
        if ((i3 & 8) != 0) {
            i = createQuoteMutation.startOffset;
        }
        if ((i3 & 16) != 0) {
            i2 = createQuoteMutation.endOffset;
        }
        if ((i3 & 32) != 0) {
            list = createQuoteMutation.targetParagraphNames;
        }
        int i4 = i2;
        List list2 = list;
        return createQuoteMutation.copy(str, str2, streamItemQuoteType, i, i4, list2);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(CreateQuoteMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getTargetPostId() {
        return this.targetPostId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getTargetPostVersionId() {
        return this.targetPostVersionId;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final StreamItemQuoteType getQuoteType() {
        return this.quoteType;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final int getStartOffset() {
        return this.startOffset;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final int getEndOffset() {
        return this.endOffset;
    }

    public final List<String> component6() {
        return this.targetParagraphNames;
    }

    public final CreateQuoteMutation copy(String targetPostId, String targetPostVersionId, StreamItemQuoteType quoteType, int startOffset, int endOffset, List<String> targetParagraphNames) {
        targetPostId.getClass();
        targetPostVersionId.getClass();
        quoteType.getClass();
        targetParagraphNames.getClass();
        return new CreateQuoteMutation(targetPostId, targetPostVersionId, quoteType, startOffset, endOffset, targetParagraphNames);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation CreateQuoteMutation($targetPostId: ID!, $targetPostVersionId: ID!, $quoteType: StreamItemQuoteType!, $startOffset: Int!, $endOffset: Int!, $targetParagraphNames: [ID!]!) { createQuote(targetPostId: $targetPostId, targetPostVersionId: $targetPostVersionId, quoteType: $quoteType, startOffset: $startOffset, endOffset: $endOffset, targetParagraphNames: $targetParagraphNames) { __typename ...HighlightDataWithGroup id } }  fragment MarkupData on Markup { __typename name type start end href title rel type anchorType userId creatorIds }  fragment HighlightData on Quote { __typename id userId startOffset endOffset paragraphs { __typename id name text markups { __typename ...MarkupData } } user { __typename id name } post { __typename id title } }  fragment HighlightGroupData on HighlightGroup { __typename id startOffset endOffset responseCount paragraph { __typename name text markups { __typename ...MarkupData } } }  fragment HighlightDataWithGroup on Quote { __typename ...HighlightData highlightGroup { __typename ...HighlightGroupData } id }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CreateQuoteMutation)) {
            return false;
        }
        CreateQuoteMutation createQuoteMutation = (CreateQuoteMutation) other;
        return g76.L(this.targetPostId, createQuoteMutation.targetPostId) && g76.L(this.targetPostVersionId, createQuoteMutation.targetPostVersionId) && this.quoteType == createQuoteMutation.quoteType && this.startOffset == createQuoteMutation.startOffset && this.endOffset == createQuoteMutation.endOffset && g76.L(this.targetParagraphNames, createQuoteMutation.targetParagraphNames);
    }

    public final int getEndOffset() {
        return this.endOffset;
    }

    public final StreamItemQuoteType getQuoteType() {
        return this.quoteType;
    }

    public final int getStartOffset() {
        return this.startOffset;
    }

    public final List<String> getTargetParagraphNames() {
        return this.targetParagraphNames;
    }

    public final String getTargetPostId() {
        return this.targetPostId;
    }

    public final String getTargetPostVersionId() {
        return this.targetPostVersionId;
    }

    public final int hashCode() {
        return this.targetParagraphNames.hashCode() + ((((((this.quoteType.hashCode() + wgd.o(this.targetPostId.hashCode() * 31, 31, this.targetPostVersionId)) * 31) + this.startOffset) * 31) + this.endOffset) * 31);
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
        List<sx1> list = CreateQuoteMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        CreateQuoteMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        String str = this.targetPostId;
        String str2 = this.targetPostVersionId;
        StreamItemQuoteType streamItemQuoteType = this.quoteType;
        int i = this.startOffset;
        int i2 = this.endOffset;
        List<String> list = this.targetParagraphNames;
        StringBuilder sbU = y30.u("CreateQuoteMutation(targetPostId=", str, ", targetPostVersionId=", str2, ", quoteType=");
        sbU.append(streamItemQuoteType);
        sbU.append(", startOffset=");
        sbU.append(i);
        sbU.append(", endOffset=");
        sbU.append(i2);
        sbU.append(", targetParagraphNames=");
        sbU.append(list);
        sbU.append(")");
        return sbU.toString();
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/CreateQuoteMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation CreateQuoteMutation($targetPostId: ID!, $targetPostVersionId: ID!, $quoteType: StreamItemQuoteType!, $startOffset: Int!, $endOffset: Int!, $targetParagraphNames: [ID!]!) { createQuote(targetPostId: $targetPostId, targetPostVersionId: $targetPostVersionId, quoteType: $quoteType, startOffset: $startOffset, endOffset: $endOffset, targetParagraphNames: $targetParagraphNames) { __typename ...HighlightDataWithGroup id } }  fragment MarkupData on Markup { __typename name type start end href title rel type anchorType userId creatorIds }  fragment HighlightData on Quote { __typename id userId startOffset endOffset paragraphs { __typename id name text markups { __typename ...MarkupData } } user { __typename id name } post { __typename id title } }  fragment HighlightGroupData on HighlightGroup { __typename id startOffset endOffset responseCount paragraph { __typename name text markups { __typename ...MarkupData } } }  fragment HighlightDataWithGroup on Quote { __typename ...HighlightData highlightGroup { __typename ...HighlightGroupData } id }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
