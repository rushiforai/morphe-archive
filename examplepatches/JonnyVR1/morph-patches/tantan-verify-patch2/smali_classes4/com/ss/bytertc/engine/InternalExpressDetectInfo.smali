.class public Lcom/ss/bytertc/engine/InternalExpressDetectInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public age:F

.field public angryScore:F

.field public arousal:F

.field public attractive:F

.field public boyProb:F

.field public happyScore:F

.field public sadScore:F

.field public surpriseScore:F

.field public valence:F


# direct methods
.method public constructor <init>(FFFFFFFFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/ss/bytertc/engine/InternalExpressDetectInfo;->age:F

    .line 5
    .line 6
    iput p2, p0, Lcom/ss/bytertc/engine/InternalExpressDetectInfo;->boyProb:F

    .line 7
    .line 8
    iput p3, p0, Lcom/ss/bytertc/engine/InternalExpressDetectInfo;->attractive:F

    .line 9
    .line 10
    iput p4, p0, Lcom/ss/bytertc/engine/InternalExpressDetectInfo;->happyScore:F

    .line 11
    .line 12
    iput p5, p0, Lcom/ss/bytertc/engine/InternalExpressDetectInfo;->sadScore:F

    .line 13
    .line 14
    iput p6, p0, Lcom/ss/bytertc/engine/InternalExpressDetectInfo;->angryScore:F

    .line 15
    .line 16
    iput p7, p0, Lcom/ss/bytertc/engine/InternalExpressDetectInfo;->surpriseScore:F

    .line 17
    .line 18
    iput p8, p0, Lcom/ss/bytertc/engine/InternalExpressDetectInfo;->arousal:F

    .line 19
    .line 20
    iput p9, p0, Lcom/ss/bytertc/engine/InternalExpressDetectInfo;->valence:F

    .line 21
    .line 22
    return-void
.end method

.method private static create(FFFFFFFFF)Lcom/ss/bytertc/engine/InternalExpressDetectInfo;
    .locals 10
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/InternalExpressDetectInfo;

    .line 2
    .line 3
    move v1, p0

    .line 4
    move v2, p1

    .line 5
    move v3, p2

    .line 6
    move v4, p3

    .line 7
    move v5, p4

    .line 8
    move v6, p5

    .line 9
    move/from16 v7, p6

    .line 10
    .line 11
    move/from16 v8, p7

    .line 12
    .line 13
    move/from16 v9, p8

    .line 14
    .line 15
    invoke-direct/range {v0 .. v9}, Lcom/ss/bytertc/engine/InternalExpressDetectInfo;-><init>(FFFFFFFFF)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method
