.class public final synthetic Ll9j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln5o;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lo9j;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lo9j;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Ll9j;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll9j;->c:Ljava/lang/String;

    iput-object p2, p0, Ll9j;->b:Lo9j;

    return-void
.end method

.method public synthetic constructor <init>(Lo9j;Ljava/lang/String;B)V
    .registers 4

    .line 11
    iput-byte p3, p0, Ll9j;->a:B

    iput-object p1, p0, Ll9j;->b:Lo9j;

    iput-object p2, p0, Ll9j;->c:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    iget-byte v0, p0, Ll9j;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object v3, p0, Ll9j;->c:Ljava/lang/String;

    iget-object p0, p0, Ll9j;->b:Lo9j;

    packed-switch v0, :pswitch_data_7a

    move-object v0, p1

    check-cast v0, Loml;

    invoke-virtual {p0, v3, v2}, Lo9j;->g(Ljava/lang/String;Z)V

    iget-object v4, p0, Lo9j;->g:Ljava/util/concurrent/atomic/AtomicReference;

    :cond_13
    const/4 p0, 0x0

    invoke-virtual {v4, v0, p0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_20

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v0, :cond_13

    :cond_20
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_23
    check-cast p1, Ljava/lang/Void;

    if-eqz v3, :cond_35

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result p1

    if-eqz p1, :cond_35

    iget-object p0, p0, Lo9j;->f:Ln9j;

    iput-boolean v2, p0, Ln9j;->n:Z

    invoke-virtual {p0}, Ln9j;->u()V

    goto :goto_3c

    :cond_35
    iget-object p0, p0, Lo9j;->f:Ln9j;

    iput-boolean v1, p0, Ln9j;->n:Z

    invoke-virtual {p0}, Ln9j;->u()V

    :goto_3c
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_3f
    check-cast p1, Ljava/lang/Void;

    new-instance p1, Ll9j;

    const/4 v0, 0x3

    invoke-direct {p1, p0, v3, v0}, Ll9j;-><init>(Lo9j;Ljava/lang/String;B)V

    iget-object v0, p0, Lo9j;->b:Lumi;

    invoke-virtual {v0, p1}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p1

    new-instance v2, Loml;

    invoke-direct {v2, p1}, Loml;-><init>(Lnml;)V

    iget-object p0, p0, Lo9j;->g:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v7, 0x0

    const-wide/16 v4, 0x15e

    move-object v3, v2

    invoke-virtual/range {v2 .. v7}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    invoke-virtual {p0, v2}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Loml;

    if-eqz p0, :cond_6e

    invoke-virtual {p0}, Loml;->isCancelled()Z

    move-result p1

    if-nez p1, :cond_6e

    invoke-virtual {p0, v1}, Loml;->cancel(Z)Z

    :cond_6e
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_71
    check-cast p1, Ljava/lang/Void;

    const/4 p1, 0x2

    invoke-static {p0, v3, p1}, Lo9j;->h(Lo9j;Ljava/lang/String;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_7a
    .packed-switch 0x0
        :pswitch_71
        :pswitch_3f
        :pswitch_23
    .end packed-switch
.end method
