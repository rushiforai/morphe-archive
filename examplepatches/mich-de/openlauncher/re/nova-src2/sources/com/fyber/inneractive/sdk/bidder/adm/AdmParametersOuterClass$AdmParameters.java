package com.fyber.inneractive.sdk.bidder.adm;

import androidx.compose.ui.node.LayoutNode;
import androidx.recyclerview.widget.u1;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.protobuf.e2;
import com.fyber.inneractive.sdk.protobuf.h0;
import com.fyber.inneractive.sdk.protobuf.k1;
import com.fyber.inneractive.sdk.protobuf.m2;
import com.fyber.inneractive.sdk.protobuf.n1;
import com.fyber.inneractive.sdk.protobuf.t0;
import com.fyber.inneractive.sdk.protobuf.u0;
import com.fyber.inneractive.sdk.protobuf.y0;
import com.fyber.inneractive.sdk.protobuf.z0;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.List;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes3.dex */
public final class AdmParametersOuterClass$AdmParameters extends z0 implements e2 {
    public static final int ABEXPERIMENTS_FIELD_NUMBER = 33;
    public static final int ADCOMPLETIONURL_FIELD_NUMBER = 24;
    public static final int ADDOMAIN_FIELD_NUMBER = 29;
    public static final int ADDURATION_FIELD_NUMBER = 25;
    public static final int ADEXPIRATIONINTERVAL_FIELD_NUMBER = 13;
    public static final int ADHEIGHT_FIELD_NUMBER = 5;
    public static final int ADNETWORKID_FIELD_NUMBER = 12;
    public static final int ADNETWORKNAME_FIELD_NUMBER = 11;
    public static final int ADTYPE_FIELD_NUMBER = 14;
    public static final int ADUNITDISPLAYTYPE_FIELD_NUMBER = 8;
    public static final int ADUNITID_FIELD_NUMBER = 6;
    public static final int ADUNITTYPE_FIELD_NUMBER = 7;
    public static final int ADVERTISEDAPPID_FIELD_NUMBER = 18;
    public static final int ADWIDTH_FIELD_NUMBER = 4;
    public static final int APPBUNDLEID_FIELD_NUMBER = 23;
    public static final int ATTRIBUTIONCLICKURL_FIELD_NUMBER = 45;
    public static final int ATTRIBUTIONIMPRESSIONURL_FIELD_NUMBER = 44;
    public static final int AUTOSTOREKITSTATE_FIELD_NUMBER = 42;
    public static final int BRANDBIDDERCTATEXT_FIELD_NUMBER = 40;
    public static final int BRANDBIDDERDONTSHOWENDCARD_FIELD_NUMBER = 39;
    public static final int CAMPAIGNID_FIELD_NUMBER = 31;
    public static final int CONTENTID_FIELD_NUMBER = 9;
    public static final int CREATIVEID_FIELD_NUMBER = 30;
    public static final int CREATIVETYPE_FIELD_NUMBER = 26;
    public static final int CUSTOMPRODUCTPAGEID_FIELD_NUMBER = 43;
    private static final AdmParametersOuterClass$AdmParameters DEFAULT_INSTANCE;
    public static final int ERRORMESSAGE_FIELD_NUMBER = 3;
    public static final int IGNITEINSTALLURL_FIELD_NUMBER = 36;
    public static final int IGNITELAUNCHERACTIVITY_FIELD_NUMBER = 37;
    public static final int IGNITEMODE_FIELD_NUMBER = 35;
    public static final int MARKUPURL_FIELD_NUMBER = 1;
    public static final int MRAIDVIDEOOMSIGNAL_FIELD_NUMBER = 41;
    public static final int MRCDATA_FIELD_NUMBER = 32;
    private static volatile m2 PARSER = null;
    public static final int PRICINGVALUE_FIELD_NUMBER = 28;
    public static final int PUBLISHERID_FIELD_NUMBER = 10;
    public static final int SDKCLICKURL_FIELD_NUMBER = 16;
    public static final int SDKIMPRESSIONURL_FIELD_NUMBER = 15;
    public static final int SESSIONID_FIELD_NUMBER = 2;
    public static final int SKADNETWORKDATA_FIELD_NUMBER = 27;
    public static final int SKIPDELAY_FIELD_NUMBER = 46;
    public static final int SKIPENDCARDDELAY_FIELD_NUMBER = 47;
    public static final int SKIPMODE_FIELD_NUMBER = 22;
    public static final int SKOVERLAYDATA_FIELD_NUMBER = 38;
    public static final int SPOTID_FIELD_NUMBER = 34;
    public static final int STORECTATEXT_FIELD_NUMBER = 21;
    public static final int STOREEVENTURL_FIELD_NUMBER = 20;
    public static final int STOREURLTYPE_FIELD_NUMBER = 19;
    public static final int STOREURL_FIELD_NUMBER = 17;
    private int adDuration_;
    private int adExpirationInterval_;
    private int adHeight_;
    private long adNetworkId_;
    private int adType_;
    private int adUnitDisplayType_;
    private int adUnitType_;
    private int adWidth_;
    private int autoStorekitState_;
    private int bitField0_;
    private int bitField1_;
    private boolean brandBidderDontShowEndcard_;
    private long contentId_;
    private int igniteMode_;
    private boolean mraidVideoOMSignal_;
    private MRCData mrcData_;
    private double pricingValue_;
    private long publisherId_;
    private SKAdNetworkData skAdNetworkData_;
    private SKOverlayData skOverlayData_;
    private double skipDelay_;
    private double skipEndcardDelay_;
    private boolean skipMode_;
    private long spotId_;
    private int storeUrlType_;
    private String markupUrl_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String sessionId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String errorMessage_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String adUnitId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String adNetworkName_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String sdkImpressionUrl_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String sdkClickUrl_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String storeUrl_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String advertisedAppId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String storeEventUrl_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String storeCTAText_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String appBundleId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String adCompletionUrl_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String creativeType_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String adDomain_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String creativeId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String campaignId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private k1 abExperiments_ = z0.emptyProtobufList();
    private String igniteInstallUrl_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String igniteLauncherActivity_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String brandBidderCtaText_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String customProductPageId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String attributionImpressionUrl_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String attributionClickUrl_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    public static final class Experiment extends z0 implements l {
        private static final Experiment DEFAULT_INSTANCE;
        public static final int IDENTIFIER_FIELD_NUMBER = 1;
        private static volatile m2 PARSER = null;
        public static final int VARIANT_FIELD_NUMBER = 2;
        private int bitField0_;
        private String identifier_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        private String variant_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

        static {
            Experiment experiment = new Experiment();
            DEFAULT_INSTANCE = experiment;
            z0.registerDefaultInstance(Experiment.class, experiment);
        }

        private Experiment() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearIdentifier() {
            this.bitField0_ &= -2;
            this.identifier_ = getDefaultInstance().getIdentifier();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearVariant() {
            this.bitField0_ &= -3;
            this.variant_ = getDefaultInstance().getVariant();
        }

        public static Experiment getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        public static k newBuilder() {
            return (k) DEFAULT_INSTANCE.createBuilder();
        }

        public static Experiment parseDelimitedFrom(InputStream inputStream) throws IOException {
            return (Experiment) z0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static Experiment parseFrom(ByteBuffer byteBuffer) throws n1 {
            return (Experiment) z0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
        }

        public static m2 parser() {
            return DEFAULT_INSTANCE.getParserForType();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setIdentifier(String str) {
            str.getClass();
            this.bitField0_ |= 1;
            this.identifier_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setIdentifierBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
            com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
            this.identifier_ = sVar.f();
            this.bitField0_ |= 1;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setVariant(String str) {
            str.getClass();
            this.bitField0_ |= 2;
            this.variant_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setVariantBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
            com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
            this.variant_ = sVar.f();
            this.bitField0_ |= 2;
        }

        @Override // com.fyber.inneractive.sdk.protobuf.z0
        public final Object dynamicMethod(y0 y0Var, Object obj, Object obj2) {
            m2 u0Var;
            switch (a.f27605a[y0Var.ordinal()]) {
                case 1:
                    return new Experiment();
                case 2:
                    return new k();
                case 3:
                    return z0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ለ\u0000\u0002ለ\u0001", new Object[]{"bitField0_", "identifier_", "variant_"});
                case 4:
                    return DEFAULT_INSTANCE;
                case 5:
                    m2 m2Var = PARSER;
                    if (m2Var != null) {
                        return m2Var;
                    }
                    synchronized (Experiment.class) {
                        try {
                            u0Var = PARSER;
                            if (u0Var == null) {
                                u0Var = new u0();
                                PARSER = u0Var;
                            }
                        } catch (Throwable th2) {
                            throw th2;
                        }
                    }
                    return u0Var;
                case 6:
                    return (byte) 1;
                case 7:
                    return null;
                default:
                    throw new UnsupportedOperationException();
            }
        }

        public String getIdentifier() {
            return this.identifier_;
        }

        public com.fyber.inneractive.sdk.protobuf.s getIdentifierBytes() {
            return com.fyber.inneractive.sdk.protobuf.s.a(this.identifier_);
        }

        public String getVariant() {
            return this.variant_;
        }

        public com.fyber.inneractive.sdk.protobuf.s getVariantBytes() {
            return com.fyber.inneractive.sdk.protobuf.s.a(this.variant_);
        }

        public boolean hasIdentifier() {
            return (this.bitField0_ & 1) != 0;
        }

        public boolean hasVariant() {
            return (this.bitField0_ & 2) != 0;
        }

        public static k newBuilder(Experiment experiment) {
            return (k) DEFAULT_INSTANCE.createBuilder(experiment);
        }

        public static Experiment parseDelimitedFrom(InputStream inputStream, h0 h0Var) throws IOException {
            return (Experiment) z0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, h0Var);
        }

        public static Experiment parseFrom(ByteBuffer byteBuffer, h0 h0Var) throws n1 {
            return (Experiment) z0.parseFrom(DEFAULT_INSTANCE, byteBuffer, h0Var);
        }

        public static Experiment parseFrom(com.fyber.inneractive.sdk.protobuf.s sVar) throws n1 {
            return (Experiment) z0.parseFrom(DEFAULT_INSTANCE, sVar);
        }

        public static Experiment parseFrom(com.fyber.inneractive.sdk.protobuf.s sVar, h0 h0Var) throws n1 {
            return (Experiment) z0.parseFrom(DEFAULT_INSTANCE, sVar, h0Var);
        }

        public static Experiment parseFrom(byte[] bArr) throws n1 {
            return (Experiment) z0.parseFrom(DEFAULT_INSTANCE, bArr);
        }

        public static Experiment parseFrom(byte[] bArr, h0 h0Var) throws n1 {
            return (Experiment) z0.parseFrom(DEFAULT_INSTANCE, bArr, h0Var);
        }

        public static Experiment parseFrom(InputStream inputStream) throws IOException {
            return (Experiment) z0.parseFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static Experiment parseFrom(InputStream inputStream, h0 h0Var) throws IOException {
            return (Experiment) z0.parseFrom(DEFAULT_INSTANCE, inputStream, h0Var);
        }

        public static Experiment parseFrom(com.fyber.inneractive.sdk.protobuf.w wVar) throws IOException {
            return (Experiment) z0.parseFrom(DEFAULT_INSTANCE, wVar);
        }

        public static Experiment parseFrom(com.fyber.inneractive.sdk.protobuf.w wVar, h0 h0Var) throws IOException {
            return (Experiment) z0.parseFrom(DEFAULT_INSTANCE, wVar, h0Var);
        }
    }

    public static final class MRCData extends z0 implements e2 {
        private static final MRCData DEFAULT_INSTANCE;
        private static volatile m2 PARSER = null;
        public static final int PIXELDURATION_FIELD_NUMBER = 2;
        public static final int PIXELIMPRESSIONURL_FIELD_NUMBER = 3;
        public static final int PIXELPERCENT_FIELD_NUMBER = 1;
        private int bitField0_;
        private int pixelDuration_;
        private String pixelImpressionUrl_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        private int pixelPercent_;

        static {
            MRCData mRCData = new MRCData();
            DEFAULT_INSTANCE = mRCData;
            z0.registerDefaultInstance(MRCData.class, mRCData);
        }

        private MRCData() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearPixelDuration() {
            this.bitField0_ &= -3;
            this.pixelDuration_ = 0;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearPixelImpressionUrl() {
            this.bitField0_ &= -5;
            this.pixelImpressionUrl_ = getDefaultInstance().getPixelImpressionUrl();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearPixelPercent() {
            this.bitField0_ &= -2;
            this.pixelPercent_ = 0;
        }

        public static MRCData getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        public static o newBuilder() {
            return (o) DEFAULT_INSTANCE.createBuilder();
        }

        public static MRCData parseDelimitedFrom(InputStream inputStream) throws IOException {
            return (MRCData) z0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static MRCData parseFrom(ByteBuffer byteBuffer) throws n1 {
            return (MRCData) z0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
        }

        public static m2 parser() {
            return DEFAULT_INSTANCE.getParserForType();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setPixelDuration(int i5) {
            this.bitField0_ |= 2;
            this.pixelDuration_ = i5;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setPixelImpressionUrl(String str) {
            str.getClass();
            this.bitField0_ |= 4;
            this.pixelImpressionUrl_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setPixelImpressionUrlBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
            com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
            this.pixelImpressionUrl_ = sVar.f();
            this.bitField0_ |= 4;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setPixelPercent(int i5) {
            this.bitField0_ |= 1;
            this.pixelPercent_ = i5;
        }

        @Override // com.fyber.inneractive.sdk.protobuf.z0
        public final Object dynamicMethod(y0 y0Var, Object obj, Object obj2) {
            m2 u0Var;
            switch (a.f27605a[y0Var.ordinal()]) {
                case 1:
                    return new MRCData();
                case 2:
                    return new o();
                case 3:
                    return z0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001ဋ\u0000\u0002ဋ\u0001\u0003ለ\u0002", new Object[]{"bitField0_", "pixelPercent_", "pixelDuration_", "pixelImpressionUrl_"});
                case 4:
                    return DEFAULT_INSTANCE;
                case 5:
                    m2 m2Var = PARSER;
                    if (m2Var != null) {
                        return m2Var;
                    }
                    synchronized (MRCData.class) {
                        try {
                            u0Var = PARSER;
                            if (u0Var == null) {
                                u0Var = new u0();
                                PARSER = u0Var;
                            }
                        } catch (Throwable th2) {
                            throw th2;
                        }
                    }
                    return u0Var;
                case 6:
                    return (byte) 1;
                case 7:
                    return null;
                default:
                    throw new UnsupportedOperationException();
            }
        }

        public int getPixelDuration() {
            return this.pixelDuration_;
        }

        public String getPixelImpressionUrl() {
            return this.pixelImpressionUrl_;
        }

        public com.fyber.inneractive.sdk.protobuf.s getPixelImpressionUrlBytes() {
            return com.fyber.inneractive.sdk.protobuf.s.a(this.pixelImpressionUrl_);
        }

        public int getPixelPercent() {
            return this.pixelPercent_;
        }

        public boolean hasPixelDuration() {
            return (this.bitField0_ & 2) != 0;
        }

        public boolean hasPixelImpressionUrl() {
            return (this.bitField0_ & 4) != 0;
        }

        public boolean hasPixelPercent() {
            return (this.bitField0_ & 1) != 0;
        }

        public static o newBuilder(MRCData mRCData) {
            return (o) DEFAULT_INSTANCE.createBuilder(mRCData);
        }

        public static MRCData parseDelimitedFrom(InputStream inputStream, h0 h0Var) throws IOException {
            return (MRCData) z0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, h0Var);
        }

        public static MRCData parseFrom(ByteBuffer byteBuffer, h0 h0Var) throws n1 {
            return (MRCData) z0.parseFrom(DEFAULT_INSTANCE, byteBuffer, h0Var);
        }

        public static MRCData parseFrom(com.fyber.inneractive.sdk.protobuf.s sVar) throws n1 {
            return (MRCData) z0.parseFrom(DEFAULT_INSTANCE, sVar);
        }

        public static MRCData parseFrom(com.fyber.inneractive.sdk.protobuf.s sVar, h0 h0Var) throws n1 {
            return (MRCData) z0.parseFrom(DEFAULT_INSTANCE, sVar, h0Var);
        }

        public static MRCData parseFrom(byte[] bArr) throws n1 {
            return (MRCData) z0.parseFrom(DEFAULT_INSTANCE, bArr);
        }

        public static MRCData parseFrom(byte[] bArr, h0 h0Var) throws n1 {
            return (MRCData) z0.parseFrom(DEFAULT_INSTANCE, bArr, h0Var);
        }

        public static MRCData parseFrom(InputStream inputStream) throws IOException {
            return (MRCData) z0.parseFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static MRCData parseFrom(InputStream inputStream, h0 h0Var) throws IOException {
            return (MRCData) z0.parseFrom(DEFAULT_INSTANCE, inputStream, h0Var);
        }

        public static MRCData parseFrom(com.fyber.inneractive.sdk.protobuf.w wVar) throws IOException {
            return (MRCData) z0.parseFrom(DEFAULT_INSTANCE, wVar);
        }

        public static MRCData parseFrom(com.fyber.inneractive.sdk.protobuf.w wVar, h0 h0Var) throws IOException {
            return (MRCData) z0.parseFrom(DEFAULT_INSTANCE, wVar, h0Var);
        }
    }

    public static final class SKAdNetworkData extends z0 implements e2 {
        private static final SKAdNetworkData DEFAULT_INSTANCE;
        private static volatile m2 PARSER = null;
        public static final int SKADNBUNDLE_FIELD_NUMBER = 4;
        public static final int SKADNCAMPIGN_FIELD_NUMBER = 3;
        public static final int SKADNETWORKID_FIELD_NUMBER = 2;
        public static final int SKADNID_FIELD_NUMBER = 5;
        public static final int SKADNIMPID_FIELD_NUMBER = 6;
        public static final int SKADNIMPSIGNATURE_FIELD_NUMBER = 10;
        public static final int SKADNIMPTIMESTAMP_FIELD_NUMBER = 9;
        public static final int SKADNSIGNATURE_FIELD_NUMBER = 11;
        public static final int SKADNSOURCEAPP_FIELD_NUMBER = 7;
        public static final int SKADNTIMESTAMP_FIELD_NUMBER = 8;
        public static final int SKADNVERSION_FIELD_NUMBER = 1;
        private int bitField0_;
        private long skAdnImpTimestamp_;
        private long skAdnSourceApp_;
        private long skAdnTimestamp_;
        private String skAdnVersion_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        private String skAdNetworkId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        private String skAdnCampign_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        private String skAdnBundle_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        private String skAdnId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        private String skAdnImpId_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        private String skAdnImpSignature_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        private String skAdnSignature_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

        static {
            SKAdNetworkData sKAdNetworkData = new SKAdNetworkData();
            DEFAULT_INSTANCE = sKAdNetworkData;
            z0.registerDefaultInstance(SKAdNetworkData.class, sKAdNetworkData);
        }

        private SKAdNetworkData() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearSkAdNetworkId() {
            this.bitField0_ &= -3;
            this.skAdNetworkId_ = getDefaultInstance().getSkAdNetworkId();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearSkAdnBundle() {
            this.bitField0_ &= -9;
            this.skAdnBundle_ = getDefaultInstance().getSkAdnBundle();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearSkAdnCampign() {
            this.bitField0_ &= -5;
            this.skAdnCampign_ = getDefaultInstance().getSkAdnCampign();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearSkAdnId() {
            this.bitField0_ &= -17;
            this.skAdnId_ = getDefaultInstance().getSkAdnId();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearSkAdnImpId() {
            this.bitField0_ &= -33;
            this.skAdnImpId_ = getDefaultInstance().getSkAdnImpId();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearSkAdnImpSignature() {
            this.bitField0_ &= -513;
            this.skAdnImpSignature_ = getDefaultInstance().getSkAdnImpSignature();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearSkAdnImpTimestamp() {
            this.bitField0_ &= -257;
            this.skAdnImpTimestamp_ = 0L;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearSkAdnSignature() {
            this.bitField0_ &= -1025;
            this.skAdnSignature_ = getDefaultInstance().getSkAdnSignature();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearSkAdnSourceApp() {
            this.bitField0_ &= -65;
            this.skAdnSourceApp_ = 0L;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearSkAdnTimestamp() {
            this.bitField0_ &= -129;
            this.skAdnTimestamp_ = 0L;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearSkAdnVersion() {
            this.bitField0_ &= -2;
            this.skAdnVersion_ = getDefaultInstance().getSkAdnVersion();
        }

        public static SKAdNetworkData getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        public static p newBuilder() {
            return (p) DEFAULT_INSTANCE.createBuilder();
        }

        public static SKAdNetworkData parseDelimitedFrom(InputStream inputStream) throws IOException {
            return (SKAdNetworkData) z0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static SKAdNetworkData parseFrom(ByteBuffer byteBuffer) throws n1 {
            return (SKAdNetworkData) z0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
        }

        public static m2 parser() {
            return DEFAULT_INSTANCE.getParserForType();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkAdNetworkId(String str) {
            str.getClass();
            this.bitField0_ |= 2;
            this.skAdNetworkId_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkAdNetworkIdBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
            com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
            this.skAdNetworkId_ = sVar.f();
            this.bitField0_ |= 2;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkAdnBundle(String str) {
            str.getClass();
            this.bitField0_ |= 8;
            this.skAdnBundle_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkAdnBundleBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
            com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
            this.skAdnBundle_ = sVar.f();
            this.bitField0_ |= 8;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkAdnCampign(String str) {
            str.getClass();
            this.bitField0_ |= 4;
            this.skAdnCampign_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkAdnCampignBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
            com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
            this.skAdnCampign_ = sVar.f();
            this.bitField0_ |= 4;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkAdnId(String str) {
            str.getClass();
            this.bitField0_ |= 16;
            this.skAdnId_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkAdnIdBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
            com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
            this.skAdnId_ = sVar.f();
            this.bitField0_ |= 16;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkAdnImpId(String str) {
            str.getClass();
            this.bitField0_ |= 32;
            this.skAdnImpId_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkAdnImpIdBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
            com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
            this.skAdnImpId_ = sVar.f();
            this.bitField0_ |= 32;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkAdnImpSignature(String str) {
            str.getClass();
            this.bitField0_ |= EventBridgeChannel.QUEUE_CAPACITY;
            this.skAdnImpSignature_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkAdnImpSignatureBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
            com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
            this.skAdnImpSignature_ = sVar.f();
            this.bitField0_ |= EventBridgeChannel.QUEUE_CAPACITY;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkAdnImpTimestamp(long j11) {
            this.bitField0_ |= 256;
            this.skAdnImpTimestamp_ = j11;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkAdnSignature(String str) {
            str.getClass();
            this.bitField0_ |= 1024;
            this.skAdnSignature_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkAdnSignatureBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
            com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
            this.skAdnSignature_ = sVar.f();
            this.bitField0_ |= 1024;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkAdnSourceApp(long j11) {
            this.bitField0_ |= 64;
            this.skAdnSourceApp_ = j11;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkAdnTimestamp(long j11) {
            this.bitField0_ |= 128;
            this.skAdnTimestamp_ = j11;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkAdnVersion(String str) {
            str.getClass();
            this.bitField0_ |= 1;
            this.skAdnVersion_ = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkAdnVersionBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
            com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
            this.skAdnVersion_ = sVar.f();
            this.bitField0_ |= 1;
        }

        @Override // com.fyber.inneractive.sdk.protobuf.z0
        public final Object dynamicMethod(y0 y0Var, Object obj, Object obj2) {
            m2 u0Var;
            switch (a.f27605a[y0Var.ordinal()]) {
                case 1:
                    return new SKAdNetworkData();
                case 2:
                    return new p();
                case 3:
                    return z0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\u000b\u0000\u0001\u0001\u000b\u000b\u0000\u0000\u0000\u0001ለ\u0000\u0002ለ\u0001\u0003ለ\u0002\u0004ለ\u0003\u0005ለ\u0004\u0006ለ\u0005\u0007ဃ\u0006\bဃ\u0007\tတ\b\nለ\t\u000bለ\n", new Object[]{"bitField0_", "skAdnVersion_", "skAdNetworkId_", "skAdnCampign_", "skAdnBundle_", "skAdnId_", "skAdnImpId_", "skAdnSourceApp_", "skAdnTimestamp_", "skAdnImpTimestamp_", "skAdnImpSignature_", "skAdnSignature_"});
                case 4:
                    return DEFAULT_INSTANCE;
                case 5:
                    m2 m2Var = PARSER;
                    if (m2Var != null) {
                        return m2Var;
                    }
                    synchronized (SKAdNetworkData.class) {
                        try {
                            u0Var = PARSER;
                            if (u0Var == null) {
                                u0Var = new u0();
                                PARSER = u0Var;
                            }
                        } catch (Throwable th2) {
                            throw th2;
                        }
                    }
                    return u0Var;
                case 6:
                    return (byte) 1;
                case 7:
                    return null;
                default:
                    throw new UnsupportedOperationException();
            }
        }

        public String getSkAdNetworkId() {
            return this.skAdNetworkId_;
        }

        public com.fyber.inneractive.sdk.protobuf.s getSkAdNetworkIdBytes() {
            return com.fyber.inneractive.sdk.protobuf.s.a(this.skAdNetworkId_);
        }

        public String getSkAdnBundle() {
            return this.skAdnBundle_;
        }

        public com.fyber.inneractive.sdk.protobuf.s getSkAdnBundleBytes() {
            return com.fyber.inneractive.sdk.protobuf.s.a(this.skAdnBundle_);
        }

        public String getSkAdnCampign() {
            return this.skAdnCampign_;
        }

        public com.fyber.inneractive.sdk.protobuf.s getSkAdnCampignBytes() {
            return com.fyber.inneractive.sdk.protobuf.s.a(this.skAdnCampign_);
        }

        public String getSkAdnId() {
            return this.skAdnId_;
        }

        public com.fyber.inneractive.sdk.protobuf.s getSkAdnIdBytes() {
            return com.fyber.inneractive.sdk.protobuf.s.a(this.skAdnId_);
        }

        public String getSkAdnImpId() {
            return this.skAdnImpId_;
        }

        public com.fyber.inneractive.sdk.protobuf.s getSkAdnImpIdBytes() {
            return com.fyber.inneractive.sdk.protobuf.s.a(this.skAdnImpId_);
        }

        public String getSkAdnImpSignature() {
            return this.skAdnImpSignature_;
        }

        public com.fyber.inneractive.sdk.protobuf.s getSkAdnImpSignatureBytes() {
            return com.fyber.inneractive.sdk.protobuf.s.a(this.skAdnImpSignature_);
        }

        public long getSkAdnImpTimestamp() {
            return this.skAdnImpTimestamp_;
        }

        public String getSkAdnSignature() {
            return this.skAdnSignature_;
        }

        public com.fyber.inneractive.sdk.protobuf.s getSkAdnSignatureBytes() {
            return com.fyber.inneractive.sdk.protobuf.s.a(this.skAdnSignature_);
        }

        public long getSkAdnSourceApp() {
            return this.skAdnSourceApp_;
        }

        public long getSkAdnTimestamp() {
            return this.skAdnTimestamp_;
        }

        public String getSkAdnVersion() {
            return this.skAdnVersion_;
        }

        public com.fyber.inneractive.sdk.protobuf.s getSkAdnVersionBytes() {
            return com.fyber.inneractive.sdk.protobuf.s.a(this.skAdnVersion_);
        }

        public boolean hasSkAdNetworkId() {
            return (this.bitField0_ & 2) != 0;
        }

        public boolean hasSkAdnBundle() {
            return (this.bitField0_ & 8) != 0;
        }

        public boolean hasSkAdnCampign() {
            return (this.bitField0_ & 4) != 0;
        }

        public boolean hasSkAdnId() {
            return (this.bitField0_ & 16) != 0;
        }

        public boolean hasSkAdnImpId() {
            return (this.bitField0_ & 32) != 0;
        }

        public boolean hasSkAdnImpSignature() {
            return (this.bitField0_ & EventBridgeChannel.QUEUE_CAPACITY) != 0;
        }

        public boolean hasSkAdnImpTimestamp() {
            return (this.bitField0_ & 256) != 0;
        }

        public boolean hasSkAdnSignature() {
            return (this.bitField0_ & 1024) != 0;
        }

        public boolean hasSkAdnSourceApp() {
            return (this.bitField0_ & 64) != 0;
        }

        public boolean hasSkAdnTimestamp() {
            return (this.bitField0_ & 128) != 0;
        }

        public boolean hasSkAdnVersion() {
            return (this.bitField0_ & 1) != 0;
        }

        public static p newBuilder(SKAdNetworkData sKAdNetworkData) {
            return (p) DEFAULT_INSTANCE.createBuilder(sKAdNetworkData);
        }

        public static SKAdNetworkData parseDelimitedFrom(InputStream inputStream, h0 h0Var) throws IOException {
            return (SKAdNetworkData) z0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, h0Var);
        }

        public static SKAdNetworkData parseFrom(ByteBuffer byteBuffer, h0 h0Var) throws n1 {
            return (SKAdNetworkData) z0.parseFrom(DEFAULT_INSTANCE, byteBuffer, h0Var);
        }

        public static SKAdNetworkData parseFrom(com.fyber.inneractive.sdk.protobuf.s sVar) throws n1 {
            return (SKAdNetworkData) z0.parseFrom(DEFAULT_INSTANCE, sVar);
        }

        public static SKAdNetworkData parseFrom(com.fyber.inneractive.sdk.protobuf.s sVar, h0 h0Var) throws n1 {
            return (SKAdNetworkData) z0.parseFrom(DEFAULT_INSTANCE, sVar, h0Var);
        }

        public static SKAdNetworkData parseFrom(byte[] bArr) throws n1 {
            return (SKAdNetworkData) z0.parseFrom(DEFAULT_INSTANCE, bArr);
        }

        public static SKAdNetworkData parseFrom(byte[] bArr, h0 h0Var) throws n1 {
            return (SKAdNetworkData) z0.parseFrom(DEFAULT_INSTANCE, bArr, h0Var);
        }

        public static SKAdNetworkData parseFrom(InputStream inputStream) throws IOException {
            return (SKAdNetworkData) z0.parseFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static SKAdNetworkData parseFrom(InputStream inputStream, h0 h0Var) throws IOException {
            return (SKAdNetworkData) z0.parseFrom(DEFAULT_INSTANCE, inputStream, h0Var);
        }

        public static SKAdNetworkData parseFrom(com.fyber.inneractive.sdk.protobuf.w wVar) throws IOException {
            return (SKAdNetworkData) z0.parseFrom(DEFAULT_INSTANCE, wVar);
        }

        public static SKAdNetworkData parseFrom(com.fyber.inneractive.sdk.protobuf.w wVar, h0 h0Var) throws IOException {
            return (SKAdNetworkData) z0.parseFrom(DEFAULT_INSTANCE, wVar, h0Var);
        }
    }

    public static final class SKOverlayData extends z0 implements e2 {
        private static final SKOverlayData DEFAULT_INSTANCE;
        private static volatile m2 PARSER = null;
        public static final int SKOVERLAYAUTOCLICK_FIELD_NUMBER = 7;
        public static final int SKOVERLAYAUTOCLOSE_FIELD_NUMBER = 4;
        public static final int SKOVERLAYDELAY_FIELD_NUMBER = 2;
        public static final int SKOVERLAYDISMISSIBLE_FIELD_NUMBER = 5;
        public static final int SKOVERLAYENDCARDDELAY_FIELD_NUMBER = 6;
        public static final int SKOVERLAYENDCARD_FIELD_NUMBER = 3;
        public static final int SKOVERLAYLPCLICK_FIELD_NUMBER = 8;
        public static final int SKOVERLAYLPDELAY_FIELD_NUMBER = 9;
        public static final int SKOVERLAYPOSITION_FIELD_NUMBER = 1;
        private int bitField0_;
        private boolean skOverlayAutoclick_;
        private int skOverlayAutoclose_;
        private int skOverlayDelay_;
        private int skOverlayDismissible_;
        private int skOverlayEndcardDelay_;
        private int skOverlayEndcard_;
        private boolean skOverlayLpClick_;
        private int skOverlayLpDelay_;
        private int skOverlayPosition_;

        static {
            SKOverlayData sKOverlayData = new SKOverlayData();
            DEFAULT_INSTANCE = sKOverlayData;
            z0.registerDefaultInstance(SKOverlayData.class, sKOverlayData);
        }

        private SKOverlayData() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearSkOverlayAutoclick() {
            this.bitField0_ &= -65;
            this.skOverlayAutoclick_ = false;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearSkOverlayAutoclose() {
            this.bitField0_ &= -9;
            this.skOverlayAutoclose_ = 0;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearSkOverlayDelay() {
            this.bitField0_ &= -3;
            this.skOverlayDelay_ = 0;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearSkOverlayDismissible() {
            this.bitField0_ &= -17;
            this.skOverlayDismissible_ = 0;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearSkOverlayEndcard() {
            this.bitField0_ &= -5;
            this.skOverlayEndcard_ = 0;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearSkOverlayEndcardDelay() {
            this.bitField0_ &= -33;
            this.skOverlayEndcardDelay_ = 0;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearSkOverlayLpClick() {
            this.bitField0_ &= -129;
            this.skOverlayLpClick_ = false;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearSkOverlayLpDelay() {
            this.bitField0_ &= -257;
            this.skOverlayLpDelay_ = 0;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearSkOverlayPosition() {
            this.bitField0_ &= -2;
            this.skOverlayPosition_ = 0;
        }

        public static SKOverlayData getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        public static q newBuilder() {
            return (q) DEFAULT_INSTANCE.createBuilder();
        }

        public static SKOverlayData parseDelimitedFrom(InputStream inputStream) throws IOException {
            return (SKOverlayData) z0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static SKOverlayData parseFrom(ByteBuffer byteBuffer) throws n1 {
            return (SKOverlayData) z0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
        }

        public static m2 parser() {
            return DEFAULT_INSTANCE.getParserForType();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkOverlayAutoclick(boolean z11) {
            this.bitField0_ |= 64;
            this.skOverlayAutoclick_ = z11;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkOverlayAutoclose(int i5) {
            this.bitField0_ |= 8;
            this.skOverlayAutoclose_ = i5;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkOverlayDelay(int i5) {
            this.bitField0_ |= 2;
            this.skOverlayDelay_ = i5;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkOverlayDismissible(int i5) {
            this.bitField0_ |= 16;
            this.skOverlayDismissible_ = i5;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkOverlayEndcard(int i5) {
            this.bitField0_ |= 4;
            this.skOverlayEndcard_ = i5;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkOverlayEndcardDelay(int i5) {
            this.bitField0_ |= 32;
            this.skOverlayEndcardDelay_ = i5;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkOverlayLpClick(boolean z11) {
            this.bitField0_ |= 128;
            this.skOverlayLpClick_ = z11;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkOverlayLpDelay(int i5) {
            this.bitField0_ |= 256;
            this.skOverlayLpDelay_ = i5;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setSkOverlayPosition(int i5) {
            this.bitField0_ |= 1;
            this.skOverlayPosition_ = i5;
        }

        @Override // com.fyber.inneractive.sdk.protobuf.z0
        public final Object dynamicMethod(y0 y0Var, Object obj, Object obj2) {
            m2 u0Var;
            switch (a.f27605a[y0Var.ordinal()]) {
                case 1:
                    return new SKOverlayData();
                case 2:
                    return new q();
                case 3:
                    return z0.newMessageInfo(DEFAULT_INSTANCE, "\u0000\t\u0000\u0001\u0001\t\t\u0000\u0000\u0000\u0001ဋ\u0000\u0002င\u0001\u0003ဋ\u0002\u0004ဋ\u0003\u0005ဋ\u0004\u0006င\u0005\u0007ဇ\u0006\bဇ\u0007\tင\b", new Object[]{"bitField0_", "skOverlayPosition_", "skOverlayDelay_", "skOverlayEndcard_", "skOverlayAutoclose_", "skOverlayDismissible_", "skOverlayEndcardDelay_", "skOverlayAutoclick_", "skOverlayLpClick_", "skOverlayLpDelay_"});
                case 4:
                    return DEFAULT_INSTANCE;
                case 5:
                    m2 m2Var = PARSER;
                    if (m2Var != null) {
                        return m2Var;
                    }
                    synchronized (SKOverlayData.class) {
                        try {
                            u0Var = PARSER;
                            if (u0Var == null) {
                                u0Var = new u0();
                                PARSER = u0Var;
                            }
                        } catch (Throwable th2) {
                            throw th2;
                        }
                    }
                    return u0Var;
                case 6:
                    return (byte) 1;
                case 7:
                    return null;
                default:
                    throw new UnsupportedOperationException();
            }
        }

        public boolean getSkOverlayAutoclick() {
            return this.skOverlayAutoclick_;
        }

        public int getSkOverlayAutoclose() {
            return this.skOverlayAutoclose_;
        }

        public int getSkOverlayDelay() {
            return this.skOverlayDelay_;
        }

        public int getSkOverlayDismissible() {
            return this.skOverlayDismissible_;
        }

        public int getSkOverlayEndcard() {
            return this.skOverlayEndcard_;
        }

        public int getSkOverlayEndcardDelay() {
            return this.skOverlayEndcardDelay_;
        }

        public boolean getSkOverlayLpClick() {
            return this.skOverlayLpClick_;
        }

        public int getSkOverlayLpDelay() {
            return this.skOverlayLpDelay_;
        }

        public int getSkOverlayPosition() {
            return this.skOverlayPosition_;
        }

        public boolean hasSkOverlayAutoclick() {
            return (this.bitField0_ & 64) != 0;
        }

        public boolean hasSkOverlayAutoclose() {
            return (this.bitField0_ & 8) != 0;
        }

        public boolean hasSkOverlayDelay() {
            return (this.bitField0_ & 2) != 0;
        }

        public boolean hasSkOverlayDismissible() {
            return (this.bitField0_ & 16) != 0;
        }

        public boolean hasSkOverlayEndcard() {
            return (this.bitField0_ & 4) != 0;
        }

        public boolean hasSkOverlayEndcardDelay() {
            return (this.bitField0_ & 32) != 0;
        }

        public boolean hasSkOverlayLpClick() {
            return (this.bitField0_ & 128) != 0;
        }

        public boolean hasSkOverlayLpDelay() {
            return (this.bitField0_ & 256) != 0;
        }

        public boolean hasSkOverlayPosition() {
            return (this.bitField0_ & 1) != 0;
        }

        public static q newBuilder(SKOverlayData sKOverlayData) {
            return (q) DEFAULT_INSTANCE.createBuilder(sKOverlayData);
        }

        public static SKOverlayData parseDelimitedFrom(InputStream inputStream, h0 h0Var) throws IOException {
            return (SKOverlayData) z0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, h0Var);
        }

        public static SKOverlayData parseFrom(ByteBuffer byteBuffer, h0 h0Var) throws n1 {
            return (SKOverlayData) z0.parseFrom(DEFAULT_INSTANCE, byteBuffer, h0Var);
        }

        public static SKOverlayData parseFrom(com.fyber.inneractive.sdk.protobuf.s sVar) throws n1 {
            return (SKOverlayData) z0.parseFrom(DEFAULT_INSTANCE, sVar);
        }

        public static SKOverlayData parseFrom(com.fyber.inneractive.sdk.protobuf.s sVar, h0 h0Var) throws n1 {
            return (SKOverlayData) z0.parseFrom(DEFAULT_INSTANCE, sVar, h0Var);
        }

        public static SKOverlayData parseFrom(byte[] bArr) throws n1 {
            return (SKOverlayData) z0.parseFrom(DEFAULT_INSTANCE, bArr);
        }

        public static SKOverlayData parseFrom(byte[] bArr, h0 h0Var) throws n1 {
            return (SKOverlayData) z0.parseFrom(DEFAULT_INSTANCE, bArr, h0Var);
        }

        public static SKOverlayData parseFrom(InputStream inputStream) throws IOException {
            return (SKOverlayData) z0.parseFrom(DEFAULT_INSTANCE, inputStream);
        }

        public static SKOverlayData parseFrom(InputStream inputStream, h0 h0Var) throws IOException {
            return (SKOverlayData) z0.parseFrom(DEFAULT_INSTANCE, inputStream, h0Var);
        }

        public static SKOverlayData parseFrom(com.fyber.inneractive.sdk.protobuf.w wVar) throws IOException {
            return (SKOverlayData) z0.parseFrom(DEFAULT_INSTANCE, wVar);
        }

        public static SKOverlayData parseFrom(com.fyber.inneractive.sdk.protobuf.w wVar, h0 h0Var) throws IOException {
            return (SKOverlayData) z0.parseFrom(DEFAULT_INSTANCE, wVar, h0Var);
        }
    }

    static {
        AdmParametersOuterClass$AdmParameters admParametersOuterClass$AdmParameters = new AdmParametersOuterClass$AdmParameters();
        DEFAULT_INSTANCE = admParametersOuterClass$AdmParameters;
        z0.registerDefaultInstance(AdmParametersOuterClass$AdmParameters.class, admParametersOuterClass$AdmParameters);
    }

    private AdmParametersOuterClass$AdmParameters() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addAbExperiments(Experiment experiment) {
        experiment.getClass();
        ensureAbExperimentsIsMutable();
        this.abExperiments_.add(experiment);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addAllAbExperiments(Iterable<? extends Experiment> iterable) {
        ensureAbExperimentsIsMutable();
        com.fyber.inneractive.sdk.protobuf.b.addAll((Iterable) iterable, (List) this.abExperiments_);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearAbExperiments() {
        this.abExperiments_ = z0.emptyProtobufList();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearAdCompletionUrl() {
        this.bitField0_ &= -1048577;
        this.adCompletionUrl_ = getDefaultInstance().getAdCompletionUrl();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearAdDomain() {
        this.bitField0_ &= -33554433;
        this.adDomain_ = getDefaultInstance().getAdDomain();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearAdDuration() {
        this.bitField0_ &= -2097153;
        this.adDuration_ = 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearAdExpirationInterval() {
        this.bitField0_ &= -1025;
        this.adExpirationInterval_ = 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearAdHeight() {
        this.bitField0_ &= -17;
        this.adHeight_ = 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearAdNetworkId() {
        this.bitField0_ &= -513;
        this.adNetworkId_ = 0L;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearAdNetworkName() {
        this.bitField0_ &= -257;
        this.adNetworkName_ = getDefaultInstance().getAdNetworkName();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearAdType() {
        this.adType_ = 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearAdUnitDisplayType() {
        this.adUnitDisplayType_ = 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearAdUnitId() {
        this.bitField0_ &= -33;
        this.adUnitId_ = getDefaultInstance().getAdUnitId();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearAdUnitType() {
        this.adUnitType_ = 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearAdWidth() {
        this.bitField0_ &= -9;
        this.adWidth_ = 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearAdvertisedAppId() {
        this.bitField0_ &= -16385;
        this.advertisedAppId_ = getDefaultInstance().getAdvertisedAppId();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearAppBundleId() {
        this.bitField0_ &= -524289;
        this.appBundleId_ = getDefaultInstance().getAppBundleId();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearAttributionClickUrl() {
        this.bitField1_ &= -257;
        this.attributionClickUrl_ = getDefaultInstance().getAttributionClickUrl();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearAttributionImpressionUrl() {
        this.bitField1_ &= -129;
        this.attributionImpressionUrl_ = getDefaultInstance().getAttributionImpressionUrl();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearAutoStorekitState() {
        this.bitField1_ &= -33;
        this.autoStorekitState_ = 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearBrandBidderCtaText() {
        this.bitField1_ &= -9;
        this.brandBidderCtaText_ = getDefaultInstance().getBrandBidderCtaText();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearBrandBidderDontShowEndcard() {
        this.bitField1_ &= -5;
        this.brandBidderDontShowEndcard_ = false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearCampaignId() {
        this.bitField0_ &= -134217729;
        this.campaignId_ = getDefaultInstance().getCampaignId();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearContentId() {
        this.bitField0_ &= -65;
        this.contentId_ = 0L;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearCreativeId() {
        this.bitField0_ &= -67108865;
        this.creativeId_ = getDefaultInstance().getCreativeId();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearCreativeType() {
        this.bitField0_ &= -4194305;
        this.creativeType_ = getDefaultInstance().getCreativeType();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearCustomProductPageId() {
        this.bitField1_ &= -65;
        this.customProductPageId_ = getDefaultInstance().getCustomProductPageId();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearErrorMessage() {
        this.bitField0_ &= -5;
        this.errorMessage_ = getDefaultInstance().getErrorMessage();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearIgniteInstallUrl() {
        this.bitField0_ &= LayoutNode.NotPlacedPlaceOrder;
        this.igniteInstallUrl_ = getDefaultInstance().getIgniteInstallUrl();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearIgniteLauncherActivity() {
        this.bitField1_ &= -2;
        this.igniteLauncherActivity_ = getDefaultInstance().getIgniteLauncherActivity();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearIgniteMode() {
        this.bitField0_ &= -1073741825;
        this.igniteMode_ = 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearMarkupUrl() {
        this.bitField0_ &= -2;
        this.markupUrl_ = getDefaultInstance().getMarkupUrl();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearMraidVideoOMSignal() {
        this.bitField1_ &= -17;
        this.mraidVideoOMSignal_ = false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearMrcData() {
        this.mrcData_ = null;
        this.bitField0_ &= -268435457;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearPricingValue() {
        this.bitField0_ &= -16777217;
        this.pricingValue_ = 0.0d;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearPublisherId() {
        this.bitField0_ &= -129;
        this.publisherId_ = 0L;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearSdkClickUrl() {
        this.bitField0_ &= -4097;
        this.sdkClickUrl_ = getDefaultInstance().getSdkClickUrl();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearSdkImpressionUrl() {
        this.bitField0_ &= -2049;
        this.sdkImpressionUrl_ = getDefaultInstance().getSdkImpressionUrl();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearSessionId() {
        this.bitField0_ &= -3;
        this.sessionId_ = getDefaultInstance().getSessionId();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearSkAdNetworkData() {
        this.skAdNetworkData_ = null;
        this.bitField0_ &= -8388609;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearSkOverlayData() {
        this.skOverlayData_ = null;
        this.bitField1_ &= -3;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearSkipDelay() {
        this.bitField1_ &= -513;
        this.skipDelay_ = 0.0d;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearSkipEndcardDelay() {
        this.bitField1_ &= -1025;
        this.skipEndcardDelay_ = 0.0d;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearSkipMode() {
        this.bitField0_ &= -262145;
        this.skipMode_ = false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearSpotId() {
        this.bitField0_ &= -536870913;
        this.spotId_ = 0L;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearStoreCTAText() {
        this.bitField0_ &= -131073;
        this.storeCTAText_ = getDefaultInstance().getStoreCTAText();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearStoreEventUrl() {
        this.bitField0_ &= -65537;
        this.storeEventUrl_ = getDefaultInstance().getStoreEventUrl();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearStoreUrl() {
        this.bitField0_ &= -8193;
        this.storeUrl_ = getDefaultInstance().getStoreUrl();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearStoreUrlType() {
        this.bitField0_ &= -32769;
        this.storeUrlType_ = 0;
    }

    private void ensureAbExperimentsIsMutable() {
        k1 k1Var = this.abExperiments_;
        if (((com.fyber.inneractive.sdk.protobuf.c) k1Var).f30774a) {
            return;
        }
        this.abExperiments_ = z0.mutableCopy(k1Var);
    }

    public static AdmParametersOuterClass$AdmParameters getDefaultInstance() {
        return DEFAULT_INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void mergeMrcData(MRCData mRCData) {
        mRCData.getClass();
        MRCData mRCData2 = this.mrcData_;
        if (mRCData2 == null || mRCData2 == MRCData.getDefaultInstance()) {
            this.mrcData_ = mRCData;
        } else {
            o oVarNewBuilder = MRCData.newBuilder(this.mrcData_);
            oVarNewBuilder.c();
            t0.a(oVarNewBuilder.f30901b, mRCData);
            this.mrcData_ = (MRCData) oVarNewBuilder.b();
        }
        this.bitField0_ |= 268435456;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void mergeSkAdNetworkData(SKAdNetworkData sKAdNetworkData) {
        sKAdNetworkData.getClass();
        SKAdNetworkData sKAdNetworkData2 = this.skAdNetworkData_;
        if (sKAdNetworkData2 == null || sKAdNetworkData2 == SKAdNetworkData.getDefaultInstance()) {
            this.skAdNetworkData_ = sKAdNetworkData;
        } else {
            p pVarNewBuilder = SKAdNetworkData.newBuilder(this.skAdNetworkData_);
            pVarNewBuilder.c();
            t0.a(pVarNewBuilder.f30901b, sKAdNetworkData);
            this.skAdNetworkData_ = (SKAdNetworkData) pVarNewBuilder.b();
        }
        this.bitField0_ |= 8388608;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void mergeSkOverlayData(SKOverlayData sKOverlayData) {
        sKOverlayData.getClass();
        SKOverlayData sKOverlayData2 = this.skOverlayData_;
        if (sKOverlayData2 == null || sKOverlayData2 == SKOverlayData.getDefaultInstance()) {
            this.skOverlayData_ = sKOverlayData;
        } else {
            q qVarNewBuilder = SKOverlayData.newBuilder(this.skOverlayData_);
            qVarNewBuilder.c();
            t0.a(qVarNewBuilder.f30901b, sKOverlayData);
            this.skOverlayData_ = (SKOverlayData) qVarNewBuilder.b();
        }
        this.bitField1_ |= 2;
    }

    public static h newBuilder() {
        return (h) DEFAULT_INSTANCE.createBuilder();
    }

    public static AdmParametersOuterClass$AdmParameters parseDelimitedFrom(InputStream inputStream) throws IOException {
        return (AdmParametersOuterClass$AdmParameters) z0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
    }

    public static AdmParametersOuterClass$AdmParameters parseFrom(ByteBuffer byteBuffer) throws n1 {
        return (AdmParametersOuterClass$AdmParameters) z0.parseFrom(DEFAULT_INSTANCE, byteBuffer);
    }

    public static m2 parser() {
        return DEFAULT_INSTANCE.getParserForType();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void removeAbExperiments(int i5) {
        ensureAbExperimentsIsMutable();
        this.abExperiments_.remove(i5);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAbExperiments(int i5, Experiment experiment) {
        experiment.getClass();
        ensureAbExperimentsIsMutable();
        this.abExperiments_.set(i5, experiment);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAdCompletionUrl(String str) {
        str.getClass();
        this.bitField0_ |= 1048576;
        this.adCompletionUrl_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAdCompletionUrlBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.adCompletionUrl_ = sVar.f();
        this.bitField0_ |= 1048576;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAdDomain(String str) {
        str.getClass();
        this.bitField0_ |= 33554432;
        this.adDomain_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAdDomainBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.adDomain_ = sVar.f();
        this.bitField0_ |= 33554432;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAdDuration(int i5) {
        this.bitField0_ |= 2097152;
        this.adDuration_ = i5;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAdExpirationInterval(int i5) {
        this.bitField0_ |= 1024;
        this.adExpirationInterval_ = i5;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAdHeight(int i5) {
        this.bitField0_ |= 16;
        this.adHeight_ = i5;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAdNetworkId(long j11) {
        this.bitField0_ |= EventBridgeChannel.QUEUE_CAPACITY;
        this.adNetworkId_ = j11;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAdNetworkName(String str) {
        str.getClass();
        this.bitField0_ |= 256;
        this.adNetworkName_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAdNetworkNameBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.adNetworkName_ = sVar.f();
        this.bitField0_ |= 256;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAdType(c cVar) {
        this.adType_ = cVar.a();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAdTypeValue(int i5) {
        this.adType_ = i5;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAdUnitDisplayType(s sVar) {
        this.adUnitDisplayType_ = sVar.a();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAdUnitDisplayTypeValue(int i5) {
        this.adUnitDisplayType_ = i5;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAdUnitId(String str) {
        str.getClass();
        this.bitField0_ |= 32;
        this.adUnitId_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAdUnitIdBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.adUnitId_ = sVar.f();
        this.bitField0_ |= 32;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAdUnitType(e eVar) {
        this.adUnitType_ = eVar.a();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAdUnitTypeValue(int i5) {
        this.adUnitType_ = i5;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAdWidth(int i5) {
        this.bitField0_ |= 8;
        this.adWidth_ = i5;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAdvertisedAppId(String str) {
        str.getClass();
        this.bitField0_ |= ReaderJsonLexerKt.BATCH_SIZE;
        this.advertisedAppId_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAdvertisedAppIdBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.advertisedAppId_ = sVar.f();
        this.bitField0_ |= ReaderJsonLexerKt.BATCH_SIZE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAppBundleId(String str) {
        str.getClass();
        this.bitField0_ |= 524288;
        this.appBundleId_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAppBundleIdBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.appBundleId_ = sVar.f();
        this.bitField0_ |= 524288;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAttributionClickUrl(String str) {
        str.getClass();
        this.bitField1_ |= 256;
        this.attributionClickUrl_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAttributionClickUrlBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.attributionClickUrl_ = sVar.f();
        this.bitField1_ |= 256;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAttributionImpressionUrl(String str) {
        str.getClass();
        this.bitField1_ |= 128;
        this.attributionImpressionUrl_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAttributionImpressionUrlBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.attributionImpressionUrl_ = sVar.f();
        this.bitField1_ |= 128;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAutoStorekitState(g gVar) {
        this.autoStorekitState_ = gVar.a();
        this.bitField1_ |= 32;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAutoStorekitStateValue(int i5) {
        this.bitField1_ |= 32;
        this.autoStorekitState_ = i5;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setBrandBidderCtaText(String str) {
        str.getClass();
        this.bitField1_ |= 8;
        this.brandBidderCtaText_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setBrandBidderCtaTextBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.brandBidderCtaText_ = sVar.f();
        this.bitField1_ |= 8;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setBrandBidderDontShowEndcard(boolean z11) {
        this.bitField1_ |= 4;
        this.brandBidderDontShowEndcard_ = z11;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setCampaignId(String str) {
        str.getClass();
        this.bitField0_ |= 134217728;
        this.campaignId_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setCampaignIdBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.campaignId_ = sVar.f();
        this.bitField0_ |= 134217728;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setContentId(long j11) {
        this.bitField0_ |= 64;
        this.contentId_ = j11;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setCreativeId(String str) {
        str.getClass();
        this.bitField0_ |= 67108864;
        this.creativeId_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setCreativeIdBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.creativeId_ = sVar.f();
        this.bitField0_ |= 67108864;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setCreativeType(String str) {
        str.getClass();
        this.bitField0_ |= 4194304;
        this.creativeType_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setCreativeTypeBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.creativeType_ = sVar.f();
        this.bitField0_ |= 4194304;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setCustomProductPageId(String str) {
        str.getClass();
        this.bitField1_ |= 64;
        this.customProductPageId_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setCustomProductPageIdBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.customProductPageId_ = sVar.f();
        this.bitField1_ |= 64;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setErrorMessage(String str) {
        str.getClass();
        this.bitField0_ |= 4;
        this.errorMessage_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setErrorMessageBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.errorMessage_ = sVar.f();
        this.bitField0_ |= 4;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setIgniteInstallUrl(String str) {
        str.getClass();
        this.bitField0_ |= Integer.MIN_VALUE;
        this.igniteInstallUrl_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setIgniteInstallUrlBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.igniteInstallUrl_ = sVar.f();
        this.bitField0_ |= Integer.MIN_VALUE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setIgniteLauncherActivity(String str) {
        str.getClass();
        this.bitField1_ |= 1;
        this.igniteLauncherActivity_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setIgniteLauncherActivityBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.igniteLauncherActivity_ = sVar.f();
        this.bitField1_ |= 1;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setIgniteMode(n nVar) {
        this.igniteMode_ = nVar.a();
        this.bitField0_ |= 1073741824;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setIgniteModeValue(int i5) {
        this.bitField0_ |= 1073741824;
        this.igniteMode_ = i5;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setMarkupUrl(String str) {
        str.getClass();
        this.bitField0_ |= 1;
        this.markupUrl_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setMarkupUrlBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.markupUrl_ = sVar.f();
        this.bitField0_ |= 1;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setMraidVideoOMSignal(boolean z11) {
        this.bitField1_ |= 16;
        this.mraidVideoOMSignal_ = z11;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setMrcData(MRCData mRCData) {
        mRCData.getClass();
        this.mrcData_ = mRCData;
        this.bitField0_ |= 268435456;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setPricingValue(double d5) {
        this.bitField0_ |= 16777216;
        this.pricingValue_ = d5;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setPublisherId(long j11) {
        this.bitField0_ |= 128;
        this.publisherId_ = j11;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setSdkClickUrl(String str) {
        str.getClass();
        this.bitField0_ |= u1.FLAG_APPEARED_IN_PRE_LAYOUT;
        this.sdkClickUrl_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setSdkClickUrlBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.sdkClickUrl_ = sVar.f();
        this.bitField0_ |= u1.FLAG_APPEARED_IN_PRE_LAYOUT;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setSdkImpressionUrl(String str) {
        str.getClass();
        this.bitField0_ |= 2048;
        this.sdkImpressionUrl_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setSdkImpressionUrlBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.sdkImpressionUrl_ = sVar.f();
        this.bitField0_ |= 2048;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setSessionId(String str) {
        str.getClass();
        this.bitField0_ |= 2;
        this.sessionId_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setSessionIdBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.sessionId_ = sVar.f();
        this.bitField0_ |= 2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setSkAdNetworkData(SKAdNetworkData sKAdNetworkData) {
        sKAdNetworkData.getClass();
        this.skAdNetworkData_ = sKAdNetworkData;
        this.bitField0_ |= 8388608;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setSkOverlayData(SKOverlayData sKOverlayData) {
        sKOverlayData.getClass();
        this.skOverlayData_ = sKOverlayData;
        this.bitField1_ |= 2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setSkipDelay(double d5) {
        this.bitField1_ |= EventBridgeChannel.QUEUE_CAPACITY;
        this.skipDelay_ = d5;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setSkipEndcardDelay(double d5) {
        this.bitField1_ |= 1024;
        this.skipEndcardDelay_ = d5;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setSkipMode(boolean z11) {
        this.bitField0_ |= SQLiteDatabase.OPEN_PRIVATECACHE;
        this.skipMode_ = z11;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setSpotId(long j11) {
        this.bitField0_ |= SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING;
        this.spotId_ = j11;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setStoreCTAText(String str) {
        str.getClass();
        this.bitField0_ |= SQLiteDatabase.OPEN_SHAREDCACHE;
        this.storeCTAText_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setStoreCTATextBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.storeCTAText_ = sVar.f();
        this.bitField0_ |= SQLiteDatabase.OPEN_SHAREDCACHE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setStoreEventUrl(String str) {
        str.getClass();
        this.bitField0_ |= SQLiteDatabase.OPEN_FULLMUTEX;
        this.storeEventUrl_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setStoreEventUrlBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.storeEventUrl_ = sVar.f();
        this.bitField0_ |= SQLiteDatabase.OPEN_FULLMUTEX;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setStoreUrl(String str) {
        str.getClass();
        this.bitField0_ |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
        this.storeUrl_ = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setStoreUrlBytes(com.fyber.inneractive.sdk.protobuf.s sVar) throws IllegalArgumentException {
        com.fyber.inneractive.sdk.protobuf.b.checkByteStringIsUtf8(sVar);
        this.storeUrl_ = sVar.f();
        this.bitField0_ |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setStoreUrlType(j jVar) {
        this.storeUrlType_ = jVar.a();
        this.bitField0_ |= SQLiteDatabase.OPEN_NOMUTEX;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setStoreUrlTypeValue(int i5) {
        this.bitField0_ |= SQLiteDatabase.OPEN_NOMUTEX;
        this.storeUrlType_ = i5;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.z0
    public final Object dynamicMethod(y0 y0Var, Object obj, Object obj2) {
        m2 u0Var;
        switch (a.f27605a[y0Var.ordinal()]) {
            case 1:
                return new AdmParametersOuterClass$AdmParameters();
            case 2:
                return new h();
            case 3:
                return z0.newMessageInfo(DEFAULT_INSTANCE, "\u0000/\u0000\u0002\u0001//\u0000\u0001\u0000\u0001ለ\u0000\u0002ለ\u0001\u0003ለ\u0002\u0004ဋ\u0003\u0005ဋ\u0004\u0006ለ\u0005\u0007\f\b\f\tဃ\u0006\nဃ\u0007\u000bለ\b\fဃ\t\rင\n\u000e\f\u000fለ\u000b\u0010ለ\f\u0011ለ\r\u0012ለ\u000e\u0013ဌ\u000f\u0014ለ\u0010\u0015ለ\u0011\u0016ဇ\u0012\u0017ለ\u0013\u0018ለ\u0014\u0019ဋ\u0015\u001aለ\u0016\u001bဉ\u0017\u001cက\u0018\u001dለ\u0019\u001eለ\u001a\u001fለ\u001b ဉ\u001c!\u001b\"ဃ\u001d#ဌ\u001e$ለ\u001f%ለ &ဉ!'ဇ\"(ለ#)ဇ$*ဌ%+ለ&,ለ'-ለ(.က)/က*", new Object[]{"bitField0_", "bitField1_", "markupUrl_", "sessionId_", "errorMessage_", "adWidth_", "adHeight_", "adUnitId_", "adUnitType_", "adUnitDisplayType_", "contentId_", "publisherId_", "adNetworkName_", "adNetworkId_", "adExpirationInterval_", "adType_", "sdkImpressionUrl_", "sdkClickUrl_", "storeUrl_", "advertisedAppId_", "storeUrlType_", "storeEventUrl_", "storeCTAText_", "skipMode_", "appBundleId_", "adCompletionUrl_", "adDuration_", "creativeType_", "skAdNetworkData_", "pricingValue_", "adDomain_", "creativeId_", "campaignId_", "mrcData_", "abExperiments_", Experiment.class, "spotId_", "igniteMode_", "igniteInstallUrl_", "igniteLauncherActivity_", "skOverlayData_", "brandBidderDontShowEndcard_", "brandBidderCtaText_", "mraidVideoOMSignal_", "autoStorekitState_", "customProductPageId_", "attributionImpressionUrl_", "attributionClickUrl_", "skipDelay_", "skipEndcardDelay_"});
            case 4:
                return DEFAULT_INSTANCE;
            case 5:
                m2 m2Var = PARSER;
                if (m2Var != null) {
                    return m2Var;
                }
                synchronized (AdmParametersOuterClass$AdmParameters.class) {
                    try {
                        u0Var = PARSER;
                        if (u0Var == null) {
                            u0Var = new u0();
                            PARSER = u0Var;
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                return u0Var;
            case 6:
                return (byte) 1;
            case 7:
                return null;
            default:
                throw new UnsupportedOperationException();
        }
    }

    public Experiment getAbExperiments(int i5) {
        return (Experiment) this.abExperiments_.get(i5);
    }

    public int getAbExperimentsCount() {
        return this.abExperiments_.size();
    }

    public List<Experiment> getAbExperimentsList() {
        return this.abExperiments_;
    }

    public l getAbExperimentsOrBuilder(int i5) {
        return (l) this.abExperiments_.get(i5);
    }

    public List<? extends l> getAbExperimentsOrBuilderList() {
        return this.abExperiments_;
    }

    public String getAdCompletionUrl() {
        return this.adCompletionUrl_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getAdCompletionUrlBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.adCompletionUrl_);
    }

    public String getAdDomain() {
        return this.adDomain_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getAdDomainBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.adDomain_);
    }

    public int getAdDuration() {
        return this.adDuration_;
    }

    public int getAdExpirationInterval() {
        return this.adExpirationInterval_;
    }

    public int getAdHeight() {
        return this.adHeight_;
    }

    public long getAdNetworkId() {
        return this.adNetworkId_;
    }

    public String getAdNetworkName() {
        return this.adNetworkName_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getAdNetworkNameBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.adNetworkName_);
    }

    public c getAdType() {
        int i5 = this.adType_;
        c cVar = i5 != 0 ? i5 != 4 ? i5 != 6 ? i5 != 8 ? i5 != 10 ? i5 != 15 ? null : c.DV360 : c.NATIVE : c.VAST : c.MRAID : c.HTML : c.OTHER;
        return cVar == null ? c.UNRECOGNIZED : cVar;
    }

    public int getAdTypeValue() {
        return this.adType_;
    }

    public s getAdUnitDisplayType() {
        int i5 = this.adUnitDisplayType_;
        s sVar = i5 != 0 ? i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? i5 != 5 ? null : s.TYPENATIVE : s.MRECT : s.REWARDED : s.INTERSTITIAL : s.BANNER : s.UNITDISPLAYTYPEUNKNOWN;
        return sVar == null ? s.UNRECOGNIZED : sVar;
    }

    public int getAdUnitDisplayTypeValue() {
        return this.adUnitDisplayType_;
    }

    public String getAdUnitId() {
        return this.adUnitId_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getAdUnitIdBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.adUnitId_);
    }

    public e getAdUnitType() {
        int i5 = this.adUnitType_;
        e eVar = i5 != 0 ? i5 != 1 ? i5 != 2 ? null : e.VIDEOANDDISPLAY : e.VIDEO : e.DISPLAY;
        return eVar == null ? e.UNRECOGNIZED : eVar;
    }

    public int getAdUnitTypeValue() {
        return this.adUnitType_;
    }

    public int getAdWidth() {
        return this.adWidth_;
    }

    public String getAdvertisedAppId() {
        return this.advertisedAppId_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getAdvertisedAppIdBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.advertisedAppId_);
    }

    public String getAppBundleId() {
        return this.appBundleId_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getAppBundleIdBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.appBundleId_);
    }

    public String getAttributionClickUrl() {
        return this.attributionClickUrl_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getAttributionClickUrlBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.attributionClickUrl_);
    }

    public String getAttributionImpressionUrl() {
        return this.attributionImpressionUrl_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getAttributionImpressionUrlBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.attributionImpressionUrl_);
    }

    public g getAutoStorekitState() {
        int i5 = this.autoStorekitState_;
        g gVar = i5 != 0 ? i5 != 1 ? i5 != 2 ? null : g.AUTOSTOREKITPRESENTANDTRACK : g.AUTOSTOREKITPRESENTONLY : g.AUTOSTOREKITNONE;
        return gVar == null ? g.UNRECOGNIZED : gVar;
    }

    public int getAutoStorekitStateValue() {
        return this.autoStorekitState_;
    }

    public String getBrandBidderCtaText() {
        return this.brandBidderCtaText_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getBrandBidderCtaTextBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.brandBidderCtaText_);
    }

    public boolean getBrandBidderDontShowEndcard() {
        return this.brandBidderDontShowEndcard_;
    }

    public String getCampaignId() {
        return this.campaignId_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getCampaignIdBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.campaignId_);
    }

    public long getContentId() {
        return this.contentId_;
    }

    public String getCreativeId() {
        return this.creativeId_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getCreativeIdBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.creativeId_);
    }

    public String getCreativeType() {
        return this.creativeType_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getCreativeTypeBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.creativeType_);
    }

    public String getCustomProductPageId() {
        return this.customProductPageId_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getCustomProductPageIdBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.customProductPageId_);
    }

    public String getErrorMessage() {
        return this.errorMessage_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getErrorMessageBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.errorMessage_);
    }

    public String getIgniteInstallUrl() {
        return this.igniteInstallUrl_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getIgniteInstallUrlBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.igniteInstallUrl_);
    }

    public String getIgniteLauncherActivity() {
        return this.igniteLauncherActivity_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getIgniteLauncherActivityBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.igniteLauncherActivity_);
    }

    public n getIgniteMode() {
        int i5 = this.igniteMode_;
        n nVar = i5 != 0 ? i5 != 1 ? i5 != 2 ? null : n.TRUESINGLETAP : n.SINGLETAP : n.NONE;
        return nVar == null ? n.UNRECOGNIZED : nVar;
    }

    public int getIgniteModeValue() {
        return this.igniteMode_;
    }

    public String getMarkupUrl() {
        return this.markupUrl_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getMarkupUrlBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.markupUrl_);
    }

    public boolean getMraidVideoOMSignal() {
        return this.mraidVideoOMSignal_;
    }

    public MRCData getMrcData() {
        MRCData mRCData = this.mrcData_;
        return mRCData == null ? MRCData.getDefaultInstance() : mRCData;
    }

    public double getPricingValue() {
        return this.pricingValue_;
    }

    public long getPublisherId() {
        return this.publisherId_;
    }

    public String getSdkClickUrl() {
        return this.sdkClickUrl_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getSdkClickUrlBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.sdkClickUrl_);
    }

    public String getSdkImpressionUrl() {
        return this.sdkImpressionUrl_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getSdkImpressionUrlBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.sdkImpressionUrl_);
    }

    public String getSessionId() {
        return this.sessionId_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getSessionIdBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.sessionId_);
    }

    public SKAdNetworkData getSkAdNetworkData() {
        SKAdNetworkData sKAdNetworkData = this.skAdNetworkData_;
        return sKAdNetworkData == null ? SKAdNetworkData.getDefaultInstance() : sKAdNetworkData;
    }

    public SKOverlayData getSkOverlayData() {
        SKOverlayData sKOverlayData = this.skOverlayData_;
        return sKOverlayData == null ? SKOverlayData.getDefaultInstance() : sKOverlayData;
    }

    public double getSkipDelay() {
        return this.skipDelay_;
    }

    public double getSkipEndcardDelay() {
        return this.skipEndcardDelay_;
    }

    public boolean getSkipMode() {
        return this.skipMode_;
    }

    public long getSpotId() {
        return this.spotId_;
    }

    public String getStoreCTAText() {
        return this.storeCTAText_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getStoreCTATextBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.storeCTAText_);
    }

    public String getStoreEventUrl() {
        return this.storeEventUrl_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getStoreEventUrlBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.storeEventUrl_);
    }

    public String getStoreUrl() {
        return this.storeUrl_;
    }

    public com.fyber.inneractive.sdk.protobuf.s getStoreUrlBytes() {
        return com.fyber.inneractive.sdk.protobuf.s.a(this.storeUrl_);
    }

    public j getStoreUrlType() {
        int i5 = this.storeUrlType_;
        j jVar = i5 != 0 ? i5 != 1 ? null : j.AUTOMATIC : j.MANUAL;
        return jVar == null ? j.UNRECOGNIZED : jVar;
    }

    public int getStoreUrlTypeValue() {
        return this.storeUrlType_;
    }

    public boolean hasAdCompletionUrl() {
        return (this.bitField0_ & 1048576) != 0;
    }

    public boolean hasAdDomain() {
        return (this.bitField0_ & 33554432) != 0;
    }

    public boolean hasAdDuration() {
        return (this.bitField0_ & 2097152) != 0;
    }

    public boolean hasAdExpirationInterval() {
        return (this.bitField0_ & 1024) != 0;
    }

    public boolean hasAdHeight() {
        return (this.bitField0_ & 16) != 0;
    }

    public boolean hasAdNetworkId() {
        return (this.bitField0_ & EventBridgeChannel.QUEUE_CAPACITY) != 0;
    }

    public boolean hasAdNetworkName() {
        return (this.bitField0_ & 256) != 0;
    }

    public boolean hasAdUnitId() {
        return (this.bitField0_ & 32) != 0;
    }

    public boolean hasAdWidth() {
        return (this.bitField0_ & 8) != 0;
    }

    public boolean hasAdvertisedAppId() {
        return (this.bitField0_ & ReaderJsonLexerKt.BATCH_SIZE) != 0;
    }

    public boolean hasAppBundleId() {
        return (this.bitField0_ & 524288) != 0;
    }

    public boolean hasAttributionClickUrl() {
        return (this.bitField1_ & 256) != 0;
    }

    public boolean hasAttributionImpressionUrl() {
        return (this.bitField1_ & 128) != 0;
    }

    public boolean hasAutoStorekitState() {
        return (this.bitField1_ & 32) != 0;
    }

    public boolean hasBrandBidderCtaText() {
        return (this.bitField1_ & 8) != 0;
    }

    public boolean hasBrandBidderDontShowEndcard() {
        return (this.bitField1_ & 4) != 0;
    }

    public boolean hasCampaignId() {
        return (this.bitField0_ & 134217728) != 0;
    }

    public boolean hasContentId() {
        return (this.bitField0_ & 64) != 0;
    }

    public boolean hasCreativeId() {
        return (this.bitField0_ & 67108864) != 0;
    }

    public boolean hasCreativeType() {
        return (this.bitField0_ & 4194304) != 0;
    }

    public boolean hasCustomProductPageId() {
        return (this.bitField1_ & 64) != 0;
    }

    public boolean hasErrorMessage() {
        return (this.bitField0_ & 4) != 0;
    }

    public boolean hasIgniteInstallUrl() {
        return (this.bitField0_ & Integer.MIN_VALUE) != 0;
    }

    public boolean hasIgniteLauncherActivity() {
        return (this.bitField1_ & 1) != 0;
    }

    public boolean hasIgniteMode() {
        return (this.bitField0_ & 1073741824) != 0;
    }

    public boolean hasMarkupUrl() {
        return (this.bitField0_ & 1) != 0;
    }

    public boolean hasMraidVideoOMSignal() {
        return (this.bitField1_ & 16) != 0;
    }

    public boolean hasMrcData() {
        return (this.bitField0_ & 268435456) != 0;
    }

    public boolean hasPricingValue() {
        return (this.bitField0_ & 16777216) != 0;
    }

    public boolean hasPublisherId() {
        return (this.bitField0_ & 128) != 0;
    }

    public boolean hasSdkClickUrl() {
        return (this.bitField0_ & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0;
    }

    public boolean hasSdkImpressionUrl() {
        return (this.bitField0_ & 2048) != 0;
    }

    public boolean hasSessionId() {
        return (this.bitField0_ & 2) != 0;
    }

    public boolean hasSkAdNetworkData() {
        return (this.bitField0_ & 8388608) != 0;
    }

    public boolean hasSkOverlayData() {
        return (this.bitField1_ & 2) != 0;
    }

    public boolean hasSkipDelay() {
        return (this.bitField1_ & EventBridgeChannel.QUEUE_CAPACITY) != 0;
    }

    public boolean hasSkipEndcardDelay() {
        return (this.bitField1_ & 1024) != 0;
    }

    public boolean hasSkipMode() {
        return (this.bitField0_ & SQLiteDatabase.OPEN_PRIVATECACHE) != 0;
    }

    public boolean hasSpotId() {
        return (this.bitField0_ & SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING) != 0;
    }

    public boolean hasStoreCTAText() {
        return (this.bitField0_ & SQLiteDatabase.OPEN_SHAREDCACHE) != 0;
    }

    public boolean hasStoreEventUrl() {
        return (this.bitField0_ & SQLiteDatabase.OPEN_FULLMUTEX) != 0;
    }

    public boolean hasStoreUrl() {
        return (this.bitField0_ & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0;
    }

    public boolean hasStoreUrlType() {
        return (this.bitField0_ & SQLiteDatabase.OPEN_NOMUTEX) != 0;
    }

    public static h newBuilder(AdmParametersOuterClass$AdmParameters admParametersOuterClass$AdmParameters) {
        return (h) DEFAULT_INSTANCE.createBuilder(admParametersOuterClass$AdmParameters);
    }

    public static AdmParametersOuterClass$AdmParameters parseDelimitedFrom(InputStream inputStream, h0 h0Var) throws IOException {
        return (AdmParametersOuterClass$AdmParameters) z0.parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, h0Var);
    }

    public static AdmParametersOuterClass$AdmParameters parseFrom(ByteBuffer byteBuffer, h0 h0Var) throws n1 {
        return (AdmParametersOuterClass$AdmParameters) z0.parseFrom(DEFAULT_INSTANCE, byteBuffer, h0Var);
    }

    public static AdmParametersOuterClass$AdmParameters parseFrom(com.fyber.inneractive.sdk.protobuf.s sVar) throws n1 {
        return (AdmParametersOuterClass$AdmParameters) z0.parseFrom(DEFAULT_INSTANCE, sVar);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addAbExperiments(int i5, Experiment experiment) {
        experiment.getClass();
        ensureAbExperimentsIsMutable();
        this.abExperiments_.add(i5, experiment);
    }

    public static AdmParametersOuterClass$AdmParameters parseFrom(com.fyber.inneractive.sdk.protobuf.s sVar, h0 h0Var) throws n1 {
        return (AdmParametersOuterClass$AdmParameters) z0.parseFrom(DEFAULT_INSTANCE, sVar, h0Var);
    }

    public static AdmParametersOuterClass$AdmParameters parseFrom(byte[] bArr) throws n1 {
        return (AdmParametersOuterClass$AdmParameters) z0.parseFrom(DEFAULT_INSTANCE, bArr);
    }

    public static AdmParametersOuterClass$AdmParameters parseFrom(byte[] bArr, h0 h0Var) throws n1 {
        return (AdmParametersOuterClass$AdmParameters) z0.parseFrom(DEFAULT_INSTANCE, bArr, h0Var);
    }

    public static AdmParametersOuterClass$AdmParameters parseFrom(InputStream inputStream) throws IOException {
        return (AdmParametersOuterClass$AdmParameters) z0.parseFrom(DEFAULT_INSTANCE, inputStream);
    }

    public static AdmParametersOuterClass$AdmParameters parseFrom(InputStream inputStream, h0 h0Var) throws IOException {
        return (AdmParametersOuterClass$AdmParameters) z0.parseFrom(DEFAULT_INSTANCE, inputStream, h0Var);
    }

    public static AdmParametersOuterClass$AdmParameters parseFrom(com.fyber.inneractive.sdk.protobuf.w wVar) throws IOException {
        return (AdmParametersOuterClass$AdmParameters) z0.parseFrom(DEFAULT_INSTANCE, wVar);
    }

    public static AdmParametersOuterClass$AdmParameters parseFrom(com.fyber.inneractive.sdk.protobuf.w wVar, h0 h0Var) throws IOException {
        return (AdmParametersOuterClass$AdmParameters) z0.parseFrom(DEFAULT_INSTANCE, wVar, h0Var);
    }
}
