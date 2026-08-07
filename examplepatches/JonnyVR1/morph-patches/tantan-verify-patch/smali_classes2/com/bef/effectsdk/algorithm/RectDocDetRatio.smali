.class public Lcom/bef/effectsdk/algorithm/RectDocDetRatio;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Lcom/amazing/annotation/EffectKeep;
.end annotation


# instance fields
.field private heightVal:I

.field private ratio:F

.field private widthVal:I


# direct methods
.method public constructor <init>(FII)V
    .locals 0
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/bef/effectsdk/algorithm/RectDocDetRatio;->ratio:F

    .line 5
    .line 6
    iput p2, p0, Lcom/bef/effectsdk/algorithm/RectDocDetRatio;->widthVal:I

    .line 7
    .line 8
    iput p3, p0, Lcom/bef/effectsdk/algorithm/RectDocDetRatio;->heightVal:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getHeightVal()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bef/effectsdk/algorithm/RectDocDetRatio;->heightVal:I

    .line 2
    .line 3
    return p0
.end method

.method public getRatio()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/bef/effectsdk/algorithm/RectDocDetRatio;->ratio:F

    .line 2
    .line 3
    return p0
.end method

.method public getWidthVal()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bef/effectsdk/algorithm/RectDocDetRatio;->widthVal:I

    .line 2
    .line 3
    return p0
.end method
