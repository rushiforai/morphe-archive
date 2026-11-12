.class public final Lxcb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcdb;


# instance fields
.field public final synthetic a:B

.field public final b:Lcom/opera/android/BrowserActivity;

.field public final c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;Ljava/lang/String;B)V
    .registers 4

    iput-byte p3, p0, Lxcb;->a:B

    iput-object p1, p0, Lxcb;->b:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lxcb;->c:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final execute()V
    .registers 13

    iget-byte v0, p0, Lxcb;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lxcb;->c:Ljava/lang/String;

    iget-object p0, p0, Lxcb;->b:Lcom/opera/android/BrowserActivity;

    packed-switch v0, :pswitch_data_b4

    invoke-virtual {p0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    const-class v3, Lfge;

    invoke-static {v0, v3}, Llcp;->o(Landroidx/fragment/app/w;Ljava/lang/Class;)Landroidx/fragment/app/Fragment;

    move-result-object v4

    check-cast v4, Lfge;

    if-eqz v4, :cond_35

    const-string p0, "flow"

    const/4 v3, -0x1

    invoke-virtual {v0, v3, v1, p0}, Landroidx/fragment/app/w;->Y(IILjava/lang/String;)Z

    invoke-virtual {v4}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_70

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    const v0, 0x7f0a0979

    invoke-static {p0, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    check-cast p0, Landroid/widget/EditText;

    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_70

    :cond_35
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/opera/android/BrowserActivity;->o1(I)V

    new-instance v0, Lfge;

    iget-object v4, p0, Lcom/opera/android/BrowserActivity;->x:Lumi;

    sget-object v5, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v5

    check-cast v5, Lcom/opera/android/OperaApplication;

    invoke-virtual {v5}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v5

    iget-object v5, v5, Ld6j;->c:Lx5f;

    invoke-direct {v0, p0, v4, v5}, Lfge;-><init>(Lcom/opera/android/BrowserActivity;Ltcl;Lx5f;)V

    iput-object v2, v0, Lfge;->O:Ljava/lang/String;

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-array v1, v1, [Ln6h;

    new-instance v5, Lwzg;

    const/4 v2, 0x4

    invoke-direct {v5, v0, v3, v2}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v4, Lzhj;

    const/4 v9, 0x0

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, -0x1

    const/4 v10, 0x0

    invoke-direct/range {v4 .. v11}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {p0, v4}, Lqim;->g(Lzhj;)V

    :cond_70
    :goto_70
    return-void

    :pswitch_71
    invoke-static {p0}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object p0

    if-eqz p0, :cond_7f

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->y0()Lmm6;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v2, v0}, Lmm6;->b(Ljava/lang/String;Ljava/lang/Runnable;)V

    :cond_7f
    return-void

    :pswitch_80
    invoke-static {p0}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object p0

    if-eqz p0, :cond_b3

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->y0()Lmm6;

    move-result-object v0

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->O()Leej;

    move-result-object p0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lbpd;

    const/16 v4, 0xb

    invoke-direct {v3, v4, v0, v2, v1}, Lbpd;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    invoke-virtual {v0}, Lmm6;->a()Lyl6;

    move-result-object v0

    iget-object v2, v0, Lyl6;->c:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    iget-object p0, p0, Leej;->a:Lnej;

    new-instance v4, Lim6;

    invoke-direct {v4, v3, v0, v2, v1}, Lim6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, v4, v0}, Lr22;->b(Ljjm;Lijm;)V

    :cond_b3
    return-void

    :pswitch_data_b4
    .packed-switch 0x0
        :pswitch_80
        :pswitch_71
    .end packed-switch
.end method
