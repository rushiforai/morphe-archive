.class public final Lse3;
.super Ld17;
.source "SourceFile"


# instance fields
.field public final synthetic d:B

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Le35;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lse3;->d:B

    .line 13
    iput-object p1, p0, Lse3;->e:Ljava/lang/Object;

    const-wide/16 v0, 0x64

    invoke-direct {p0, v0, v1}, Ld17;-><init>(J)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 11
    iput-byte p2, p0, Lse3;->d:B

    iput-object p1, p0, Lse3;->e:Ljava/lang/Object;

    const-wide/16 p1, 0xbb8

    invoke-direct {p0, p1, p2}, Ld17;-><init>(J)V

    return-void
.end method

.method public constructor <init>(Lp12;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Lse3;->d:B

    .line 12
    iput-object p1, p0, Lse3;->e:Ljava/lang/Object;

    const-wide/16 v0, 0x0

    invoke-direct {p0, v0, v1}, Ld17;-><init>(J)V

    return-void
.end method

.method public constructor <init>(Lsgi;)V
    .registers 4

    const/4 v0, 0x4

    iput-byte v0, p0, Lse3;->d:B

    iput-object p1, p0, Lse3;->e:Ljava/lang/Object;

    const-wide/16 v0, 0x2710

    invoke-direct {p0, v0, v1}, Ld17;-><init>(J)V

    return-void
.end method


# virtual methods
.method public final b()V
    .registers 10

    iget-byte v0, p0, Lse3;->d:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object p0, p0, Lse3;->e:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_e2

    check-cast p0, Lsgi;

    iput-boolean v2, p0, Lsgi;->d:Z

    iget-object p0, p0, Lsgi;->h:Ljava/lang/Object;

    check-cast p0, Lrdn;

    invoke-virtual {p0}, Lrdn;->run()V

    return-void

    :pswitch_15
    check-cast p0, Lhd;

    iget-object v0, p0, Lhd;->f:Ljava/lang/Object;

    check-cast v0, Lko7;

    iget-object p0, p0, Lhd;->d:Ljava/lang/Object;

    check-cast p0, Lxbf;

    new-instance v3, Lpkg;

    invoke-direct {v3}, Lpkg;-><init>()V

    iget-object v4, p0, Lxbf;->c:Ljava/lang/Object;

    check-cast v4, Lode;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lgig;

    iget-object p0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast p0, Ltjg;

    iget-object p0, p0, Ltjg;->k:Lokg;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iget-object v6, p0, Lokg;->c:Llkg;

    new-instance v7, Lkkg;

    invoke-direct {v7, p0, v5, v2}, Lkkg;-><init>(Lokg;Ljava/util/ArrayList;B)V

    invoke-interface {v6, v7, v2}, Llkg;->h(Lod3;Z)V

    iget-object p0, v3, Lpkg;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-interface {v4}, Lgig;->f0()I

    move-result v5

    iput v5, v3, Lpkg;->b:I

    invoke-interface {v4}, Lgig;->getCurrentPosition()J

    move-result-wide v4

    iput-wide v4, v3, Lpkg;->c:J

    :cond_57
    :goto_57
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v1, v4, :cond_84

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_81

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    iget v4, v3, Lpkg;->b:I

    if-le v4, v1, :cond_6f

    add-int/lit8 v4, v4, -0x1

    iput v4, v3, Lpkg;->b:I

    goto :goto_57

    :cond_6f
    if-ne v4, v1, :cond_57

    const-wide/16 v5, 0x0

    iput-wide v5, v3, Lpkg;->c:J

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ne v4, v5, :cond_57

    iget v4, v3, Lpkg;->b:I

    sub-int/2addr v4, v2

    iput v4, v3, Lpkg;->b:I

    goto :goto_57

    :cond_81
    add-int/lit8 v1, v1, 0x1

    goto :goto_57

    :cond_84
    invoke-virtual {v0, v3}, Lldk;->g(Ljava/lang/Object;)V

    return-void

    :pswitch_88
    check-cast p0, Lp12;

    invoke-virtual {p0, v1}, Lp12;->B(Z)V

    return-void

    :pswitch_8e
    check-cast p0, Le35;

    iget-object v0, p0, Le35;->r:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v4, v1

    move v5, v4

    move v6, v5

    :cond_99
    :goto_99
    if-ge v6, v3, :cond_b9

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v6, v6, 0x1

    check-cast v7, Lc35;

    iget-boolean v8, v7, Lc35;->e:Z

    if-nez v8, :cond_a9

    move v8, v1

    goto :goto_af

    :cond_a9
    iget-object v8, v7, Lc35;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v8}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->isChecked()Z

    move-result v8

    :goto_af
    if-eqz v8, :cond_99

    add-int/lit8 v4, v4, 0x1

    iget-boolean v7, v7, Lc35;->c:Z

    if-nez v7, :cond_99

    move v5, v2

    goto :goto_99

    :cond_b9
    iget-object v0, p0, Le35;->v:Lac1;

    iput v4, v0, Lac1;->b:I

    invoke-virtual {v0}, Lac1;->k()V

    if-lez v4, :cond_c5

    if-nez v5, :cond_c5

    move v1, v2

    :cond_c5
    iget-object p0, p0, Le35;->u:Lpq3;

    iget-object p0, p0, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0, v1}, Landroid/view/View;->setEnabled(Z)V

    return-void

    :pswitch_cd
    check-cast p0, Lcom/opera/android/settings/BigSwitchButton;

    iget-object v0, p0, Lcom/opera/android/settings/BigSwitchButton;->b:Lse3;

    invoke-virtual {v0}, Ld17;->d()V

    iget-object p0, p0, Lcom/opera/android/settings/BigSwitchButton;->a:Lvs;

    iget-object p0, p0, Lvs;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    sget-object v0, Lcom/opera/android/settings/BigSwitchButton;->j:Lk2d;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/opera/android/widget/LottieAnimationView;->t(Lk2d;Ljava/lang/Runnable;)V

    return-void

    nop

    :pswitch_data_e2
    .packed-switch 0x0
        :pswitch_cd
        :pswitch_8e
        :pswitch_88
        :pswitch_15
    .end packed-switch
.end method
