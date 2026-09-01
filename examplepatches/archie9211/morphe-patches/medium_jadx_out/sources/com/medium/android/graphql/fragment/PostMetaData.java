package com.medium.android.graphql.fragment;

import com.drew.imaging.riff.pvS.uuLAxLN;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.common.ui.Ezz.Plbho;
import com.medium.android.graphql.type.InResponseToEntityType;
import com.medium.android.graphql.type.PostPaywallType;
import com.medium.android.graphql.type.PostVisibilityType;
import defpackage.b09;
import defpackage.ev6;
import defpackage.g15;
import defpackage.g76;
import defpackage.ho2;
import defpackage.ka1;
import defpackage.km4;
import defpackage.lv8;
import defpackage.wgd;
import defpackage.y30;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u008a\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b4\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b@\b\u0086\b\u0018\u00002\u00020\u0001:\"\u0094\u0001\u0095\u0001\u0096\u0001\u0097\u0001\u0098\u0001\u0099\u0001\u009a\u0001\u009b\u0001\u009c\u0001\u009d\u0001\u009e\u0001\u009f\u0001 \u0001¡\u0001¢\u0001£\u0001¤\u0001B\u0089\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\r\u001a\u0004\u0018\u00010\f\u0012\b\u0010\u000f\u001a\u0004\u0018\u00010\u000e\u0012\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010\u0012\b\u0010\u0012\u001a\u0004\u0018\u00010\u0010\u0012\u0006\u0010\u0013\u001a\u00020\u0010\u0012\u0006\u0010\u0014\u001a\u00020\u0002\u0012\b\u0010\u0015\u001a\u0004\u0018\u00010\u000e\u0012\b\u0010\u0017\u001a\u0004\u0018\u00010\u0016\u0012\b\u0010\u0019\u001a\u0004\u0018\u00010\u0018\u0012\b\u0010\u001b\u001a\u0004\u0018\u00010\u001a\u0012\b\u0010\u001d\u001a\u0004\u0018\u00010\u001c\u0012\b\u0010\u001e\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010 \u001a\u0004\u0018\u00010\u001f\u0012\b\u0010\"\u001a\u0004\u0018\u00010!\u0012\b\u0010$\u001a\u0004\u0018\u00010#\u0012\b\u0010%\u001a\u0004\u0018\u00010\u000e\u0012\u0006\u0010&\u001a\u00020\u0010\u0012\u0006\u0010(\u001a\u00020'\u0012\u0006\u0010*\u001a\u00020)\u0012\u0006\u0010,\u001a\u00020+\u0012\u0006\u0010.\u001a\u00020-¢\u0006\u0004\b/\u00100J\u0010\u00101\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b1\u00102J\u0010\u00103\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b3\u00102J\u0012\u00104\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b4\u00102J\u0010\u00105\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b5\u00106J\u0010\u00107\u001a\u00020\bHÆ\u0003¢\u0006\u0004\b7\u00108J\u0012\u00109\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b9\u00102J\u0012\u0010:\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b:\u00102J\u0012\u0010;\u001a\u0004\u0018\u00010\fHÆ\u0003¢\u0006\u0004\b;\u0010<J\u0012\u0010=\u001a\u0004\u0018\u00010\u000eHÆ\u0003¢\u0006\u0004\b=\u0010>J\u0012\u0010?\u001a\u0004\u0018\u00010\u0010HÆ\u0003¢\u0006\u0004\b?\u0010@J\u0012\u0010A\u001a\u0004\u0018\u00010\u0010HÆ\u0003¢\u0006\u0004\bA\u0010@J\u0010\u0010B\u001a\u00020\u0010HÆ\u0003¢\u0006\u0004\bB\u0010CJ\u0010\u0010D\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\bD\u00102J\u0012\u0010E\u001a\u0004\u0018\u00010\u000eHÆ\u0003¢\u0006\u0004\bE\u0010>J\u0012\u0010F\u001a\u0004\u0018\u00010\u0016HÆ\u0003¢\u0006\u0004\bF\u0010GJ\u0012\u0010H\u001a\u0004\u0018\u00010\u0018HÆ\u0003¢\u0006\u0004\bH\u0010IJ\u0012\u0010J\u001a\u0004\u0018\u00010\u001aHÆ\u0003¢\u0006\u0004\bJ\u0010KJ\u0012\u0010L\u001a\u0004\u0018\u00010\u001cHÆ\u0003¢\u0006\u0004\bL\u0010MJ\u0012\u0010N\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\bN\u00102J\u0012\u0010O\u001a\u0004\u0018\u00010\u001fHÆ\u0003¢\u0006\u0004\bO\u0010PJ\u0012\u0010Q\u001a\u0004\u0018\u00010!HÆ\u0003¢\u0006\u0004\bQ\u0010RJ\u0012\u0010S\u001a\u0004\u0018\u00010#HÆ\u0003¢\u0006\u0004\bS\u0010TJ\u0012\u0010U\u001a\u0004\u0018\u00010\u000eHÆ\u0003¢\u0006\u0004\bU\u0010>J\u0010\u0010V\u001a\u00020\u0010HÆ\u0003¢\u0006\u0004\bV\u0010CJ\u0010\u0010W\u001a\u00020'HÆ\u0003¢\u0006\u0004\bW\u0010XJ\u0010\u0010Y\u001a\u00020)HÆ\u0003¢\u0006\u0004\bY\u0010ZJ\u0010\u0010[\u001a\u00020+HÆ\u0003¢\u0006\u0004\b[\u0010\\J\u0010\u0010]\u001a\u00020-HÆ\u0003¢\u0006\u0004\b]\u0010^JÊ\u0002\u0010_\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00022\b\b\u0002\u0010\u0007\u001a\u00020\u00062\b\b\u0002\u0010\t\u001a\u00020\b2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000e2\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00102\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00102\b\b\u0002\u0010\u0013\u001a\u00020\u00102\b\b\u0002\u0010\u0014\u001a\u00020\u00022\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u000e2\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u00162\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u00182\n\b\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u001a2\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u001c2\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010 \u001a\u0004\u0018\u00010\u001f2\n\b\u0002\u0010\"\u001a\u0004\u0018\u00010!2\n\b\u0002\u0010$\u001a\u0004\u0018\u00010#2\n\b\u0002\u0010%\u001a\u0004\u0018\u00010\u000e2\b\b\u0002\u0010&\u001a\u00020\u00102\b\b\u0002\u0010(\u001a\u00020'2\b\b\u0002\u0010*\u001a\u00020)2\b\b\u0002\u0010,\u001a\u00020+2\b\b\u0002\u0010.\u001a\u00020-HÆ\u0001¢\u0006\u0004\b_\u0010`J\u0010\u0010a\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\ba\u00102J\u0010\u0010c\u001a\u00020bHÖ\u0001¢\u0006\u0004\bc\u0010dJ\u001a\u0010g\u001a\u00020\u00102\b\u0010f\u001a\u0004\u0018\u00010eHÖ\u0003¢\u0006\u0004\bg\u0010hR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010i\u001a\u0004\bj\u00102R\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010i\u001a\u0004\bk\u00102R\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010i\u001a\u0004\bl\u00102R\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010m\u001a\u0004\bn\u00106R\u0017\u0010\t\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u0010o\u001a\u0004\bp\u00108R\u0019\u0010\n\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\n\u0010i\u001a\u0004\bq\u00102R\u0019\u0010\u000b\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u000b\u0010i\u001a\u0004\br\u00102R\u0019\u0010\r\u001a\u0004\u0018\u00010\f8\u0006¢\u0006\f\n\u0004\b\r\u0010s\u001a\u0004\bt\u0010<R\u0019\u0010\u000f\u001a\u0004\u0018\u00010\u000e8\u0006¢\u0006\f\n\u0004\b\u000f\u0010u\u001a\u0004\bv\u0010>R\u0019\u0010\u0011\u001a\u0004\u0018\u00010\u00108\u0006¢\u0006\f\n\u0004\b\u0011\u0010w\u001a\u0004\b\u0011\u0010@R\u0019\u0010\u0012\u001a\u0004\u0018\u00010\u00108\u0006¢\u0006\f\n\u0004\b\u0012\u0010w\u001a\u0004\bx\u0010@R\u0017\u0010\u0013\u001a\u00020\u00108\u0006¢\u0006\f\n\u0004\b\u0013\u0010y\u001a\u0004\b\u0013\u0010CR\u0017\u0010\u0014\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0014\u0010i\u001a\u0004\bz\u00102R\u0019\u0010\u0015\u001a\u0004\u0018\u00010\u000e8\u0006¢\u0006\f\n\u0004\b\u0015\u0010u\u001a\u0004\b{\u0010>R\u0019\u0010\u0017\u001a\u0004\u0018\u00010\u00168\u0006¢\u0006\f\n\u0004\b\u0017\u0010|\u001a\u0004\b}\u0010GR\u0019\u0010\u0019\u001a\u0004\u0018\u00010\u00188\u0006¢\u0006\f\n\u0004\b\u0019\u0010~\u001a\u0004\b\u007f\u0010IR\u001b\u0010\u001b\u001a\u0004\u0018\u00010\u001a8\u0006¢\u0006\u000e\n\u0005\b\u001b\u0010\u0080\u0001\u001a\u0005\b\u0081\u0001\u0010KR\u001b\u0010\u001d\u001a\u0004\u0018\u00010\u001c8\u0006¢\u0006\u000e\n\u0005\b\u001d\u0010\u0082\u0001\u001a\u0005\b\u0083\u0001\u0010MR\u001a\u0010\u001e\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\r\n\u0004\b\u001e\u0010i\u001a\u0005\b\u0084\u0001\u00102R\u001b\u0010 \u001a\u0004\u0018\u00010\u001f8\u0006¢\u0006\u000e\n\u0005\b \u0010\u0085\u0001\u001a\u0005\b\u0086\u0001\u0010PR\u001b\u0010\"\u001a\u0004\u0018\u00010!8\u0006¢\u0006\u000e\n\u0005\b\"\u0010\u0087\u0001\u001a\u0005\b\u0088\u0001\u0010RR\u001b\u0010$\u001a\u0004\u0018\u00010#8\u0006¢\u0006\u000e\n\u0005\b$\u0010\u0089\u0001\u001a\u0005\b\u008a\u0001\u0010TR\u001a\u0010%\u001a\u0004\u0018\u00010\u000e8\u0006¢\u0006\r\n\u0004\b%\u0010u\u001a\u0005\b\u008b\u0001\u0010>R\u0017\u0010&\u001a\u00020\u00108\u0006¢\u0006\f\n\u0004\b&\u0010y\u001a\u0004\b&\u0010CR\u0019\u0010(\u001a\u00020'8\u0006¢\u0006\u000e\n\u0005\b(\u0010\u008c\u0001\u001a\u0005\b\u008d\u0001\u0010XR\u0019\u0010*\u001a\u00020)8\u0006¢\u0006\u000e\n\u0005\b*\u0010\u008e\u0001\u001a\u0005\b\u008f\u0001\u0010ZR\u0019\u0010,\u001a\u00020+8\u0006¢\u0006\u000e\n\u0005\b,\u0010\u0090\u0001\u001a\u0005\b\u0091\u0001\u0010\\R\u0019\u0010.\u001a\u00020-8\u0006¢\u0006\u000e\n\u0005\b.\u0010\u0092\u0001\u001a\u0005\b\u0093\u0001\u0010^¨\u0006¥\u0001"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaData;", "Lg15;", "", "__typename", "id", "title", "Lcom/medium/android/graphql/type/PostVisibilityType;", "visibility", "Lcom/medium/android/graphql/fragment/PostMetaData$ViewerEdge;", "viewerEdge", "detectedLanguage", "mediumUrl", "", "readingTime", "", "updatedAt", "", "isLocked", "allowResponses", "isProxyPost", "latestPublishedVersion", "firstPublishedAt", "Lcom/medium/android/graphql/fragment/PostMetaData$PreviewImage;", "previewImage", "Lcom/medium/android/graphql/fragment/PostMetaData$InResponseToPostResult;", "inResponseToPostResult", "Lcom/medium/android/graphql/fragment/PostMetaData$InResponseToMediaResource;", "inResponseToMediaResource", "Lcom/medium/android/graphql/type/InResponseToEntityType;", "inResponseToEntityType", "canonicalUrl", "Lcom/medium/android/graphql/fragment/PostMetaData$Collection;", "collection", "Lcom/medium/android/graphql/fragment/PostMetaData$Creator;", "creator", "Lcom/medium/android/graphql/fragment/PostMetaData$PreviewContent;", "previewContent", "pinnedByCreatorAt", "isNewsletter", "Lcom/medium/android/graphql/fragment/PostClapsData;", "postClapsData", "Lcom/medium/android/graphql/fragment/ResponseCountData;", "responseCountData", "Lcom/medium/android/graphql/fragment/PostVisibilityData;", "postVisibilityData", "Lcom/medium/android/graphql/fragment/PostMenuData;", "postMenuData", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/type/PostVisibilityType;Lcom/medium/android/graphql/fragment/PostMetaData$ViewerEdge;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Double;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/Boolean;ZLjava/lang/String;Ljava/lang/Long;Lcom/medium/android/graphql/fragment/PostMetaData$PreviewImage;Lcom/medium/android/graphql/fragment/PostMetaData$InResponseToPostResult;Lcom/medium/android/graphql/fragment/PostMetaData$InResponseToMediaResource;Lcom/medium/android/graphql/type/InResponseToEntityType;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostMetaData$Collection;Lcom/medium/android/graphql/fragment/PostMetaData$Creator;Lcom/medium/android/graphql/fragment/PostMetaData$PreviewContent;Ljava/lang/Long;ZLcom/medium/android/graphql/fragment/PostClapsData;Lcom/medium/android/graphql/fragment/ResponseCountData;Lcom/medium/android/graphql/fragment/PostVisibilityData;Lcom/medium/android/graphql/fragment/PostMenuData;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "()Lcom/medium/android/graphql/type/PostVisibilityType;", "component5", "()Lcom/medium/android/graphql/fragment/PostMetaData$ViewerEdge;", "component6", "component7", "component8", "()Ljava/lang/Double;", "component9", "()Ljava/lang/Long;", "component10", "()Ljava/lang/Boolean;", "component11", "component12", "()Z", "component13", "component14", "component15", "()Lcom/medium/android/graphql/fragment/PostMetaData$PreviewImage;", "component16", "()Lcom/medium/android/graphql/fragment/PostMetaData$InResponseToPostResult;", "component17", "()Lcom/medium/android/graphql/fragment/PostMetaData$InResponseToMediaResource;", "component18", "()Lcom/medium/android/graphql/type/InResponseToEntityType;", "component19", "component20", "()Lcom/medium/android/graphql/fragment/PostMetaData$Collection;", "component21", "()Lcom/medium/android/graphql/fragment/PostMetaData$Creator;", "component22", "()Lcom/medium/android/graphql/fragment/PostMetaData$PreviewContent;", "component23", "component24", "component25", "()Lcom/medium/android/graphql/fragment/PostClapsData;", "component26", "()Lcom/medium/android/graphql/fragment/ResponseCountData;", "component27", "()Lcom/medium/android/graphql/fragment/PostVisibilityData;", "component28", "()Lcom/medium/android/graphql/fragment/PostMenuData;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/type/PostVisibilityType;Lcom/medium/android/graphql/fragment/PostMetaData$ViewerEdge;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Double;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/Boolean;ZLjava/lang/String;Ljava/lang/Long;Lcom/medium/android/graphql/fragment/PostMetaData$PreviewImage;Lcom/medium/android/graphql/fragment/PostMetaData$InResponseToPostResult;Lcom/medium/android/graphql/fragment/PostMetaData$InResponseToMediaResource;Lcom/medium/android/graphql/type/InResponseToEntityType;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostMetaData$Collection;Lcom/medium/android/graphql/fragment/PostMetaData$Creator;Lcom/medium/android/graphql/fragment/PostMetaData$PreviewContent;Ljava/lang/Long;ZLcom/medium/android/graphql/fragment/PostClapsData;Lcom/medium/android/graphql/fragment/ResponseCountData;Lcom/medium/android/graphql/fragment/PostVisibilityData;Lcom/medium/android/graphql/fragment/PostMenuData;)Lcom/medium/android/graphql/fragment/PostMetaData;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "getTitle", "Lcom/medium/android/graphql/type/PostVisibilityType;", "getVisibility", "Lcom/medium/android/graphql/fragment/PostMetaData$ViewerEdge;", "getViewerEdge", "getDetectedLanguage", "getMediumUrl", "Ljava/lang/Double;", "getReadingTime", "Ljava/lang/Long;", "getUpdatedAt", "Ljava/lang/Boolean;", "getAllowResponses", "Z", "getLatestPublishedVersion", "getFirstPublishedAt", "Lcom/medium/android/graphql/fragment/PostMetaData$PreviewImage;", "getPreviewImage", "Lcom/medium/android/graphql/fragment/PostMetaData$InResponseToPostResult;", "getInResponseToPostResult", "Lcom/medium/android/graphql/fragment/PostMetaData$InResponseToMediaResource;", "getInResponseToMediaResource", "Lcom/medium/android/graphql/type/InResponseToEntityType;", "getInResponseToEntityType", "getCanonicalUrl", "Lcom/medium/android/graphql/fragment/PostMetaData$Collection;", "getCollection", "Lcom/medium/android/graphql/fragment/PostMetaData$Creator;", "getCreator", "Lcom/medium/android/graphql/fragment/PostMetaData$PreviewContent;", "getPreviewContent", "getPinnedByCreatorAt", "Lcom/medium/android/graphql/fragment/PostClapsData;", "getPostClapsData", "Lcom/medium/android/graphql/fragment/ResponseCountData;", "getResponseCountData", "Lcom/medium/android/graphql/fragment/PostVisibilityData;", "getPostVisibilityData", "Lcom/medium/android/graphql/fragment/PostMenuData;", "getPostMenuData", "ViewerEdge", "PreviewImage", "InResponseToPostResult", "InResponseToMediaResource", "Collection", "Creator", "PreviewContent", "Paywall", "CreatorSpotlight", "MediumQuote", "Avatar", "ViewerEdge1", "LatestPostsConnection", "Post", "ViewerEdge2", "Verifications", "AdminCollection", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PostMetaData implements g15 {
    private final String __typename;
    private final Boolean allowResponses;
    private final String canonicalUrl;
    private final Collection collection;
    private final Creator creator;
    private final String detectedLanguage;
    private final Long firstPublishedAt;
    private final String id;
    private final InResponseToEntityType inResponseToEntityType;
    private final InResponseToMediaResource inResponseToMediaResource;
    private final InResponseToPostResult inResponseToPostResult;
    private final Boolean isLocked;
    private final boolean isNewsletter;
    private final boolean isProxyPost;
    private final String latestPublishedVersion;
    private final String mediumUrl;
    private final Long pinnedByCreatorAt;
    private final PostClapsData postClapsData;
    private final PostMenuData postMenuData;
    private final PostVisibilityData postVisibilityData;
    private final PreviewContent previewContent;
    private final PreviewImage previewImage;
    private final Double readingTime;
    private final ResponseCountData responseCountData;
    private final String title;
    private final Long updatedAt;
    private final ViewerEdge viewerEdge;
    private final PostVisibilityType visibility;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaData$AdminCollection;", "", "__typename", "", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class AdminCollection {
        private final String __typename;
        private final String id;

        public AdminCollection(String str, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
        }

        public static /* synthetic */ AdminCollection copy$default(AdminCollection adminCollection, String str, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = adminCollection.__typename;
            }
            if ((i & 2) != 0) {
                str2 = adminCollection.id;
            }
            return adminCollection.copy(str, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final AdminCollection copy(String __typename, String id) {
            __typename.getClass();
            id.getClass();
            return new AdminCollection(__typename, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof AdminCollection)) {
                return false;
            }
            AdminCollection adminCollection = (AdminCollection) other;
            return g76.L(this.__typename, adminCollection.__typename) && g76.L(this.id, adminCollection.id);
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ev6.y("AdminCollection(__typename=", this.__typename, ", id=", this.id, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaData$Avatar;", "", "__typename", "", "id", "imageMetadataData", "Lcom/medium/android/graphql/fragment/ImageMetadataData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ImageMetadataData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getImageMetadataData", "()Lcom/medium/android/graphql/fragment/ImageMetadataData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Avatar {
        private final String __typename;
        private final String id;
        private final ImageMetadataData imageMetadataData;

        public Avatar(String str, String str2, ImageMetadataData imageMetadataData) {
            str.getClass();
            str2.getClass();
            imageMetadataData.getClass();
            this.__typename = str;
            this.id = str2;
            this.imageMetadataData = imageMetadataData;
        }

        public static /* synthetic */ Avatar copy$default(Avatar avatar, String str, String str2, ImageMetadataData imageMetadataData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = avatar.__typename;
            }
            if ((i & 2) != 0) {
                str2 = avatar.id;
            }
            if ((i & 4) != 0) {
                imageMetadataData = avatar.imageMetadataData;
            }
            return avatar.copy(str, str2, imageMetadataData);
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

        public final Avatar copy(String __typename, String id, ImageMetadataData imageMetadataData) {
            __typename.getClass();
            id.getClass();
            imageMetadataData.getClass();
            return new Avatar(__typename, id, imageMetadataData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Avatar)) {
                return false;
            }
            Avatar avatar = (Avatar) other;
            return g76.L(this.__typename, avatar.__typename) && g76.L(this.id, avatar.id) && g76.L(this.imageMetadataData, avatar.imageMetadataData);
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
            StringBuilder sbU = y30.u("Avatar(__typename=", str, ", id=", str2, ", imageMetadataData=");
            sbU.append(imageMetadataData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b \n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001Bk\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\t\u001a\u0004\u0018\u00010\n\u0012\u0006\u0010\u000b\u001a\u00020\f\u0012\b\u0010\r\u001a\u0004\u0018\u00010\u000e\u0012\u0006\u0010\u000f\u001a\u00020\u0010\u0012\u0006\u0010\u0011\u001a\u00020\u0012¢\u0006\u0004\b\u0013\u0010\u0014J\t\u0010&\u001a\u00020\u0003HÆ\u0003J\t\u0010'\u001a\u00020\u0003HÆ\u0003J\u000b\u0010(\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010)\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010*\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010+\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010,\u001a\u0004\u0018\u00010\nHÆ\u0003J\t\u0010-\u001a\u00020\fHÆ\u0003J\u000b\u0010.\u001a\u0004\u0018\u00010\u000eHÆ\u0003J\t\u0010/\u001a\u00020\u0010HÆ\u0003J\t\u00100\u001a\u00020\u0012HÆ\u0003J\u0083\u0001\u00101\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\n2\b\b\u0002\u0010\u000b\u001a\u00020\f2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u000e2\b\b\u0002\u0010\u000f\u001a\u00020\u00102\b\b\u0002\u0010\u0011\u001a\u00020\u0012HÆ\u0001J\u0013\u00102\u001a\u0002032\b\u00104\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u00105\u001a\u000206HÖ\u0001J\t\u00107\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0016R\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0016R\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0016R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\u0016R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u0016R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\u0016R\u0013\u0010\t\u001a\u0004\u0018\u00010\n¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u001dR\u0011\u0010\u000b\u001a\u00020\f¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u001fR\u0013\u0010\r\u001a\u0004\u0018\u00010\u000e¢\u0006\b\n\u0000\u001a\u0004\b \u0010!R\u0011\u0010\u000f\u001a\u00020\u0010¢\u0006\b\n\u0000\u001a\u0004\b\"\u0010#R\u0011\u0010\u0011\u001a\u00020\u0012¢\u0006\b\n\u0000\u001a\u0004\b$\u0010%¨\u00068"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaData$Collection;", "", "__typename", "", "id", "slug", "name", "shortDescription", "description", "avatar", "Lcom/medium/android/graphql/fragment/PostMetaData$Avatar;", "viewerEdge", "Lcom/medium/android/graphql/fragment/PostMetaData$ViewerEdge1;", "latestPostsConnection", "Lcom/medium/android/graphql/fragment/PostMetaData$LatestPostsConnection;", "collectionNewsletterData", "Lcom/medium/android/graphql/fragment/CollectionNewsletterData;", "collectionFollowData", "Lcom/medium/android/graphql/fragment/CollectionFollowData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostMetaData$Avatar;Lcom/medium/android/graphql/fragment/PostMetaData$ViewerEdge1;Lcom/medium/android/graphql/fragment/PostMetaData$LatestPostsConnection;Lcom/medium/android/graphql/fragment/CollectionNewsletterData;Lcom/medium/android/graphql/fragment/CollectionFollowData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getSlug", "getName", "getShortDescription", "getDescription", "getAvatar", "()Lcom/medium/android/graphql/fragment/PostMetaData$Avatar;", "getViewerEdge", "()Lcom/medium/android/graphql/fragment/PostMetaData$ViewerEdge1;", "getLatestPostsConnection", "()Lcom/medium/android/graphql/fragment/PostMetaData$LatestPostsConnection;", "getCollectionNewsletterData", "()Lcom/medium/android/graphql/fragment/CollectionNewsletterData;", "getCollectionFollowData", "()Lcom/medium/android/graphql/fragment/CollectionFollowData;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "component10", "component11", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Collection {
        private final String __typename;
        private final Avatar avatar;
        private final CollectionFollowData collectionFollowData;
        private final CollectionNewsletterData collectionNewsletterData;
        private final String description;
        private final String id;
        private final LatestPostsConnection latestPostsConnection;
        private final String name;
        private final String shortDescription;
        private final String slug;
        private final ViewerEdge1 viewerEdge;

        public Collection(String str, String str2, String str3, String str4, String str5, String str6, Avatar avatar, ViewerEdge1 viewerEdge1, LatestPostsConnection latestPostsConnection, CollectionNewsletterData collectionNewsletterData, CollectionFollowData collectionFollowData) {
            str.getClass();
            str2.getClass();
            viewerEdge1.getClass();
            collectionNewsletterData.getClass();
            collectionFollowData.getClass();
            this.__typename = str;
            this.id = str2;
            this.slug = str3;
            this.name = str4;
            this.shortDescription = str5;
            this.description = str6;
            this.avatar = avatar;
            this.viewerEdge = viewerEdge1;
            this.latestPostsConnection = latestPostsConnection;
            this.collectionNewsletterData = collectionNewsletterData;
            this.collectionFollowData = collectionFollowData;
        }

        public static /* synthetic */ Collection copy$default(Collection collection, String str, String str2, String str3, String str4, String str5, String str6, Avatar avatar, ViewerEdge1 viewerEdge1, LatestPostsConnection latestPostsConnection, CollectionNewsletterData collectionNewsletterData, CollectionFollowData collectionFollowData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = collection.__typename;
            }
            if ((i & 2) != 0) {
                str2 = collection.id;
            }
            if ((i & 4) != 0) {
                str3 = collection.slug;
            }
            if ((i & 8) != 0) {
                str4 = collection.name;
            }
            if ((i & 16) != 0) {
                str5 = collection.shortDescription;
            }
            if ((i & 32) != 0) {
                str6 = collection.description;
            }
            if ((i & 64) != 0) {
                avatar = collection.avatar;
            }
            if ((i & 128) != 0) {
                viewerEdge1 = collection.viewerEdge;
            }
            if ((i & 256) != 0) {
                latestPostsConnection = collection.latestPostsConnection;
            }
            if ((i & 512) != 0) {
                collectionNewsletterData = collection.collectionNewsletterData;
            }
            if ((i & 1024) != 0) {
                collectionFollowData = collection.collectionFollowData;
            }
            CollectionNewsletterData collectionNewsletterData2 = collectionNewsletterData;
            CollectionFollowData collectionFollowData2 = collectionFollowData;
            ViewerEdge1 viewerEdge12 = viewerEdge1;
            LatestPostsConnection latestPostsConnection2 = latestPostsConnection;
            String str7 = str6;
            Avatar avatar2 = avatar;
            String str8 = str5;
            String str9 = str3;
            return collection.copy(str, str2, str9, str4, str8, str7, avatar2, viewerEdge12, latestPostsConnection2, collectionNewsletterData2, collectionFollowData2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component10, reason: from getter */
        public final CollectionNewsletterData getCollectionNewsletterData() {
            return this.collectionNewsletterData;
        }

        /* JADX INFO: renamed from: component11, reason: from getter */
        public final CollectionFollowData getCollectionFollowData() {
            return this.collectionFollowData;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getSlug() {
            return this.slug;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getName() {
            return this.name;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final String getShortDescription() {
            return this.shortDescription;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final String getDescription() {
            return this.description;
        }

        /* JADX INFO: renamed from: component7, reason: from getter */
        public final Avatar getAvatar() {
            return this.avatar;
        }

        /* JADX INFO: renamed from: component8, reason: from getter */
        public final ViewerEdge1 getViewerEdge() {
            return this.viewerEdge;
        }

        /* JADX INFO: renamed from: component9, reason: from getter */
        public final LatestPostsConnection getLatestPostsConnection() {
            return this.latestPostsConnection;
        }

        public final Collection copy(String __typename, String id, String slug, String name, String shortDescription, String description, Avatar avatar, ViewerEdge1 viewerEdge, LatestPostsConnection latestPostsConnection, CollectionNewsletterData collectionNewsletterData, CollectionFollowData collectionFollowData) {
            __typename.getClass();
            id.getClass();
            viewerEdge.getClass();
            collectionNewsletterData.getClass();
            collectionFollowData.getClass();
            return new Collection(__typename, id, slug, name, shortDescription, description, avatar, viewerEdge, latestPostsConnection, collectionNewsletterData, collectionFollowData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Collection)) {
                return false;
            }
            Collection collection = (Collection) other;
            return g76.L(this.__typename, collection.__typename) && g76.L(this.id, collection.id) && g76.L(this.slug, collection.slug) && g76.L(this.name, collection.name) && g76.L(this.shortDescription, collection.shortDescription) && g76.L(this.description, collection.description) && g76.L(this.avatar, collection.avatar) && g76.L(this.viewerEdge, collection.viewerEdge) && g76.L(this.latestPostsConnection, collection.latestPostsConnection) && g76.L(this.collectionNewsletterData, collection.collectionNewsletterData) && g76.L(this.collectionFollowData, collection.collectionFollowData);
        }

        public final Avatar getAvatar() {
            return this.avatar;
        }

        public final CollectionFollowData getCollectionFollowData() {
            return this.collectionFollowData;
        }

        public final CollectionNewsletterData getCollectionNewsletterData() {
            return this.collectionNewsletterData;
        }

        public final String getDescription() {
            return this.description;
        }

        public final String getId() {
            return this.id;
        }

        public final LatestPostsConnection getLatestPostsConnection() {
            return this.latestPostsConnection;
        }

        public final String getName() {
            return this.name;
        }

        public final String getShortDescription() {
            return this.shortDescription;
        }

        public final String getSlug() {
            return this.slug;
        }

        public final ViewerEdge1 getViewerEdge() {
            return this.viewerEdge;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.slug;
            int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.name;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.shortDescription;
            int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
            String str4 = this.description;
            int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
            Avatar avatar = this.avatar;
            int iHashCode5 = (this.viewerEdge.hashCode() + ((iHashCode4 + (avatar == null ? 0 : avatar.hashCode())) * 31)) * 31;
            LatestPostsConnection latestPostsConnection = this.latestPostsConnection;
            int iHashCode6 = latestPostsConnection != null ? latestPostsConnection.hashCode() : 0;
            return this.collectionFollowData.hashCode() + ((this.collectionNewsletterData.hashCode() + ((iHashCode5 + iHashCode6) * 31)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            String str3 = this.slug;
            String str4 = this.name;
            String str5 = this.shortDescription;
            String str6 = this.description;
            Avatar avatar = this.avatar;
            ViewerEdge1 viewerEdge1 = this.viewerEdge;
            LatestPostsConnection latestPostsConnection = this.latestPostsConnection;
            CollectionNewsletterData collectionNewsletterData = this.collectionNewsletterData;
            CollectionFollowData collectionFollowData = this.collectionFollowData;
            StringBuilder sbU = y30.u("Collection(__typename=", str, ", id=", str2, ", slug=");
            ka1.C(sbU, str3, ", name=", str4, ", shortDescription=");
            ka1.C(sbU, str5, ", description=", str6, ", avatar=");
            sbU.append(avatar);
            sbU.append(", viewerEdge=");
            sbU.append(viewerEdge1);
            sbU.append(", latestPostsConnection=");
            sbU.append(latestPostsConnection);
            sbU.append(", collectionNewsletterData=");
            sbU.append(collectionNewsletterData);
            sbU.append(", collectionFollowData=");
            sbU.append(collectionFollowData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000P\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\b\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b/\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0099\u0001\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\n\u001a\u00020\u0003\u0012\u0006\u0010\u000b\u001a\u00020\f\u0012\u0006\u0010\r\u001a\u00020\u000e\u0012\b\u0010\u000f\u001a\u0004\u0018\u00010\u0010\u0012\f\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00130\u0012\u0012\u0006\u0010\u0014\u001a\u00020\u0015\u0012\u0006\u0010\u0016\u001a\u00020\u0017\u0012\u0006\u0010\u0018\u001a\u00020\u0019\u0012\u0006\u0010\u001a\u001a\u00020\u001b¢\u0006\u0004\b\u001c\u0010\u001dJ\t\u00107\u001a\u00020\u0003HÆ\u0003J\t\u00108\u001a\u00020\u0003HÆ\u0003J\u000b\u00109\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010:\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010;\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010<\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010=\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010>\u001a\u00020\u0003HÆ\u0003J\t\u0010?\u001a\u00020\fHÆ\u0003J\t\u0010@\u001a\u00020\u000eHÆ\u0003J\u000b\u0010A\u001a\u0004\u0018\u00010\u0010HÆ\u0003J\u000f\u0010B\u001a\b\u0012\u0004\u0012\u00020\u00130\u0012HÆ\u0003J\t\u0010C\u001a\u00020\u0015HÆ\u0003J\t\u0010D\u001a\u00020\u0017HÆ\u0003J\t\u0010E\u001a\u00020\u0019HÆ\u0003J\t\u0010F\u001a\u00020\u001bHÆ\u0003J»\u0001\u0010G\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\n\u001a\u00020\u00032\b\b\u0002\u0010\u000b\u001a\u00020\f2\b\b\u0002\u0010\r\u001a\u00020\u000e2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u00102\u000e\b\u0002\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00130\u00122\b\b\u0002\u0010\u0014\u001a\u00020\u00152\b\b\u0002\u0010\u0016\u001a\u00020\u00172\b\b\u0002\u0010\u0018\u001a\u00020\u00192\b\b\u0002\u0010\u001a\u001a\u00020\u001bHÆ\u0001J\u0013\u0010H\u001a\u00020\f2\b\u0010I\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010J\u001a\u00020KHÖ\u0001J\t\u0010L\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u001fR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b \u0010\u001fR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b!\u0010\u001fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\"\u0010\u001fR\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b#\u0010\u001fR\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b$\u0010\u001fR\u0013\u0010\t\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b%\u0010\u001fR\u0011\u0010\n\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b&\u0010\u001fR\u0011\u0010\u000b\u001a\u00020\f¢\u0006\b\n\u0000\u001a\u0004\b'\u0010(R\u0011\u0010\r\u001a\u00020\u000e¢\u0006\b\n\u0000\u001a\u0004\b)\u0010*R\u0013\u0010\u000f\u001a\u0004\u0018\u00010\u0010¢\u0006\b\n\u0000\u001a\u0004\b+\u0010,R\u0017\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00130\u0012¢\u0006\b\n\u0000\u001a\u0004\b-\u0010.R\u0011\u0010\u0014\u001a\u00020\u0015¢\u0006\b\n\u0000\u001a\u0004\b/\u00100R\u0011\u0010\u0016\u001a\u00020\u0017¢\u0006\b\n\u0000\u001a\u0004\b1\u00102R\u0011\u0010\u0018\u001a\u00020\u0019¢\u0006\b\n\u0000\u001a\u0004\b3\u00104R\u0011\u0010\u001a\u001a\u00020\u001b¢\u0006\b\n\u0000\u001a\u0004\b5\u00106¨\u0006M"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaData$Creator;", "", "__typename", "", "id", "name", "username", "bio", "tippingLink", "imageId", "twitterScreenName", "hasSubdomain", "", "viewerEdge", "Lcom/medium/android/graphql/fragment/PostMetaData$ViewerEdge2;", "verifications", "Lcom/medium/android/graphql/fragment/PostMetaData$Verifications;", "adminCollections", "", "Lcom/medium/android/graphql/fragment/PostMetaData$AdminCollection;", "userBlockData", "Lcom/medium/android/graphql/fragment/UserBlockData;", "userFollowData", "Lcom/medium/android/graphql/fragment/UserFollowData;", "userNewsletterData", "Lcom/medium/android/graphql/fragment/UserNewsletterData;", "userMuteData", "Lcom/medium/android/graphql/fragment/UserMuteData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/medium/android/graphql/fragment/PostMetaData$ViewerEdge2;Lcom/medium/android/graphql/fragment/PostMetaData$Verifications;Ljava/util/List;Lcom/medium/android/graphql/fragment/UserBlockData;Lcom/medium/android/graphql/fragment/UserFollowData;Lcom/medium/android/graphql/fragment/UserNewsletterData;Lcom/medium/android/graphql/fragment/UserMuteData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getName", "getUsername", "getBio", "getTippingLink", "getImageId", "getTwitterScreenName", "getHasSubdomain", "()Z", "getViewerEdge", "()Lcom/medium/android/graphql/fragment/PostMetaData$ViewerEdge2;", "getVerifications", "()Lcom/medium/android/graphql/fragment/PostMetaData$Verifications;", "getAdminCollections", "()Ljava/util/List;", "getUserBlockData", "()Lcom/medium/android/graphql/fragment/UserBlockData;", "getUserFollowData", "()Lcom/medium/android/graphql/fragment/UserFollowData;", "getUserNewsletterData", "()Lcom/medium/android/graphql/fragment/UserNewsletterData;", "getUserMuteData", "()Lcom/medium/android/graphql/fragment/UserMuteData;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "component10", "component11", "component12", "component13", "component14", "component15", "component16", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Creator {
        private final String __typename;
        private final List<AdminCollection> adminCollections;
        private final String bio;
        private final boolean hasSubdomain;
        private final String id;
        private final String imageId;
        private final String name;
        private final String tippingLink;
        private final String twitterScreenName;
        private final UserBlockData userBlockData;
        private final UserFollowData userFollowData;
        private final UserMuteData userMuteData;
        private final UserNewsletterData userNewsletterData;
        private final String username;
        private final Verifications verifications;
        private final ViewerEdge2 viewerEdge;

        public Creator(String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, boolean z, ViewerEdge2 viewerEdge2, Verifications verifications, List<AdminCollection> list, UserBlockData userBlockData, UserFollowData userFollowData, UserNewsletterData userNewsletterData, UserMuteData userMuteData) {
            str.getClass();
            str2.getClass();
            str8.getClass();
            viewerEdge2.getClass();
            list.getClass();
            userBlockData.getClass();
            userFollowData.getClass();
            userNewsletterData.getClass();
            userMuteData.getClass();
            this.__typename = str;
            this.id = str2;
            this.name = str3;
            this.username = str4;
            this.bio = str5;
            this.tippingLink = str6;
            this.imageId = str7;
            this.twitterScreenName = str8;
            this.hasSubdomain = z;
            this.viewerEdge = viewerEdge2;
            this.verifications = verifications;
            this.adminCollections = list;
            this.userBlockData = userBlockData;
            this.userFollowData = userFollowData;
            this.userNewsletterData = userNewsletterData;
            this.userMuteData = userMuteData;
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component10, reason: from getter */
        public final ViewerEdge2 getViewerEdge() {
            return this.viewerEdge;
        }

        /* JADX INFO: renamed from: component11, reason: from getter */
        public final Verifications getVerifications() {
            return this.verifications;
        }

        public final List<AdminCollection> component12() {
            return this.adminCollections;
        }

        /* JADX INFO: renamed from: component13, reason: from getter */
        public final UserBlockData getUserBlockData() {
            return this.userBlockData;
        }

        /* JADX INFO: renamed from: component14, reason: from getter */
        public final UserFollowData getUserFollowData() {
            return this.userFollowData;
        }

        /* JADX INFO: renamed from: component15, reason: from getter */
        public final UserNewsletterData getUserNewsletterData() {
            return this.userNewsletterData;
        }

        /* JADX INFO: renamed from: component16, reason: from getter */
        public final UserMuteData getUserMuteData() {
            return this.userMuteData;
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
        public final String getUsername() {
            return this.username;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final String getBio() {
            return this.bio;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final String getTippingLink() {
            return this.tippingLink;
        }

        /* JADX INFO: renamed from: component7, reason: from getter */
        public final String getImageId() {
            return this.imageId;
        }

        /* JADX INFO: renamed from: component8, reason: from getter */
        public final String getTwitterScreenName() {
            return this.twitterScreenName;
        }

        /* JADX INFO: renamed from: component9, reason: from getter */
        public final boolean getHasSubdomain() {
            return this.hasSubdomain;
        }

        public final Creator copy(String __typename, String id, String name, String username, String bio, String tippingLink, String imageId, String twitterScreenName, boolean hasSubdomain, ViewerEdge2 viewerEdge, Verifications verifications, List<AdminCollection> adminCollections, UserBlockData userBlockData, UserFollowData userFollowData, UserNewsletterData userNewsletterData, UserMuteData userMuteData) {
            __typename.getClass();
            id.getClass();
            twitterScreenName.getClass();
            viewerEdge.getClass();
            adminCollections.getClass();
            userBlockData.getClass();
            userFollowData.getClass();
            userNewsletterData.getClass();
            userMuteData.getClass();
            return new Creator(__typename, id, name, username, bio, tippingLink, imageId, twitterScreenName, hasSubdomain, viewerEdge, verifications, adminCollections, userBlockData, userFollowData, userNewsletterData, userMuteData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Creator)) {
                return false;
            }
            Creator creator = (Creator) other;
            return g76.L(this.__typename, creator.__typename) && g76.L(this.id, creator.id) && g76.L(this.name, creator.name) && g76.L(this.username, creator.username) && g76.L(this.bio, creator.bio) && g76.L(this.tippingLink, creator.tippingLink) && g76.L(this.imageId, creator.imageId) && g76.L(this.twitterScreenName, creator.twitterScreenName) && this.hasSubdomain == creator.hasSubdomain && g76.L(this.viewerEdge, creator.viewerEdge) && g76.L(this.verifications, creator.verifications) && g76.L(this.adminCollections, creator.adminCollections) && g76.L(this.userBlockData, creator.userBlockData) && g76.L(this.userFollowData, creator.userFollowData) && g76.L(this.userNewsletterData, creator.userNewsletterData) && g76.L(this.userMuteData, creator.userMuteData);
        }

        public final List<AdminCollection> getAdminCollections() {
            return this.adminCollections;
        }

        public final String getBio() {
            return this.bio;
        }

        public final boolean getHasSubdomain() {
            return this.hasSubdomain;
        }

        public final String getId() {
            return this.id;
        }

        public final String getImageId() {
            return this.imageId;
        }

        public final String getName() {
            return this.name;
        }

        public final String getTippingLink() {
            return this.tippingLink;
        }

        public final String getTwitterScreenName() {
            return this.twitterScreenName;
        }

        public final UserBlockData getUserBlockData() {
            return this.userBlockData;
        }

        public final UserFollowData getUserFollowData() {
            return this.userFollowData;
        }

        public final UserMuteData getUserMuteData() {
            return this.userMuteData;
        }

        public final UserNewsletterData getUserNewsletterData() {
            return this.userNewsletterData;
        }

        public final String getUsername() {
            return this.username;
        }

        public final Verifications getVerifications() {
            return this.verifications;
        }

        public final ViewerEdge2 getViewerEdge() {
            return this.viewerEdge;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.name;
            int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.username;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.bio;
            int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
            String str4 = this.tippingLink;
            int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
            String str5 = this.imageId;
            int iHashCode5 = (this.viewerEdge.hashCode() + ((wgd.o((iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31, 31, this.twitterScreenName) + (this.hasSubdomain ? 1231 : 1237)) * 31)) * 31;
            Verifications verifications = this.verifications;
            return this.userMuteData.hashCode() + ((this.userNewsletterData.hashCode() + ((this.userFollowData.hashCode() + ((this.userBlockData.hashCode() + wgd.p((iHashCode5 + (verifications != null ? verifications.hashCode() : 0)) * 31, 31, this.adminCollections)) * 31)) * 31)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            String str3 = this.name;
            String str4 = this.username;
            String str5 = this.bio;
            String str6 = this.tippingLink;
            String str7 = this.imageId;
            String str8 = this.twitterScreenName;
            boolean z = this.hasSubdomain;
            ViewerEdge2 viewerEdge2 = this.viewerEdge;
            Verifications verifications = this.verifications;
            List<AdminCollection> list = this.adminCollections;
            UserBlockData userBlockData = this.userBlockData;
            UserFollowData userFollowData = this.userFollowData;
            UserNewsletterData userNewsletterData = this.userNewsletterData;
            UserMuteData userMuteData = this.userMuteData;
            StringBuilder sbU = y30.u("Creator(__typename=", str, ", id=", str2, ", name=");
            ka1.C(sbU, str3, ", username=", str4, ", bio=");
            ka1.C(sbU, str5, ", tippingLink=", str6, ", imageId=");
            ka1.C(sbU, str7, ", twitterScreenName=", str8, ", hasSubdomain=");
            sbU.append(z);
            sbU.append(", viewerEdge=");
            sbU.append(viewerEdge2);
            sbU.append(", verifications=");
            sbU.append(verifications);
            sbU.append(Plbho.AjDVtjD);
            sbU.append(list);
            sbU.append(", userBlockData=");
            sbU.append(userBlockData);
            sbU.append(uuLAxLN.kLZT);
            sbU.append(userFollowData);
            sbU.append(", userNewsletterData=");
            sbU.append(userNewsletterData);
            sbU.append(", userMuteData=");
            sbU.append(userMuteData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0016\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B;\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0003\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0016\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0017\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0018\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010\u0019\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u001a\u001a\u0004\u0018\u00010\tHÆ\u0003¢\u0006\u0002\u0010\u0013JN\u0010\u001b\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\tHÆ\u0001¢\u0006\u0002\u0010\u001cJ\u0013\u0010\u001d\u001a\u00020\t2\b\u0010\u001e\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001f\u001a\u00020 HÖ\u0001J\t\u0010!\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\rR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\rR\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\rR\u0015\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\n\n\u0002\u0010\u0014\u001a\u0004\b\u0012\u0010\u0013¨\u0006\""}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaData$CreatorSpotlight;", "", "__typename", "", "name", "jobTitle", "company", "imageId", "hideOnMediumScreen", "", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V", "get__typename", "()Ljava/lang/String;", "getName", "getJobTitle", "getCompany", "getImageId", "getHideOnMediumScreen", "()Ljava/lang/Boolean;", "Ljava/lang/Boolean;", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)Lcom/medium/android/graphql/fragment/PostMetaData$CreatorSpotlight;", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class CreatorSpotlight {
        private final String __typename;
        private final String company;
        private final Boolean hideOnMediumScreen;
        private final String imageId;
        private final String jobTitle;
        private final String name;

        public CreatorSpotlight(String str, String str2, String str3, String str4, String str5, Boolean bool) {
            ho2.Q(str, str2, str3, str5);
            this.__typename = str;
            this.name = str2;
            this.jobTitle = str3;
            this.company = str4;
            this.imageId = str5;
            this.hideOnMediumScreen = bool;
        }

        public static /* synthetic */ CreatorSpotlight copy$default(CreatorSpotlight creatorSpotlight, String str, String str2, String str3, String str4, String str5, Boolean bool, int i, Object obj) {
            if ((i & 1) != 0) {
                str = creatorSpotlight.__typename;
            }
            if ((i & 2) != 0) {
                str2 = creatorSpotlight.name;
            }
            if ((i & 4) != 0) {
                str3 = creatorSpotlight.jobTitle;
            }
            if ((i & 8) != 0) {
                str4 = creatorSpotlight.company;
            }
            if ((i & 16) != 0) {
                str5 = creatorSpotlight.imageId;
            }
            if ((i & 32) != 0) {
                bool = creatorSpotlight.hideOnMediumScreen;
            }
            String str6 = str5;
            Boolean bool2 = bool;
            return creatorSpotlight.copy(str, str2, str3, str4, str6, bool2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getName() {
            return this.name;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getJobTitle() {
            return this.jobTitle;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getCompany() {
            return this.company;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final String getImageId() {
            return this.imageId;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final Boolean getHideOnMediumScreen() {
            return this.hideOnMediumScreen;
        }

        public final CreatorSpotlight copy(String __typename, String name, String jobTitle, String company, String imageId, Boolean hideOnMediumScreen) {
            __typename.getClass();
            name.getClass();
            jobTitle.getClass();
            imageId.getClass();
            return new CreatorSpotlight(__typename, name, jobTitle, company, imageId, hideOnMediumScreen);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof CreatorSpotlight)) {
                return false;
            }
            CreatorSpotlight creatorSpotlight = (CreatorSpotlight) other;
            return g76.L(this.__typename, creatorSpotlight.__typename) && g76.L(this.name, creatorSpotlight.name) && g76.L(this.jobTitle, creatorSpotlight.jobTitle) && g76.L(this.company, creatorSpotlight.company) && g76.L(this.imageId, creatorSpotlight.imageId) && g76.L(this.hideOnMediumScreen, creatorSpotlight.hideOnMediumScreen);
        }

        public final String getCompany() {
            return this.company;
        }

        public final Boolean getHideOnMediumScreen() {
            return this.hideOnMediumScreen;
        }

        public final String getImageId() {
            return this.imageId;
        }

        public final String getJobTitle() {
            return this.jobTitle;
        }

        public final String getName() {
            return this.name;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(wgd.o(this.__typename.hashCode() * 31, 31, this.name), 31, this.jobTitle);
            String str = this.company;
            int iO2 = wgd.o((iO + (str == null ? 0 : str.hashCode())) * 31, 31, this.imageId);
            Boolean bool = this.hideOnMediumScreen;
            return iO2 + (bool != null ? bool.hashCode() : 0);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.name;
            String str3 = this.jobTitle;
            String str4 = this.company;
            String str5 = this.imageId;
            Boolean bool = this.hideOnMediumScreen;
            StringBuilder sbU = y30.u("CreatorSpotlight(__typename=", str, ", name=", str2, ", jobTitle=");
            ka1.C(sbU, str3, ", company=", str4, ", imageId=");
            sbU.append(str5);
            sbU.append(", hideOnMediumScreen=");
            sbU.append(bool);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000f\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J)\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaData$InResponseToMediaResource;", "", "__typename", "", "mediumQuote", "Lcom/medium/android/graphql/fragment/PostMetaData$MediumQuote;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostMetaData$MediumQuote;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getMediumQuote", "()Lcom/medium/android/graphql/fragment/PostMetaData$MediumQuote;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class InResponseToMediaResource {
        private final String __typename;
        private final String id;
        private final MediumQuote mediumQuote;

        public InResponseToMediaResource(String str, MediumQuote mediumQuote, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.mediumQuote = mediumQuote;
            this.id = str2;
        }

        public static /* synthetic */ InResponseToMediaResource copy$default(InResponseToMediaResource inResponseToMediaResource, String str, MediumQuote mediumQuote, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = inResponseToMediaResource.__typename;
            }
            if ((i & 2) != 0) {
                mediumQuote = inResponseToMediaResource.mediumQuote;
            }
            if ((i & 4) != 0) {
                str2 = inResponseToMediaResource.id;
            }
            return inResponseToMediaResource.copy(str, mediumQuote, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final MediumQuote getMediumQuote() {
            return this.mediumQuote;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final InResponseToMediaResource copy(String __typename, MediumQuote mediumQuote, String id) {
            __typename.getClass();
            id.getClass();
            return new InResponseToMediaResource(__typename, mediumQuote, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof InResponseToMediaResource)) {
                return false;
            }
            InResponseToMediaResource inResponseToMediaResource = (InResponseToMediaResource) other;
            return g76.L(this.__typename, inResponseToMediaResource.__typename) && g76.L(this.mediumQuote, inResponseToMediaResource.mediumQuote) && g76.L(this.id, inResponseToMediaResource.id);
        }

        public final String getId() {
            return this.id;
        }

        public final MediumQuote getMediumQuote() {
            return this.mediumQuote;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            MediumQuote mediumQuote = this.mediumQuote;
            return this.id.hashCode() + ((iHashCode + (mediumQuote == null ? 0 : mediumQuote.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            MediumQuote mediumQuote = this.mediumQuote;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("InResponseToMediaResource(__typename=");
            sb.append(str);
            sb.append(", mediumQuote=");
            sb.append(mediumQuote);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaData$InResponseToPostResult;", "", "__typename", "", "inResponseToPost", "Lcom/medium/android/graphql/fragment/InResponseToPost;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/InResponseToPost;)V", "get__typename", "()Ljava/lang/String;", "getInResponseToPost", "()Lcom/medium/android/graphql/fragment/InResponseToPost;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class InResponseToPostResult {
        private final String __typename;
        private final InResponseToPost inResponseToPost;

        public InResponseToPostResult(String str, InResponseToPost inResponseToPost) {
            str.getClass();
            this.__typename = str;
            this.inResponseToPost = inResponseToPost;
        }

        public static /* synthetic */ InResponseToPostResult copy$default(InResponseToPostResult inResponseToPostResult, String str, InResponseToPost inResponseToPost, int i, Object obj) {
            if ((i & 1) != 0) {
                str = inResponseToPostResult.__typename;
            }
            if ((i & 2) != 0) {
                inResponseToPost = inResponseToPostResult.inResponseToPost;
            }
            return inResponseToPostResult.copy(str, inResponseToPost);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final InResponseToPost getInResponseToPost() {
            return this.inResponseToPost;
        }

        public final InResponseToPostResult copy(String __typename, InResponseToPost inResponseToPost) {
            __typename.getClass();
            return new InResponseToPostResult(__typename, inResponseToPost);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof InResponseToPostResult)) {
                return false;
            }
            InResponseToPostResult inResponseToPostResult = (InResponseToPostResult) other;
            return g76.L(this.__typename, inResponseToPostResult.__typename) && g76.L(this.inResponseToPost, inResponseToPostResult.inResponseToPost);
        }

        public final InResponseToPost getInResponseToPost() {
            return this.inResponseToPost;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            InResponseToPost inResponseToPost = this.inResponseToPost;
            return iHashCode + (inResponseToPost == null ? 0 : inResponseToPost.hashCode());
        }

        public final String toString() {
            return "InResponseToPostResult(__typename=" + this.__typename + ", inResponseToPost=" + this.inResponseToPost + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000e\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u0011\u0010\u000e\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005HÆ\u0003J%\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0019\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaData$LatestPostsConnection;", "", "__typename", "", "posts", "", "Lcom/medium/android/graphql/fragment/PostMetaData$Post;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getPosts", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class LatestPostsConnection {
        private final String __typename;
        private final List<Post> posts;

        public LatestPostsConnection(String str, List<Post> list) {
            str.getClass();
            this.__typename = str;
            this.posts = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ LatestPostsConnection copy$default(LatestPostsConnection latestPostsConnection, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = latestPostsConnection.__typename;
            }
            if ((i & 2) != 0) {
                list = latestPostsConnection.posts;
            }
            return latestPostsConnection.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Post> component2() {
            return this.posts;
        }

        public final LatestPostsConnection copy(String __typename, List<Post> posts) {
            __typename.getClass();
            return new LatestPostsConnection(__typename, posts);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof LatestPostsConnection)) {
                return false;
            }
            LatestPostsConnection latestPostsConnection = (LatestPostsConnection) other;
            return g76.L(this.__typename, latestPostsConnection.__typename) && g76.L(this.posts, latestPostsConnection.posts);
        }

        public final List<Post> getPosts() {
            return this.posts;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            List<Post> list = this.posts;
            return iHashCode + (list == null ? 0 : list.hashCode());
        }

        public final String toString() {
            return ka1.s("LatestPostsConnection(__typename=", this.__typename, ", posts=", ")", this.posts);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaData$MediumQuote;", "", "__typename", "", "id", "highlightData", "Lcom/medium/android/graphql/fragment/HighlightData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/HighlightData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getHighlightData", "()Lcom/medium/android/graphql/fragment/HighlightData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class MediumQuote {
        private final String __typename;
        private final HighlightData highlightData;
        private final String id;

        public MediumQuote(String str, String str2, HighlightData highlightData) {
            str.getClass();
            str2.getClass();
            highlightData.getClass();
            this.__typename = str;
            this.id = str2;
            this.highlightData = highlightData;
        }

        public static /* synthetic */ MediumQuote copy$default(MediumQuote mediumQuote, String str, String str2, HighlightData highlightData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = mediumQuote.__typename;
            }
            if ((i & 2) != 0) {
                str2 = mediumQuote.id;
            }
            if ((i & 4) != 0) {
                highlightData = mediumQuote.highlightData;
            }
            return mediumQuote.copy(str, str2, highlightData);
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
        public final HighlightData getHighlightData() {
            return this.highlightData;
        }

        public final MediumQuote copy(String __typename, String id, HighlightData highlightData) {
            __typename.getClass();
            id.getClass();
            highlightData.getClass();
            return new MediumQuote(__typename, id, highlightData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof MediumQuote)) {
                return false;
            }
            MediumQuote mediumQuote = (MediumQuote) other;
            return g76.L(this.__typename, mediumQuote.__typename) && g76.L(this.id, mediumQuote.id) && g76.L(this.highlightData, mediumQuote.highlightData);
        }

        public final HighlightData getHighlightData() {
            return this.highlightData;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.highlightData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            HighlightData highlightData = this.highlightData;
            StringBuilder sbU = y30.u("MediumQuote(__typename=", str, ", id=", str2, ", highlightData=");
            sbU.append(highlightData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B%\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0005HÆ\u0003J\u000f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\b0\u0007HÆ\u0003J-\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\u000e\b\u0002\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007HÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0017\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaData$Paywall;", "", "__typename", "", "type", "Lcom/medium/android/graphql/type/PostPaywallType;", "creatorSpotlights", "", "Lcom/medium/android/graphql/fragment/PostMetaData$CreatorSpotlight;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/PostPaywallType;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getType", "()Lcom/medium/android/graphql/type/PostPaywallType;", "getCreatorSpotlights", "()Ljava/util/List;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Paywall {
        private final String __typename;
        private final List<CreatorSpotlight> creatorSpotlights;
        private final PostPaywallType type;

        public Paywall(String str, PostPaywallType postPaywallType, List<CreatorSpotlight> list) {
            str.getClass();
            postPaywallType.getClass();
            list.getClass();
            this.__typename = str;
            this.type = postPaywallType;
            this.creatorSpotlights = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ Paywall copy$default(Paywall paywall, String str, PostPaywallType postPaywallType, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = paywall.__typename;
            }
            if ((i & 2) != 0) {
                postPaywallType = paywall.type;
            }
            if ((i & 4) != 0) {
                list = paywall.creatorSpotlights;
            }
            return paywall.copy(str, postPaywallType, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PostPaywallType getType() {
            return this.type;
        }

        public final List<CreatorSpotlight> component3() {
            return this.creatorSpotlights;
        }

        public final Paywall copy(String __typename, PostPaywallType type, List<CreatorSpotlight> creatorSpotlights) {
            __typename.getClass();
            type.getClass();
            creatorSpotlights.getClass();
            return new Paywall(__typename, type, creatorSpotlights);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Paywall)) {
                return false;
            }
            Paywall paywall = (Paywall) other;
            return g76.L(this.__typename, paywall.__typename) && this.type == paywall.type && g76.L(this.creatorSpotlights, paywall.creatorSpotlights);
        }

        public final List<CreatorSpotlight> getCreatorSpotlights() {
            return this.creatorSpotlights;
        }

        public final PostPaywallType getType() {
            return this.type;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.creatorSpotlights.hashCode() + ((this.type.hashCode() + (this.__typename.hashCode() * 31)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            PostPaywallType postPaywallType = this.type;
            List<CreatorSpotlight> list = this.creatorSpotlights;
            StringBuilder sb = new StringBuilder("Paywall(__typename=");
            sb.append(str);
            sb.append(", type=");
            sb.append(postPaywallType);
            sb.append(", creatorSpotlights=");
            return b09.B(sb, list, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u000e\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0011\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0002\u0010\rJ.\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006HÆ\u0001¢\u0006\u0002\u0010\u0013J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0015\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\n\n\u0002\u0010\u000e\u001a\u0004\b\f\u0010\r¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaData$Post;", "", "__typename", "", "id", "latestPublishedAt", "", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)V", "get__typename", "()Ljava/lang/String;", "getId", "getLatestPublishedAt", "()Ljava/lang/Long;", "Ljava/lang/Long;", "component1", "component2", "component3", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)Lcom/medium/android/graphql/fragment/PostMetaData$Post;", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Post {
        private final String __typename;
        private final String id;
        private final Long latestPublishedAt;

        public Post(String str, String str2, Long l) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.latestPublishedAt = l;
        }

        public static /* synthetic */ Post copy$default(Post post, String str, String str2, Long l, int i, Object obj) {
            if ((i & 1) != 0) {
                str = post.__typename;
            }
            if ((i & 2) != 0) {
                str2 = post.id;
            }
            if ((i & 4) != 0) {
                l = post.latestPublishedAt;
            }
            return post.copy(str, str2, l);
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
        public final Long getLatestPublishedAt() {
            return this.latestPublishedAt;
        }

        public final Post copy(String __typename, String id, Long latestPublishedAt) {
            __typename.getClass();
            id.getClass();
            return new Post(__typename, id, latestPublishedAt);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Post)) {
                return false;
            }
            Post post = (Post) other;
            return g76.L(this.__typename, post.__typename) && g76.L(this.id, post.id) && g76.L(this.latestPublishedAt, post.latestPublishedAt);
        }

        public final String getId() {
            return this.id;
        }

        public final Long getLatestPublishedAt() {
            return this.latestPublishedAt;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            Long l = this.latestPublishedAt;
            return iO + (l == null ? 0 : l.hashCode());
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            Long l = this.latestPublishedAt;
            StringBuilder sbU = y30.u("Post(__typename=", str, ", id=", str2, ", latestPublishedAt=");
            sbU.append(l);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u001f\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaData$PreviewContent;", "", "__typename", "", "subtitle", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getSubtitle", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaData$PreviewImage;", "", "__typename", "", "id", "imageMetadataData", "Lcom/medium/android/graphql/fragment/ImageMetadataData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ImageMetadataData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getImageMetadataData", "()Lcom/medium/android/graphql/fragment/ImageMetadataData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PreviewImage {
        private final String __typename;
        private final String id;
        private final ImageMetadataData imageMetadataData;

        public PreviewImage(String str, String str2, ImageMetadataData imageMetadataData) {
            str.getClass();
            str2.getClass();
            imageMetadataData.getClass();
            this.__typename = str;
            this.id = str2;
            this.imageMetadataData = imageMetadataData;
        }

        public static /* synthetic */ PreviewImage copy$default(PreviewImage previewImage, String str, String str2, ImageMetadataData imageMetadataData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = previewImage.__typename;
            }
            if ((i & 2) != 0) {
                str2 = previewImage.id;
            }
            if ((i & 4) != 0) {
                imageMetadataData = previewImage.imageMetadataData;
            }
            return previewImage.copy(str, str2, imageMetadataData);
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

        public final PreviewImage copy(String __typename, String id, ImageMetadataData imageMetadataData) {
            __typename.getClass();
            id.getClass();
            imageMetadataData.getClass();
            return new PreviewImage(__typename, id, imageMetadataData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PreviewImage)) {
                return false;
            }
            PreviewImage previewImage = (PreviewImage) other;
            return g76.L(this.__typename, previewImage.__typename) && g76.L(this.id, previewImage.id) && g76.L(this.imageMetadataData, previewImage.imageMetadataData);
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
            StringBuilder sbU = y30.u("PreviewImage(__typename=", str, ", id=", str2, ", imageMetadataData=");
            sbU.append(imageMetadataData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\t\u0010\f\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\r\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000e\u001a\u00020\u00052\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\n¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaData$Verifications;", "", "__typename", "", "isBookAuthor", "", "<init>", "(Ljava/lang/String;Z)V", "get__typename", "()Ljava/lang/String;", "()Z", "component1", "component2", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Verifications {
        private final String __typename;
        private final boolean isBookAuthor;

        public Verifications(String str, boolean z) {
            str.getClass();
            this.__typename = str;
            this.isBookAuthor = z;
        }

        public static /* synthetic */ Verifications copy$default(Verifications verifications, String str, boolean z, int i, Object obj) {
            if ((i & 1) != 0) {
                str = verifications.__typename;
            }
            if ((i & 2) != 0) {
                z = verifications.isBookAuthor;
            }
            return verifications.copy(str, z);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final boolean getIsBookAuthor() {
            return this.isBookAuthor;
        }

        public final Verifications copy(String __typename, boolean isBookAuthor) {
            __typename.getClass();
            return new Verifications(__typename, isBookAuthor);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Verifications)) {
                return false;
            }
            Verifications verifications = (Verifications) other;
            return g76.L(this.__typename, verifications.__typename) && this.isBookAuthor == verifications.isBookAuthor;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return (this.__typename.hashCode() * 31) + (this.isBookAuthor ? 1231 : 1237);
        }

        public final boolean isBookAuthor() {
            return this.isBookAuthor;
        }

        public final String toString() {
            return km4.z("Verifications(__typename=", this.__typename, ", isBookAuthor=", ")", this.isBookAuthor);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B+\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0006HÆ\u0003J\u000b\u0010\u0013\u001a\u0004\u0018\u00010\u0003HÆ\u0003J5\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000b¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaData$ViewerEdge;", "", "__typename", "", "id", "paywall", "Lcom/medium/android/graphql/fragment/PostMetaData$Paywall;", "shareKey", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostMetaData$Paywall;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "getPaywall", "()Lcom/medium/android/graphql/fragment/PostMetaData$Paywall;", "getShareKey", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final String id;
        private final Paywall paywall;
        private final String shareKey;

        public ViewerEdge(String str, String str2, Paywall paywall, String str3) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.paywall = paywall;
            this.shareKey = str3;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, String str2, Paywall paywall, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                str2 = viewerEdge.id;
            }
            if ((i & 4) != 0) {
                paywall = viewerEdge.paywall;
            }
            if ((i & 8) != 0) {
                str3 = viewerEdge.shareKey;
            }
            return viewerEdge.copy(str, str2, paywall, str3);
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
        public final Paywall getPaywall() {
            return this.paywall;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getShareKey() {
            return this.shareKey;
        }

        public final ViewerEdge copy(String __typename, String id, Paywall paywall, String shareKey) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, id, paywall, shareKey);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && g76.L(this.id, viewerEdge.id) && g76.L(this.paywall, viewerEdge.paywall) && g76.L(this.shareKey, viewerEdge.shareKey);
        }

        public final String getId() {
            return this.id;
        }

        public final Paywall getPaywall() {
            return this.paywall;
        }

        public final String getShareKey() {
            return this.shareKey;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            Paywall paywall = this.paywall;
            int iHashCode = (iO + (paywall == null ? 0 : paywall.hashCode())) * 31;
            String str = this.shareKey;
            return iHashCode + (str != null ? str.hashCode() : 0);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            Paywall paywall = this.paywall;
            String str3 = this.shareKey;
            StringBuilder sbU = y30.u("ViewerEdge(__typename=", str, ", id=", str2, ", paywall=");
            sbU.append(paywall);
            sbU.append(", shareKey=");
            sbU.append(str3);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0017\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B?\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\b\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\u0006\u0012\u0006\u0010\n\u001a\u00020\u0006¢\u0006\u0004\b\u000b\u0010\fJ\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0006HÆ\u0003J\t\u0010\u0016\u001a\u00020\u0006HÆ\u0003J\t\u0010\u0017\u001a\u00020\u0006HÆ\u0003J\t\u0010\u0018\u001a\u00020\u0006HÆ\u0003J\t\u0010\u0019\u001a\u00020\u0006HÆ\u0003JO\u0010\u001a\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00062\b\b\u0002\u0010\u0007\u001a\u00020\u00062\b\b\u0002\u0010\b\u001a\u00020\u00062\b\b\u0002\u0010\t\u001a\u00020\u00062\b\b\u0002\u0010\n\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u001b\u001a\u00020\u00062\b\u0010\u001c\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001d\u001a\u00020\u001eHÖ\u0001J\t\u0010\u001f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000eR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0010R\u0011\u0010\u0007\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\u0010R\u0011\u0010\b\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0010R\u0011\u0010\t\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0010R\u0011\u0010\n\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u0010¨\u0006 "}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaData$ViewerEdge1;", "", "__typename", "", "id", "isFollowing", "", "isEditor", "canEditPosts", "canEditOwnPosts", "isMuting", "<init>", "(Ljava/lang/String;Ljava/lang/String;ZZZZZ)V", "get__typename", "()Ljava/lang/String;", "getId", "()Z", "getCanEditPosts", "getCanEditOwnPosts", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge1 {
        private final String __typename;
        private final boolean canEditOwnPosts;
        private final boolean canEditPosts;
        private final String id;
        private final boolean isEditor;
        private final boolean isFollowing;
        private final boolean isMuting;

        public ViewerEdge1(String str, String str2, boolean z, boolean z2, boolean z3, boolean z4, boolean z5) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.isFollowing = z;
            this.isEditor = z2;
            this.canEditPosts = z3;
            this.canEditOwnPosts = z4;
            this.isMuting = z5;
        }

        public static /* synthetic */ ViewerEdge1 copy$default(ViewerEdge1 viewerEdge1, String str, String str2, boolean z, boolean z2, boolean z3, boolean z4, boolean z5, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge1.__typename;
            }
            if ((i & 2) != 0) {
                str2 = viewerEdge1.id;
            }
            if ((i & 4) != 0) {
                z = viewerEdge1.isFollowing;
            }
            if ((i & 8) != 0) {
                z2 = viewerEdge1.isEditor;
            }
            if ((i & 16) != 0) {
                z3 = viewerEdge1.canEditPosts;
            }
            if ((i & 32) != 0) {
                z4 = viewerEdge1.canEditOwnPosts;
            }
            if ((i & 64) != 0) {
                z5 = viewerEdge1.isMuting;
            }
            boolean z6 = z4;
            boolean z7 = z5;
            boolean z8 = z3;
            boolean z9 = z;
            return viewerEdge1.copy(str, str2, z9, z2, z8, z6, z7);
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
        public final boolean getIsFollowing() {
            return this.isFollowing;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final boolean getIsEditor() {
            return this.isEditor;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final boolean getCanEditPosts() {
            return this.canEditPosts;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final boolean getCanEditOwnPosts() {
            return this.canEditOwnPosts;
        }

        /* JADX INFO: renamed from: component7, reason: from getter */
        public final boolean getIsMuting() {
            return this.isMuting;
        }

        public final ViewerEdge1 copy(String __typename, String id, boolean isFollowing, boolean isEditor, boolean canEditPosts, boolean canEditOwnPosts, boolean isMuting) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge1(__typename, id, isFollowing, isEditor, canEditPosts, canEditOwnPosts, isMuting);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge1)) {
                return false;
            }
            ViewerEdge1 viewerEdge1 = (ViewerEdge1) other;
            return g76.L(this.__typename, viewerEdge1.__typename) && g76.L(this.id, viewerEdge1.id) && this.isFollowing == viewerEdge1.isFollowing && this.isEditor == viewerEdge1.isEditor && this.canEditPosts == viewerEdge1.canEditPosts && this.canEditOwnPosts == viewerEdge1.canEditOwnPosts && this.isMuting == viewerEdge1.isMuting;
        }

        public final boolean getCanEditOwnPosts() {
            return this.canEditOwnPosts;
        }

        public final boolean getCanEditPosts() {
            return this.canEditPosts;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return ((((((((wgd.o(this.__typename.hashCode() * 31, 31, this.id) + (this.isFollowing ? 1231 : 1237)) * 31) + (this.isEditor ? 1231 : 1237)) * 31) + (this.canEditPosts ? 1231 : 1237)) * 31) + (this.canEditOwnPosts ? 1231 : 1237)) * 31) + (this.isMuting ? 1231 : 1237);
        }

        public final boolean isEditor() {
            return this.isEditor;
        }

        public final boolean isFollowing() {
            return this.isFollowing;
        }

        public final boolean isMuting() {
            return this.isMuting;
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            boolean z = this.isFollowing;
            boolean z2 = this.isEditor;
            boolean z3 = this.canEditPosts;
            boolean z4 = this.canEditOwnPosts;
            boolean z5 = this.isMuting;
            StringBuilder sbU = y30.u("ViewerEdge1(__typename=", str, ", id=", str2, ", isFollowing=");
            ho2.R(sbU, z, ", isEditor=", z2, ", canEditPosts=");
            ho2.R(sbU, z3, ", canEditOwnPosts=", z4, ", isMuting=");
            return lv8.t(sbU, z5, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\r\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0006HÆ\u0003J'\u0010\u0010\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0011\u001a\u00020\u00062\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/PostMetaData$ViewerEdge2;", "", "__typename", "", "id", "isUser", "", "<init>", "(Ljava/lang/String;Ljava/lang/String;Z)V", "get__typename", "()Ljava/lang/String;", "getId", "()Z", "component1", "component2", "component3", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge2 {
        private final String __typename;
        private final String id;
        private final boolean isUser;

        public ViewerEdge2(String str, String str2, boolean z) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.isUser = z;
        }

        public static /* synthetic */ ViewerEdge2 copy$default(ViewerEdge2 viewerEdge2, String str, String str2, boolean z, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge2.__typename;
            }
            if ((i & 2) != 0) {
                str2 = viewerEdge2.id;
            }
            if ((i & 4) != 0) {
                z = viewerEdge2.isUser;
            }
            return viewerEdge2.copy(str, str2, z);
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
        public final boolean getIsUser() {
            return this.isUser;
        }

        public final ViewerEdge2 copy(String __typename, String id, boolean isUser) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge2(__typename, id, isUser);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge2)) {
                return false;
            }
            ViewerEdge2 viewerEdge2 = (ViewerEdge2) other;
            return g76.L(this.__typename, viewerEdge2.__typename) && g76.L(this.id, viewerEdge2.id) && this.isUser == viewerEdge2.isUser;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return wgd.o(this.__typename.hashCode() * 31, 31, this.id) + (this.isUser ? 1231 : 1237);
        }

        public final boolean isUser() {
            return this.isUser;
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return lv8.t(y30.u("ViewerEdge2(__typename=", str, ", id=", str2, ", isUser="), this.isUser, ")");
        }
    }

    public PostMetaData(String str, String str2, String str3, PostVisibilityType postVisibilityType, ViewerEdge viewerEdge, String str4, String str5, Double d, Long l, Boolean bool, Boolean bool2, boolean z, String str6, Long l2, PreviewImage previewImage, InResponseToPostResult inResponseToPostResult, InResponseToMediaResource inResponseToMediaResource, InResponseToEntityType inResponseToEntityType, String str7, Collection collection, Creator creator, PreviewContent previewContent, Long l3, boolean z2, PostClapsData postClapsData, ResponseCountData responseCountData, PostVisibilityData postVisibilityData, PostMenuData postMenuData) {
        str.getClass();
        str2.getClass();
        postVisibilityType.getClass();
        viewerEdge.getClass();
        str6.getClass();
        postClapsData.getClass();
        responseCountData.getClass();
        postVisibilityData.getClass();
        postMenuData.getClass();
        this.__typename = str;
        this.id = str2;
        this.title = str3;
        this.visibility = postVisibilityType;
        this.viewerEdge = viewerEdge;
        this.detectedLanguage = str4;
        this.mediumUrl = str5;
        this.readingTime = d;
        this.updatedAt = l;
        this.isLocked = bool;
        this.allowResponses = bool2;
        this.isProxyPost = z;
        this.latestPublishedVersion = str6;
        this.firstPublishedAt = l2;
        this.previewImage = previewImage;
        this.inResponseToPostResult = inResponseToPostResult;
        this.inResponseToMediaResource = inResponseToMediaResource;
        this.inResponseToEntityType = inResponseToEntityType;
        this.canonicalUrl = str7;
        this.collection = collection;
        this.creator = creator;
        this.previewContent = previewContent;
        this.pinnedByCreatorAt = l3;
        this.isNewsletter = z2;
        this.postClapsData = postClapsData;
        this.responseCountData = responseCountData;
        this.postVisibilityData = postVisibilityData;
        this.postMenuData = postMenuData;
    }

    public static /* synthetic */ PostMetaData copy$default(PostMetaData postMetaData, String str, String str2, String str3, PostVisibilityType postVisibilityType, ViewerEdge viewerEdge, String str4, String str5, Double d, Long l, Boolean bool, Boolean bool2, boolean z, String str6, Long l2, PreviewImage previewImage, InResponseToPostResult inResponseToPostResult, InResponseToMediaResource inResponseToMediaResource, InResponseToEntityType inResponseToEntityType, String str7, Collection collection, Creator creator, PreviewContent previewContent, Long l3, boolean z2, PostClapsData postClapsData, ResponseCountData responseCountData, PostVisibilityData postVisibilityData, PostMenuData postMenuData, int i, Object obj) {
        PostMenuData postMenuData2;
        PostVisibilityData postVisibilityData2;
        String str8 = (i & 1) != 0 ? postMetaData.__typename : str;
        String str9 = (i & 2) != 0 ? postMetaData.id : str2;
        String str10 = (i & 4) != 0 ? postMetaData.title : str3;
        PostVisibilityType postVisibilityType2 = (i & 8) != 0 ? postMetaData.visibility : postVisibilityType;
        ViewerEdge viewerEdge2 = (i & 16) != 0 ? postMetaData.viewerEdge : viewerEdge;
        String str11 = (i & 32) != 0 ? postMetaData.detectedLanguage : str4;
        String str12 = (i & 64) != 0 ? postMetaData.mediumUrl : str5;
        Double d2 = (i & 128) != 0 ? postMetaData.readingTime : d;
        Long l4 = (i & 256) != 0 ? postMetaData.updatedAt : l;
        Boolean bool3 = (i & 512) != 0 ? postMetaData.isLocked : bool;
        Boolean bool4 = (i & 1024) != 0 ? postMetaData.allowResponses : bool2;
        boolean z3 = (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? postMetaData.isProxyPost : z;
        String str13 = (i & 4096) != 0 ? postMetaData.latestPublishedVersion : str6;
        Long l5 = (i & 8192) != 0 ? postMetaData.firstPublishedAt : l2;
        String str14 = str8;
        PreviewImage previewImage2 = (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? postMetaData.previewImage : previewImage;
        InResponseToPostResult inResponseToPostResult2 = (i & 32768) != 0 ? postMetaData.inResponseToPostResult : inResponseToPostResult;
        InResponseToMediaResource inResponseToMediaResource2 = (i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? postMetaData.inResponseToMediaResource : inResponseToMediaResource;
        InResponseToEntityType inResponseToEntityType2 = (i & 131072) != 0 ? postMetaData.inResponseToEntityType : inResponseToEntityType;
        String str15 = (i & 262144) != 0 ? postMetaData.canonicalUrl : str7;
        Collection collection2 = (i & 524288) != 0 ? postMetaData.collection : collection;
        Creator creator2 = (i & 1048576) != 0 ? postMetaData.creator : creator;
        PreviewContent previewContent2 = (i & 2097152) != 0 ? postMetaData.previewContent : previewContent;
        Long l6 = (i & 4194304) != 0 ? postMetaData.pinnedByCreatorAt : l3;
        boolean z4 = (i & 8388608) != 0 ? postMetaData.isNewsletter : z2;
        PostClapsData postClapsData2 = (i & 16777216) != 0 ? postMetaData.postClapsData : postClapsData;
        ResponseCountData responseCountData2 = (i & 33554432) != 0 ? postMetaData.responseCountData : responseCountData;
        PostVisibilityData postVisibilityData3 = (i & 67108864) != 0 ? postMetaData.postVisibilityData : postVisibilityData;
        if ((i & 134217728) != 0) {
            postVisibilityData2 = postVisibilityData3;
            postMenuData2 = postMetaData.postMenuData;
        } else {
            postMenuData2 = postMenuData;
            postVisibilityData2 = postVisibilityData3;
        }
        return postMetaData.copy(str14, str9, str10, postVisibilityType2, viewerEdge2, str11, str12, d2, l4, bool3, bool4, z3, str13, l5, previewImage2, inResponseToPostResult2, inResponseToMediaResource2, inResponseToEntityType2, str15, collection2, creator2, previewContent2, l6, z4, postClapsData2, responseCountData2, postVisibilityData2, postMenuData2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component10, reason: from getter */
    public final Boolean getIsLocked() {
        return this.isLocked;
    }

    /* JADX INFO: renamed from: component11, reason: from getter */
    public final Boolean getAllowResponses() {
        return this.allowResponses;
    }

    /* JADX INFO: renamed from: component12, reason: from getter */
    public final boolean getIsProxyPost() {
        return this.isProxyPost;
    }

    /* JADX INFO: renamed from: component13, reason: from getter */
    public final String getLatestPublishedVersion() {
        return this.latestPublishedVersion;
    }

    /* JADX INFO: renamed from: component14, reason: from getter */
    public final Long getFirstPublishedAt() {
        return this.firstPublishedAt;
    }

    /* JADX INFO: renamed from: component15, reason: from getter */
    public final PreviewImage getPreviewImage() {
        return this.previewImage;
    }

    /* JADX INFO: renamed from: component16, reason: from getter */
    public final InResponseToPostResult getInResponseToPostResult() {
        return this.inResponseToPostResult;
    }

    /* JADX INFO: renamed from: component17, reason: from getter */
    public final InResponseToMediaResource getInResponseToMediaResource() {
        return this.inResponseToMediaResource;
    }

    /* JADX INFO: renamed from: component18, reason: from getter */
    public final InResponseToEntityType getInResponseToEntityType() {
        return this.inResponseToEntityType;
    }

    /* JADX INFO: renamed from: component19, reason: from getter */
    public final String getCanonicalUrl() {
        return this.canonicalUrl;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getId() {
        return this.id;
    }

    /* JADX INFO: renamed from: component20, reason: from getter */
    public final Collection getCollection() {
        return this.collection;
    }

    /* JADX INFO: renamed from: component21, reason: from getter */
    public final Creator getCreator() {
        return this.creator;
    }

    /* JADX INFO: renamed from: component22, reason: from getter */
    public final PreviewContent getPreviewContent() {
        return this.previewContent;
    }

    /* JADX INFO: renamed from: component23, reason: from getter */
    public final Long getPinnedByCreatorAt() {
        return this.pinnedByCreatorAt;
    }

    /* JADX INFO: renamed from: component24, reason: from getter */
    public final boolean getIsNewsletter() {
        return this.isNewsletter;
    }

    /* JADX INFO: renamed from: component25, reason: from getter */
    public final PostClapsData getPostClapsData() {
        return this.postClapsData;
    }

    /* JADX INFO: renamed from: component26, reason: from getter */
    public final ResponseCountData getResponseCountData() {
        return this.responseCountData;
    }

    /* JADX INFO: renamed from: component27, reason: from getter */
    public final PostVisibilityData getPostVisibilityData() {
        return this.postVisibilityData;
    }

    /* JADX INFO: renamed from: component28, reason: from getter */
    public final PostMenuData getPostMenuData() {
        return this.postMenuData;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getTitle() {
        return this.title;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final PostVisibilityType getVisibility() {
        return this.visibility;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final ViewerEdge getViewerEdge() {
        return this.viewerEdge;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final String getDetectedLanguage() {
        return this.detectedLanguage;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final String getMediumUrl() {
        return this.mediumUrl;
    }

    /* JADX INFO: renamed from: component8, reason: from getter */
    public final Double getReadingTime() {
        return this.readingTime;
    }

    /* JADX INFO: renamed from: component9, reason: from getter */
    public final Long getUpdatedAt() {
        return this.updatedAt;
    }

    public final PostMetaData copy(String __typename, String id, String title, PostVisibilityType visibility, ViewerEdge viewerEdge, String detectedLanguage, String mediumUrl, Double readingTime, Long updatedAt, Boolean isLocked, Boolean allowResponses, boolean isProxyPost, String latestPublishedVersion, Long firstPublishedAt, PreviewImage previewImage, InResponseToPostResult inResponseToPostResult, InResponseToMediaResource inResponseToMediaResource, InResponseToEntityType inResponseToEntityType, String canonicalUrl, Collection collection, Creator creator, PreviewContent previewContent, Long pinnedByCreatorAt, boolean isNewsletter, PostClapsData postClapsData, ResponseCountData responseCountData, PostVisibilityData postVisibilityData, PostMenuData postMenuData) {
        __typename.getClass();
        id.getClass();
        visibility.getClass();
        viewerEdge.getClass();
        latestPublishedVersion.getClass();
        postClapsData.getClass();
        responseCountData.getClass();
        postVisibilityData.getClass();
        postMenuData.getClass();
        return new PostMetaData(__typename, id, title, visibility, viewerEdge, detectedLanguage, mediumUrl, readingTime, updatedAt, isLocked, allowResponses, isProxyPost, latestPublishedVersion, firstPublishedAt, previewImage, inResponseToPostResult, inResponseToMediaResource, inResponseToEntityType, canonicalUrl, collection, creator, previewContent, pinnedByCreatorAt, isNewsletter, postClapsData, responseCountData, postVisibilityData, postMenuData);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PostMetaData)) {
            return false;
        }
        PostMetaData postMetaData = (PostMetaData) other;
        return g76.L(this.__typename, postMetaData.__typename) && g76.L(this.id, postMetaData.id) && g76.L(this.title, postMetaData.title) && this.visibility == postMetaData.visibility && g76.L(this.viewerEdge, postMetaData.viewerEdge) && g76.L(this.detectedLanguage, postMetaData.detectedLanguage) && g76.L(this.mediumUrl, postMetaData.mediumUrl) && g76.L(this.readingTime, postMetaData.readingTime) && g76.L(this.updatedAt, postMetaData.updatedAt) && g76.L(this.isLocked, postMetaData.isLocked) && g76.L(this.allowResponses, postMetaData.allowResponses) && this.isProxyPost == postMetaData.isProxyPost && g76.L(this.latestPublishedVersion, postMetaData.latestPublishedVersion) && g76.L(this.firstPublishedAt, postMetaData.firstPublishedAt) && g76.L(this.previewImage, postMetaData.previewImage) && g76.L(this.inResponseToPostResult, postMetaData.inResponseToPostResult) && g76.L(this.inResponseToMediaResource, postMetaData.inResponseToMediaResource) && this.inResponseToEntityType == postMetaData.inResponseToEntityType && g76.L(this.canonicalUrl, postMetaData.canonicalUrl) && g76.L(this.collection, postMetaData.collection) && g76.L(this.creator, postMetaData.creator) && g76.L(this.previewContent, postMetaData.previewContent) && g76.L(this.pinnedByCreatorAt, postMetaData.pinnedByCreatorAt) && this.isNewsletter == postMetaData.isNewsletter && g76.L(this.postClapsData, postMetaData.postClapsData) && g76.L(this.responseCountData, postMetaData.responseCountData) && g76.L(this.postVisibilityData, postMetaData.postVisibilityData) && g76.L(this.postMenuData, postMetaData.postMenuData);
    }

    public final Boolean getAllowResponses() {
        return this.allowResponses;
    }

    public final String getCanonicalUrl() {
        return this.canonicalUrl;
    }

    public final Collection getCollection() {
        return this.collection;
    }

    public final Creator getCreator() {
        return this.creator;
    }

    public final String getDetectedLanguage() {
        return this.detectedLanguage;
    }

    public final Long getFirstPublishedAt() {
        return this.firstPublishedAt;
    }

    public final String getId() {
        return this.id;
    }

    public final InResponseToEntityType getInResponseToEntityType() {
        return this.inResponseToEntityType;
    }

    public final InResponseToMediaResource getInResponseToMediaResource() {
        return this.inResponseToMediaResource;
    }

    public final InResponseToPostResult getInResponseToPostResult() {
        return this.inResponseToPostResult;
    }

    public final String getLatestPublishedVersion() {
        return this.latestPublishedVersion;
    }

    public final String getMediumUrl() {
        return this.mediumUrl;
    }

    public final Long getPinnedByCreatorAt() {
        return this.pinnedByCreatorAt;
    }

    public final PostClapsData getPostClapsData() {
        return this.postClapsData;
    }

    public final PostMenuData getPostMenuData() {
        return this.postMenuData;
    }

    public final PostVisibilityData getPostVisibilityData() {
        return this.postVisibilityData;
    }

    public final PreviewContent getPreviewContent() {
        return this.previewContent;
    }

    public final PreviewImage getPreviewImage() {
        return this.previewImage;
    }

    public final Double getReadingTime() {
        return this.readingTime;
    }

    public final ResponseCountData getResponseCountData() {
        return this.responseCountData;
    }

    public final String getTitle() {
        return this.title;
    }

    public final Long getUpdatedAt() {
        return this.updatedAt;
    }

    public final ViewerEdge getViewerEdge() {
        return this.viewerEdge;
    }

    public final PostVisibilityType getVisibility() {
        return this.visibility;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        String str = this.title;
        int iHashCode = (this.viewerEdge.hashCode() + ((this.visibility.hashCode() + ((iO + (str == null ? 0 : str.hashCode())) * 31)) * 31)) * 31;
        String str2 = this.detectedLanguage;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.mediumUrl;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        Double d = this.readingTime;
        int iHashCode4 = (iHashCode3 + (d == null ? 0 : d.hashCode())) * 31;
        Long l = this.updatedAt;
        int iHashCode5 = (iHashCode4 + (l == null ? 0 : l.hashCode())) * 31;
        Boolean bool = this.isLocked;
        int iHashCode6 = (iHashCode5 + (bool == null ? 0 : bool.hashCode())) * 31;
        Boolean bool2 = this.allowResponses;
        int iO2 = wgd.o((((iHashCode6 + (bool2 == null ? 0 : bool2.hashCode())) * 31) + (this.isProxyPost ? 1231 : 1237)) * 31, 31, this.latestPublishedVersion);
        Long l2 = this.firstPublishedAt;
        int iHashCode7 = (iO2 + (l2 == null ? 0 : l2.hashCode())) * 31;
        PreviewImage previewImage = this.previewImage;
        int iHashCode8 = (iHashCode7 + (previewImage == null ? 0 : previewImage.hashCode())) * 31;
        InResponseToPostResult inResponseToPostResult = this.inResponseToPostResult;
        int iHashCode9 = (iHashCode8 + (inResponseToPostResult == null ? 0 : inResponseToPostResult.hashCode())) * 31;
        InResponseToMediaResource inResponseToMediaResource = this.inResponseToMediaResource;
        int iHashCode10 = (iHashCode9 + (inResponseToMediaResource == null ? 0 : inResponseToMediaResource.hashCode())) * 31;
        InResponseToEntityType inResponseToEntityType = this.inResponseToEntityType;
        int iHashCode11 = (iHashCode10 + (inResponseToEntityType == null ? 0 : inResponseToEntityType.hashCode())) * 31;
        String str4 = this.canonicalUrl;
        int iHashCode12 = (iHashCode11 + (str4 == null ? 0 : str4.hashCode())) * 31;
        Collection collection = this.collection;
        int iHashCode13 = (iHashCode12 + (collection == null ? 0 : collection.hashCode())) * 31;
        Creator creator = this.creator;
        int iHashCode14 = (iHashCode13 + (creator == null ? 0 : creator.hashCode())) * 31;
        PreviewContent previewContent = this.previewContent;
        int iHashCode15 = (iHashCode14 + (previewContent == null ? 0 : previewContent.hashCode())) * 31;
        Long l3 = this.pinnedByCreatorAt;
        return this.postMenuData.hashCode() + ((this.postVisibilityData.hashCode() + ((this.responseCountData.hashCode() + ((this.postClapsData.hashCode() + ((((iHashCode15 + (l3 != null ? l3.hashCode() : 0)) * 31) + (this.isNewsletter ? 1231 : 1237)) * 31)) * 31)) * 31)) * 31);
    }

    public final Boolean isLocked() {
        return this.isLocked;
    }

    public final boolean isNewsletter() {
        return this.isNewsletter;
    }

    public final boolean isProxyPost() {
        return this.isProxyPost;
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        String str3 = this.title;
        PostVisibilityType postVisibilityType = this.visibility;
        ViewerEdge viewerEdge = this.viewerEdge;
        String str4 = this.detectedLanguage;
        String str5 = this.mediumUrl;
        Double d = this.readingTime;
        Long l = this.updatedAt;
        Boolean bool = this.isLocked;
        Boolean bool2 = this.allowResponses;
        boolean z = this.isProxyPost;
        String str6 = this.latestPublishedVersion;
        Long l2 = this.firstPublishedAt;
        PreviewImage previewImage = this.previewImage;
        InResponseToPostResult inResponseToPostResult = this.inResponseToPostResult;
        InResponseToMediaResource inResponseToMediaResource = this.inResponseToMediaResource;
        InResponseToEntityType inResponseToEntityType = this.inResponseToEntityType;
        String str7 = this.canonicalUrl;
        Collection collection = this.collection;
        Creator creator = this.creator;
        PreviewContent previewContent = this.previewContent;
        Long l3 = this.pinnedByCreatorAt;
        boolean z2 = this.isNewsletter;
        PostClapsData postClapsData = this.postClapsData;
        ResponseCountData responseCountData = this.responseCountData;
        PostVisibilityData postVisibilityData = this.postVisibilityData;
        PostMenuData postMenuData = this.postMenuData;
        StringBuilder sbU = y30.u("PostMetaData(__typename=", str, ", id=", str2, ", title=");
        sbU.append(str3);
        sbU.append(", visibility=");
        sbU.append(postVisibilityType);
        sbU.append(", viewerEdge=");
        sbU.append(viewerEdge);
        sbU.append(", detectedLanguage=");
        sbU.append(str4);
        sbU.append(", mediumUrl=");
        sbU.append(str5);
        sbU.append(", readingTime=");
        sbU.append(d);
        sbU.append(", updatedAt=");
        sbU.append(l);
        sbU.append(", isLocked=");
        sbU.append(bool);
        sbU.append(", allowResponses=");
        sbU.append(bool2);
        sbU.append(", isProxyPost=");
        sbU.append(z);
        sbU.append(", latestPublishedVersion=");
        sbU.append(str6);
        sbU.append(", firstPublishedAt=");
        sbU.append(l2);
        sbU.append(", previewImage=");
        sbU.append(previewImage);
        sbU.append(", inResponseToPostResult=");
        sbU.append(inResponseToPostResult);
        sbU.append(", inResponseToMediaResource=");
        sbU.append(inResponseToMediaResource);
        sbU.append(", inResponseToEntityType=");
        sbU.append(inResponseToEntityType);
        sbU.append(", canonicalUrl=");
        sbU.append(str7);
        sbU.append(", collection=");
        sbU.append(collection);
        sbU.append(", creator=");
        sbU.append(creator);
        sbU.append(", previewContent=");
        sbU.append(previewContent);
        sbU.append(", pinnedByCreatorAt=");
        sbU.append(l3);
        sbU.append(", isNewsletter=");
        sbU.append(z2);
        sbU.append(", postClapsData=");
        sbU.append(postClapsData);
        sbU.append(", responseCountData=");
        sbU.append(responseCountData);
        sbU.append(", postVisibilityData=");
        sbU.append(postVisibilityData);
        sbU.append(", postMenuData=");
        sbU.append(postMenuData);
        sbU.append(")");
        return sbU.toString();
    }
}
