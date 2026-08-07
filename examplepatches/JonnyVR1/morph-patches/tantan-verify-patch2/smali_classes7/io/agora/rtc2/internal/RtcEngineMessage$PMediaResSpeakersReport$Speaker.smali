.class public Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport$Speaker;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResSpeakersReport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Speaker"
.end annotation


# instance fields
.field public uid:I

.field public vad:I

.field public voicePitch:D

.field public volume:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
