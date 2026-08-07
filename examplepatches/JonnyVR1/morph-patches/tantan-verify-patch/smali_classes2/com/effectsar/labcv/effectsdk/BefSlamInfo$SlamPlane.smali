.class public Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPlane;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/BefSlamInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SlamPlane"
.end annotation


# instance fields
.field public boundary:[F

.field public hasPlane:I

.field public normal:[F

.field public offset:F

.field public origin:[F

.field public originWorld:[F

.field public planePointsIds:[I


# direct methods
.method public constructor <init>(I[FF[F[F[F[I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPlane;->hasPlane:I

    .line 5
    .line 6
    iput-object p2, p0, Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPlane;->normal:[F

    .line 7
    .line 8
    iput p3, p0, Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPlane;->offset:F

    .line 9
    .line 10
    iput-object p4, p0, Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPlane;->originWorld:[F

    .line 11
    .line 12
    iput-object p5, p0, Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPlane;->origin:[F

    .line 13
    .line 14
    iput-object p6, p0, Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPlane;->boundary:[F

    .line 15
    .line 16
    iput-object p7, p0, Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPlane;->planePointsIds:[I

    .line 17
    .line 18
    return-void
.end method
