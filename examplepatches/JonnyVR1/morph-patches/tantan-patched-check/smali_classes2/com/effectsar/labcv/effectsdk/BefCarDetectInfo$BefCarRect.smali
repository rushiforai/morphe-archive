.class public Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefCarRect;
.super Lcom/effectsar/labcv/effectsdk/BefPublicDefine$BefRect;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BefCarRect"
.end annotation


# instance fields
.field private orientation:I


# direct methods
.method public constructor <init>(IIII)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/effectsar/labcv/effectsdk/BefPublicDefine$BefRect;-><init>(IIII)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefCarRect;->orientation:I

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(IIIII)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/effectsar/labcv/effectsdk/BefPublicDefine$BefRect;-><init>(IIII)V

    .line 9
    iput p5, p0, Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefCarRect;->orientation:I

    return-void
.end method


# virtual methods
.method public getOrientation()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefCarRect;->orientation:I

    .line 2
    .line 3
    return p0
.end method

.method public setOrientation(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefCarRect;->orientation:I

    .line 2
    .line 3
    return-void
.end method
