.class public Lcom/mm/mediasdk/log/cache/EditPhotoLogData;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field private photoBeautyBigeye:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_beauty_bigeye"
    .end annotation
.end field

.field private photoBeautyBodythin:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_beauty_bodythin"
    .end annotation
.end field

.field private photoBeautyLegLenght:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_beauty_legLenght"
    .end annotation
.end field

.field private photoBeautyRuddy:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_beauty_ruddy"
    .end annotation
.end field

.field private photoBeautySkinsmooth:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_beauty_skinsmooth"
    .end annotation
.end field

.field private photoBeautySkinwhiten:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_beauty_skinwhiten"
    .end annotation
.end field

.field private photoBeautyThinface:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_beauty_thinface"
    .end annotation
.end field

.field private photoDetectBodyJoint:Z
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


# virtual methods
.method public getPhotoBeautyBigeye()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoBeautyBigeye:F

    .line 2
    .line 3
    return p0
.end method

.method public getPhotoBeautyBodythin()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoBeautyBodythin:F

    .line 2
    .line 3
    return p0
.end method

.method public getPhotoBeautyLegLenght()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoBeautyLegLenght:F

    .line 2
    .line 3
    return p0
.end method

.method public getPhotoBeautyRuddy()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoBeautyRuddy:F

    .line 2
    .line 3
    return p0
.end method

.method public getPhotoBeautySkinsmooth()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoBeautySkinsmooth:F

    .line 2
    .line 3
    return p0
.end method

.method public getPhotoBeautySkinwhiten()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoBeautySkinwhiten:F

    .line 2
    .line 3
    return p0
.end method

.method public getPhotoBeautyThinface()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoBeautyThinface:F

    .line 2
    .line 3
    return p0
.end method

.method public getPhotoFileFormat()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoFileFormat:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPhotoFileHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoFileHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getPhotoFileSize()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoFileSize:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getPhotoFileWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoFileWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public getPhotoOriginHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoOriginHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getPhotoOriginSize()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoOriginSize:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getPhotoOriginWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoOriginWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public isPhotoDetectBodyJoint()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoDetectBodyJoint:Z

    .line 2
    .line 3
    return p0
.end method

.method public isPhotoDetectFace()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoDetectFace:Z

    .line 2
    .line 3
    return p0
.end method

.method public setPhotoBeautyBigeye(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoBeautyBigeye:F

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoBeautyBodythin(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoBeautyBodythin:F

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoBeautyLegLenght(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoBeautyLegLenght:F

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoBeautyRuddy(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoBeautyRuddy:F

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoBeautySkinsmooth(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoBeautySkinsmooth:F

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoBeautySkinwhiten(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoBeautySkinwhiten:F

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoBeautyThinface(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoBeautyThinface:F

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoDetectBodyJoint(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoDetectBodyJoint:Z

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoDetectFace(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoDetectFace:Z

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoFileFormat(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoFileFormat:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoFileHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoFileHeight:I

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoFileSize(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoFileSize:J

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoFileWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoFileWidth:I

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoOriginFormat(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoOriginFormat:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoOriginHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoOriginHeight:I

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoOriginSize(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoOriginSize:J

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoOriginWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/mm/mediasdk/log/cache/EditPhotoLogData;->photoOriginWidth:I

    .line 2
    .line 3
    return-void
.end method
