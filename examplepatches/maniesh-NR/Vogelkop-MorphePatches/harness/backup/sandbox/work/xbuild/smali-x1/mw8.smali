.class public final Lmw8;
.super Lnv9;
.source "SourceFile"

# interfaces
.implements Lp5j;


# instance fields
.field private final o:Lq8j;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lq8j;"
        }
    .end annotation
.end field

.field public final p:Lcom/opera/android/BrowserActivity;

.field public final q:Lcom/opera/android/settings/SettingsManager;

.field public final r:Lgjm;

.field public final s:Lcq5;

.field public final t:Lkw8;

.field public final u:Z

.field public v:Ll0c;

.field public w:Z

.field public x:Z


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lr16;Low8;Lcom/opera/android/settings/SettingsManager;Lcq5;Lx5f;Lgjm;)V
    .registers 17

    invoke-virtual {p1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v4

    invoke-static {p6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v5, Lzv8;

    const/4 v0, 0x2

    invoke-direct {v5, p6, v0}, Lzv8;-><init>(Lx5f;B)V

    sget-object v7, Lvb0;->c:Lvb0;

    sget-object v8, Lvb0;->d:Lvb0;

    const-class v1, Ljw8;

    sget-object v6, Lvb0;->b:Lvb0;

    move-object v0, p0

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v8}, Lnv9;-><init>(Ljava/lang/Class;Lr16;Low8;Ltcc;Lqp5;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance p2, Lxy;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p3}, Lxy;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lmw8;->o:Lq8j;

    iput-object p1, p0, Lmw8;->p:Lcom/opera/android/BrowserActivity;

    iput-object p4, p0, Lmw8;->q:Lcom/opera/android/settings/SettingsManager;

    move-object/from16 p6, p7

    iput-object p6, p0, Lmw8;->r:Lgjm;

    const-string p6, "personalized_default"

    invoke-virtual {p4, p6}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p6

    if-gtz p6, :cond_34

    const/4 p3, 0x0

    :cond_34
    iput-boolean p3, p0, Lmw8;->u:Z

    invoke-virtual {p4}, Lcom/opera/android/settings/SettingsManager;->M()Z

    move-result p3

    iput-boolean p3, p0, Lmw8;->w:Z

    invoke-virtual {p4, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    iput-object p5, p0, Lmw8;->s:Lcq5;

    new-instance p3, Lkw8;

    const-string p4, "news_personalized_news_card_handler"

    const-string p5, "news_personalized_news_card_shown"

    invoke-direct {p3, p1, p4, p5}, Lk8;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    iput-object p3, p0, Lmw8;->t:Lkw8;

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object p0

    invoke-virtual {p0, p2}, Lfqe;->a(Lq8j;)V

    return-void
.end method

.method public static bridge synthetic C(Lmw8;)Lq8j;
    .registers 1

    iget-object p0, p0, Lmw8;->o:Lq8j;

    return-object p0
.end method


# virtual methods
.method public final A()V
    .registers 2

    iget-object p0, p0, Lmw8;->t:Lkw8;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lkw8;->s0(Z)V

    return-void
.end method

.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "personalized_news"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    const-string v0, "process_news_topics"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_21

    :cond_10
    iget-object p1, p0, Lmw8;->q:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1}, Lcom/opera/android/settings/SettingsManager;->M()Z

    move-result p1

    iput-boolean p1, p0, Lmw8;->w:Z

    iget-boolean v0, p0, Lnv9;->i:Z

    if-eqz v0, :cond_21

    if-eqz p1, :cond_21

    invoke-virtual {p0}, Lnv9;->w()V

    :cond_21
    return-void
.end method

.method public final b(Lsjm;)V
    .registers 9

    invoke-virtual {p1}, Lsjm;->a()Z

    move-result v0

    if-eqz v0, :cond_2f

    iget-object v0, p0, Lmw8;->t:Lkw8;

    iget-object v1, v0, Lk8;->b:Ljava/lang/Object;

    check-cast v1, Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, "news_personalized_news_shown_timestamp"

    const-wide/16 v3, -0x1

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    cmp-long v1, v5, v3

    if-nez v1, :cond_2f

    iget-object v0, v0, Lk8;->b:Ljava/lang/Object;

    check-cast v0, Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-static {v0, v2}, Lam2;->x(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;)V

    :cond_2f
    invoke-super {p0, p1}, Lnv9;->b(Lsjm;)V

    return-void
.end method

.method public final k(Landroid/view/ViewGroup;I)Lab2;
    .registers 6

    const v0, 0x7f0d01a6

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

    const v2, 0x7f14082c

    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p1, Lov0;->c:Ljava/lang/Object;

    check-cast p1, Lov0;

    iget-object p2, p1, Lov0;->c:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/custom_views/CapturableButton;

    iget-object p1, p1, Lov0;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/CapturableButton;

    const v2, 0x7f14092a

    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(I)V

    new-instance v2, Llw8;

    invoke-direct {v2, p0, v1}, Llw8;-><init>(Lmw8;B)V

    invoke-virtual {p2, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p2, 0x7f140bbd

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    new-instance p2, Llw8;

    const/4 v1, 0x1

    invoke-direct {p2, p0, v1}, Llw8;-><init>(Lmw8;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v0

    :cond_47
    const/4 p0, 0x0

    return-object p0
.end method

.method public final onDestroy()V
    .registers 2

    invoke-super {p0}, Lnv9;->onDestroy()V

    iget-object v0, p0, Lmw8;->q:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lmw8;->x:Z

    return-void
.end method

.method public final q(Lja2;ILca2;)I
    .registers 4

    const p0, 0x7f0d01a6

    return p0
.end method

.method public final t()Lyv8;
    .registers 2

    new-instance p0, Ljw8;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lia2;-><init>(B)V

    return-object p0
.end method

.method public final u()Z
    .registers 1

    iget-object p0, p0, Lmw8;->t:Lkw8;

    invoke-virtual {p0}, Lk8;->X()Z

    move-result p0

    return p0
.end method

.method public final y()Z
    .registers 9

    invoke-super {p0}, Lnv9;->y()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_72

    iget-object v0, p0, Lmw8;->t:Lkw8;

    iget-object v2, v0, Lk8;->b:Ljava/lang/Object;

    check-cast v2, Lb59;

    iget-object v0, v0, Lk8;->b:Ljava/lang/Object;

    check-cast v0, Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    const-string v3, "news_personalized_news_card_accepted"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_72

    iget-object v2, p0, Lmw8;->v:Ll0c;

    if-eqz v2, :cond_72

    iget-object v2, p0, Lmw8;->s:Lcq5;

    invoke-virtual {v2}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lbef;

    invoke-virtual {v2}, Lbef;->h()Lffb;

    move-result-object v2

    iget-object v3, p0, Lmw8;->v:Ll0c;

    invoke-virtual {v3}, Ll0c;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_72

    iget-boolean v2, p0, Lmw8;->u:Z

    if-nez v2, :cond_72

    iget-boolean p0, p0, Lmw8;->w:Z

    if-nez p0, :cond_72

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v2, "news_personalized_news_card_shown_count"

    invoke-interface {p0, v2, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    const/4 v2, 0x2

    if-ge p0, v2, :cond_72

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "news_personalized_news_shown_timestamp"

    const-wide/16 v2, -0x1

    invoke-interface {p0, v0, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    cmp-long p0, v4, v2

    if-eqz p0, :cond_72

    sub-long/2addr v6, v4

    const-wide/32 v2, 0x19bfcc00

    cmp-long p0, v6, v2

    if-ltz p0, :cond_72

    const/4 p0, 0x1

    return p0

    :cond_72
    return v1
.end method

.method public final z()V
    .registers 3

    iget-object v0, p0, Lnv9;->k:Lnrl;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lnrl;->a:Z

    iget-object p0, p0, Lmw8;->t:Lkw8;

    invoke-virtual {p0, v1}, Lkw8;->s0(Z)V

    return-void
.end method
