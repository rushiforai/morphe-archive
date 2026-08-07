.class public final Ll/u5g0;
.super Ll/u8;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/u5g0$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u00002\u00020\u0001:\u0001\rB\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u000f\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\t\u0010\n\u001a\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\u000e"
    }
    d2 = {
        "Ll/u5g0;",
        "Ll/u8;",
        "",
        "min",
        "<init>",
        "(J)V",
        "Ll/p5d0;",
        "h",
        "()Ll/p5d0;",
        "e",
        "J",
        "getMin",
        "()J",
        "a",
        "sharedlibrarymanager_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final e:J


# direct methods
.method public constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/u8;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Ll/u5g0;->e:J

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public h()Ll/p5d0;
    .locals 6
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-static {}, Ll/o1m;->d()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/u5g0;->e:J

    .line 6
    .line 7
    const-wide/16 v4, 0x0

    .line 8
    .line 9
    cmp-long v4, v2, v4

    .line 10
    .line 11
    if-nez v4, :cond_0

    .line 12
    .line 13
    const-wide/32 v2, 0x77359400

    .line 14
    .line 15
    .line 16
    :cond_0
    cmp-long v2, v0, v2

    .line 17
    .line 18
    if-ltz v2, :cond_2

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/u8;->d()Ll/dyl;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-interface {p0}, Ll/dyl;->onComplete()V

    .line 27
    .line 28
    .line 29
    :cond_1
    sget-object p0, Ll/p5d0;->Companion:Ll/p5d0$a;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/p5d0$a;->b()Ll/p5d0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :cond_2
    new-instance v2, Ljava/lang/Exception;

    .line 37
    .line 38
    new-instance v3, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v4, "Not enough space left, current "

    .line 41
    .line 42
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-direct {v2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, v2}, Ll/u8;->b(Ljava/lang/Exception;)Ll/p4c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p0, v0}, Ll/u8;->e(Ll/p4c;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/u8;->d()Ll/dyl;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    if-eqz p0, :cond_3

    .line 67
    .line 68
    invoke-interface {p0, v2}, Ll/dyl;->onError(Ljava/lang/Throwable;)V

    .line 69
    .line 70
    .line 71
    :cond_3
    sget-object p0, Ll/p5d0;->Companion:Ll/p5d0$a;

    .line 72
    .line 73
    invoke-virtual {p0, v2}, Ll/p5d0$a;->a(Ljava/lang/Exception;)Ll/p5d0;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0
.end method
