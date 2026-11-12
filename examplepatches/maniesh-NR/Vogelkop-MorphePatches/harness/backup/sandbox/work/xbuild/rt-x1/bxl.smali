.class public final synthetic Lbxl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lih4;
.implements Lee5;
.implements Lfn8;
.implements Lq5n;
.implements Lurg;
.implements Lktn;
.implements Lp9n;
.implements Llo7;
.implements Lxjj;
.implements Lyjj;


# static fields
.field public static final b:Lbxl;

.field public static final c:Lbxl;

.field public static final d:Lbxl;

.field public static final e:Lbxl;

.field public static final f:Lbxl;


# instance fields
.field public final synthetic a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lbxl;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lbxl;-><init>(B)V

    sput-object v0, Lbxl;->b:Lbxl;

    new-instance v0, Lbxl;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lbxl;-><init>(B)V

    sput-object v0, Lbxl;->c:Lbxl;

    new-instance v0, Lbxl;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lbxl;-><init>(B)V

    sput-object v0, Lbxl;->d:Lbxl;

    new-instance v0, Lbxl;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lbxl;-><init>(B)V

    sput-object v0, Lbxl;->e:Lbxl;

    new-instance v0, Lbxl;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lbxl;-><init>(B)V

    sput-object v0, Lbxl;->f:Lbxl;

    return-void
.end method

.method public synthetic constructor <init>(B)V
    .registers 2

    .line 8
    iput-byte p1, p0, Lbxl;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Luim;)V
    .registers 2

    const/16 p1, 0xe

    iput-byte p1, p0, Lbxl;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic a(ILjava/lang/StringBuilder;)V
    .registers 2

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static synthetic b(JLjava/lang/String;)V
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static synthetic d(Ljava/lang/Object;)V
    .registers 2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static synthetic g(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1, p0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static synthetic j(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1, p0, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method

.method public static synthetic k(Ljava/lang/StringBuilder;Ljava/lang/Object;)V
    .registers 2

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static synthetic l(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 4

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public final c(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/i;
    .registers 4

    new-instance p0, Lp6n;

    const v0, 0x7f0d0472

    const/4 v1, 0x0

    invoke-static {p1, v0, p1, v1}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_18

    new-instance v0, Lcq3;

    check-cast p1, Lcom/opera/android/custom_views/LineHeaderTextView;

    const/4 v1, 0x7

    invoke-direct {v0, p1, v1}, Lcq3;-><init>(Landroid/view/View;B)V

    invoke-direct {p0, v0}, Lp6n;-><init>(Lcq3;)V

    return-object p0

    :cond_18
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final cancel()V
    .registers 1

    return-void
.end method

.method public final createExtractors()[Lcn8;
    .registers 8

    new-instance v0, Lp7m;

    new-instance v4, Lpql;

    const-wide/16 v1, 0x0

    invoke-direct {v4, v1, v2}, Lpql;-><init>(J)V

    new-instance v5, Lgl;

    sget-object p0, Lh1b;->b:La1b;

    sget-object p0, Lcsh;->e:Lcsh;

    const/4 v6, 0x0

    invoke-direct {v5, v6, p0}, Lgl;-><init>(ILjava/util/List;)V

    const/4 v1, 0x1

    const/4 v2, 0x1

    sget-object v3, Ltnk;->Ap:Ldvj;

    invoke-direct/range {v0 .. v5}, Lp7m;-><init>(IILtnk;Lpql;Lgl;)V

    const/4 p0, 0x1

    new-array p0, p0, [Lcn8;

    aput-object v0, p0, v6

    return-object p0
.end method

.method public final e(Lorg/chromium/content/browser/webcontents/WebContentsImpl;)Ljava/lang/Object;
    .registers 2

    iget-byte p0, p0, Lbxl;->a:B

    packed-switch p0, :pswitch_data_12

    new-instance p0, Ld6n;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :pswitch_b
    new-instance p0, Lb6n;

    invoke-direct {p0, p1}, Lb6n;-><init>(Lorg/chromium/content/browser/webcontents/WebContentsImpl;)V

    return-object p0

    nop

    :pswitch_data_12
    .packed-switch 0x13
        :pswitch_b
    .end packed-switch
.end method

.method public final h(Landroid/view/View;)V
    .registers 2

    const p0, 0x7f0a0c96

    invoke-virtual {p1, p0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lu8n;

    if-eqz p0, :cond_e

    const/4 p1, 0x0

    iput p1, p0, Lu8n;->c:I

    :cond_e
    return-void
.end method

.method public final i(Ljava/lang/Object;Landroidx/recyclerview/widget/i;)V
    .registers 9

    iget-byte p0, p0, Lbxl;->a:B

    packed-switch p0, :pswitch_data_96

    check-cast p1, Llkb;

    check-cast p2, Lx6n;

    iget-object p0, p2, Lx6n;->d:Lbt1;

    iget-object p1, p0, Lbt1;->d:Lcom/opera/android/custom_views/StylingImageView;

    const p2, 0x7f080550

    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    iget-object p0, p0, Lbt1;->c:Lcom/opera/android/custom_views/StylingTextView;

    const p1, 0x7f141445

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    return-void

    :pswitch_1c
    check-cast p1, Lkkb;

    check-cast p2, Lw6n;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget p0, p1, Lkkb;->b:I

    iput p0, p2, Lw6n;->d:I

    iget-object p0, p2, Lw6n;->e:Lpyl;

    iget-object v1, p1, Lkkb;->a:Laln;

    iput-object v1, p0, Lpyl;->c:Ljava/lang/Object;

    iget-object p1, p0, Lpyl;->d:Ljava/lang/Object;

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object p1, p0, Lpyl;->d:Ljava/lang/Object;

    move-object v2, p1

    check-cast v2, Landroid/view/View;

    iget-object p1, p0, Lpyl;->e:Ljava/lang/Object;

    move-object v3, p1

    check-cast v3, Lagm;

    iget v4, p0, Lpyl;->b:I

    iget-object p0, p0, Lpyl;->f:Ljava/lang/Object;

    check-cast p0, Ltjn;

    invoke-interface {p0}, Ltjn;->a()I

    move-result v5

    invoke-static/range {v0 .. v5}, Lpyl;->i(Landroid/content/Context;Laln;Landroid/view/View;Lagm;II)V

    iget p0, p2, Lw6n;->d:I

    iget-object p1, p2, Lw6n;->b:Lnck;

    iget-object p1, p1, Lnck;->c:Lcom/opera/android/custom_views/StylingTextView;

    invoke-static {p0}, Lam2;->b(I)I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(I)V

    return-void

    :pswitch_5a
    check-cast p1, Lekb;

    check-cast p2, Lt6n;

    iget-object p0, p2, Lt6n;->c:Ltjn;

    invoke-interface {p0}, Ltjn;->d()Z

    move-result p0

    invoke-virtual {p2, p0}, Lt6n;->U(Z)V

    return-void

    :pswitch_68
    check-cast p1, Ldkb;

    check-cast p2, Lr6n;

    iget-object p0, p2, Lr6n;->b:Lvs;

    iget-object p1, p0, Lvs;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageView;

    const v0, 0x7f080631

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    iget-object p1, p0, Lvs;->e:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    const v0, 0x7f141448

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    iget-object p0, p0, Lvs;->d:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/button/MaterialButton;

    const p1, 0x7f140ebc

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    new-instance p1, Lpkm;

    const/4 v0, 0x2

    invoke-direct {p1, p2, v0}, Lpkm;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :pswitch_data_96
    .packed-switch 0x19
        :pswitch_68
        :pswitch_5a
        :pswitch_1c
    .end packed-switch
.end method

.method public final onUnhandledKeyEvent(Landroid/view/View;Landroid/view/KeyEvent;)Z
    .registers 3

    invoke-static {}, Lc37;->r()Lc37;

    move-result-object p0

    const/4 p1, 0x3

    invoke-virtual {p0, p1, p2}, Lc37;->l(ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public final r(Lx79;)Ljava/lang/Object;
    .registers 2

    iget-byte p0, p0, Lbxl;->a:B

    packed-switch p0, :pswitch_data_14

    invoke-static {p1}, Lcom/google/firebase/datatransport/TransportRegistrar;->a(Lx79;)Lp5m;

    move-result-object p0

    return-object p0

    :pswitch_a
    invoke-static {p1}, Lcom/google/firebase/datatransport/TransportRegistrar;->b(Lx79;)Lp5m;

    move-result-object p0

    return-object p0

    :pswitch_f
    invoke-static {p1}, Lcom/google/firebase/datatransport/TransportRegistrar;->c(Lx79;)Lp5m;

    move-result-object p0

    return-object p0

    :pswitch_data_14
    .packed-switch 0x7
        :pswitch_f
        :pswitch_a
    .end packed-switch
.end method

.method public final test(Ljava/lang/Object;)Z
    .registers 4

    check-cast p1, Lkqm;

    if-eqz p1, :cond_1a

    iget-object p0, p1, Lkqm;->b:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_18

    iget-object p0, p1, Lkqm;->d:Lipm;

    invoke-virtual {p0}, Lipm;->b()J

    move-result-wide p0

    const-wide/16 v0, 0x3

    cmp-long p0, p0, v0

    if-ltz p0, :cond_1a

    :cond_18
    const/4 p0, 0x0

    return p0

    :cond_1a
    const/4 p0, 0x1

    return p0
.end method

.method public final x(Landroid/content/Context;)Lno7;
    .registers 4

    iget-byte p0, p0, Lbxl;->a:B

    const/16 v0, 0x11

    packed-switch p0, :pswitch_data_18

    new-instance p0, Lbjn;

    const-string v1, "wallet_settings"

    invoke-direct {p0, p1, v0, v1}, Lno7;-><init>(Landroid/content/Context;ILjava/lang/String;)V

    return-object p0

    :pswitch_f
    new-instance p0, Lufn;

    const-string v1, "vpn_settings"

    invoke-direct {p0, p1, v0, v1}, Lno7;-><init>(Landroid/content/Context;ILjava/lang/String;)V

    return-object p0

    nop

    :pswitch_data_18
    .packed-switch 0x17
        :pswitch_f
    .end packed-switch
.end method
