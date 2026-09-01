package com.medium.android.graphql.fragment;

import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import com.medium.android.graphql.type.LayoutType;
import com.medium.android.graphql.type.ParagraphType;
import com.medium.android.graphql.type.SyntaxHighlightMode;
import defpackage.g15;
import defpackage.g76;
import defpackage.ka1;
import defpackage.wgd;
import defpackage.y30;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@kotlin.Metadata(d1 = {"\u0000\\\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u001e\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\"\b\u0086\b\u0018\u00002\u00020\u0001:\u0006WXYZ[\\B\u0093\u0001\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\t\u001a\u0004\u0018\u00010\b\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\r0\f\u0012\b\u0010\u0010\u001a\u0004\u0018\u00010\u000f\u0012\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011\u0012\b\u0010\u0014\u001a\u0004\u0018\u00010\u0013\u0012\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015\u0012\b\u0010\u0018\u001a\u0004\u0018\u00010\u0017\u0012\b\u0010\u001a\u001a\u0004\u0018\u00010\u0019¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u001f\u0010\u001eJ\u0012\u0010 \u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b \u0010\u001eJ\u0012\u0010!\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b!\u0010\u001eJ\u0012\u0010\"\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\"\u0010\u001eJ\u0012\u0010#\u001a\u0004\u0018\u00010\bHÆ\u0003¢\u0006\u0004\b#\u0010$J\u0012\u0010%\u001a\u0004\u0018\u00010\nHÆ\u0003¢\u0006\u0004\b%\u0010&J\u0016\u0010'\u001a\b\u0012\u0004\u0012\u00020\r0\fHÆ\u0003¢\u0006\u0004\b'\u0010(J\u0012\u0010)\u001a\u0004\u0018\u00010\u000fHÆ\u0003¢\u0006\u0004\b)\u0010*J\u0012\u0010+\u001a\u0004\u0018\u00010\u0011HÆ\u0003¢\u0006\u0004\b+\u0010,J\u0012\u0010-\u001a\u0004\u0018\u00010\u0013HÆ\u0003¢\u0006\u0004\b-\u0010.J\u0012\u0010/\u001a\u0004\u0018\u00010\u0015HÆ\u0003¢\u0006\u0004\b/\u00100J\u0012\u00101\u001a\u0004\u0018\u00010\u0017HÆ\u0003¢\u0006\u0004\b1\u00102J\u0012\u00103\u001a\u0004\u0018\u00010\u0019HÆ\u0003¢\u0006\u0004\b3\u00104J¸\u0001\u00105\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\u000e\b\u0002\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\r0\f2\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u000f2\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u00152\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u00172\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u0019HÆ\u0001¢\u0006\u0004\b5\u00106J\u0010\u00107\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b7\u0010\u001eJ\u0010\u00109\u001a\u000208HÖ\u0001¢\u0006\u0004\b9\u0010:J\u001a\u0010=\u001a\u00020\u00152\b\u0010<\u001a\u0004\u0018\u00010;HÖ\u0003¢\u0006\u0004\b=\u0010>R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010?\u001a\u0004\b@\u0010\u001eR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010?\u001a\u0004\bA\u0010\u001eR\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010?\u001a\u0004\bB\u0010\u001eR\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010?\u001a\u0004\bC\u0010\u001eR\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0007\u0010?\u001a\u0004\bD\u0010\u001eR\u0019\u0010\t\u001a\u0004\u0018\u00010\b8\u0006¢\u0006\f\n\u0004\b\t\u0010E\u001a\u0004\bF\u0010$R\u0019\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006¢\u0006\f\n\u0004\b\u000b\u0010G\u001a\u0004\bH\u0010&R\u001d\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\r0\f8\u0006¢\u0006\f\n\u0004\b\u000e\u0010I\u001a\u0004\bJ\u0010(R\u0019\u0010\u0010\u001a\u0004\u0018\u00010\u000f8\u0006¢\u0006\f\n\u0004\b\u0010\u0010K\u001a\u0004\bL\u0010*R\u0019\u0010\u0012\u001a\u0004\u0018\u00010\u00118\u0006¢\u0006\f\n\u0004\b\u0012\u0010M\u001a\u0004\bN\u0010,R\u0019\u0010\u0014\u001a\u0004\u0018\u00010\u00138\u0006¢\u0006\f\n\u0004\b\u0014\u0010O\u001a\u0004\bP\u0010.R\u0019\u0010\u0016\u001a\u0004\u0018\u00010\u00158\u0006¢\u0006\f\n\u0004\b\u0016\u0010Q\u001a\u0004\bR\u00100R\u0019\u0010\u0018\u001a\u0004\u0018\u00010\u00178\u0006¢\u0006\f\n\u0004\b\u0018\u0010S\u001a\u0004\bT\u00102R\u0019\u0010\u001a\u001a\u0004\u0018\u00010\u00198\u0006¢\u0006\f\n\u0004\b\u001a\u0010U\u001a\u0004\bV\u00104¨\u0006]"}, d2 = {"Lcom/medium/android/graphql/fragment/ParagraphData;", "Lg15;", "", "__typename", "id", "name", "href", "text", "Lcom/medium/android/graphql/fragment/ParagraphData$Iframe;", "iframe", "Lcom/medium/android/graphql/type/LayoutType;", "layout", "", "Lcom/medium/android/graphql/fragment/ParagraphData$Markup;", "markups", "Lcom/medium/android/graphql/fragment/ParagraphData$Metadata;", "metadata", "Lcom/medium/android/graphql/fragment/ParagraphData$MixtapeMetadata;", "mixtapeMetadata", "Lcom/medium/android/graphql/type/ParagraphType;", "type", "", "hasDropCap", "Lcom/medium/android/graphql/fragment/ParagraphData$DropCapImage;", "dropCapImage", "Lcom/medium/android/graphql/fragment/ParagraphData$CodeBlockMetadata;", "codeBlockMetadata", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ParagraphData$Iframe;Lcom/medium/android/graphql/type/LayoutType;Ljava/util/List;Lcom/medium/android/graphql/fragment/ParagraphData$Metadata;Lcom/medium/android/graphql/fragment/ParagraphData$MixtapeMetadata;Lcom/medium/android/graphql/type/ParagraphType;Ljava/lang/Boolean;Lcom/medium/android/graphql/fragment/ParagraphData$DropCapImage;Lcom/medium/android/graphql/fragment/ParagraphData$CodeBlockMetadata;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "component5", "component6", "()Lcom/medium/android/graphql/fragment/ParagraphData$Iframe;", "component7", "()Lcom/medium/android/graphql/type/LayoutType;", "component8", "()Ljava/util/List;", "component9", "()Lcom/medium/android/graphql/fragment/ParagraphData$Metadata;", "component10", "()Lcom/medium/android/graphql/fragment/ParagraphData$MixtapeMetadata;", "component11", "()Lcom/medium/android/graphql/type/ParagraphType;", "component12", "()Ljava/lang/Boolean;", "component13", "()Lcom/medium/android/graphql/fragment/ParagraphData$DropCapImage;", "component14", "()Lcom/medium/android/graphql/fragment/ParagraphData$CodeBlockMetadata;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ParagraphData$Iframe;Lcom/medium/android/graphql/type/LayoutType;Ljava/util/List;Lcom/medium/android/graphql/fragment/ParagraphData$Metadata;Lcom/medium/android/graphql/fragment/ParagraphData$MixtapeMetadata;Lcom/medium/android/graphql/type/ParagraphType;Ljava/lang/Boolean;Lcom/medium/android/graphql/fragment/ParagraphData$DropCapImage;Lcom/medium/android/graphql/fragment/ParagraphData$CodeBlockMetadata;)Lcom/medium/android/graphql/fragment/ParagraphData;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "getName", "getHref", "getText", "Lcom/medium/android/graphql/fragment/ParagraphData$Iframe;", "getIframe", "Lcom/medium/android/graphql/type/LayoutType;", "getLayout", "Ljava/util/List;", "getMarkups", "Lcom/medium/android/graphql/fragment/ParagraphData$Metadata;", "getMetadata", "Lcom/medium/android/graphql/fragment/ParagraphData$MixtapeMetadata;", "getMixtapeMetadata", "Lcom/medium/android/graphql/type/ParagraphType;", "getType", "Ljava/lang/Boolean;", "getHasDropCap", "Lcom/medium/android/graphql/fragment/ParagraphData$DropCapImage;", "getDropCapImage", "Lcom/medium/android/graphql/fragment/ParagraphData$CodeBlockMetadata;", "getCodeBlockMetadata", "Iframe", "Markup", "Metadata", "MixtapeMetadata", "DropCapImage", "CodeBlockMetadata", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class ParagraphData implements g15 {
    private final String __typename;
    private final CodeBlockMetadata codeBlockMetadata;
    private final DropCapImage dropCapImage;
    private final Boolean hasDropCap;
    private final String href;
    private final String id;
    private final Iframe iframe;
    private final LayoutType layout;
    private final List<Markup> markups;
    private final Metadata metadata;
    private final MixtapeMetadata mixtapeMetadata;
    private final String name;
    private final String text;
    private final ParagraphType type;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000f\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J)\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/ParagraphData$CodeBlockMetadata;", "", "__typename", "", "lang", "mode", "Lcom/medium/android/graphql/type/SyntaxHighlightMode;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/type/SyntaxHighlightMode;)V", "get__typename", "()Ljava/lang/String;", "getLang", "getMode", "()Lcom/medium/android/graphql/type/SyntaxHighlightMode;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class CodeBlockMetadata {
        private final String __typename;
        private final String lang;
        private final SyntaxHighlightMode mode;

        public CodeBlockMetadata(String str, String str2, SyntaxHighlightMode syntaxHighlightMode) {
            str.getClass();
            syntaxHighlightMode.getClass();
            this.__typename = str;
            this.lang = str2;
            this.mode = syntaxHighlightMode;
        }

        public static /* synthetic */ CodeBlockMetadata copy$default(CodeBlockMetadata codeBlockMetadata, String str, String str2, SyntaxHighlightMode syntaxHighlightMode, int i, Object obj) {
            if ((i & 1) != 0) {
                str = codeBlockMetadata.__typename;
            }
            if ((i & 2) != 0) {
                str2 = codeBlockMetadata.lang;
            }
            if ((i & 4) != 0) {
                syntaxHighlightMode = codeBlockMetadata.mode;
            }
            return codeBlockMetadata.copy(str, str2, syntaxHighlightMode);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getLang() {
            return this.lang;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final SyntaxHighlightMode getMode() {
            return this.mode;
        }

        public final CodeBlockMetadata copy(String __typename, String lang, SyntaxHighlightMode mode) {
            __typename.getClass();
            mode.getClass();
            return new CodeBlockMetadata(__typename, lang, mode);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof CodeBlockMetadata)) {
                return false;
            }
            CodeBlockMetadata codeBlockMetadata = (CodeBlockMetadata) other;
            return g76.L(this.__typename, codeBlockMetadata.__typename) && g76.L(this.lang, codeBlockMetadata.lang) && this.mode == codeBlockMetadata.mode;
        }

        public final String getLang() {
            return this.lang;
        }

        public final SyntaxHighlightMode getMode() {
            return this.mode;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            String str = this.lang;
            return this.mode.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.lang;
            SyntaxHighlightMode syntaxHighlightMode = this.mode;
            StringBuilder sbU = y30.u("CodeBlockMetadata(__typename=", str, ", lang=", str2, ", mode=");
            sbU.append(syntaxHighlightMode);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/ParagraphData$DropCapImage;", "", "__typename", "", "id", "imageMetadataData", "Lcom/medium/android/graphql/fragment/ImageMetadataData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ImageMetadataData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getImageMetadataData", "()Lcom/medium/android/graphql/fragment/ImageMetadataData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class DropCapImage {
        private final String __typename;
        private final String id;
        private final ImageMetadataData imageMetadataData;

        public DropCapImage(String str, String str2, ImageMetadataData imageMetadataData) {
            str.getClass();
            str2.getClass();
            imageMetadataData.getClass();
            this.__typename = str;
            this.id = str2;
            this.imageMetadataData = imageMetadataData;
        }

        public static /* synthetic */ DropCapImage copy$default(DropCapImage dropCapImage, String str, String str2, ImageMetadataData imageMetadataData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = dropCapImage.__typename;
            }
            if ((i & 2) != 0) {
                str2 = dropCapImage.id;
            }
            if ((i & 4) != 0) {
                imageMetadataData = dropCapImage.imageMetadataData;
            }
            return dropCapImage.copy(str, str2, imageMetadataData);
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
        public final ImageMetadataData getImageMetadataData() {
            return this.imageMetadataData;
        }

        public final DropCapImage copy(String __typename, String id, ImageMetadataData imageMetadataData) {
            __typename.getClass();
            id.getClass();
            imageMetadataData.getClass();
            return new DropCapImage(__typename, id, imageMetadataData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof DropCapImage)) {
                return false;
            }
            DropCapImage dropCapImage = (DropCapImage) other;
            return g76.L(this.__typename, dropCapImage.__typename) && g76.L(this.id, dropCapImage.id) && g76.L(this.imageMetadataData, dropCapImage.imageMetadataData);
        }

        public final String getId() {
            return this.id;
        }

        public final ImageMetadataData getImageMetadataData() {
            return this.imageMetadataData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.imageMetadataData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            ImageMetadataData imageMetadataData = this.imageMetadataData;
            StringBuilder sbU = y30.u("DropCapImage(__typename=", str, ", id=", str2, ", imageMetadataData=");
            sbU.append(imageMetadataData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/ParagraphData$Iframe;", "", "__typename", "", "iframeData", "Lcom/medium/android/graphql/fragment/IframeData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/IframeData;)V", "get__typename", "()Ljava/lang/String;", "getIframeData", "()Lcom/medium/android/graphql/fragment/IframeData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Iframe {
        private final String __typename;
        private final IframeData iframeData;

        public Iframe(String str, IframeData iframeData) {
            str.getClass();
            iframeData.getClass();
            this.__typename = str;
            this.iframeData = iframeData;
        }

        public static /* synthetic */ Iframe copy$default(Iframe iframe, String str, IframeData iframeData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = iframe.__typename;
            }
            if ((i & 2) != 0) {
                iframeData = iframe.iframeData;
            }
            return iframe.copy(str, iframeData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final IframeData getIframeData() {
            return this.iframeData;
        }

        public final Iframe copy(String __typename, IframeData iframeData) {
            __typename.getClass();
            iframeData.getClass();
            return new Iframe(__typename, iframeData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Iframe)) {
                return false;
            }
            Iframe iframe = (Iframe) other;
            return g76.L(this.__typename, iframe.__typename) && g76.L(this.iframeData, iframe.iframeData);
        }

        public final IframeData getIframeData() {
            return this.iframeData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.iframeData.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Iframe(__typename=" + this.__typename + ", iframeData=" + this.iframeData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/ParagraphData$Markup;", "", "__typename", "", "markupData", "Lcom/medium/android/graphql/fragment/MarkupData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/MarkupData;)V", "get__typename", "()Ljava/lang/String;", "getMarkupData", "()Lcom/medium/android/graphql/fragment/MarkupData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Markup {
        private final String __typename;
        private final MarkupData markupData;

        public Markup(String str, MarkupData markupData) {
            str.getClass();
            markupData.getClass();
            this.__typename = str;
            this.markupData = markupData;
        }

        public static /* synthetic */ Markup copy$default(Markup markup, String str, MarkupData markupData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = markup.__typename;
            }
            if ((i & 2) != 0) {
                markupData = markup.markupData;
            }
            return markup.copy(str, markupData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final MarkupData getMarkupData() {
            return this.markupData;
        }

        public final Markup copy(String __typename, MarkupData markupData) {
            __typename.getClass();
            markupData.getClass();
            return new Markup(__typename, markupData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Markup)) {
                return false;
            }
            Markup markup = (Markup) other;
            return g76.L(this.__typename, markup.__typename) && g76.L(this.markupData, markup.markupData);
        }

        public final MarkupData getMarkupData() {
            return this.markupData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.markupData.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Markup(__typename=" + this.__typename + CspinKvYN.ZFnxIHYSSyEk + this.markupData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/ParagraphData$Metadata;", "", "__typename", "", "id", "imageMetadataData", "Lcom/medium/android/graphql/fragment/ImageMetadataData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ImageMetadataData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getImageMetadataData", "()Lcom/medium/android/graphql/fragment/ImageMetadataData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Metadata {
        private final String __typename;
        private final String id;
        private final ImageMetadataData imageMetadataData;

        public Metadata(String str, String str2, ImageMetadataData imageMetadataData) {
            str.getClass();
            str2.getClass();
            imageMetadataData.getClass();
            this.__typename = str;
            this.id = str2;
            this.imageMetadataData = imageMetadataData;
        }

        public static /* synthetic */ Metadata copy$default(Metadata metadata, String str, String str2, ImageMetadataData imageMetadataData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = metadata.__typename;
            }
            if ((i & 2) != 0) {
                str2 = metadata.id;
            }
            if ((i & 4) != 0) {
                imageMetadataData = metadata.imageMetadataData;
            }
            return metadata.copy(str, str2, imageMetadataData);
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
        public final ImageMetadataData getImageMetadataData() {
            return this.imageMetadataData;
        }

        public final Metadata copy(String __typename, String id, ImageMetadataData imageMetadataData) {
            __typename.getClass();
            id.getClass();
            imageMetadataData.getClass();
            return new Metadata(__typename, id, imageMetadataData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Metadata)) {
                return false;
            }
            Metadata metadata = (Metadata) other;
            return g76.L(this.__typename, metadata.__typename) && g76.L(this.id, metadata.id) && g76.L(this.imageMetadataData, metadata.imageMetadataData);
        }

        public final String getId() {
            return this.id;
        }

        public final ImageMetadataData getImageMetadataData() {
            return this.imageMetadataData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.imageMetadataData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            ImageMetadataData imageMetadataData = this.imageMetadataData;
            StringBuilder sbU = y30.u("Metadata(__typename=", str, ", id=", str2, ", imageMetadataData=");
            sbU.append(imageMetadataData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/ParagraphData$MixtapeMetadata;", "", "__typename", "", "mixtapeMetadataData", "Lcom/medium/android/graphql/fragment/MixtapeMetadataData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/MixtapeMetadataData;)V", "get__typename", "()Ljava/lang/String;", "getMixtapeMetadataData", "()Lcom/medium/android/graphql/fragment/MixtapeMetadataData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class MixtapeMetadata {
        private final String __typename;
        private final MixtapeMetadataData mixtapeMetadataData;

        public MixtapeMetadata(String str, MixtapeMetadataData mixtapeMetadataData) {
            str.getClass();
            mixtapeMetadataData.getClass();
            this.__typename = str;
            this.mixtapeMetadataData = mixtapeMetadataData;
        }

        public static /* synthetic */ MixtapeMetadata copy$default(MixtapeMetadata mixtapeMetadata, String str, MixtapeMetadataData mixtapeMetadataData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = mixtapeMetadata.__typename;
            }
            if ((i & 2) != 0) {
                mixtapeMetadataData = mixtapeMetadata.mixtapeMetadataData;
            }
            return mixtapeMetadata.copy(str, mixtapeMetadataData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final MixtapeMetadataData getMixtapeMetadataData() {
            return this.mixtapeMetadataData;
        }

        public final MixtapeMetadata copy(String __typename, MixtapeMetadataData mixtapeMetadataData) {
            __typename.getClass();
            mixtapeMetadataData.getClass();
            return new MixtapeMetadata(__typename, mixtapeMetadataData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof MixtapeMetadata)) {
                return false;
            }
            MixtapeMetadata mixtapeMetadata = (MixtapeMetadata) other;
            return g76.L(this.__typename, mixtapeMetadata.__typename) && g76.L(this.mixtapeMetadataData, mixtapeMetadata.mixtapeMetadataData);
        }

        public final MixtapeMetadataData getMixtapeMetadataData() {
            return this.mixtapeMetadataData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.mixtapeMetadataData.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "MixtapeMetadata(__typename=" + this.__typename + ", mixtapeMetadataData=" + this.mixtapeMetadataData + ")";
        }
    }

    public ParagraphData(String str, String str2, String str3, String str4, String str5, Iframe iframe, LayoutType layoutType, List<Markup> list, Metadata metadata, MixtapeMetadata mixtapeMetadata, ParagraphType paragraphType, Boolean bool, DropCapImage dropCapImage, CodeBlockMetadata codeBlockMetadata) {
        str.getClass();
        str2.getClass();
        list.getClass();
        this.__typename = str;
        this.id = str2;
        this.name = str3;
        this.href = str4;
        this.text = str5;
        this.iframe = iframe;
        this.layout = layoutType;
        this.markups = list;
        this.metadata = metadata;
        this.mixtapeMetadata = mixtapeMetadata;
        this.type = paragraphType;
        this.hasDropCap = bool;
        this.dropCapImage = dropCapImage;
        this.codeBlockMetadata = codeBlockMetadata;
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component10, reason: from getter */
    public final MixtapeMetadata getMixtapeMetadata() {
        return this.mixtapeMetadata;
    }

    /* JADX INFO: renamed from: component11, reason: from getter */
    public final ParagraphType getType() {
        return this.type;
    }

    /* JADX INFO: renamed from: component12, reason: from getter */
    public final Boolean getHasDropCap() {
        return this.hasDropCap;
    }

    /* JADX INFO: renamed from: component13, reason: from getter */
    public final DropCapImage getDropCapImage() {
        return this.dropCapImage;
    }

    /* JADX INFO: renamed from: component14, reason: from getter */
    public final CodeBlockMetadata getCodeBlockMetadata() {
        return this.codeBlockMetadata;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getId() {
        return this.id;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getName() {
        return this.name;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final String getHref() {
        return this.href;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final String getText() {
        return this.text;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final Iframe getIframe() {
        return this.iframe;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final LayoutType getLayout() {
        return this.layout;
    }

    public final List<Markup> component8() {
        return this.markups;
    }

    /* JADX INFO: renamed from: component9, reason: from getter */
    public final Metadata getMetadata() {
        return this.metadata;
    }

    public final ParagraphData copy(String __typename, String id, String name, String href, String text, Iframe iframe, LayoutType layout, List<Markup> markups, Metadata metadata, MixtapeMetadata mixtapeMetadata, ParagraphType type, Boolean hasDropCap, DropCapImage dropCapImage, CodeBlockMetadata codeBlockMetadata) {
        __typename.getClass();
        id.getClass();
        markups.getClass();
        return new ParagraphData(__typename, id, name, href, text, iframe, layout, markups, metadata, mixtapeMetadata, type, hasDropCap, dropCapImage, codeBlockMetadata);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ParagraphData)) {
            return false;
        }
        ParagraphData paragraphData = (ParagraphData) other;
        return g76.L(this.__typename, paragraphData.__typename) && g76.L(this.id, paragraphData.id) && g76.L(this.name, paragraphData.name) && g76.L(this.href, paragraphData.href) && g76.L(this.text, paragraphData.text) && g76.L(this.iframe, paragraphData.iframe) && this.layout == paragraphData.layout && g76.L(this.markups, paragraphData.markups) && g76.L(this.metadata, paragraphData.metadata) && g76.L(this.mixtapeMetadata, paragraphData.mixtapeMetadata) && this.type == paragraphData.type && g76.L(this.hasDropCap, paragraphData.hasDropCap) && g76.L(this.dropCapImage, paragraphData.dropCapImage) && g76.L(this.codeBlockMetadata, paragraphData.codeBlockMetadata);
    }

    public final CodeBlockMetadata getCodeBlockMetadata() {
        return this.codeBlockMetadata;
    }

    public final DropCapImage getDropCapImage() {
        return this.dropCapImage;
    }

    public final Boolean getHasDropCap() {
        return this.hasDropCap;
    }

    public final String getHref() {
        return this.href;
    }

    public final String getId() {
        return this.id;
    }

    public final Iframe getIframe() {
        return this.iframe;
    }

    public final LayoutType getLayout() {
        return this.layout;
    }

    public final List<Markup> getMarkups() {
        return this.markups;
    }

    public final Metadata getMetadata() {
        return this.metadata;
    }

    public final MixtapeMetadata getMixtapeMetadata() {
        return this.mixtapeMetadata;
    }

    public final String getName() {
        return this.name;
    }

    public final String getText() {
        return this.text;
    }

    public final ParagraphType getType() {
        return this.type;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        String str = this.name;
        int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.href;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.text;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        Iframe iframe = this.iframe;
        int iHashCode4 = (iHashCode3 + (iframe == null ? 0 : iframe.hashCode())) * 31;
        LayoutType layoutType = this.layout;
        int iP = wgd.p((iHashCode4 + (layoutType == null ? 0 : layoutType.hashCode())) * 31, 31, this.markups);
        Metadata metadata = this.metadata;
        int iHashCode5 = (iP + (metadata == null ? 0 : metadata.hashCode())) * 31;
        MixtapeMetadata mixtapeMetadata = this.mixtapeMetadata;
        int iHashCode6 = (iHashCode5 + (mixtapeMetadata == null ? 0 : mixtapeMetadata.hashCode())) * 31;
        ParagraphType paragraphType = this.type;
        int iHashCode7 = (iHashCode6 + (paragraphType == null ? 0 : paragraphType.hashCode())) * 31;
        Boolean bool = this.hasDropCap;
        int iHashCode8 = (iHashCode7 + (bool == null ? 0 : bool.hashCode())) * 31;
        DropCapImage dropCapImage = this.dropCapImage;
        int iHashCode9 = (iHashCode8 + (dropCapImage == null ? 0 : dropCapImage.hashCode())) * 31;
        CodeBlockMetadata codeBlockMetadata = this.codeBlockMetadata;
        return iHashCode9 + (codeBlockMetadata != null ? codeBlockMetadata.hashCode() : 0);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        String str3 = this.name;
        String str4 = this.href;
        String str5 = this.text;
        Iframe iframe = this.iframe;
        LayoutType layoutType = this.layout;
        List<Markup> list = this.markups;
        Metadata metadata = this.metadata;
        MixtapeMetadata mixtapeMetadata = this.mixtapeMetadata;
        ParagraphType paragraphType = this.type;
        Boolean bool = this.hasDropCap;
        DropCapImage dropCapImage = this.dropCapImage;
        CodeBlockMetadata codeBlockMetadata = this.codeBlockMetadata;
        StringBuilder sbU = y30.u("ParagraphData(__typename=", str, ", id=", str2, ", name=");
        ka1.C(sbU, str3, ", href=", str4, ", text=");
        sbU.append(str5);
        sbU.append(", iframe=");
        sbU.append(iframe);
        sbU.append(", layout=");
        sbU.append(layoutType);
        sbU.append(", markups=");
        sbU.append(list);
        sbU.append(", metadata=");
        sbU.append(metadata);
        sbU.append(", mixtapeMetadata=");
        sbU.append(mixtapeMetadata);
        sbU.append(", type=");
        sbU.append(paragraphType);
        sbU.append(", hasDropCap=");
        sbU.append(bool);
        sbU.append(", dropCapImage=");
        sbU.append(dropCapImage);
        sbU.append(", codeBlockMetadata=");
        sbU.append(codeBlockMetadata);
        sbU.append(")");
        return sbU.toString();
    }
}
