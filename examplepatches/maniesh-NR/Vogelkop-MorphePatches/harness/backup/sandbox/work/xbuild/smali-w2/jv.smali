.class public final synthetic Ljv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lbz0;


# direct methods
.method public synthetic constructor <init>(Lbz0;B)V
    .registers 3

    iput-byte p2, p0, Ljv;->a:B

    iput-object p1, p0, Ljv;->b:Lbz0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 8

    iget-byte v0, p0, Ljv;->a:B

    iget-object p0, p0, Ljv;->b:Lbz0;

    packed-switch v0, :pswitch_data_64

    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p0

    sget-boolean v0, Lphj;->s:Z

    if-nez v0, :cond_5f

    const/4 v0, 0x1

    sput-boolean v0, Lphj;->s:Z

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v1, v1, Ld6j;->c:Lx5f;

    iget-boolean v2, v1, Lx5f;->h:Z

    if-eqz v2, :cond_3a

    iget-object v2, v1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    invoke-static {v2, v3}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object v2

    iget-object v2, v2, Lhi0;->b:Lfi0;

    const/16 v4, 0x17

    const-wide/16 v5, 0x1

    invoke-virtual {v2, v4, v0, v5, v6}, Ljf0;->p(IIJ)V

    invoke-virtual {v1, v3}, Lx5f;->U0(Lx56;)V

    :cond_3a
    const v1, 0x7f14057a

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_4f

    invoke-static {p0}, Lr9n;->M(Landroid/widget/Toast;)V

    goto :goto_5c

    :cond_4f
    invoke-virtual {p0}, Landroid/widget/Toast;->getView()Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcz0;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcz0;-><init>(B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    :goto_5c
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_5f
    return-void

    :pswitch_60
    invoke-virtual {p0}, Lzp1;->dismiss()V

    return-void

    :pswitch_data_64
    .packed-switch 0x0
        :pswitch_60
    .end packed-switch
.end method
