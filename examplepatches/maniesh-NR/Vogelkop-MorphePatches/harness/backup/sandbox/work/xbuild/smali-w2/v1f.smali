.class public final Lv1f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lb59;

.field public final b:Landroid/util/SparseArray;

.field public final c:Lr1f;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lumi;Lxc9;Ljnm;Lojn;Lru9;Likc;)V
    .registers 14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lv1f;->b:Landroid/util/SparseArray;

    new-instance v1, Lr1f;

    new-instance v2, Lrl;

    const/4 v3, 0x4

    invoke-direct {v2, v3}, Lrl;-><init>(B)V

    invoke-direct {v1, p0, v2}, Lr1f;-><init>(Lv1f;Lrl;)V

    iput-object v1, p0, Lv1f;->c:Lr1f;

    const/4 v2, 0x0

    new-array v4, v2, [Lbg1;

    const-string v5, "main_menu_notification_controller"

    invoke-static {p1, p2, v5, v4}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object v4

    iput-object v4, p0, Lv1f;->a:Lb59;

    new-instance v4, Lyqd;

    const/16 v5, 0x14

    invoke-direct {v4, v1, v5}, Lyqd;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lr1f;

    invoke-direct {v1, p1, p3, v4}, Lr1f;-><init>(Lndc;Lxc9;Lyqd;)V

    const/4 p3, 0x1

    invoke-virtual {v0, p3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    new-instance p3, Lu1f;

    invoke-direct {p3, p1, p2, v4}, Lu1f;-><init>(Lcom/opera/android/BrowserActivity;Lumi;Lyqd;)V

    const/4 p2, 0x2

    invoke-virtual {v0, p2, p3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    new-instance p2, Lr1f;

    invoke-direct {p2, p5}, Lr1f;-><init>(Lojn;)V

    invoke-virtual {v0, v3, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    new-instance p2, Lr1f;

    invoke-direct {p2, p1, p4, v4}, Lr1f;-><init>(Lndc;Ljnm;Lyqd;)V

    const/16 p3, 0x8

    invoke-virtual {v0, p3, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    new-instance p2, Lu1f;

    invoke-direct {p2, p1, p6, p7, v4}, Lu1f;-><init>(Lndc;Lru9;Likc;Lyqd;)V

    const/16 p3, 0x10

    invoke-virtual {v0, p3, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    invoke-virtual {p1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object p1

    :goto_5b
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result p2

    if-ge v2, p2, :cond_93

    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lp1f;

    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->keyAt(I)I

    move-result p3

    new-instance p4, Ld50;

    const/4 p5, 0x7

    invoke-direct {p4, p0, p3, p2, p5}, Ld50;-><init>(Ljava/lang/Object;ILjava/lang/Object;B)V

    iget-object p5, p2, Lp1f;->b:Lnrl;

    invoke-virtual {p5, p4}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    new-instance p4, Lo1f;

    invoke-direct {p4, p0, p3}, Lo1f;-><init>(Lv1f;I)V

    iget-object p3, p2, Lp1f;->a:Li7f;

    invoke-virtual {p3, p4}, Li7f;->b(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_88

    iget-object p3, p2, Lp1f;->c:Ljava/lang/Runnable;

    invoke-interface {p3}, Ljava/lang/Runnable;->run()V

    :cond_88
    new-instance p3, Ld62;

    invoke-direct {p3, p2, p4}, Ld62;-><init>(Lp1f;Lt1f;)V

    invoke-virtual {p1, p3}, Ltcc;->a(Lmdc;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_5b

    :cond_93
    return-void
.end method


# virtual methods
.method public final a(I)Lp1f;
    .registers 2

    iget-object p0, p0, Lv1f;->b:Landroid/util/SparseArray;

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lp1f;

    return-object p0
.end method

.method public final b()I
    .registers 3

    iget-object p0, p0, Lv1f;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "unseen_notifications"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public final c(I)V
    .registers 4

    invoke-virtual {p0}, Lv1f;->b()I

    move-result v0

    if-ne p1, v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lv1f;->a:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "unseen_notifications"

    invoke-static {v0, v1, p1}, Lcom/appsflyer/internal/j;->b(Landroid/content/SharedPreferences;Ljava/lang/String;I)V

    iget-object p0, p0, Lv1f;->c:Lr1f;

    invoke-virtual {p0}, Lp1f;->b()V

    return-void
.end method

.method public final d(IZ)V
    .registers 8

    iget-object v0, p0, Lv1f;->a:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, "active_notifications"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    and-int v4, v1, p1

    if-eqz v4, :cond_14

    const/4 v3, 0x1

    :cond_14
    if-ne p2, v3, :cond_17

    return-void

    :cond_17
    if-eqz p2, :cond_1b

    or-int/2addr v1, p1

    goto :goto_1d

    :cond_1b
    not-int p2, p1

    and-int/2addr v1, p2

    :goto_1d
    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/SharedPreferences;

    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2, v2, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Lv1f;->b()I

    move-result p2

    and-int v0, p1, v1

    not-int v1, v1

    and-int/2addr p1, v1

    or-int/2addr p2, v0

    not-int p1, p1

    and-int/2addr p2, p1

    invoke-virtual {p0, p2}, Lv1f;->c(I)V

    return-void
.end method
