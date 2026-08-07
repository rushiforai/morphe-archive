.class public Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceAttri;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/BefFaceInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FaceAttri"
.end annotation


# instance fields
.field age:F

.field attractive:F

.field boy_prob:F

.field confuse_prob:F

.field exp_probs:[F

.field expression_type:I

.field happy_score:F


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
    iput v0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceAttri;->age:F

    .line 6
    .line 7
    iput v0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceAttri;->boy_prob:F

    .line 8
    .line 9
    iput v0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceAttri;->attractive:F

    .line 10
    .line 11
    iput v0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceAttri;->happy_score:F

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput v0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceAttri;->expression_type:I

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public getAge()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceAttri;->age:F

    .line 2
    .line 3
    return p0
.end method

.method public getAttractive()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceAttri;->attractive:F

    .line 2
    .line 3
    return p0
.end method

.method public getBoy_prob()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceAttri;->boy_prob:F

    .line 2
    .line 3
    return p0
.end method

.method public getConfuseProb()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceAttri;->confuse_prob:F

    .line 2
    .line 3
    return p0
.end method

.method public getExp_probs()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceAttri;->exp_probs:[F

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    new-array p0, p0, [F

    .line 7
    .line 8
    :cond_0
    return-object p0
.end method

.method public getExpression_type()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceAttri;->expression_type:I

    .line 2
    .line 3
    return p0
.end method

.method public getHappy_score()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceAttri;->happy_score:F

    .line 2
    .line 3
    return p0
.end method

.method public setAge(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceAttri;->age:F

    .line 2
    .line 3
    return-void
.end method

.method public setAttractive(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceAttri;->attractive:F

    .line 2
    .line 3
    return-void
.end method

.method public setBoy_prob(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceAttri;->boy_prob:F

    .line 2
    .line 3
    return-void
.end method

.method public setExp_probs([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceAttri;->exp_probs:[F

    .line 2
    .line 3
    return-void
.end method

.method public setExpression_type(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceAttri;->expression_type:I

    .line 2
    .line 3
    return-void
.end method

.method public setHappy_score(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceAttri;->happy_score:F

    .line 2
    .line 3
    return-void
.end method
