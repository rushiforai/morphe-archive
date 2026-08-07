.class public Lio/agora/rtc2/video/MakeUpOptions;
.super Ljava/lang/Object;


# instance fields
.field public mBlushColor:I

.field public mBlushStrength:F

.field public mBlushType:I

.field public mBrowColor:I

.field public mBrowStrength:F

.field public mBrowType:I

.field public mLashColor:I

.field public mLashStrength:F

.field public mLashType:I

.field public mLipColor:I

.field public mLipStrength:F

.field public mLipType:I

.field public mMakeUpEnable:Z

.field public mPupilStrength:F

.field public mPupilType:I

.field public mShadowStrength:F

.field public mShadowType:I


# direct methods
.method public constructor <init>()V
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/agora/rtc2/video/MakeUpOptions;->mMakeUpEnable:Z

    iput v0, p0, Lio/agora/rtc2/video/MakeUpOptions;->mBrowType:I

    iput v0, p0, Lio/agora/rtc2/video/MakeUpOptions;->mBrowColor:I

    const/4 v1, 0x0

    iput v1, p0, Lio/agora/rtc2/video/MakeUpOptions;->mBrowStrength:F

    iput v0, p0, Lio/agora/rtc2/video/MakeUpOptions;->mLashType:I

    iput v0, p0, Lio/agora/rtc2/video/MakeUpOptions;->mLashColor:I

    iput v1, p0, Lio/agora/rtc2/video/MakeUpOptions;->mLashStrength:F

    iput v0, p0, Lio/agora/rtc2/video/MakeUpOptions;->mShadowType:I

    iput v1, p0, Lio/agora/rtc2/video/MakeUpOptions;->mShadowStrength:F

    iput v0, p0, Lio/agora/rtc2/video/MakeUpOptions;->mPupilType:I

    iput v1, p0, Lio/agora/rtc2/video/MakeUpOptions;->mPupilStrength:F

    iput v0, p0, Lio/agora/rtc2/video/MakeUpOptions;->mBlushType:I

    iput v0, p0, Lio/agora/rtc2/video/MakeUpOptions;->mBlushColor:I

    iput v1, p0, Lio/agora/rtc2/video/MakeUpOptions;->mBlushStrength:F

    iput v0, p0, Lio/agora/rtc2/video/MakeUpOptions;->mLipType:I

    iput v0, p0, Lio/agora/rtc2/video/MakeUpOptions;->mLipColor:I

    iput v1, p0, Lio/agora/rtc2/video/MakeUpOptions;->mLipStrength:F

    return-void
.end method
