.class public Lcom/momo/xengine/media/MediaThread;
.super Ljava/lang/Thread;
.source "SourceFile"


# instance fields
.field private final pointer:J


# direct methods
.method public constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/momo/xengine/media/MediaThread;->pointer:J

    .line 5
    .line 6
    return-void
.end method

.method private native nativeCallFunc(J)V
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/xengine/media/MediaThread;->pointer:J

    .line 5
    .line 6
    invoke-direct {p0, v0, v1}, Lcom/momo/xengine/media/MediaThread;->nativeCallFunc(J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
