.class public final Liw8;
.super Lnv9;
.source "SourceFile"


# instance fields
.field public final o:Lcom/opera/android/BrowserActivity;

.field public final p:Lsz4;

.field public final q:Loi;

.field public final r:Lbw8;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lsz4;Loi;Lx5f;Lr16;Low8;)V
    .registers 16

    invoke-virtual {p1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v4

    invoke-static {p4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v5, Lzv8;

    const/4 v0, 0x1

    invoke-direct {v5, p4, v0}, Lzv8;-><init>(Lx5f;B)V

    sget-object v7, Lj90;->b:Lj90;

    sget-object v8, Lj90;->d:Lj90;

    const-class v1, Lfw8;

    sget-object v6, Lj90;->c:Lj90;

    move-object v0, p0

    move-object v2, p5

    move-object v3, p6

    invoke-direct/range {v0 .. v8}, Lnv9;-><init>(Ljava/lang/Class;Lr16;Low8;Ltcc;Lqp5;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object p1, v0, Liw8;->o:Lcom/opera/android/BrowserActivity;

    iput-object p2, v0, Liw8;->p:Lsz4;

    iput-object p3, v0, Liw8;->q:Loi;

    new-instance p0, Lbw8;

    const-string p4, "news_notifications_suggestion_card_clicked"

    const-string p5, "news_notifications_suggestion_card_sp_visits"

    const-string p2, "news_notifications_card_handler"

    const-string p3, "news_notifications_suggestion_card_shown"

    invoke-direct/range {p0 .. p5}, Lbw8;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object p0, v0, Liw8;->r:Lbw8;

    return-void
.end method


# virtual methods
.method public final A()V
    .registers 2

    iget-object p0, p0, Liw8;->r:Lbw8;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lbw8;->t0(Z)V

    return-void
.end method

.method public final k(Landroid/view/ViewGroup;I)Lab2;
    .registers 6

    const v0, 0x7f0d01ab

    if-ne p2, v0, :cond_47

    new-instance v0, Lhw8;

    const/4 v1, 0x0

    invoke-static {p1, p2, v1}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Lmv9;-><init>(Lnv9;Landroid/view/View;)V

    invoke-static {p1}, Lov0;->b(Landroid/view/View;)Lov0;

    move-result-object p1

    iget-object p2, p1, Lov0;->d:Ljava/lang/Object;

    check-cast p2, Landroid/widget/TextView;

    const v2, 0x7f14082b

    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p1, Lov0;->c:Ljava/lang/Object;

    check-cast p1, Lov0;

    iget-object p2, p1, Lov0;->c:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/custom_views/CapturableButton;

    iget-object p1, p1, Lov0;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/CapturableButton;

    const v2, 0x7f140b4b

    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(I)V

    new-instance v2, Lgw8;

    invoke-direct {v2, p0, v1}, Lgw8;-><init>(Liw8;B)V

    invoke-virtual {p2, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p2, 0x7f140693

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    new-instance p2, Lgw8;

    const/4 v1, 0x1

    invoke-direct {p2, p0, v1}, Lgw8;-><init>(Liw8;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v0

    :cond_47
    const/4 p0, 0x0

    return-object p0
.end method

.method public final q(Lja2;ILca2;)I
    .registers 4

    const p0, 0x7f0d01ab

    return p0
.end method

.method public final t()Lyv8;
    .registers 2

    new-instance p0, Lfw8;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lia2;-><init>(B)V

    return-object p0
.end method

.method public final u()Z
    .registers 1

    iget-object p0, p0, Liw8;->r:Lbw8;

    invoke-virtual {p0}, Lk8;->X()Z

    move-result p0

    return p0
.end method

.method public final y()Z
    .registers 9

    invoke-super {p0}, Lnv9;->y()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_68

    iget-object v0, p0, Liw8;->p:Lsz4;

    invoke-static {v0}, Lyi4;->T(Lsz4;)Z

    move-result v0

    if-eqz v0, :cond_68

    iget-object v0, p0, Liw8;->r:Lbw8;

    iget-object v2, v0, Lk8;->b:Ljava/lang/Object;

    check-cast v2, Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    iget-object v3, v0, Lbw8;->o:Ljava/lang/String;

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_68

    iget-object p0, p0, Liw8;->o:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lu59;->C(Landroid/content/Context;)Lu59;

    move-result-object p0

    invoke-virtual {p0}, Lu59;->H()Lt59;

    move-result-object p0

    iget-wide v2, p0, Lt59;->b:J

    const-wide/16 v4, 0x0

    cmp-long p0, v2, v4

    if-eqz p0, :cond_41

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v2

    const-wide/32 v2, 0xa4cb800

    cmp-long p0, v6, v2

    if-ltz p0, :cond_6b

    :cond_41
    iget-object p0, v0, Lk8;->b:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v2, "news_notifications_suggestion_card_shown_timestamp"

    invoke-interface {p0, v2, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    cmp-long p0, v2, v4

    if-eqz p0, :cond_61

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v2

    const-wide/32 v2, 0x19bfcc00

    cmp-long p0, v4, v2

    if-ltz p0, :cond_6b

    :cond_61
    invoke-virtual {v0}, Lbw8;->u0()I

    move-result p0

    const/4 v0, 0x2

    if-le p0, v0, :cond_69

    :cond_68
    return v1

    :cond_69
    const/4 p0, 0x1

    return p0

    :cond_6b
    return v1
.end method

.method public final z()V
    .registers 3

    iget-object v0, p0, Lnv9;->k:Lnrl;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lnrl;->a:Z

    iget-object p0, p0, Liw8;->r:Lbw8;

    invoke-virtual {p0, v1}, Lbw8;->t0(Z)V

    return-void
.end method
