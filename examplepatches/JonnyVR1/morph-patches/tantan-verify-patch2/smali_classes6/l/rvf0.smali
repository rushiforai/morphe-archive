.class public final Ll/rvf0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/rvf0$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\n\n\u0002\u0010\u000b\n\u0002\u0008\u0005\u0018\u0000 \u00182\u00020\u0001:\u0001\u000bB\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0015\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0015\u0010\u000b\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\r\u0010\r\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\r\u0010\u0003R\u0014\u0010\u000f\u001a\u00020\t8\u0002X\u0082D\u00a2\u0006\u0006\n\u0004\u0008\u000b\u0010\u000eR\u0016\u0010\u0010\u001a\u00020\t8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\r\u0010\u000eR\u0016\u0010\u0011\u001a\u00020\t8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0007\u0010\u000eR\u0016\u0010\u0013\u001a\u00020\t8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0012\u0010\u000eR\u0016\u0010\u0017\u001a\u00020\u00148\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0015\u0010\u0016\u00a8\u0006\u0019"
    }
    d2 = {
        "Ll/rvf0;",
        "",
        "<init>",
        "()V",
        "",
        "fps",
        "",
        "c",
        "(I)V",
        "",
        "presentationTimeUsec",
        "a",
        "(J)V",
        "b",
        "J",
        "ONE_MILLION",
        "prevPresentUsec",
        "prevMonoUsec",
        "d",
        "fixedFrameDurationUsec",
        "",
        "e",
        "Z",
        "loopReset",
        "Companion",
        "base_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Ll/rvf0$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:J

.field public b:J

.field public c:J

.field public d:J

.field public e:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/rvf0$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/rvf0$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/rvf0;->Companion:Ll/rvf0$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/32 v0, 0xf4240

    .line 5
    .line 6
    .line 7
    iput-wide v0, p0, Ll/rvf0;->a:J

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Ll/rvf0;->e:Z

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a(J)V
    .locals 11

    .line 1
    iget-wide v0, p0, Ll/rvf0;->c:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    const-wide/16 v5, 0x3e8

    .line 8
    .line 9
    if-nez v4, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    div-long/2addr v0, v5

    .line 16
    iput-wide v0, p0, Ll/rvf0;->c:J

    .line 17
    .line 18
    iput-wide p1, p0, Ll/rvf0;->b:J

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-boolean v4, p0, Ll/rvf0;->e:Z

    .line 22
    .line 23
    if-eqz v4, :cond_1

    .line 24
    .line 25
    iget-wide v7, p0, Ll/rvf0;->a:J

    .line 26
    .line 27
    const-wide/16 v9, 0x1e

    .line 28
    .line 29
    div-long/2addr v7, v9

    .line 30
    sub-long v7, p1, v7

    .line 31
    .line 32
    iput-wide v7, p0, Ll/rvf0;->b:J

    .line 33
    .line 34
    const/4 v4, 0x0

    .line 35
    iput-boolean v4, p0, Ll/rvf0;->e:Z

    .line 36
    .line 37
    :cond_1
    iget-wide v7, p0, Ll/rvf0;->d:J

    .line 38
    .line 39
    cmp-long v4, v7, v2

    .line 40
    .line 41
    if-eqz v4, :cond_2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    iget-wide v7, p0, Ll/rvf0;->b:J

    .line 45
    .line 46
    sub-long v7, p1, v7

    .line 47
    .line 48
    :goto_0
    cmp-long p1, v7, v2

    .line 49
    .line 50
    if-gez p1, :cond_3

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_3
    iget-wide p1, p0, Ll/rvf0;->a:J

    .line 54
    .line 55
    const-wide/16 v2, 0xa

    .line 56
    .line 57
    mul-long/2addr v2, p1

    .line 58
    cmp-long v2, v7, v2

    .line 59
    .line 60
    if-lez v2, :cond_4

    .line 61
    .line 62
    const-wide/16 v2, 0x5

    .line 63
    .line 64
    mul-long/2addr v2, p1

    .line 65
    goto :goto_1

    .line 66
    :cond_4
    move-wide v2, v7

    .line 67
    :goto_1
    add-long/2addr v0, v2

    .line 68
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 69
    .line 70
    .line 71
    move-result-wide p1

    .line 72
    div-long/2addr p1, v5

    .line 73
    :goto_2
    const-wide/16 v7, 0x64

    .line 74
    .line 75
    sub-long v7, v0, v7

    .line 76
    .line 77
    cmp-long v4, p1, v7

    .line 78
    .line 79
    if-gez v4, :cond_6

    .line 80
    .line 81
    sub-long p1, v0, p1

    .line 82
    .line 83
    const-wide/32 v7, 0x7a120

    .line 84
    .line 85
    .line 86
    cmp-long v4, p1, v7

    .line 87
    .line 88
    if-lez v4, :cond_5

    .line 89
    .line 90
    move-wide p1, v7

    .line 91
    :cond_5
    :try_start_0
    div-long v7, p1, v5

    .line 92
    .line 93
    rem-long/2addr p1, v5

    .line 94
    long-to-int p1, p1

    .line 95
    mul-int/lit16 p1, p1, 0x3e8

    .line 96
    .line 97
    invoke-static {v7, v8, p1}, Ljava/lang/Thread;->sleep(JI)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    .line 99
    .line 100
    goto :goto_3

    .line 101
    :catch_0
    move-exception p1

    .line 102
    sget-object p2, Ll/z0;->INSTANCE:Ll/z0;

    .line 103
    .line 104
    new-instance v4, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    const-string v7, "e="

    .line 107
    .line 108
    invoke-direct {v4, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v4

    .line 118
    const-string v7, "AnimPlayer.SpeedControlUtil"

    .line 119
    .line 120
    invoke-virtual {p2, v7, v4, p1}, Ll/z0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 121
    .line 122
    .line 123
    :goto_3
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 124
    .line 125
    .line 126
    move-result-wide p1

    .line 127
    div-long/2addr p1, v5

    .line 128
    goto :goto_2

    .line 129
    :cond_6
    iget-wide p1, p0, Ll/rvf0;->c:J

    .line 130
    .line 131
    add-long/2addr p1, v2

    .line 132
    iput-wide p1, p0, Ll/rvf0;->c:J

    .line 133
    .line 134
    iget-wide p1, p0, Ll/rvf0;->b:J

    .line 135
    .line 136
    add-long/2addr p1, v2

    .line 137
    iput-wide p1, p0, Ll/rvf0;->b:J

    .line 138
    .line 139
    return-void
.end method

.method public final b()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Ll/rvf0;->b:J

    .line 4
    .line 5
    iput-wide v0, p0, Ll/rvf0;->c:J

    .line 6
    .line 7
    return-void
.end method

.method public final c(I)V
    .locals 4

    .line 1
    if-gtz p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-wide v0, p0, Ll/rvf0;->a:J

    .line 5
    .line 6
    int-to-long v2, p1

    .line 7
    div-long/2addr v0, v2

    .line 8
    iput-wide v0, p0, Ll/rvf0;->d:J

    .line 9
    .line 10
    return-void
.end method
