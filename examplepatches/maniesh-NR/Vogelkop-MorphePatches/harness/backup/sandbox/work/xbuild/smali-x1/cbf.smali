.class public final synthetic Lcbf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ldbf;


# direct methods
.method public synthetic constructor <init>(Ldbf;B)V
    .registers 3

    iput-byte p2, p0, Lcbf;->a:B

    iput-object p1, p0, Lcbf;->b:Ldbf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Lcbf;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lcbf;->b:Ldbf;

    packed-switch v0, :pswitch_data_38

    sget-object v0, Lqk0;->F:Lqk0;

    invoke-virtual {p0, v0}, Ldbf;->A(Lqk0;)V

    return-void

    :pswitch_e
    sget-object v0, Lqk0;->b:Lqk0;

    invoke-virtual {p0, v0}, Ldbf;->A(Lqk0;)V

    return-void

    :pswitch_14
    iput-object v1, p0, Ldbf;->o:Lcbf;

    iget-object p0, p0, Ldbf;->q:Lgbf;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lgbf;->m(Z)V

    iget-object p0, p0, Lgbf;->s:Lay;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzqi;

    iget-object v0, p0, Lzqi;->a:Lmri;

    invoke-virtual {v0}, Lo73;->k()Z

    move-result v1

    if-eqz v1, :cond_2f

    invoke-virtual {v0}, Lo73;->b()Z

    :cond_2f
    iget-object p0, p0, Lzqi;->b:Lmrk;

    invoke-virtual {p0}, Lmrk;->b()V

    return-void

    :pswitch_35
    iput-object v1, p0, Ldbf;->n:Lk18;

    return-void

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_35
        :pswitch_14
        :pswitch_e
    .end packed-switch
.end method
