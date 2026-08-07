.class public Ll/g6x;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private additionalInfo:Ll/w80;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "additionalInfo"
    .end annotation
.end field

.field distortionList:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "distortionList"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/z5x;",
            ">;"
        }
    .end annotation
.end field

.field private duration:J

.field private effectList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/xqe;",
            ">;"
        }
    .end annotation
.end field

.field faceFacialFeatureScale:F

.field faceScale:F

.field folderPath:Ljava/lang/String;

.field frameRate:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "frameRate"
    .end annotation
.end field

.field lookUpFilters:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "filterList"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/e5w;",
            ">;"
        }
    .end annotation
.end field

.field masks:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "faceMaskList"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/z5x;",
            ">;"
        }
    .end annotation
.end field

.field private modelType:I

.field private pollGroupNum:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "pollGroupNum"
    .end annotation
.end field

.field previewPath:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "previewPath"
    .end annotation
.end field

.field sound:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "sound"
    .end annotation
.end field

.field soundPath:Ljava/lang/String;

.field soundPitchMode:I

.field public spectrumSticker:Ll/w4g0;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "spectrumFilter"
    .end annotation
.end field

.field stickers:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "itemList"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/w4g0;",
            ">;"
        }
    .end annotation
.end field

.field warpType:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/g6x;->soundPitchMode:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a()Ll/w80;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g6x;->additionalInfo:Ll/w80;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/z5x;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/g6x;->distortionList:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/xqe;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/g6x;->effectList:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Ll/g6x;->frameRate:I

    .line 2
    .line 3
    return p0
.end method

.method public e()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/e5w;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/g6x;->lookUpFilters:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/z5x;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/g6x;->masks:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g6x;->sound:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/w4g0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/g6x;->stickers:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/g6x;->faceFacialFeatureScale:F

    .line 2
    .line 3
    return-void
.end method

.method public j(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/g6x;->faceScale:F

    .line 2
    .line 3
    return-void
.end method

.method public k(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g6x;->folderPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public l(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g6x;->soundPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public m(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/g6x;->soundPitchMode:I

    .line 2
    .line 3
    return-void
.end method

.method public n(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/w4g0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/g6x;->stickers:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public o(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g6x;->warpType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
