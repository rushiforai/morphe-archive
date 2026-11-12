.class public final synthetic Lcrk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbcf;
.implements Lav4;
.implements Lmm9;
.implements Lih4;
.implements Llr8;
.implements Ln5o;
.implements Lykj;
.implements Lssl;
.implements Lh93;
.implements Lurg;
.implements Lhh4;
.implements Lh6f;
.implements Lyyk;
.implements Lcom/opera/android/bar/AutocompleteHelper$Callback;
.implements Louh;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lcrk;->a:B

    iput-object p1, p0, Lcrk;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final E(Lcom/opera/android/custom_views/CheckBox;)V
    .registers 2

    iget-object p0, p0, Lcrk;->b:Ljava/lang/Object;

    check-cast p0, Ljm9;

    iget-object p0, p0, Ljm9;->c:Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    iget-boolean p1, p1, Lcom/opera/android/custom_views/CheckBox;->n:Z

    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public final X(Landroid/os/Bundle;Ljava/lang/String;)V
    .registers 3

    iget-object p0, p0, Lcrk;->b:Ljava/lang/Object;

    check-cast p0, Lgil;

    const-string p2, "result_code"

    invoke-virtual {p1, p2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    move-result p1

    const/4 p2, -0x1

    if-ne p1, p2, :cond_f

    const/4 p1, 0x1

    goto :goto_10

    :cond_f
    const/4 p1, 0x0

    :goto_10
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Lgil;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final a(Ljava/lang/String;)Z
    .registers 3

    iget-object p0, p0, Lcrk;->b:Ljava/lang/Object;

    check-cast p0, Lsyk;

    const-string v0, "ofa://ui/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_26

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object p0

    sget-object v0, Lp6l;->a:Lp6l;

    invoke-virtual {p0, p1, v0}, Lnr8;->c(Ljava/lang/String;Lp6l;)Lhq8;

    move-result-object p0

    if-eqz p0, :cond_26

    const/4 p0, 0x1

    return p0

    :cond_26
    const/4 p0, 0x0

    return p0
.end method

.method public final cancel()V
    .registers 3

    iget-byte v0, p0, Lcrk;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lcrk;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_24

    check-cast p0, Lj5m;

    iput-object v1, p0, Lj5m;->j:Ljava/lang/Runnable;

    return-void

    :sswitch_d
    check-cast p0, Lbf9;

    iget-object v0, p0, Lbf9;->q:Lh5k;

    if-eqz v0, :cond_1c

    iget-object v0, v0, Lh5k;->c:Ljava/lang/Object;

    check-cast v0, Lq65;

    invoke-virtual {v0}, Ln1;->S()V

    iput-object v1, p0, Lbf9;->q:Lh5k;

    :cond_1c
    return-void

    :sswitch_1d
    check-cast p0, Landroid/os/CancellationSignal;

    invoke-virtual {p0}, Landroid/os/CancellationSignal;->cancel()V

    return-void

    nop

    :sswitch_data_24
    .sparse-switch
        0x4 -> :sswitch_1d
        0x13 -> :sswitch_d
    .end sparse-switch
.end method

.method public final d(ZZ)V
    .registers 4

    iget-object p0, p0, Lcrk;->b:Ljava/lang/Object;

    check-cast p0, Lpom;

    iget-object p0, p0, Lpom;->c:Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_b

    return-void

    :cond_b
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1, p2}, Lx5f;->Z(Lgt0;ZZ)V

    return-void
.end method

.method public final execute()Ljava/lang/Object;
    .registers 5

    iget-object p0, p0, Lcrk;->b:Ljava/lang/Object;

    check-cast p0, Lks3;

    iget-object p0, p0, Lks3;->i:Ljava/lang/Object;

    check-cast p0, Lydi;

    invoke-virtual {p0}, Lydi;->h()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_f
    const-string v1, "DELETE FROM log_event_dropped"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "UPDATE global_log_event_state SET last_metrics_upload_ms="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lydi;->b:Lt55;

    invoke-interface {p0}, Lt55;->d()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object p0

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_36
    .catchall {:try_start_f .. :try_end_36} :catchall_3b

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    const/4 p0, 0x0

    return-object p0

    :catchall_3b
    move-exception p0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw p0
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lcrk;->a:B

    iget-object p0, p0, Lcrk;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_32

    :pswitch_7
    check-cast p0, Ltb2;

    invoke-virtual {p0, p1}, Ltb2;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_e
    check-cast p0, Ltb2;

    invoke-virtual {p0, p1}, Ltb2;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_15
    check-cast p0, Lp01;

    invoke-virtual {p0, p1}, Lp01;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_1c
    check-cast p0, Lymk;

    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0}, Lymk;->get()Ljava/lang/Object;

    const/4 p0, 0x0

    return-object p0

    :pswitch_25
    check-cast p0, Lvx;

    check-cast p1, Ljava/lang/Void;

    iget-object p0, p0, Lvx;->b:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_data_32
    .packed-switch 0x8
        :pswitch_25
        :pswitch_1c
        :pswitch_15
        :pswitch_7
        :pswitch_7
        :pswitch_e
    .end packed-switch
.end method

.method public final h(JLg1g;)V
    .registers 4

    iget-object p0, p0, Lcrk;->b:Ljava/lang/Object;

    check-cast p0, Loam;

    iget-object p0, p0, Loam;->b:Ljava/lang/Object;

    check-cast p0, [Lhyl;

    invoke-static {p1, p2, p3, p0}, Lrm5;->n(JLg1g;[Lhyl;)V

    return-void
.end method

.method public final k(Lg3d;)Ljava/lang/Object;
    .registers 2

    iget-object p0, p0, Lcrk;->b:Ljava/lang/Object;

    check-cast p0, Lqll;

    sget p1, Lcom/opera/android/widget/ThemeableLottieAnimationView;->x:I

    iget-object p0, p0, Lqll;->b:Ljava/lang/Object;

    return-object p0
.end method

.method public final l0(Landroid/view/View;Lg3o;)Lg3o;
    .registers 9

    iget-byte p1, p0, Lcrk;->a:B

    const/4 v0, 0x1

    const/16 v1, 0x207

    iget-object p0, p0, Lcrk;->b:Ljava/lang/Object;

    sparse-switch p1, :sswitch_data_da

    check-cast p0, Lobm;

    iget-object p1, p0, Lobm;->l:Landroid/widget/FrameLayout;

    iget-object v2, p2, Lg3o;->a:Ld3o;

    invoke-virtual {v2, v1}, Ld3o;->i(I)Lr9b;

    move-result-object v1

    const/16 v3, 0x80

    invoke-virtual {v2, v3}, Ld3o;->i(I)Lr9b;

    move-result-object v2

    invoke-static {v1, v2}, Lr9b;->a(Lr9b;Lr9b;)Lr9b;

    move-result-object v1

    iput-object v1, p0, Lobm;->m:Lr9b;

    iget-object v1, p0, Lobm;->g:Llbm;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eq v1, v0, :cond_40

    const/4 v0, 0x2

    if-eq v1, v0, :cond_32

    const/4 p1, 0x3

    if-ne v1, p1, :cond_51

    invoke-virtual {p0}, Lobm;->a()V

    goto :goto_51

    :cond_32
    iget-object p0, p0, Lobm;->m:Lr9b;

    iget v0, p0, Lr9b;->a:I

    iget v1, p0, Lr9b;->b:I

    iget v2, p0, Lr9b;->c:I

    iget p0, p0, Lr9b;->d:I

    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_51

    :cond_40
    iget-object v0, p0, Lobm;->m:Lr9b;

    iget v0, v0, Lr9b;->a:I

    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    iget-object p0, p0, Lobm;->m:Lr9b;

    iget v2, p0, Lr9b;->c:I

    iget p0, p0, Lr9b;->d:I

    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/view/View;->setPadding(IIII)V

    :cond_51
    :goto_51
    return-object p2

    :sswitch_52
    check-cast p0, Lcom/opera/android/custom_views/SystemBarsBottomPlaceholderView;

    sget p1, Lcom/opera/android/custom_views/SystemBarsBottomPlaceholderView;->b:I

    iget-object p1, p2, Lg3o;->a:Ld3o;

    invoke-virtual {p1, v1}, Ld3o;->i(I)Lr9b;

    move-result-object p1

    iget p1, p1, Lr9b;->d:I

    iget v0, p0, Lcom/opera/android/custom_views/SystemBarsBottomPlaceholderView;->a:I

    if-eq p1, v0, :cond_67

    iput p1, p0, Lcom/opera/android/custom_views/SystemBarsBottomPlaceholderView;->a:I

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    :cond_67
    return-object p2

    :sswitch_68
    check-cast p0, Lizk;

    iget-object p1, p0, Lizk;->b:Ljava/util/ArrayList;

    iget-object v2, p2, Lg3o;->a:Ld3o;

    invoke-virtual {v2, v1}, Ld3o;->i(I)Lr9b;

    move-result-object v3

    const/16 v4, 0x40

    invoke-virtual {v2, v4}, Ld3o;->i(I)Lr9b;

    move-result-object v5

    invoke-static {v3, v5}, Lr9b;->b(Lr9b;Lr9b;)Lr9b;

    move-result-object v3

    invoke-virtual {v2, v1}, Ld3o;->j(I)Lr9b;

    move-result-object v1

    invoke-virtual {v2, v4}, Ld3o;->j(I)Lr9b;

    move-result-object v2

    invoke-static {v1, v2}, Lr9b;->b(Lr9b;Lr9b;)Lr9b;

    move-result-object v1

    iget-object v2, p0, Lizk;->c:Lr9b;

    invoke-virtual {v3, v2}, Lr9b;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_98

    iget-object v2, p0, Lizk;->d:Lr9b;

    invoke-virtual {v1, v2}, Lr9b;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_ba

    :cond_98
    iput-object v3, p0, Lizk;->c:Lr9b;

    iput-object v1, p0, Lizk;->d:Lr9b;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p0

    sub-int/2addr p0, v0

    :goto_a1
    if-ltz p0, :cond_ba

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ll6h;

    iget-object v1, v1, Ll6h;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr v2, v0

    if-gez v2, :cond_b5

    add-int/lit8 p0, p0, -0x1

    goto :goto_a1

    :cond_b5
    invoke-static {v2, v1}, Lfki;->n(ILjava/util/ArrayList;)Ljava/lang/ClassCastException;

    move-result-object p0

    throw p0

    :cond_ba
    return-object p2

    :sswitch_bb
    check-cast p0, Lw6j;

    const/16 p1, 0x20f

    iget-object v0, p2, Lg3o;->a:Ld3o;

    invoke-virtual {v0, p1}, Ld3o;->i(I)Lr9b;

    move-result-object p1

    iget-object p0, p0, Lw6j;->a:Ljava/lang/Object;

    check-cast p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    iget v1, p1, Lr9b;->b:I

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    iget p1, p1, Lr9b;->d:I

    invoke-virtual {p0, v0, v1, v2, p1}, Landroid/view/View;->setPadding(IIII)V

    return-object p2

    nop

    :sswitch_data_da
    .sparse-switch
        0x0 -> :sswitch_bb
        0x6 -> :sswitch_68
        0x7 -> :sswitch_52
    .end sparse-switch
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 2

    iget-object p0, p0, Lcrk;->b:Ljava/lang/Object;

    check-cast p0, Lltl;

    invoke-virtual {p0, p1}, Lltl;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public final run(Ljava/lang/String;Ljava/lang/String;I)V
    .registers 6

    iget-object p0, p0, Lcrk;->b:Ljava/lang/Object;

    check-cast p0, Lcbk;

    if-eqz p1, :cond_14

    if-eqz p2, :cond_14

    iget-object v0, p0, Lcbk;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    new-instance v1, Lcca;

    invoke-direct {v1, p1, p2, p3}, Lcca;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_14
    invoke-virtual {p0}, Lcbk;->b()V

    return-void
.end method

.method public final s()V
    .registers 2

    iget-object p0, p0, Lcrk;->b:Ljava/lang/Object;

    check-cast p0, Lwyl;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object p0

    if-eqz p0, :cond_19

    const-class v0, Ld8j;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ld8j;

    goto :goto_1a

    :cond_19
    const/4 p0, 0x0

    :goto_1a
    if-eqz p0, :cond_21

    check-cast p0, Lg8j;

    invoke-virtual {p0}, Lg8j;->h()V

    :cond_21
    return-void
.end method

.method public final test(Ljava/lang/Object;)Z
    .registers 7

    iget-byte v0, p0, Lcrk;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object p0, p0, Lcrk;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_2e

    check-cast p0, Lkqm;

    check-cast p1, Lkqm;

    iget-object p1, p1, Lkqm;->d:Lipm;

    iget-wide v3, p1, Lipm;->b:J

    iget-object p0, p0, Lkqm;->d:Lipm;

    iget-wide p0, p0, Lipm;->b:J

    cmp-long p0, v3, p0

    if-nez p0, :cond_1a

    move v1, v2

    :cond_1a
    return v1

    :pswitch_1b
    check-cast p0, Lr4m;

    check-cast p1, Lszb;

    iget-object p0, p0, Lr4m;->b:Ly4m;

    iget-object p0, p0, Ly4m;->i:Lszb;

    if-eqz p0, :cond_2c

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2c

    move v1, v2

    :cond_2c
    return v1

    nop

    :pswitch_data_2e
    .packed-switch 0x15
        :pswitch_1b
    .end packed-switch
.end method
