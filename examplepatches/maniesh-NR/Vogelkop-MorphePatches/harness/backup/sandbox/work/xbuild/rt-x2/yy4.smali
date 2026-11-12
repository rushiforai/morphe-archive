.class public final Lyy4;
.super Liz4;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final synthetic c:Landroid/widget/FrameLayout;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/chromium/ChromiumContainerView;Lvx;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lyy4;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lyy4;->c:Landroid/widget/FrameLayout;

    iput-object p2, p0, Lyy4;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lg7b;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lyy4;->a:B

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lyy4;->c:Landroid/widget/FrameLayout;

    .line 16
    iput-object p1, p0, Lyy4;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final A(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 3

    iget-byte v0, p0, Lyy4;->a:B

    packed-switch v0, :pswitch_data_22

    return-void

    :pswitch_6
    invoke-virtual {p0, p1}, Lyy4;->M(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    iget-object p1, p0, Lyy4;->b:Ljava/lang/Object;

    check-cast p1, Lvx;

    invoke-virtual {p1}, Lvx;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_20

    iget-object p0, p0, Lyy4;->c:Landroid/widget/FrameLayout;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;

    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    :cond_20
    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final L(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 3

    iget-byte v0, p0, Lyy4;->a:B

    packed-switch v0, :pswitch_data_a

    return-void

    :pswitch_6
    invoke-virtual {p0, p1}, Lyy4;->M(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    return-void

    :pswitch_data_a
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final M(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 4

    iget-object v0, p0, Lyy4;->c:Landroid/widget/FrameLayout;

    check-cast v0, Lcom/opera/android/browser/chromium/ChromiumContainerView;

    iget-object v1, v0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->d:Lyy4;

    if-ne v1, p0, :cond_b

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->d:Lyy4;

    :cond_b
    invoke-virtual {p1, p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->y(Liz4;)V

    return-void
.end method

.method public final i(Lcom/opera/android/browser/chromium/ChromiumContent;III)V
    .registers 5

    iget-byte p1, p0, Lyy4;->a:B

    packed-switch p1, :pswitch_data_1c

    return-void

    :pswitch_6
    iget-object p0, p0, Lyy4;->b:Ljava/lang/Object;

    check-cast p0, Lg7b;

    iget p1, p0, Lg7b;->k:I

    sub-int p1, p3, p1

    iput p3, p0, Lg7b;->k:I

    iget-byte p2, p0, Lg7b;->e:B

    if-eqz p2, :cond_1a

    iget p2, p0, Lg7b;->h:F

    int-to-float p1, p1

    sub-float/2addr p2, p1

    iput p2, p0, Lg7b;->h:F

    :cond_1a
    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final j(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 3

    iget-byte v0, p0, Lyy4;->a:B

    packed-switch v0, :pswitch_data_a

    return-void

    :pswitch_6
    invoke-virtual {p0, p1}, Lyy4;->M(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    return-void

    :pswitch_data_a
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final l(Lcom/opera/android/browser/chromium/ChromiumContent;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 3

    iget-byte p2, p0, Lyy4;->a:B

    packed-switch p2, :pswitch_data_12

    return-void

    :pswitch_6
    iget-boolean p1, p1, Lcom/opera/android/browser/chromium/ChromiumContent;->r:Z

    if-eqz p1, :cond_11

    iget-object p0, p0, Lyy4;->b:Ljava/lang/Object;

    check-cast p0, Lg7b;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lg7b;->n:Z

    :cond_11
    return-void

    :pswitch_data_12
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final m(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 3

    iget-byte v0, p0, Lyy4;->a:B

    packed-switch v0, :pswitch_data_22

    return-void

    :pswitch_6
    invoke-virtual {p0, p1}, Lyy4;->M(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    iget-object p1, p0, Lyy4;->b:Ljava/lang/Object;

    check-cast p1, Lvx;

    invoke-virtual {p1}, Lvx;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_20

    iget-object p0, p0, Lyy4;->c:Landroid/widget/FrameLayout;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;

    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    :cond_20
    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final o(Lcom/opera/android/browser/chromium/ChromiumContent;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 4

    iget-byte v0, p0, Lyy4;->a:B

    packed-switch v0, :pswitch_data_46

    return-void

    :pswitch_6
    iget-boolean v0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->b:Z

    if-eqz v0, :cond_1b

    invoke-virtual {p1}, Lcom/opera/android/browser/chromium/ChromiumContent;->r()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p2, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    invoke-virtual {p2}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, LJ/N;->M3e4Lx_w(Ljava/lang/Object;Ljava/lang/Object;Z)Z

    move-result p1

    if-nez p1, :cond_3a

    :cond_1b
    iget-object p0, p0, Lyy4;->c:Landroid/widget/FrameLayout;

    check-cast p0, Lg7b;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iget-object p0, p0, Lg7b;->q:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-nez p2, :cond_40

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-nez p1, :cond_3b

    :cond_3a
    return-void

    :cond_3b
    invoke-static {p0}, Lp3p;->g(Ljava/util/Iterator;)Ljava/lang/ClassCastException;

    move-result-object p0

    throw p0

    :cond_40
    invoke-static {p0}, Lp3p;->g(Ljava/util/Iterator;)Ljava/lang/ClassCastException;

    move-result-object p0

    throw p0

    nop

    :pswitch_data_46
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method
