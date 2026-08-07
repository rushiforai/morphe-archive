.class public final Ll/s07;
.super Ll/dy6;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\r\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0019\u0010\u000b\u001a\u00020\u00062\u0008\u0008\u0002\u0010\n\u001a\u00020\tH\u0007\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0019\u0010\u0010\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u000f0\u000e0\r\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u0013\u0010\u0013\u001a\u0008\u0012\u0004\u0012\u00020\u00120\r\u00a2\u0006\u0004\u0008\u0013\u0010\u0011R\"\u0010\u0017\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u000f0\u000e0\u00148\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0015\u0010\u0016R\u001c\u0010\u0019\u001a\u0008\u0012\u0004\u0012\u00020\u00120\u00148\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0018\u0010\u0016\u00a8\u0006\u001a"
    }
    d2 = {
        "Ll/s07;",
        "Ll/dy6;",
        "Lcom/p1/mobile/putong/core/api/c;",
        "api",
        "<init>",
        "(Lcom/p1/mobile/putong/core/api/c;)V",
        "",
        "p3",
        "()V",
        "",
        "delayTime",
        "u3",
        "(J)V",
        "Lrx/c;",
        "",
        "Lcom/p1/mobile/putong/core/data/ComStatusAward;",
        "n3",
        "()Lrx/c;",
        "Ll/uxj0;",
        "o3",
        "Lrx/subjects/a;",
        "R",
        "Lrx/subjects/a;",
        "newUserComGuideNewUIBehaviorSubject",
        "S",
        "updateNewUserComGuideNewUIBehaviorSubject",
        "b_core_base"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public R:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ComStatusAward;",
            ">;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public S:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/api/c;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Ll/s07;->R:Lrx/subjects/a;

    .line 15
    .line 16
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Ll/s07;->S:Lrx/subjects/a;

    .line 24
    .line 25
    return-void
.end method

.method public static final A3(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Lrx/c;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lrx/c;

    .line 6
    .line 7
    return-object p0
.end method

.method public static final B3(Ll/s07;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s07;->S:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static final C3(Ll/s07;Lcom/p1/mobile/putong/data/Envelope;)Lkotlin/Unit;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s07;->R:Lrx/subjects/a;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 4
    .line 5
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->comStatusAwards:Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/s07;->S:Lrx/subjects/a;

    .line 17
    .line 18
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 24
    .line 25
    return-object p0
.end method

.method public static final D3(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a3(JLl/s07;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/n07;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/n07;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Ll/qi20;->d(Ll/pcj;Z)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 12
    .line 13
    invoke-virtual {v0, p0, p1, v1}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance p1, Ll/o07;

    .line 26
    .line 27
    invoke-direct {p1, p2}, Ll/o07;-><init>(Ll/s07;)V

    .line 28
    .line 29
    .line 30
    new-instance v0, Ll/p07;

    .line 31
    .line 32
    invoke-direct {v0, p1}, Ll/p07;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    new-instance p1, Ll/q07;

    .line 40
    .line 41
    invoke-direct {p1, p2}, Ll/q07;-><init>(Ll/s07;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, p1}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    new-instance p1, Ll/r07;

    .line 49
    .line 50
    invoke-direct {p1, p2}, Ll/r07;-><init>(Ll/s07;)V

    .line 51
    .line 52
    .line 53
    new-instance p2, Ll/g07;

    .line 54
    .line 55
    invoke-direct {p2, p1}, Ll/g07;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, p2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public static synthetic b3(Lcom/p1/mobile/putong/data/Envelope;Ll/uxj0;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/s07;->y3(Lcom/p1/mobile/putong/data/Envelope;Ll/uxj0;)Lcom/p1/mobile/putong/data/Envelope;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c3(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/s07;->D3(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic d3(Ll/s07;Lcom/p1/mobile/putong/data/Envelope;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/s07;->C3(Ll/s07;Lcom/p1/mobile/putong/data/Envelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e3(Ll/s07;Lcom/p1/mobile/putong/data/Envelope;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/s07;->r3(Ll/s07;Lcom/p1/mobile/putong/data/Envelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f3()Ll/x1d0;
    .locals 1

    .line 1
    invoke-static {}, Ll/s07;->q3()Ll/x1d0;

    move-result-object v0

    return-object v0
.end method

.method public static synthetic g3(Ll/s07;Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/s07;->x3(Ll/s07;Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static h3(Ll/s07;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/k07;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/k07;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Ll/qi20;->d(Ll/pcj;Z)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/l07;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/l07;-><init>(Ll/s07;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ll/m07;

    .line 17
    .line 18
    invoke-direct {p0, v1}, Ll/m07;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public static synthetic i3()Ll/x1d0;
    .locals 1

    .line 1
    invoke-static {}, Ll/s07;->w3()Ll/x1d0;

    move-result-object v0

    return-object v0
.end method

.method public static synthetic j3(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/s07;->z3(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Lcom/p1/mobile/putong/data/Envelope;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k3(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/s07;->A3(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l3(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/s07;->s3(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic m3(Ll/s07;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/s07;->B3(Ll/s07;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static final q3()Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/newUserComGuideNewUI"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->h2(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    return-object v0
.end method

.method public static final r3(Ll/s07;Lcom/p1/mobile/putong/data/Envelope;)Lkotlin/Unit;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/s07;->R:Lrx/subjects/a;

    .line 2
    .line 3
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->comStatusAwards:Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 17
    .line 18
    return-object p0
.end method

.method public static final s3(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v3(Ll/s07;JILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x1

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const-wide/16 p1, 0x1

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/s07;->u3(J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static final w3()Ll/x1d0;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/newUserComGuideNewUI?updateStatus=true"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->h2(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 18
    .line 19
    const-string v2, ""

    .line 20
    .line 21
    invoke-static {v1, v2}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    return-object v0
.end method

.method public static final x3(Ll/s07;Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->H9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ll/h07;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Ll/h07;-><init>(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 12
    .line 13
    .line 14
    new-instance p1, Ll/i07;

    .line 15
    .line 16
    invoke-direct {p1, v0}, Ll/i07;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static final y3(Lcom/p1/mobile/putong/data/Envelope;Ll/uxj0;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static final z3(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/data/Envelope;

    .line 6
    .line 7
    return-object p0
.end method


# virtual methods
.method public final n3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ComStatusAward;",
            ">;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/s07;->R:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public final o3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/s07;->S:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public final p3()V
    .locals 3

    .line 1
    new-instance v0, Ll/f07;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/f07;-><init>(Ll/s07;)V

    .line 4
    .line 5
    .line 6
    const-string v1, "com-status-award-newUserComGuideNewUI"

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {p0, v1, v2, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final t3()V
    .locals 4
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    invoke-static {p0, v2, v3, v0, v1}, Ll/s07;->v3(Ll/s07;JILjava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final u3(J)V
    .locals 1
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 1
    new-instance v0, Ll/j07;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p0}, Ll/j07;-><init>(JLl/s07;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "com-status-award-updateNewUserComGuideNewUI"

    .line 7
    .line 8
    const/4 p2, -0x1

    .line 9
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 10
    .line 11
    .line 12
    return-void
.end method
