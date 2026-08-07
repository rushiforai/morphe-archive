.class public Lcom/momo/mcamera/mask/BeautyFace;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private awlType:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "wrapType"
    .end annotation
.end field

.field private bigEye:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "bigEyeAmount"
    .end annotation
.end field

.field private bigEyeValue:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "bigEyeValue"
    .end annotation
.end field

.field private eyeBrightenValue:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "eyeBrightenValue"
    .end annotation
.end field

.field private nasolabiaFoldslValue:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "nasolabiaFoldslValue"
    .end annotation
.end field

.field private removePouchValue:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "removePouchValue"
    .end annotation
.end field

.field private skinRuddyValue:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "skinRuddyValue"
    .end annotation
.end field

.field private skinSharpenValue:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "skinSharpenValue"
    .end annotation
.end field

.field private skinSmoothing:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "skinSmoothingAmount"
    .end annotation
.end field

.field private skinSmoothingValue:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "skinSmoothingValue"
    .end annotation
.end field

.field private skinWhitenValue:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "skinWhitenValue"
    .end annotation
.end field

.field private teethWhtienValue:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "teethWhtienValue"
    .end annotation
.end field

.field private thinFace:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "thinFaceAmount"
    .end annotation
.end field

.field private thinFaceValue:F
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "thinFaceValue"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, -0x40800000    # -1.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/momo/mcamera/mask/BeautyFace;->bigEyeValue:F

    .line 7
    .line 8
    iput v0, p0, Lcom/momo/mcamera/mask/BeautyFace;->thinFaceValue:F

    .line 9
    .line 10
    iput v0, p0, Lcom/momo/mcamera/mask/BeautyFace;->skinSmoothingValue:F

    .line 11
    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/BeautyFace;->skinWhitenValue:F

    .line 13
    .line 14
    iput v0, p0, Lcom/momo/mcamera/mask/BeautyFace;->skinRuddyValue:F

    .line 15
    .line 16
    iput v0, p0, Lcom/momo/mcamera/mask/BeautyFace;->skinSharpenValue:F

    .line 17
    .line 18
    iput v0, p0, Lcom/momo/mcamera/mask/BeautyFace;->eyeBrightenValue:F

    .line 19
    .line 20
    iput v0, p0, Lcom/momo/mcamera/mask/BeautyFace;->teethWhtienValue:F

    .line 21
    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/BeautyFace;->removePouchValue:F

    .line 23
    .line 24
    iput v0, p0, Lcom/momo/mcamera/mask/BeautyFace;->nasolabiaFoldslValue:F

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public getAwlType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/BeautyFace;->awlType:I

    .line 2
    .line 3
    return p0
.end method

.method public getBigEye()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/BeautyFace;->bigEye:F

    .line 2
    .line 3
    return p0
.end method

.method public getBigEyeValue()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/BeautyFace;->bigEyeValue:F

    .line 2
    .line 3
    return p0
.end method

.method public getEyeBrightenValue()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/BeautyFace;->eyeBrightenValue:F

    .line 2
    .line 3
    return p0
.end method

.method public getNasolabiaFoldslValue()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/BeautyFace;->nasolabiaFoldslValue:F

    .line 2
    .line 3
    return p0
.end method

.method public getRemovePouchValue()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/BeautyFace;->removePouchValue:F

    .line 2
    .line 3
    return p0
.end method

.method public getSkinRuddyValue()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/BeautyFace;->skinRuddyValue:F

    .line 2
    .line 3
    return p0
.end method

.method public getSkinSharpenValue()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/BeautyFace;->skinSharpenValue:F

    .line 2
    .line 3
    return p0
.end method

.method public getSkinSmoothing()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/BeautyFace;->skinSmoothing:F

    .line 2
    .line 3
    return p0
.end method

.method public getSkinSmoothingValue()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/BeautyFace;->skinSmoothingValue:F

    .line 2
    .line 3
    return p0
.end method

.method public getSkinWhitenValue()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/BeautyFace;->skinWhitenValue:F

    .line 2
    .line 3
    return p0
.end method

.method public getTeethWhtienValue()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/BeautyFace;->teethWhtienValue:F

    .line 2
    .line 3
    return p0
.end method

.method public getThinFace()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/BeautyFace;->thinFace:F

    .line 2
    .line 3
    return p0
.end method

.method public getThinFaceValue()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/BeautyFace;->thinFaceValue:F

    .line 2
    .line 3
    return p0
.end method

.method public setAwlType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/BeautyFace;->awlType:I

    .line 2
    .line 3
    return-void
.end method

.method public setBigEye(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/BeautyFace;->bigEye:F

    .line 2
    .line 3
    return-void
.end method

.method public setBigEyeValue(I)V
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    iput p1, p0, Lcom/momo/mcamera/mask/BeautyFace;->bigEyeValue:F

    .line 3
    .line 4
    return-void
.end method

.method public setEyeBrightenValue(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/BeautyFace;->eyeBrightenValue:F

    .line 2
    .line 3
    return-void
.end method

.method public setNasolabiaFoldslValue(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/BeautyFace;->nasolabiaFoldslValue:F

    .line 2
    .line 3
    return-void
.end method

.method public setRemovePouchValue(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/BeautyFace;->removePouchValue:F

    .line 2
    .line 3
    return-void
.end method

.method public setSkinRuddyValue(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/BeautyFace;->skinRuddyValue:F

    .line 2
    .line 3
    return-void
.end method

.method public setSkinSharpenValue(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/BeautyFace;->skinSharpenValue:F

    .line 2
    .line 3
    return-void
.end method

.method public setSkinSmoothing(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/BeautyFace;->skinSmoothing:F

    .line 2
    .line 3
    return-void
.end method

.method public setSkinSmoothingValue(I)V
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    iput p1, p0, Lcom/momo/mcamera/mask/BeautyFace;->skinSmoothingValue:F

    .line 3
    .line 4
    return-void
.end method

.method public setSkinWhitenValue(I)V
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    iput p1, p0, Lcom/momo/mcamera/mask/BeautyFace;->skinWhitenValue:F

    .line 3
    .line 4
    return-void
.end method

.method public setTeethWhtienValue(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/BeautyFace;->teethWhtienValue:F

    .line 2
    .line 3
    return-void
.end method

.method public setThinFace(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/BeautyFace;->thinFace:F

    .line 2
    .line 3
    return-void
.end method

.method public setThinFaceValue(I)V
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    iput p1, p0, Lcom/momo/mcamera/mask/BeautyFace;->thinFaceValue:F

    .line 3
    .line 4
    return-void
.end method
