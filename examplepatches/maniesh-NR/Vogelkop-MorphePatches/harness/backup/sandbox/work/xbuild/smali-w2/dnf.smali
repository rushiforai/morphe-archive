.class public final Ldnf;
.super Lo93;
.source "SourceFile"


# instance fields
.field public final c:Lorg/chromium/ui/modelutil/PropertyModel;

.field public d:Z

.field public e:Z

.field public final f:Lhp2;


# direct methods
.method public constructor <init>(Lorg/chromium/ui/modelutil/PropertyModel;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldnf;->c:Lorg/chromium/ui/modelutil/PropertyModel;

    new-instance p1, Lhp2;

    const/16 v0, 0xd

    const/4 v1, 0x0

    invoke-direct {p1, v0, v1}, Lhp2;-><init>(BZ)V

    iput-object p1, p0, Ldnf;->f:Lhp2;

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)Lgtj;
    .registers 6

    sget-object v0, Lhvd;->g:Lx5h;

    iget-object v1, p0, Ldnf;->c:Lorg/chromium/ui/modelutil/PropertyModel;

    invoke-virtual {v1, v0}, Lorg/chromium/ui/modelutil/PropertyModel;->c(Lu5h;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    const/16 v2, 0x1388

    invoke-static {p1, v0, v2}, Lgtj;->e(Landroid/view/View;Ljava/lang/CharSequence;I)Lgtj;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lq9n;->h(Landroid/content/Context;)V

    sget-object p1, Lhvd;->b:Lx5h;

    invoke-virtual {v1, p1}, Lorg/chromium/ui/modelutil/PropertyModel;->c(Lu5h;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_4a

    iget-object v1, p0, Ldnf;->f:Lhp2;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, v1, Lhp2;->b:J

    new-instance v1, Lzvd;

    const/16 v2, 0x8

    invoke-direct {v1, p0, v2}, Lzvd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1, v1}, Lgtj;->g(Ljava/lang/CharSequence;Landroid/view/View$OnClickListener;)V

    new-instance p1, Ljf7;

    const/16 v1, 0x1b

    invoke-direct {p1, p0, v0, v1}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, v0, Lgtj;->a:Lasj;

    iget-object p0, p0, Lna3;->i:Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;

    const v1, 0x7f0a0a8b

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_4a

    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_4a
    return-object v0
.end method

.method public final f(I)V
    .registers 5

    iget-boolean v0, p0, Ldnf;->e:Z

    if-nez v0, :cond_35

    const/4 v0, 0x1

    iput-boolean v0, p0, Ldnf;->e:Z

    iget-object v1, p0, Ldnf;->c:Lorg/chromium/ui/modelutil/PropertyModel;

    sget-object v2, Lhvd;->t:Lx5h;

    invoke-virtual {v1, v2}, Lorg/chromium/ui/modelutil/PropertyModel;->c(Lu5h;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/base/Callback;

    if-eqz v1, :cond_35

    iget-boolean p0, p0, Ldnf;->d:Z

    if-nez p0, :cond_2e

    const/4 p0, 0x4

    if-eqz p1, :cond_2d

    if-eq p1, v0, :cond_2e

    const/4 v0, 0x2

    const/4 v2, 0x3

    if-eq p1, v0, :cond_2b

    if-eq p1, v2, :cond_28

    if-eq p1, p0, :cond_26

    const/4 v0, 0x0

    goto :goto_2e

    :cond_26
    const/4 v0, 0x6

    goto :goto_2e

    :cond_28
    const/16 v0, 0x9

    goto :goto_2e

    :cond_2b
    move v0, v2

    goto :goto_2e

    :cond_2d
    move v0, p0

    :cond_2e
    :goto_2e
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {v1, p0}, Lorg/chromium/base/Callback;->onResult(Ljava/lang/Object;)V

    :cond_35
    return-void
.end method

.method public final g()V
    .registers 2

    iget-boolean v0, p0, Ldnf;->d:Z

    if-nez v0, :cond_1d

    iget-boolean v0, p0, Ldnf;->e:Z

    if-nez v0, :cond_1d

    const/4 v0, 0x1

    iput-boolean v0, p0, Ldnf;->d:Z

    iget-object p0, p0, Ldnf;->c:Lorg/chromium/ui/modelutil/PropertyModel;

    sget-object v0, Lhvd;->d:Lx5h;

    invoke-virtual {p0, v0}, Lorg/chromium/ui/modelutil/PropertyModel;->c(Lu5h;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/function/Supplier;

    if-eqz p0, :cond_1d

    invoke-interface {p0}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    :cond_1d
    return-void
.end method
