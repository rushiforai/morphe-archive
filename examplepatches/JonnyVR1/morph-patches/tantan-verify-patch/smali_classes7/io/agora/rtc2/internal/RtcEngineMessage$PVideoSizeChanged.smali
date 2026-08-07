.class public Lio/agora/rtc2/internal/RtcEngineMessage$PVideoSizeChanged;
.super Lio/agora/rtc2/internal/Marshallable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/RtcEngineMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PVideoSizeChanged"
.end annotation


# instance fields
.field public height:I

.field public rotation:I

.field public source:I

.field public uid:I

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lio/agora/rtc2/internal/Marshallable;-><init>()V

    return-void
.end method


# virtual methods
.method public marshall()[B
    .locals 1

    iget v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoSizeChanged;->source:I

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushByte(B)V

    iget v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoSizeChanged;->uid:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoSizeChanged;->width:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoSizeChanged;->height:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoSizeChanged;->rotation:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    invoke-super {p0}, Lio/agora/rtc2/internal/Marshallable;->marshall()[B

    move-result-object p0

    return-object p0
.end method

.method public unmarshall([B)V
    .locals 0

    invoke-super {p0, p1}, Lio/agora/rtc2/internal/Marshallable;->unmarshall([B)V

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popByte()B

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoSizeChanged;->source:I

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoSizeChanged;->uid:I

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoSizeChanged;->width:I

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoSizeChanged;->height:I

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoSizeChanged;->rotation:I

    return-void
.end method
