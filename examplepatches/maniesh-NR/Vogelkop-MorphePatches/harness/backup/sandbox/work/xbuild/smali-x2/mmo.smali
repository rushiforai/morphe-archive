.class public final Lmmo;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Lyoo;


# direct methods
.method public synthetic constructor <init>(Lyoo;B)V
    .registers 3

    iput-byte p2, p0, Lmmo;->i:B

    iput-object p1, p0, Lmmo;->j:Lyoo;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lmmo;->i:B

    packed-switch v0, :pswitch_data_4a

    check-cast p1, Landroid/view/ViewGroup;

    iget-object v0, p0, Lmmo;->j:Lyoo;

    iget-object v0, v0, Lpxo;->e:Lbap;

    iget-boolean v1, v0, Lbap;->a:Z

    if-eqz v1, :cond_1e

    iget-boolean v1, v0, Lbap;->c:Z

    if-nez v1, :cond_1e

    iget-boolean v0, v0, Lbap;->b:Z

    if-nez v0, :cond_1e

    iget-object p0, p0, Lmmo;->j:Lyoo;

    iput-object p1, p0, Lpxo;->f:Landroid/view/ViewGroup;

    invoke-virtual {p0}, Lpxo;->e()V

    :cond_1e
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_21
    check-cast p1, Lbap;

    iget-object p1, p0, Lmmo;->j:Lyoo;

    iget-object p1, p1, Lpxo;->d:Lvoo;

    check-cast p1, Lylp;

    const/4 v0, 0x0

    if-eqz p1, :cond_43

    invoke-static {p1}, Locp;->d(Lvoo;)Luro;

    move-result-object p1

    iget-object v1, p0, Lmmo;->j:Lyoo;

    iget-object v1, v1, Lpxo;->d:Lvoo;

    iget-object v2, p1, Luro;->a:Lylp;

    if-eq v1, v2, :cond_39

    move-object p1, v0

    :cond_39
    if-eqz p1, :cond_43

    iput-object v0, p1, Luro;->a:Lylp;

    iput-object v0, p1, Luro;->b:Lp7p;

    iput-object v0, p1, Luro;->c:Lwoo;

    iput-object v0, p1, Luro;->d:Lmmo;

    :cond_43
    iget-object p0, p0, Lmmo;->j:Lyoo;

    invoke-static {p0}, Lyoo;->f(Lyoo;)V

    return-object v0

    nop

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_21
    .end packed-switch
.end method
