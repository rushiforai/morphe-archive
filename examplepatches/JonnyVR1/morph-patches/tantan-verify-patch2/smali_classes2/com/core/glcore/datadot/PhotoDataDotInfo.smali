.class public Lcom/core/glcore/datadot/PhotoDataDotInfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private photoBeautyBigeye:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_beauty_bigeye"
    .end annotation
.end field

.field private photoBeautyBodyThin:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_beauty_bodythin"
    .end annotation
.end field

.field private photoBeautyLegLenght:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_beauty_legLenght"
    .end annotation
.end field

.field private photoBeautySkinWhiten:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_beauty_skinwhiten"
    .end annotation
.end field

.field private photoBeautySkinsmooth:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_beauty_skinsmooth"
    .end annotation
.end field

.field private photoBeautyThinFace:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_beauty_thinface"
    .end annotation
.end field

.field private photoDetectBody:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_detect_body_joint"
    .end annotation
.end field

.field private photoDetectFace:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_detect_face"
    .end annotation
.end field

.field private photoFileFormat:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_file_format"
    .end annotation
.end field

.field private photoFileHeight:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_file_height"
    .end annotation
.end field

.field private photoFileSize:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_file_size"
    .end annotation
.end field

.field private photoFileWidth:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_file_width"
    .end annotation
.end field

.field private photoFilterType:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_filter_type"
    .end annotation
.end field

.field private photoOriginFormat:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_origin_format"
    .end annotation
.end field

.field private photoOriginHeight:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_origin_height"
    .end annotation
.end field

.field private photoOriginSize:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_origin_size"
    .end annotation
.end field

.field private photoOriginWidth:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_origin_width"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getPhotoDataDot(Ljava/lang/String;)Lcom/core/glcore/datadot/PhotoDataDotInfo;
    .locals 2

    .line 1
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-class v1, Lcom/core/glcore/datadot/PhotoDataDotInfo;

    .line 6
    .line 7
    invoke-virtual {v0, p0, v1}, Lcom/core/glcore/util/JsonUtil;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;

    .line 12
    .line 13
    return-object p0
.end method

.method public static toPhotoDataDot(Lcom/core/glcore/datadot/PhotoDataDotInfo;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lcom/core/glcore/util/JsonUtil;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method


# virtual methods
.method public getPhotoBeautyBigeye()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoBeautyBigeye:F

    .line 2
    .line 3
    return p0
.end method

.method public getPhotoBeautyBodyThin()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoBeautyBodyThin:F

    .line 2
    .line 3
    return p0
.end method

.method public getPhotoBeautyLegLenght()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoBeautyLegLenght:F

    .line 2
    .line 3
    return p0
.end method

.method public getPhotoBeautySkinWhiten()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoBeautySkinWhiten:F

    .line 2
    .line 3
    return p0
.end method

.method public getPhotoBeautySkinsmooth()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoBeautySkinsmooth:F

    .line 2
    .line 3
    return p0
.end method

.method public getPhotoBeautyThinFace()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoBeautyThinFace:F

    .line 2
    .line 3
    return p0
.end method

.method public getPhotoFileFormat()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoFileFormat:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPhotoFileHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoFileHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getPhotoFileSize()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoFileSize:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getPhotoFileWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoFileWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public getPhotoFilterType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoFilterType:I

    .line 2
    .line 3
    return p0
.end method

.method public getPhotoOriginFormat()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoOriginFormat:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPhotoOriginHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoOriginHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getPhotoOriginSize()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoOriginSize:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getPhotoOriginWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoOriginWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public isPhotoDetectBody()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoDetectBody:Z

    .line 2
    .line 3
    return p0
.end method

.method public isPhotoDetectFace()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoDetectFace:Z

    .line 2
    .line 3
    return p0
.end method

.method public setPhotoBeautyBigeye(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoBeautyBigeye:F

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoBeautyBodyThin(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoBeautyBodyThin:F

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoBeautyLegLenght(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoBeautyLegLenght:F

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoBeautySkinWhiten(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoBeautySkinWhiten:F

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoBeautySkinsmooth(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoBeautySkinsmooth:F

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoBeautyThinFace(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoBeautyThinFace:F

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoDetectBody(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoDetectBody:Z

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoDetectFace(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoDetectFace:Z

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoFileFormat(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoFileFormat:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoFileHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoFileHeight:I

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoFileSize(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoFileSize:J

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoFileWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoFileWidth:I

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoFilterType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoFilterType:I

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoOriginFormat(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoOriginFormat:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoOriginHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoOriginHeight:I

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoOriginSize(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoOriginSize:J

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoOriginWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/core/glcore/datadot/PhotoDataDotInfo;->photoOriginWidth:I

    .line 2
    .line 3
    return-void
.end method
