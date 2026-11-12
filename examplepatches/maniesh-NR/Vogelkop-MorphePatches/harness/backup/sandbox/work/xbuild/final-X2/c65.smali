.class public final Lc65;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldul;


# instance fields
.field public final a:Lmw3;

.field public final b:Lddc;

.field public final c:Ldx5;


# direct methods
.method public constructor <init>(Lmw3;Lddc;Ldx5;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc65;->a:Lmw3;

    iput-object p2, p0, Lc65;->b:Lddc;

    iput-object p3, p0, Lc65;->c:Ldx5;

    return-void
.end method


# virtual methods
.method public final a(Ljul;)Ljava/lang/Object;
    .registers 5

    new-instance p1, Lmr3;

    invoke-direct {p1, p0}, Lmr3;-><init>(Lc65;)V

    new-instance v0, Lr3;

    const/16 v1, 0x13

    const/4 v2, 0x0

    invoke-direct {v0, p0, p1, v2, v1}, Lr3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 p1, 0x3

    iget-object p0, p0, Lc65;->b:Lddc;

    invoke-static {p0, v2, v2, v0, p1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final b()Lkotlin/Unit;
    .registers 1

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final c(Landroid/net/Uri;Lcek;)Ljava/lang/Object;
    .registers 5

    const-string p2, "s"

    invoke-static {p1, p2}, Lwqm;->m(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ltx0;

    const/16 v0, 0xb

    invoke-direct {p2, p0, p1, v0}, Ltx0;-><init>(Ljava/lang/Object;Ljava/lang/String;B)V

    new-instance p1, Lr3;

    const/16 v0, 0x13

    const/4 v1, 0x0

    invoke-direct {p1, p0, p2, v1, v0}, Lr3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 p2, 0x3

    iget-object p0, p0, Lc65;->b:Lddc;

    invoke-static {p0, v1, v1, p1, p2}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
