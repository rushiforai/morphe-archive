.class public final Lwd7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroidx/fragment/app/r;

.field public final b:Lumi;

.field public final c:Lox3;

.field public final d:Lqke;

.field public final e:Ldj9;

.field public final f:Ljava/util/Random;

.field public final g:Lkotlin/jvm/functions/Function1;

.field public h:Z

.field public i:Z

.field public j:J

.field public final k:Lvd7;

.field public final l:Lud7;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/r;Lumi;Lox3;Lqke;Lplh;Ldj9;)V
    .registers 10

    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sget-object v1, Lsd7;->a:Lsd7;

    sget-object v2, Lvml;->e:Lwjh;

    iget-object v2, v2, Lwjh;->b:Ljava/lang/Object;

    check-cast v2, Ld7a;

    invoke-static {v2}, Lsgb;->b(Lkotlin/coroutines/CoroutineContext;)La64;

    move-result-object v2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwd7;->a:Landroidx/fragment/app/r;

    iput-object p2, p0, Lwd7;->b:Lumi;

    iput-object p3, p0, Lwd7;->c:Lox3;

    iput-object p4, p0, Lwd7;->d:Lqke;

    iput-object p6, p0, Lwd7;->e:Ldj9;

    iput-object v0, p0, Lwd7;->f:Ljava/util/Random;

    iput-object v1, p0, Lwd7;->g:Lkotlin/jvm/functions/Function1;

    new-instance p1, Lvd7;

    invoke-direct {p1, p0}, Lvd7;-><init>(Lwd7;)V

    iput-object p1, p0, Lwd7;->k:Lvd7;

    new-instance p1, Lud7;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lud7;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lwd7;->l:Lud7;

    new-instance p1, Lfg6;

    const/16 p2, 0xb

    const/4 p3, 0x0

    invoke-direct {p1, p5, p0, p3, p2}, Lfg6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 p0, 0x3

    invoke-static {v2, p3, p3, p1, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method
