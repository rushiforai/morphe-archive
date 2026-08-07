.class public Ltv/danmaku/ijk/media/streamer/RecorderParameters;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltv/danmaku/ijk/media/streamer/RecorderParameters$avcodecType;
    }
.end annotation


# static fields
.field private static k:Z = true


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:I

.field private h:Ljava/lang/String;

.field private i:I

.field private j:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/RecorderParameters;->a:I

    .line 6
    .line 7
    const/16 v0, 0xc

    .line 8
    .line 9
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/RecorderParameters;->b:I

    .line 10
    .line 11
    sget-boolean v0, Ltv/danmaku/ijk/media/streamer/RecorderParameters;->k:Z

    .line 12
    .line 13
    xor-int/lit8 v1, v0, 0x1

    .line 14
    .line 15
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/RecorderParameters;->c:I

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/RecorderParameters;->d:I

    .line 19
    .line 20
    const v1, 0x17700

    .line 21
    .line 22
    .line 23
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/RecorderParameters;->e:I

    .line 24
    .line 25
    const v1, 0xf4240

    .line 26
    .line 27
    .line 28
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/RecorderParameters;->f:I

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    const v1, 0xac44

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/16 v1, 0x1f40

    .line 37
    .line 38
    :goto_0
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/RecorderParameters;->g:I

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    const-string v0, "mp4"

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    const-string v0, "3gp"

    .line 46
    .line 47
    :goto_1
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/RecorderParameters;->h:Ljava/lang/String;

    .line 48
    .line 49
    const/16 v0, 0x1e0

    .line 50
    .line 51
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/RecorderParameters;->i:I

    .line 52
    .line 53
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/RecorderParameters;->j:I

    .line 54
    .line 55
    return-void
.end method
