.class public final synthetic Ljef;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lafe;

.field public final synthetic c:Lnx5;

.field public final synthetic d:Lu6c;

.field public final synthetic e:Lndf;


# direct methods
.method public synthetic constructor <init>(ILafe;Lnx5;Lu6c;Lndf;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ljef;->a:I

    iput-object p2, p0, Ljef;->b:Lafe;

    iput-object p3, p0, Ljef;->c:Lnx5;

    iput-object p4, p0, Ljef;->d:Lu6c;

    iput-object p5, p0, Ljef;->e:Lndf;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 6

    iget v0, p0, Ljef;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Ljef;->b:Lafe;

    invoke-interface {v2, v1}, Lafe;->setValue(Ljava/lang/Object;)V

    new-instance v1, Lhj4;

    iget-object v2, p0, Ljef;->d:Lu6c;

    iget-object v3, p0, Ljef;->e:Lndf;

    const/4 v4, 0x0

    invoke-direct {v1, v2, v0, v3, v4}, Lhj4;-><init>(Lu6c;ILndf;Lmt5;)V

    const/4 v0, 0x3

    iget-object p0, p0, Ljef;->c:Lnx5;

    invoke-static {p0, v4, v4, v1, v0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
