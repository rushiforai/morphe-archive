.class public Lio/agora/rtc2/internal/RtcEngineMessage$PVideoCompositingLayout;
.super Lio/agora/rtc2/internal/Marshallable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/RtcEngineMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PVideoCompositingLayout"
.end annotation


# static fields
.field private static final SERVER_TYPE:S = 0x0s

.field private static final URI:S = 0x14s


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lio/agora/rtc2/internal/Marshallable;-><init>()V

    return-void
.end method

.method private marshall(Lio/agora/rtc2/internal/Marshallable;Lio/agora/rtc2/video/VideoCompositingLayout;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lio/agora/rtc2/internal/Marshallable;->pushShort(S)V

    const/16 v1, 0x14

    invoke-virtual {p1, v1}, Lio/agora/rtc2/internal/Marshallable;->pushShort(S)V

    iget v1, p2, Lio/agora/rtc2/video/VideoCompositingLayout;->canvasWidth:I

    invoke-virtual {p1, v1}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget v1, p2, Lio/agora/rtc2/video/VideoCompositingLayout;->canvasHeight:I

    invoke-virtual {p1, v1}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v1, p2, Lio/agora/rtc2/video/VideoCompositingLayout;->backgroundColor:Ljava/lang/String;

    const-string v2, ""

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {p1, v1}, Lio/agora/rtc2/internal/Marshallable;->pushBytes([B)V

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {p1, v1}, Lio/agora/rtc2/internal/Marshallable;->pushBytes([B)V

    :goto_0
    iget-object v1, p2, Lio/agora/rtc2/video/VideoCompositingLayout;->appData:[B

    if-eqz v1, :cond_1

    invoke-virtual {p1, v1}, Lio/agora/rtc2/internal/Marshallable;->pushBytes([B)V

    goto :goto_1

    :cond_1
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {p1, v1}, Lio/agora/rtc2/internal/Marshallable;->pushBytes([B)V

    :goto_1
    iget-object v1, p2, Lio/agora/rtc2/video/VideoCompositingLayout;->regions:[Lio/agora/rtc2/video/VideoCompositingLayout$Region;

    array-length v1, v1

    int-to-short v1, v1

    invoke-virtual {p1, v1}, Lio/agora/rtc2/internal/Marshallable;->pushShort(S)V

    :goto_2
    iget-object v1, p2, Lio/agora/rtc2/video/VideoCompositingLayout;->regions:[Lio/agora/rtc2/video/VideoCompositingLayout$Region;

    array-length v2, v1

    if-ge v0, v2, :cond_2

    aget-object v1, v1, v0

    invoke-direct {p0, p1, v1}, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoCompositingLayout;->marshallRegion(Lio/agora/rtc2/internal/Marshallable;Lio/agora/rtc2/video/VideoCompositingLayout$Region;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_2
    return-void
.end method

.method private marshallRegion(Lio/agora/rtc2/internal/Marshallable;Lio/agora/rtc2/video/VideoCompositingLayout$Region;)V
    .locals 2

    iget p0, p2, Lio/agora/rtc2/video/VideoCompositingLayout$Region;->uid:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object p0, p2, Lio/agora/rtc2/video/VideoCompositingLayout$Region;->userId:Ljava/lang/String;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_0

    iget-object p0, p2, Lio/agora/rtc2/video/VideoCompositingLayout$Region;->userId:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushBytes([B)V

    goto :goto_0

    :cond_0
    const-string p0, ""

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushBytes([B)V

    :goto_0
    iget-wide v0, p2, Lio/agora/rtc2/video/VideoCompositingLayout$Region;->x:D

    invoke-virtual {p1, v0, v1}, Lio/agora/rtc2/internal/Marshallable;->pushDouble(D)V

    iget-wide v0, p2, Lio/agora/rtc2/video/VideoCompositingLayout$Region;->y:D

    invoke-virtual {p1, v0, v1}, Lio/agora/rtc2/internal/Marshallable;->pushDouble(D)V

    iget-wide v0, p2, Lio/agora/rtc2/video/VideoCompositingLayout$Region;->width:D

    invoke-virtual {p1, v0, v1}, Lio/agora/rtc2/internal/Marshallable;->pushDouble(D)V

    iget-wide v0, p2, Lio/agora/rtc2/video/VideoCompositingLayout$Region;->height:D

    invoke-virtual {p1, v0, v1}, Lio/agora/rtc2/internal/Marshallable;->pushDouble(D)V

    iget p0, p2, Lio/agora/rtc2/video/VideoCompositingLayout$Region;->zOrder:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-wide v0, p2, Lio/agora/rtc2/video/VideoCompositingLayout$Region;->alpha:D

    invoke-virtual {p1, v0, v1}, Lio/agora/rtc2/internal/Marshallable;->pushDouble(D)V

    iget p0, p2, Lio/agora/rtc2/video/VideoCompositingLayout$Region;->renderMode:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    return-void
.end method


# virtual methods
.method public marshall(Lio/agora/rtc2/video/VideoCompositingLayout;)[B
    .locals 0

    .line 2
    invoke-direct {p0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoCompositingLayout;->marshall(Lio/agora/rtc2/internal/Marshallable;Lio/agora/rtc2/video/VideoCompositingLayout;)V

    invoke-super {p0}, Lio/agora/rtc2/internal/Marshallable;->marshall()[B

    move-result-object p0

    return-object p0
.end method
