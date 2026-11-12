.class public final synthetic Lerk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lmrk;


# direct methods
.method public synthetic constructor <init>(Lmrk;B)V
    .registers 3

    iput-byte p2, p0, Lerk;->a:B

    iput-object p1, p0, Lerk;->b:Lmrk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lerk;->a:B

    iget-object p0, p0, Lerk;->b:Lmrk;

    packed-switch v0, :pswitch_data_3a

    invoke-virtual {p0}, Lmrk;->d()Z

    move-result v0

    if-eqz v0, :cond_15

    iget-object p0, p0, Lmrk;->G:Lrv7;

    iget-object p0, p0, Lrv7;->n:Lyv7;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lyv7;->m(Z)V

    :cond_15
    return-void

    :pswitch_16
    invoke-virtual {p0}, Lmrk;->c()Z

    move-result v0

    if-eqz v0, :cond_36

    iget-object v0, p0, Lmrk;->P:Lc1f;

    if-eqz v0, :cond_27

    iget-object v0, v0, Lc1f;->f:Ljava/lang/Object;

    check-cast v0, Ljqk;

    invoke-virtual {v0}, Ljqk;->a()V

    :cond_27
    iget-object v0, p0, Lmrk;->H:Lxpm;

    iget-object v0, v0, Lxpm;->a:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lmrk;->i(Ljava/lang/String;)V

    :cond_36
    const/4 v0, 0x0

    iput-boolean v0, p0, Lmrk;->V:Z

    return-void

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method
