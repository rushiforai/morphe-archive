.class public final Lu1;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final g:Ls1;

.field public static final h:Ls1;


# instance fields
.field public final a:Ljava/util/HashSet;

.field public final b:Ljava/util/concurrent/atomic/AtomicReference;

.field public final c:Lv1;

.field public final d:Lj4c;

.field public volatile e:Z

.field public final f:Lb59;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Ls1;

    const-string v1, ""

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3, v3}, Ls1;-><init>(Ljava/lang/String;Z[Ljava/lang/String;[Ljava/lang/String;)V

    sput-object v0, Lu1;->g:Ls1;

    new-instance v0, Ls1;

    const-string v1, "new_user"

    invoke-direct {v0, v1, v2, v3, v3}, Ls1;-><init>(Ljava/lang/String;Z[Ljava/lang/String;[Ljava/lang/String;)V

    sput-object v0, Lu1;->h:Ls1;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lv1;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "news_delay"

    const-string v1, "cc_new_start_page_test"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/util/HashSet;

    const/4 v2, 0x2

    invoke-static {v2}, Lna2;->j(I)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(I)V

    invoke-static {v1, v0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    iput-object v1, p0, Lu1;->a:Ljava/util/HashSet;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lu1;->b:Ljava/util/concurrent/atomic/AtomicReference;

    iput-object p2, p0, Lu1;->c:Lv1;

    new-instance p2, Lt1;

    const/4 v0, 0x0

    invoke-direct {p2, p1, v0}, Lt1;-><init>(Landroid/content/Context;B)V

    new-instance v1, Lj4c;

    invoke-direct {v1, p2, v0}, Lj4c;-><init>(Lesk;B)V

    iput-object v1, p0, Lu1;->d:Lj4c;

    sget-object p2, Lvml;->d:Lumi;

    const-string v1, "ab_testing"

    new-array v0, v0, [Lbg1;

    invoke-static {p1, p2, v1, v0}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lu1;->f:Lb59;

    new-instance p0, Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final a(Ls1;)Ljava/lang/String;
    .registers 3

    iget-object p1, p1, Ls1;->c:Ljava/util/HashMap;

    if-eqz p1, :cond_17

    const-string v0, "test"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_17

    iget-object p0, p0, Lu1;->a:Ljava/util/HashSet;

    invoke-virtual {p0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_17

    return-object p1

    :cond_17
    const/4 p0, 0x0

    return-object p0
.end method

.method public final b(Ls1;)V
    .registers 4

    iget-object v0, p0, Lu1;->b:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    if-eqz p1, :cond_33

    iget-object v0, p1, Ls1;->a:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_33

    iget-boolean v0, p1, Ls1;->b:Z

    if-eqz v0, :cond_33

    invoke-virtual {p0, p1}, Lu1;->a(Ls1;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_33

    iget-object p0, p0, Lu1;->f:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    const-string v0, "client_test_activated"

    const/4 v1, 0x1

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-nez p1, :cond_33

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-static {p0, v0, v1}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    :cond_33
    return-void
.end method

.method public final c(Lq1;Z)V
    .registers 10

    const-string v0, "client_test_activated"

    if-eqz p2, :cond_14

    iget-boolean p2, p1, Lq1;->a:Z

    if-eqz p2, :cond_14

    iget-object p2, p0, Lu1;->f:Lb59;

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/SharedPreferences;

    const/4 v1, 0x0

    invoke-static {p2, v0, v1}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    :cond_14
    iget-object p2, p1, Lq1;->b:Ljava/lang/String;

    iget-boolean v1, p1, Lq1;->a:Z

    iget-object v2, p1, Lq1;->c:[Ljava/lang/String;

    iget-object p1, p1, Lq1;->d:[Ljava/lang/String;

    sget-object v3, Lu1;->g:Ls1;

    new-instance v4, Ls1;

    invoke-direct {v4, p2, v1, v2, p1}, Ls1;-><init>(Ljava/lang/String;Z[Ljava/lang/String;[Ljava/lang/String;)V

    iget-object p1, p0, Lu1;->b:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ls1;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ls1;

    const/4 v5, 0x1

    if-eqz p1, :cond_71

    iget-object v6, p1, Ls1;->a:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_71

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    iget-boolean p1, p1, Ls1;->b:Z

    if-eqz v6, :cond_4d

    if-eqz p1, :cond_a4

    if-eqz p1, :cond_a4

    iget-boolean p1, p0, Lu1;->e:Z

    if-nez p1, :cond_95

    goto :goto_a4

    :cond_4d
    if-eqz p1, :cond_53

    iget-boolean p1, p0, Lu1;->e:Z

    if-nez p1, :cond_95

    :cond_53
    if-eqz v1, :cond_a4

    invoke-virtual {p0, v4}, Lu1;->a(Ls1;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_95

    iget-boolean p1, p0, Lu1;->e:Z

    if-nez p1, :cond_95

    iget-object p1, p0, Lu1;->f:Lb59;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    invoke-interface {p1, v0, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-nez p1, :cond_a4

    invoke-virtual {p0, v4}, Lu1;->a(Ls1;)Ljava/lang/String;

    goto :goto_a4

    :cond_71
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_a4

    if-eqz v1, :cond_a4

    invoke-virtual {p0, v4}, Lu1;->a(Ls1;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_95

    iget-boolean p1, p0, Lu1;->e:Z

    if-nez p1, :cond_95

    iget-object p1, p0, Lu1;->f:Lb59;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    invoke-interface {p1, v0, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-nez p1, :cond_a4

    invoke-virtual {p0, v4}, Lu1;->a(Ls1;)Ljava/lang/String;

    goto :goto_a4

    :cond_95
    if-eqz v2, :cond_a0

    iget-boolean p1, v2, Ls1;->b:Z

    if-eqz p1, :cond_a0

    iget-boolean p1, p0, Lu1;->e:Z

    if-eqz p1, :cond_a0

    return-void

    :cond_a0
    invoke-virtual {p0, v3}, Lu1;->b(Ls1;)V

    return-void

    :cond_a4
    :goto_a4
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_ba

    if-eqz v1, :cond_ba

    invoke-virtual {p0, v4}, Lu1;->a(Ls1;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_b6

    invoke-virtual {p0, v4}, Lu1;->b(Ls1;)V

    return-void

    :cond_b6
    invoke-virtual {p0, v3}, Lu1;->b(Ls1;)V

    return-void

    :cond_ba
    invoke-virtual {p0, v4}, Lu1;->b(Ls1;)V

    return-void
.end method
