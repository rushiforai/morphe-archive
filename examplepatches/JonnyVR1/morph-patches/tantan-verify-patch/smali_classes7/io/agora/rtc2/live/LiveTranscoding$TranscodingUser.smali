.class public Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/live/LiveTranscoding;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TranscodingUser"
.end annotation


# instance fields
.field public alpha:F

.field public audioChannel:I

.field public height:I

.field public uid:I

.field public userId:Ljava/lang/String;

.field public width:I

.field public x:I

.field public y:I

.field public zOrder:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->uid:I

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->alpha:F

    return-void
.end method
