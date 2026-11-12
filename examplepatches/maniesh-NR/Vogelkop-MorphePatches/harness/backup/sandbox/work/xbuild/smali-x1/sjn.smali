.class public final synthetic Lsjn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lxjj;
.implements Lyjj;
.implements Lzkn;
.implements Lfn8;
.implements Lbcf;
.implements Llo7;
.implements Lktn;
.implements Lwxg;
.implements Lk0g;
.implements Li0g;
.implements Lhvb;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lsjn;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bridge synthetic g()Landroid/view/WindowInsets;
    .registers 1

    sget-object v0, Landroid/view/WindowInsets;->CONSUMED:Landroid/view/WindowInsets;

    return-object v0
.end method

.method public static synthetic h(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V
    .registers 5

    new-instance v0, Ljava/security/GeneralSecurityException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static synthetic k(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 6

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static synthetic l(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, p0, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method


# virtual methods
.method public final a(Loup;)Ljava/lang/Object;
    .registers 6

    check-cast p1, Lb9o;

    iget-object p0, p1, Lb9o;->f:Le9o;

    iget p0, p0, Le9o;->b:I

    const/16 v0, 0x8

    if-lt p0, v0, :cond_3a

    const/16 v0, 0xc

    if-gt p0, v0, :cond_3a

    new-instance p0, Ld20;

    iget-object v0, p1, Lb9o;->g:Li4d;

    iget-object v0, v0, Li4d;->b:Ljava/lang/Object;

    check-cast v0, Lm54;

    invoke-virtual {v0}, Lm54;->b()[B

    move-result-object v0

    iget-object p1, p1, Lb9o;->h:Lm54;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    array-length v1, v0

    invoke-static {v1}, Lr20;->b(I)Lr20;

    move-result-object v1

    new-instance v2, Li4d;

    invoke-static {v0}, Lm54;->a([B)Lm54;

    move-result-object v0

    const/16 v3, 0x18

    invoke-direct {v2, v0, v3}, Li4d;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1, v2}, Lq20;->z0(Lr20;Li4d;)Lq20;

    move-result-object v0

    invoke-static {v0}, Lexg;->k(Lq20;)Ldxg;

    invoke-virtual {p1}, Lm54;->b()[B

    return-object p0

    :cond_3a
    const-string p0, "invalid salt size"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final b(Lc0g;)Ls6h;
    .registers 6

    check-cast p1, Le9o;

    invoke-static {}, Lkvb;->z()Ljvb;

    move-result-object p0

    const-string v0, "type.googleapis.com/google.crypto.tink.XAesGcmKey"

    invoke-virtual {p0, v0}, Ljvb;->i(Ljava/lang/String;)V

    invoke-static {}, Ld9o;->x()Lc9o;

    move-result-object v0

    invoke-static {}, Lg9o;->x()Lf9o;

    move-result-object v1

    iget v2, p1, Le9o;->b:I

    invoke-virtual {v1}, Lav9;->f()V

    iget-object v3, v1, Lav9;->b:Lfv9;

    check-cast v3, Lg9o;

    invoke-virtual {v3, v2}, Lg9o;->y(I)V

    invoke-virtual {v1}, Lav9;->b()Lfv9;

    move-result-object v1

    check-cast v1, Lg9o;

    invoke-virtual {v0}, Lav9;->f()V

    iget-object v2, v0, Lav9;->b:Lfv9;

    check-cast v2, Ld9o;

    invoke-virtual {v2, v1}, Ld9o;->z(Lg9o;)V

    invoke-virtual {v0}, Lav9;->b()Lfv9;

    move-result-object v0

    check-cast v0, Ld9o;

    invoke-virtual {v0}, Lv5;->e()Lc54;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljvb;->j(Le54;)V

    iget-object p1, p1, Le9o;->a:Lb30;

    invoke-static {p1}, Li9o;->a(Lb30;)Liuf;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljvb;->g(Liuf;)V

    invoke-virtual {p0}, Lav9;->b()Lfv9;

    move-result-object p0

    check-cast p0, Lkvb;

    invoke-static {p0}, Ls6h;->D(Lkvb;)Ls6h;

    move-result-object p0

    return-object p0
.end method

.method public final c(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/i;
    .registers 8

    iget-byte p0, p0, Lsjn;->a:B

    const/4 v0, 0x5

    const v1, 0x7f0a02ef

    const/4 v2, 0x0

    const-string v3, "Missing required view with ID: "

    const/4 v4, 0x0

    sparse-switch p0, :sswitch_data_ca

    new-instance p0, Lpqn;

    const v5, 0x7f0d048b

    invoke-static {p1, v5, p1, v4}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_3d

    new-instance v1, Lb98;

    check-cast v4, Landroid/widget/FrameLayout;

    invoke-direct {v1, v4, v0}, Lb98;-><init>(Landroid/widget/FrameLayout;B)V

    const v0, 0x7f0a08f1

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/FrameLayout;

    if-eqz v4, :cond_3c

    new-instance v0, Lq5g;

    check-cast p1, Landroid/widget/FrameLayout;

    const/16 v2, 0xf

    invoke-direct {v0, p1, v1, v4, v2}, Lq5g;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p0, v0}, Lpqn;-><init>(Lq5g;)V

    move-object v2, p0

    goto :goto_4c

    :cond_3c
    move v1, v0

    :cond_3d
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v3, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_4c
    return-object v2

    :sswitch_4d
    new-instance p0, Lxqn;

    const v5, 0x7f0d048d

    invoke-static {p1, v5, p1, v4}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_7d

    new-instance v1, Lb98;

    check-cast v4, Landroid/widget/FrameLayout;

    invoke-direct {v1, v4, v0}, Lb98;-><init>(Landroid/widget/FrameLayout;B)V

    const v0, 0x7f0a0aaf

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/FrameLayout;

    if-eqz v4, :cond_7c

    new-instance v0, Lb7k;

    check-cast p1, Landroid/widget/FrameLayout;

    const/16 v2, 0x8

    invoke-direct {v0, v2, p1, v1}, Lb7k;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    invoke-direct {p0, v0}, Lxqn;-><init>(Lb7k;)V

    move-object v2, p0

    goto :goto_8c

    :cond_7c
    move v1, v0

    :cond_7d
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v3, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_8c
    return-object v2

    :sswitch_8d
    new-instance p0, Lq6n;

    const v0, 0x7f0d0474

    invoke-static {p1, v0, p1, v4}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0a00f2

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    if-eqz v1, :cond_ba

    const v0, 0x7f0a0382

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v4, :cond_ba

    new-instance v0, Lq5g;

    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/16 v2, 0xd

    invoke-direct {v0, p1, v1, v4, v2}, Lq5g;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p0, v0}, Lq6n;-><init>(Lq5g;)V

    move-object v2, p0

    goto :goto_c9

    :cond_ba
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v3, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_c9
    return-object v2

    :sswitch_data_ca
    .sparse-switch
        0x6 -> :sswitch_8d
        0xb -> :sswitch_4d
    .end sparse-switch
.end method

.method public final createExtractors()[Lcn8;
    .registers 3

    new-instance p0, Lvnn;

    invoke-direct {p0}, Lvnn;-><init>()V

    const/4 v0, 0x1

    new-array v0, v0, [Lcn8;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    return-object v0
.end method

.method public final d(Landroid/content/Context;Lxkn;Lo2c;Landroid/graphics/Bitmap;ILy1n;)Llkn;
    .registers 7

    new-instance p0, Llkn;

    invoke-direct {p0, p2, p4, p5, p6}, Llkn;-><init>(Lxkn;Landroid/graphics/Bitmap;ILy1n;)V

    return-object p0
.end method

.method public final e(Lorg/chromium/content/browser/webcontents/WebContentsImpl;)Ljava/lang/Object;
    .registers 2

    new-instance p0, La2o;

    invoke-direct {p0, p1}, La2o;-><init>(Lorg/chromium/content/browser/webcontents/WebContentsImpl;)V

    return-object p0
.end method

.method public final i(Ljava/lang/Object;Landroidx/recyclerview/widget/i;)V
    .registers 11

    iget-byte p0, p0, Lsjn;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x0

    packed-switch p0, :pswitch_data_130

    :pswitch_7
    check-cast p1, Lrqn;

    check-cast p2, Lwqn;

    iget-object p0, p2, Lwqn;->b:Lq5g;

    iget-object v0, p1, Lrqn;->c:Lioh;

    iget-object v2, p1, Lrqn;->b:Landroid/net/Uri;

    iput-object v0, p2, Lwqn;->e:Lioh;

    iput-boolean v1, p2, Lwqn;->f:Z

    instance-of v3, v0, Ltqn;

    const/4 v4, 0x1

    if-eqz v3, :cond_27

    move-object v3, v0

    check-cast v3, Ltqn;

    iget-object v3, v3, Ltqn;->a:Lo29;

    sget-object v5, Lo29;->k:Lo29;

    if-ne v3, v5, :cond_27

    invoke-virtual {p2, v2}, Lwqn;->U(Landroid/net/Uri;)V

    goto :goto_58

    :cond_27
    sget-object v3, Luqn;->a:Luqn;

    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_55

    iget-object v3, p2, Lwqn;->d:Lesk;

    invoke-interface {v3}, Lesk;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lpne;

    iget-object v3, v3, Lpne;->a:Ljava/lang/String;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Ldbh;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_4d

    iput-boolean v4, p2, Lwqn;->f:Z

    invoke-virtual {p2, v0}, Lwqn;->X(Lioh;)V

    goto :goto_58

    :cond_4d
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p2, v0}, Lwqn;->U(Landroid/net/Uri;)V

    goto :goto_58

    :cond_55
    invoke-virtual {p2, v0}, Lwqn;->X(Lioh;)V

    :goto_58
    iget-object v0, p0, Lq5g;->c:Ljava/lang/Object;

    check-cast v0, Lb98;

    iget-object v0, v0, Lb98;->b:Landroid/widget/FrameLayout;

    new-instance v2, Lvqn;

    invoke-direct {v2, p2, p1, v1}, Lvqn;-><init>(Lwqn;Lrqn;B)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, p0, Lq5g;->d:Ljava/lang/Object;

    check-cast p0, Landroid/widget/ImageView;

    new-instance v0, Lvqn;

    invoke-direct {v0, p2, p1, v4}, Lvqn;-><init>(Lwqn;Lrqn;B)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :pswitch_73
    check-cast p1, Lckb;

    check-cast p2, Lq6n;

    iget-object p0, p2, Lq6n;->b:Lq5g;

    iget-object p1, p0, Lq5g;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    const p2, 0x7f141451

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    iget-object p0, p0, Lq5g;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    const p1, 0x7f13002b

    invoke-virtual {p0, p1}, Ln2d;->j(I)V

    const p1, 0x7fffffff

    invoke-virtual {p0, v1, v1, p1, v0}, Lcom/opera/android/widget/LottieAnimationView;->s(IIILjava/lang/Runnable;)V

    return-void

    :pswitch_94
    check-cast p1, Lakb;

    check-cast p2, Ll6n;

    return-void

    :pswitch_99
    check-cast p1, Lgkb;

    check-cast p2, Lm6n;

    return-void

    :pswitch_9e
    check-cast p1, Likb;

    check-cast p2, Lv6n;

    return-void

    :pswitch_a3
    new-instance p0, Ljava/lang/ClassCastException;

    invoke-direct {p0}, Ljava/lang/ClassCastException;-><init>()V

    throw p0

    :pswitch_a9
    check-cast p1, Ljkb;

    check-cast p2, Ly6n;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v3, p1, Ljkb;->a:Laln;

    iput-object v3, p2, Ly6n;->c:Laln;

    iget-object p0, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    check-cast p0, Lgt9;

    iget-object p1, p2, Ly6n;->b:Ltjn;

    invoke-interface {p1}, Ltjn;->o()Lx4i;

    move-result-object p1

    if-eqz p1, :cond_d7

    iget-object p1, p1, Lx4i;->h:Lode;

    if-eqz p1, :cond_d7

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    if-eqz p1, :cond_d7

    invoke-interface {v3}, Laln;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Lk15;

    :cond_d7
    iget-object p0, p0, Lgt9;->d:Lov0;

    iget-object p1, p0, Lov0;->c:Ljava/lang/Object;

    check-cast p1, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_f3

    invoke-virtual {v0}, Lk15;->a()Z

    move-result v2

    if-nez v2, :cond_f3

    iget-object p0, p0, Lov0;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    iget-wide v4, v0, Lk15;->b:J

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_f5

    :cond_f3
    const/16 v1, 0x8

    :goto_f5
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p2, Ly6n;->d:Lpyl;

    iput-object v3, p0, Lpyl;->c:Ljava/lang/Object;

    iget-object p1, p0, Lpyl;->d:Ljava/lang/Object;

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object p1, p0, Lpyl;->d:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Landroid/view/View;

    iget-object p1, p0, Lpyl;->e:Ljava/lang/Object;

    move-object v5, p1

    check-cast v5, Lagm;

    iget v6, p0, Lpyl;->b:I

    iget-object p0, p0, Lpyl;->f:Ljava/lang/Object;

    check-cast p0, Ltjn;

    invoke-interface {p0}, Ltjn;->a()I

    move-result v7

    invoke-static/range {v2 .. v7}, Lpyl;->i(Landroid/content/Context;Laln;Landroid/view/View;Lagm;II)V

    return-void

    :pswitch_11c
    check-cast p1, Lbkb;

    check-cast p2, Lp6n;

    iget-object p0, p2, Lp6n;->b:Lcq3;

    iget-object p0, p0, Lcq3;->b:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/LineHeaderTextView;

    iget p1, p1, Lbkb;->a:I

    invoke-static {p1}, Lam2;->b(I)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    return-void

    :pswitch_data_130
    .packed-switch 0x0
        :pswitch_11c
        :pswitch_a9
        :pswitch_a3
        :pswitch_9e
        :pswitch_99
        :pswitch_94
        :pswitch_7
        :pswitch_73
    .end packed-switch
.end method

.method public final j(Loup;)Lr6h;
    .registers 6

    check-cast p1, Lb9o;

    invoke-static {}, La9o;->y()Lz8o;

    move-result-object p0

    iget-object v0, p1, Lb9o;->g:Li4d;

    iget-object v0, v0, Li4d;->b:Ljava/lang/Object;

    check-cast v0, Lm54;

    invoke-virtual {v0}, Lm54;->b()[B

    move-result-object v0

    const/4 v1, 0x0

    array-length v2, v0

    invoke-static {v1, v2, v0}, Le54;->h(II[B)Lc54;

    move-result-object v0

    invoke-virtual {p0}, Lav9;->f()V

    iget-object v1, p0, Lav9;->b:Lfv9;

    check-cast v1, La9o;

    invoke-virtual {v1, v0}, La9o;->A(Lc54;)V

    invoke-static {}, Lg9o;->x()Lf9o;

    move-result-object v0

    iget-object v1, p1, Lb9o;->f:Le9o;

    iget v2, v1, Le9o;->b:I

    invoke-virtual {v0}, Lav9;->f()V

    iget-object v3, v0, Lav9;->b:Lfv9;

    check-cast v3, Lg9o;

    invoke-virtual {v3, v2}, Lg9o;->y(I)V

    invoke-virtual {v0}, Lav9;->b()Lfv9;

    move-result-object v0

    check-cast v0, Lg9o;

    invoke-virtual {p0}, Lav9;->f()V

    iget-object v2, p0, Lav9;->b:Lfv9;

    check-cast v2, La9o;

    invoke-virtual {v2, v0}, La9o;->B(Lg9o;)V

    invoke-virtual {p0}, Lav9;->b()Lfv9;

    move-result-object p0

    check-cast p0, La9o;

    invoke-virtual {p0}, Lv5;->e()Lc54;

    move-result-object p0

    iget-object v0, v1, Le9o;->a:Lb30;

    invoke-static {v0}, Li9o;->a(Lb30;)Liuf;

    move-result-object v0

    iget-object p1, p1, Lb9o;->i:Ljava/lang/Integer;

    const-string v1, "type.googleapis.com/google.crypto.tink.XAesGcmKey"

    sget-object v2, Lmub;->c:Lmub;

    invoke-static {v1, p0, v2, v0, p1}, Lr6h;->a(Ljava/lang/String;Le54;Lmub;Liuf;Ljava/lang/Integer;)Lr6h;

    move-result-object p0

    return-object p0
.end method

.method public final l0(Landroid/view/View;Lg3o;)Lg3o;
    .registers 4

    iget-object p0, p2, Lg3o;->a:Ld3o;

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Ld3o;->i(I)Lr9b;

    move-result-object v0

    iget v0, v0, Lr9b;->d:I

    if-eqz v0, :cond_1a

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const/high16 v0, 0x40800000    # 4.0f

    invoke-static {p0, v0}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p0

    invoke-static {p0, p1}, Lp37;->p0(ILandroid/view/View;)V

    return-object p2

    :cond_1a
    const/16 v0, 0x207

    invoke-virtual {p0, v0}, Ld3o;->i(I)Lr9b;

    move-result-object p0

    iget p0, p0, Lr9b;->d:I

    invoke-static {p0, p1}, Lp37;->p0(ILandroid/view/View;)V

    return-object p2
.end method

.method public final m()Lo8o;
    .registers 1

    iget-byte p0, p0, Lsjn;->a:B

    packed-switch p0, :pswitch_data_10

    invoke-static {}, Lorg/chromium/net/X509Util;->b()Lo8o;

    move-result-object p0

    return-object p0

    :pswitch_a
    invoke-static {}, Lorg/chromium/net/X509Util;->a()Lo8o;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_10
    .packed-switch 0x17
        :pswitch_a
    .end packed-switch
.end method

.method public final n(Ls6h;)Lc0g;
    .registers 4

    iget-object p0, p1, Ls6h;->b:Ljava/lang/Object;

    check-cast p0, Lkvb;

    invoke-virtual {p0}, Lkvb;->x()Ljava/lang/String;

    move-result-object p1

    const-string v0, "type.googleapis.com/google.crypto.tink.XAesGcmKey"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_45

    :try_start_11
    invoke-virtual {p0}, Lkvb;->y()Le54;

    move-result-object p1

    invoke-static {}, Lxk8;->a()Lxk8;

    move-result-object v1

    invoke-static {p1, v1}, Ld9o;->y(Le54;Lxk8;)Ld9o;

    move-result-object p1
    :try_end_1d
    .catch Lajb; {:try_start_11 .. :try_end_1d} :catch_3e

    invoke-virtual {p1}, Ld9o;->w()I

    move-result v1

    if-nez v1, :cond_38

    invoke-virtual {p0}, Lkvb;->w()Liuf;

    move-result-object p0

    invoke-static {p0}, Li9o;->b(Liuf;)Lb30;

    move-result-object p0

    invoke-virtual {p1}, Ld9o;->v()Lg9o;

    move-result-object p1

    invoke-virtual {p1}, Lg9o;->w()I

    move-result p1

    invoke-static {p0, p1}, Le9o;->b(Lb30;I)Le9o;

    move-result-object p0

    return-object p0

    :cond_38
    const-string p0, "Only version 0 parameters are accepted"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v0

    :catch_3e
    move-exception p0

    const-string p1, "Parsing XAesGcmParameters failed: "

    invoke-static {p1, p0}, Lt3p;->k(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v0

    :cond_45
    const-string p1, "Wrong type URL in call to XAesGcmProtoSerialization.parseParameters: "

    invoke-virtual {p0}, Lkvb;->x()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p1}, Lt3p;->i(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method

.method public final x(Landroid/content/Context;)Lno7;
    .registers 4

    new-instance p0, Lbvn;

    const/16 v0, 0x11

    const-string v1, "web_page_translation_settings"

    invoke-direct {p0, p1, v0, v1}, Lno7;-><init>(Landroid/content/Context;ILjava/lang/String;)V

    return-object p0
.end method
