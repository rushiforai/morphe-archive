.class public final synthetic Lkfn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpfn;


# direct methods
.method public synthetic constructor <init>(Lpfn;B)V
    .registers 3

    iput-byte p2, p0, Lkfn;->a:B

    iput-object p1, p0, Lkfn;->b:Lpfn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lkfn;->a:B

    iget-object p0, p0, Lkfn;->b:Lpfn;

    packed-switch v0, :pswitch_data_4a

    check-cast p1, Lnfn;

    iget-object p0, p0, Lpfn;->n:Lmfn;

    if-eqz p1, :cond_15

    iget-object v0, p0, Lmfn;->c:Lnfn;

    invoke-virtual {p1, v0}, Lnfn;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1a

    :cond_15
    invoke-virtual {p0}, Lmfn;->a()V

    iput-object p1, p0, Lmfn;->c:Lnfn;

    :cond_1a
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1d
    check-cast p1, Lwvg;

    iput-object p1, p0, Lpfn;->r:Lwvg;

    iget-object p1, p0, Lpfn;->p:Llh4;

    iget-object p1, p1, Llh4;->b:Lcom/opera/api/Callback;

    if-nez p1, :cond_3a

    new-instance p1, Llh4;

    new-instance v0, Ljfn;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Ljfn;-><init>(Lpfn;B)V

    const/4 v1, 0x0

    invoke-direct {p1, v0, v1}, Llh4;-><init>(Lcom/opera/api/Callback;B)V

    iput-object p1, p0, Lpfn;->p:Llh4;

    iget-object v0, p0, Lpfn;->b:Laf3;

    invoke-virtual {v0, p1}, Laf3;->d(Lcom/opera/api/Callback;)V

    :cond_3a
    iget-object p0, p0, Lpfn;->f:Lfmk;

    invoke-virtual {p0}, Lfmk;->b()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_42
    check-cast p1, Lylk;

    invoke-virtual {p1, p0}, Lylk;->s0(Ldmk;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_42
        :pswitch_1d
    .end packed-switch
.end method
