package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.medium.proto.model.ParagraphPb;
import com.medium.proto.model.PostDisplay;
import com.medium.proto.model.SectionModel;
import com.medium.proto.model.SelectionPb;
import com.medium.proto.obv.post.DeltaType;
import com.squareup.wire.sjIw.ezwlgQm;
import gen.model.ImageMetadata;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
@Metadata(d1 = {"\u0000P\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001R\u001a\u0010\u0007\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u0004\u001a\u0004\b\u0005\u0010\u0006R\u001c\u0010\f\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\t\u0010\n\u001a\u0004\b\t\u0010\u000bR\u001c\u0010\u0011\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u000e\u0010\u000f\u001a\u0004\b\u000e\u0010\u0010R\u001c\u0010\u0017\u001a\u0004\u0018\u00010\u00128\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016R\u001c\u0010\u001d\u001a\u0004\u0018\u00010\u00188\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0019\u0010\u001a\u001a\u0004\b\u001b\u0010\u001cR\u001c\u0010\"\u001a\u0004\u0018\u00010\u001e8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u001f\u0010 \u001a\u0004\b\u0003\u0010!R\u001c\u0010'\u001a\u0004\u0018\u00010#8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b$\u0010%\u001a\u0004\b\u001f\u0010&R\u001c\u0010)\u001a\u0004\u0018\u00010\u00188\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u001b\u0010\u001a\u001a\u0004\b(\u0010\u001cR\u001c\u0010*\u001a\u0004\u0018\u00010\u00188\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0005\u0010\u001a\u001a\u0004\b\u0019\u0010\u001cR\u001c\u0010/\u001a\u0004\u0018\u00010+8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b,\u0010-\u001a\u0004\b\u0013\u0010.R\u001c\u00103\u001a\u0004\u0018\u0001008\u0006X\u0087\u0004¢\u0006\f\n\u0004\b(\u00101\u001a\u0004\b$\u00102R\u001c\u00104\u001a\u0004\u0018\u00010\u00128\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0015\u0010\u0014\u001a\u0004\b,\u0010\u0016¨\u00065"}, d2 = {"La73;", "", "Lcom/medium/proto/obv/post/DeltaType;", "a", "Lcom/medium/proto/obv/post/DeltaType;", "i", "()Lcom/medium/proto/obv/post/DeltaType;", "type", "", "b", "Ljava/lang/Integer;", "()Ljava/lang/Integer;", "index", "Lcom/medium/proto/model/ParagraphPb;", "c", "Lcom/medium/proto/model/ParagraphPb;", "()Lcom/medium/proto/model/ParagraphPb;", "paragraphPb", "", "d", "Ljava/lang/Boolean;", "l", "()Ljava/lang/Boolean;", "isStartOfSection", "", "e", "Ljava/lang/String;", "h", "()Ljava/lang/String;", "text", "Lgen/model/ImageMetadata;", "f", "Lgen/model/ImageMetadata;", "()Lgen/model/ImageMetadata;", "imageMetadata", "Lcom/medium/proto/model/SectionModel;", "g", "Lcom/medium/proto/model/SectionModel;", "()Lcom/medium/proto/model/SectionModel;", "sectionModel", "k", "versionId", "revision", "Lcom/medium/proto/model/PostDisplay;", "j", "Lcom/medium/proto/model/PostDisplay;", "()Lcom/medium/proto/model/PostDisplay;", "postDisplay", "Lcom/medium/proto/model/SelectionPb;", "Lcom/medium/proto/model/SelectionPb;", "()Lcom/medium/proto/model/SelectionPb;", "selectionPb", "verifySameName", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class a73 {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    @g0c("type")
    private final DeltaType type;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    @g0c("index")
    private final Integer index;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    @g0c("paragraph")
    private final ParagraphPb paragraphPb;

    /* JADX INFO: renamed from: d, reason: from kotlin metadata */
    @g0c("isStartOfSection")
    private final Boolean isStartOfSection;

    /* JADX INFO: renamed from: e, reason: from kotlin metadata */
    @g0c("text")
    private final String text;

    /* JADX INFO: renamed from: f, reason: from kotlin metadata */
    @g0c("image")
    private final ImageMetadata imageMetadata;

    /* JADX INFO: renamed from: g, reason: from kotlin metadata */
    @g0c("section")
    private final SectionModel sectionModel;

    /* JADX INFO: renamed from: h, reason: from kotlin metadata */
    @g0c("versionId")
    private final String versionId;

    /* JADX INFO: renamed from: i, reason: from kotlin metadata */
    @g0c("rev")
    private final String revision;

    /* JADX INFO: renamed from: j, reason: from kotlin metadata */
    @g0c("postDisplay")
    private final PostDisplay postDisplay;

    /* JADX INFO: renamed from: k, reason: from kotlin metadata */
    @g0c("selection")
    private final SelectionPb selectionPb;

    /* JADX INFO: renamed from: l, reason: from kotlin metadata */
    @g0c("verifySameName")
    private final Boolean verifySameName;

    public a73(DeltaType deltaType, Integer num, ParagraphPb paragraphPb, Boolean bool, String str, ImageMetadata imageMetadata, SectionModel sectionModel, String str2, String str3, PostDisplay postDisplay, SelectionPb selectionPb, Boolean bool2, int i) {
        num = (i & 2) != 0 ? null : num;
        paragraphPb = (i & 4) != 0 ? null : paragraphPb;
        bool = (i & 8) != 0 ? null : bool;
        str = (i & 16) != 0 ? null : str;
        imageMetadata = (i & 32) != 0 ? null : imageMetadata;
        sectionModel = (i & 64) != 0 ? null : sectionModel;
        str2 = (i & 128) != 0 ? null : str2;
        str3 = (i & 256) != 0 ? null : str3;
        postDisplay = (i & 512) != 0 ? null : postDisplay;
        selectionPb = (i & 1024) != 0 ? null : selectionPb;
        bool2 = (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : bool2;
        deltaType.getClass();
        this.type = deltaType;
        this.index = num;
        this.paragraphPb = paragraphPb;
        this.isStartOfSection = bool;
        this.text = str;
        this.imageMetadata = imageMetadata;
        this.sectionModel = sectionModel;
        this.versionId = str2;
        this.revision = str3;
        this.postDisplay = postDisplay;
        this.selectionPb = selectionPb;
        this.verifySameName = bool2;
    }

    /* JADX INFO: renamed from: a, reason: from getter */
    public final ImageMetadata getImageMetadata() {
        return this.imageMetadata;
    }

    /* JADX INFO: renamed from: b, reason: from getter */
    public final Integer getIndex() {
        return this.index;
    }

    /* JADX INFO: renamed from: c, reason: from getter */
    public final ParagraphPb getParagraphPb() {
        return this.paragraphPb;
    }

    /* JADX INFO: renamed from: d, reason: from getter */
    public final PostDisplay getPostDisplay() {
        return this.postDisplay;
    }

    /* JADX INFO: renamed from: e, reason: from getter */
    public final String getRevision() {
        return this.revision;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a73)) {
            return false;
        }
        a73 a73Var = (a73) obj;
        return this.type == a73Var.type && g76.L(this.index, a73Var.index) && g76.L(this.paragraphPb, a73Var.paragraphPb) && g76.L(this.isStartOfSection, a73Var.isStartOfSection) && g76.L(this.text, a73Var.text) && g76.L(this.imageMetadata, a73Var.imageMetadata) && g76.L(this.sectionModel, a73Var.sectionModel) && g76.L(this.versionId, a73Var.versionId) && g76.L(this.revision, a73Var.revision) && g76.L(this.postDisplay, a73Var.postDisplay) && g76.L(this.selectionPb, a73Var.selectionPb) && g76.L(this.verifySameName, a73Var.verifySameName);
    }

    /* JADX INFO: renamed from: f, reason: from getter */
    public final SectionModel getSectionModel() {
        return this.sectionModel;
    }

    /* JADX INFO: renamed from: g, reason: from getter */
    public final SelectionPb getSelectionPb() {
        return this.selectionPb;
    }

    /* JADX INFO: renamed from: h, reason: from getter */
    public final String getText() {
        return this.text;
    }

    public final int hashCode() {
        int iHashCode = this.type.hashCode() * 31;
        Integer num = this.index;
        int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
        ParagraphPb paragraphPb = this.paragraphPb;
        int iHashCode3 = (iHashCode2 + (paragraphPb == null ? 0 : paragraphPb.hashCode())) * 31;
        Boolean bool = this.isStartOfSection;
        int iHashCode4 = (iHashCode3 + (bool == null ? 0 : bool.hashCode())) * 31;
        String str = this.text;
        int iHashCode5 = (iHashCode4 + (str == null ? 0 : str.hashCode())) * 31;
        ImageMetadata imageMetadata = this.imageMetadata;
        int iHashCode6 = (iHashCode5 + (imageMetadata == null ? 0 : imageMetadata.hashCode())) * 31;
        SectionModel sectionModel = this.sectionModel;
        int iHashCode7 = (iHashCode6 + (sectionModel == null ? 0 : sectionModel.hashCode())) * 31;
        String str2 = this.versionId;
        int iHashCode8 = (iHashCode7 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.revision;
        int iHashCode9 = (iHashCode8 + (str3 == null ? 0 : str3.hashCode())) * 31;
        PostDisplay postDisplay = this.postDisplay;
        int iHashCode10 = (iHashCode9 + (postDisplay == null ? 0 : postDisplay.hashCode())) * 31;
        SelectionPb selectionPb = this.selectionPb;
        int iHashCode11 = (iHashCode10 + (selectionPb == null ? 0 : selectionPb.hashCode())) * 31;
        Boolean bool2 = this.verifySameName;
        return iHashCode11 + (bool2 != null ? bool2.hashCode() : 0);
    }

    /* JADX INFO: renamed from: i, reason: from getter */
    public final DeltaType getType() {
        return this.type;
    }

    /* JADX INFO: renamed from: j, reason: from getter */
    public final Boolean getVerifySameName() {
        return this.verifySameName;
    }

    /* JADX INFO: renamed from: k, reason: from getter */
    public final String getVersionId() {
        return this.versionId;
    }

    /* JADX INFO: renamed from: l, reason: from getter */
    public final Boolean getIsStartOfSection() {
        return this.isStartOfSection;
    }

    public final String toString() {
        return "Delta(type=" + this.type + ", index=" + this.index + ", paragraphPb=" + this.paragraphPb + ", isStartOfSection=" + this.isStartOfSection + ", text=" + this.text + ", imageMetadata=" + this.imageMetadata + ", sectionModel=" + this.sectionModel + ", versionId=" + this.versionId + ezwlgQm.uWzyAnxZTR + this.revision + ", postDisplay=" + this.postDisplay + ", selectionPb=" + this.selectionPb + ", verifySameName=" + this.verifySameName + ")";
    }
}
