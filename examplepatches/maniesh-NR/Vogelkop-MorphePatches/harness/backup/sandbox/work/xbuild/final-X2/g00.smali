.class public final synthetic Lg00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lm9n;
.implements Lxo4;
.implements Lyk7;
.implements Lfjc;
.implements Lop5;
.implements Lod3;
.implements Ln5o;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;IB)V
    .registers 4

    .line 12
    iput-byte p3, p0, Lg00;->a:B

    iput-object p1, p0, Lg00;->c:Ljava/lang/Object;

    iput p2, p0, Lg00;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lltl;ILcom/google/android/material/appbar/CollapsingToolbarLayout;)V
    .registers 4

    const/16 p1, 0x8

    iput-byte p1, p0, Lg00;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lg00;->b:I

    iput-object p3, p0, Lg00;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 4

    iget-object v0, p0, Lg00;->c:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;

    if-eqz v0, :cond_2e

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    if-eqz p1, :cond_e

    const/4 p0, -0x2

    goto :goto_10

    :cond_e
    iget p0, p0, Lg00;->b:I

    :goto_10
    iput p0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    xor-int/lit8 p0, p1, 0x1

    iget-boolean v1, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->n:Z

    if-eq p0, v1, :cond_2e

    iput-boolean p0, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->n:Z

    if-nez p1, :cond_24

    iget-object p0, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->l:Lv85;

    iget-object p0, p0, Lv85;->H:Ljava/lang/CharSequence;

    goto :goto_25

    :cond_24
    const/4 p0, 0x0

    :goto_25
    invoke-virtual {v0, p0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->g()V

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    :cond_2e
    return-void
.end method

.method public final accept(Ljava/lang/Object;)V
    .registers 13

    const-string v1, "no error message provided"

    iget-object v0, p0, Lg00;->c:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lnod;

    iget p0, p0, Lg00;->b:I

    check-cast p1, Lcom/google/common/util/concurrent/ListenableFuture;

    :try_start_b
    invoke-interface {p1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lxbc;

    const-string v0, "LibraryResult must not be null"

    invoke-static {p1, v0}, Lz4o;->D(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_16
    .catch Ljava/util/concurrent/CancellationException; {:try_start_b .. :try_end_16} :catch_38
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_b .. :try_end_16} :catch_17
    .catch Ljava/lang/InterruptedException; {:try_start_b .. :try_end_16} :catch_17

    goto :goto_58

    :catch_17
    move-exception v0

    move-object p1, v0

    const-string v0, "Library operation failed"

    invoke-static {v0, p1}, Lw7d;->L(Ljava/lang/String;Ljava/lang/Throwable;)V

    sget-object p1, Lxbc;->g:Ljava/lang/String;

    new-instance v8, La4j;

    sget-object p1, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    const/4 v0, -0x1

    invoke-direct {v8, v1, v0, p1}, La4j;-><init>(Ljava/lang/String;ILandroid/os/Bundle;)V

    new-instance v3, Lxbc;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    const/4 v9, 0x0

    const/4 v10, 0x4

    iget v4, v8, La4j;->a:I

    const/4 v7, 0x0

    invoke-direct/range {v3 .. v10}, Lxbc;-><init>(IJLsjd;La4j;Ljava/lang/Object;I)V

    :goto_36
    move-object p1, v3

    goto :goto_58

    :catch_38
    move-exception v0

    move-object p1, v0

    const-string v0, "Library operation cancelled"

    invoke-static {v0, p1}, Lw7d;->L(Ljava/lang/String;Ljava/lang/Throwable;)V

    sget-object p1, Lxbc;->g:Ljava/lang/String;

    new-instance v8, La4j;

    sget-object p1, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    const/4 v0, 0x1

    invoke-direct {v8, v1, v0, p1}, La4j;-><init>(Ljava/lang/String;ILandroid/os/Bundle;)V

    new-instance v3, Lxbc;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    const/4 v9, 0x0

    const/4 v10, 0x4

    iget v4, v8, La4j;->a:I

    const/4 v7, 0x0

    invoke-direct/range {v3 .. v10}, Lxbc;-><init>(IJLsjd;La4j;Ljava/lang/Object;I)V

    goto :goto_36

    :goto_58
    :try_start_58
    iget-object v0, v2, Lnod;->d:Lmod;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v0, p0, p1}, Lmod;->g(ILxbc;)V
    :try_end_60
    .catch Landroid/os/RemoteException; {:try_start_58 .. :try_end_60} :catch_61

    goto :goto_74

    :catch_61
    move-exception v0

    move-object p0, v0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Failed to send result to browser "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p0}, Lw7d;->L(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_74
    return-void
.end method

.method public final c(Ljava/lang/Integer;Lqjd;)V
    .registers 4

    iget-object v0, p0, Lg00;->c:Ljava/lang/Object;

    check-cast v0, Lokg;

    invoke-virtual {v0, p2}, Lokg;->c(Lqjd;)Legd;

    move-result-object p2

    if-eqz p2, :cond_1e

    iget p2, p2, Legd;->e:I

    iget p0, p0, Lg00;->b:I

    if-ne p0, p2, :cond_1e

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p0

    iget-object p1, v0, Lokg;->c:Llkg;

    invoke-interface {p1, p0}, Llkg;->remove(I)V

    iget-object p0, v0, Lokg;->b:Lkjg;

    invoke-virtual {p0}, Lkjg;->b()V

    :cond_1e
    return-void
.end method

.method public final f()Landroid/graphics/drawable/Drawable;
    .registers 2

    iget-object v0, p0, Lg00;->c:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget p0, p0, Lg00;->b:I

    invoke-static {p0, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-object v0, p0, Lg00;->c:Ljava/lang/Object;

    check-cast v0, Lo9j;

    check-cast p1, Ljava/lang/Void;

    iget-object p1, v0, Lo9j;->c:La21;

    iget-object v1, p1, La21;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/settings/settings_search/database/SettingsSearchDatabase;

    invoke-virtual {v1}, Lcom/opera/android/settings/settings_search/database/SettingsSearchDatabase;->x()Lpmh;

    move-result-object v2

    new-instance v3, Lomh;

    iget-object p1, p1, La21;->c:Ljava/lang/Object;

    check-cast p1, Li06;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget p0, p0, Lg00;->b:I

    invoke-direct {v3, p0, v4, v5}, Lomh;-><init>(IJ)V

    iget-object p0, v2, Lpmh;->a:Ly5i;

    new-instance p1, Lvvf;

    const/16 v4, 0x9

    invoke-direct {p1, v2, v3, v4}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {p0, v2, v3, p1}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    invoke-virtual {v1}, Lcom/opera/android/settings/settings_search/database/SettingsSearchDatabase;->x()Lpmh;

    move-result-object p0

    iget-object p0, p0, Lpmh;->a:Ly5i;

    new-instance p1, Lu4h;

    const/16 v1, 0x8

    invoke-direct {p1, v1}, Lu4h;-><init>(B)V

    invoke-static {p0, v2, v3, p1}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    iget-object p0, v0, Lo9j;->f:Ln9j;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lj9j;

    if-eqz p0, :cond_5d

    iget-boolean p1, p0, Lj9j;->c:Z

    if-eqz p1, :cond_5d

    if-eqz p1, :cond_58

    iget-object p0, p0, Lj9j;->b:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_5d

    :cond_58
    const/4 p0, 0x3

    const/4 p1, 0x0

    invoke-static {v0, p1, p0}, Lo9j;->h(Lo9j;Ljava/lang/String;I)V

    :cond_5d
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke(Ljava/lang/Object;)V
    .registers 3

    iget-object v0, p0, Lg00;->c:Ljava/lang/Object;

    check-cast v0, Lqjd;

    iget p0, p0, Lg00;->b:I

    check-cast p1, Leig;

    invoke-interface {p1, p0, v0}, Leig;->B(ILqjd;)V

    return-void
.end method

.method public final j()V
    .registers 5

    iget-byte v0, p0, Lg00;->a:B

    iget v1, p0, Lg00;->b:I

    iget-object p0, p0, Lg00;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_3c

    check-cast p0, Lupm;

    invoke-interface {p0, v1}, Lupm;->e(I)Z

    return-void

    :pswitch_f
    check-cast p0, Lh00;

    iget-object v0, p0, Lo43;->d:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v2

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    sub-int/2addr v2, v0

    mul-int/2addr v2, v1

    div-int/lit8 v2, v2, 0x64

    iget-object p0, p0, Lxv8;->p:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/TextView;->getTextSize()F

    move-result v1

    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    int-to-float v2, v2

    mul-float/2addr v1, v2

    int-to-float v0, v0

    div-float/2addr v1, v0

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    return-void

    nop

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method

.method public final m(Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;)Lcom/google/android/gms/common/api/PendingResult;
    .registers 4

    iget-object v0, p0, Lg00;->c:Ljava/lang/Object;

    check-cast v0, Lzo4;

    iget-object v0, v0, Lzo4;->l:[I

    array-length v1, v0

    iget p0, p0, Lg00;->b:I

    if-ge p0, v1, :cond_e

    aget p0, v0, p0

    goto :goto_f

    :cond_e
    const/4 p0, 0x0

    :goto_f
    const/4 v0, 0x0

    invoke-virtual {p1, p0, v0}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->queueJumpToItem(ILorg/json/JSONObject;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object p0

    return-object p0
.end method
