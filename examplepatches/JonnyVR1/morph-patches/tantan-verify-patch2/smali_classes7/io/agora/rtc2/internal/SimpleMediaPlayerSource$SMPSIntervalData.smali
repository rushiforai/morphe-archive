.class Lio/agora/rtc2/internal/SimpleMediaPlayerSource$SMPSIntervalData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/SimpleMediaPlayerSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SMPSIntervalData"
.end annotation


# instance fields
.field private byteBuffer:Ljava/nio/ByteBuffer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private isEndOfStream:Z

.field private isError:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lio/agora/rtc2/internal/SimpleMediaPlayerSource$SMPSIntervalData;->byteBuffer:Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/agora/rtc2/internal/SimpleMediaPlayerSource$SMPSIntervalData;->isEndOfStream:Z

    iput-boolean v0, p0, Lio/agora/rtc2/internal/SimpleMediaPlayerSource$SMPSIntervalData;->isError:Z

    return-void
.end method

.method public static synthetic access$102(Lio/agora/rtc2/internal/SimpleMediaPlayerSource$SMPSIntervalData;Z)Z
    .locals 0

    iput-boolean p1, p0, Lio/agora/rtc2/internal/SimpleMediaPlayerSource$SMPSIntervalData;->isError:Z

    return p1
.end method

.method public static synthetic access$202(Lio/agora/rtc2/internal/SimpleMediaPlayerSource$SMPSIntervalData;Z)Z
    .locals 0

    iput-boolean p1, p0, Lio/agora/rtc2/internal/SimpleMediaPlayerSource$SMPSIntervalData;->isEndOfStream:Z

    return p1
.end method

.method public static synthetic access$302(Lio/agora/rtc2/internal/SimpleMediaPlayerSource$SMPSIntervalData;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    .locals 0

    iput-object p1, p0, Lio/agora/rtc2/internal/SimpleMediaPlayerSource$SMPSIntervalData;->byteBuffer:Ljava/nio/ByteBuffer;

    return-object p1
.end method


# virtual methods
.method public getByteBuffer()Ljava/nio/ByteBuffer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "SMPSIntervalData"
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/internal/SimpleMediaPlayerSource$SMPSIntervalData;->byteBuffer:Ljava/nio/ByteBuffer;

    return-object p0
.end method

.method public isEndOfStream()Z
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "SMPSIntervalData"
    .end annotation

    iget-boolean p0, p0, Lio/agora/rtc2/internal/SimpleMediaPlayerSource$SMPSIntervalData;->isEndOfStream:Z

    return p0
.end method

.method public isError()Z
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "SMPSIntervalData"
    .end annotation

    iget-boolean p0, p0, Lio/agora/rtc2/internal/SimpleMediaPlayerSource$SMPSIntervalData;->isError:Z

    return p0
.end method
