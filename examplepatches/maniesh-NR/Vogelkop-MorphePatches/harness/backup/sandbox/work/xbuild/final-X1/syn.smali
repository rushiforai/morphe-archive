.class public abstract Lsyn;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lsyn;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method public static final a(Lcom/opera/android/BrowserActivity;Lru9;Lumi;)V
    .registers 6

    iget-object v0, p1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "webapp_shortcut_migration_pending"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_14

    sget-object v0, Lsyn;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-nez v0, :cond_15

    :cond_14
    return-void

    :cond_15
    new-instance v0, Lroj;

    const/16 v1, 0x12

    invoke-direct {v0, p0, p1, v1}, Lroj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, v0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p0

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public static final b(Lcom/opera/android/BrowserActivity;)Z
    .registers 11

    invoke-static {p0}, Lm5h;->k(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_f
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_93

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/ShortcutInfo;

    invoke-virtual {v2}, Landroid/content/pm/ShortcutInfo;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const/4 v5, 0x0

    if-eqz v4, :cond_81

    invoke-virtual {v4}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    const-string v7, "com.opera.android.ACTION_START_WEBAPP"

    invoke-static {v6, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_81

    const-string v6, "org.opera.browser.webapp_mac"

    invoke-virtual {v4, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_81

    const-string v7, "org.opera.browser.webapp_url"

    invoke-virtual {v4, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_81

    invoke-virtual {v2}, Landroid/content/pm/ShortcutInfo;->getShortLabel()Ljava/lang/CharSequence;

    move-result-object v8

    if-eqz v8, :cond_81

    const-string v9, "org.opera.browser.webapp_icon"

    invoke-virtual {v4, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Lw7d;->E(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v7

    if-eqz v7, :cond_81

    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5, v4}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    const/4 v4, 0x2

    invoke-static {v7, v4}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v6, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {v2}, Landroid/content/pm/ShortcutInfo;->getId()Ljava/lang/String;

    move-result-object v2

    new-instance v5, Lnhj;

    invoke-direct {v5}, Lnhj;-><init>()V

    iput-object p0, v5, Lnhj;->a:Landroid/content/Context;

    iput-object v2, v5, Lnhj;->b:Ljava/lang/String;

    iput-object v8, v5, Lnhj;->e:Ljava/lang/CharSequence;

    filled-new-array {v4}, [Landroid/content/Intent;

    move-result-object v2

    iput-object v2, v5, Lnhj;->c:[Landroid/content/Intent;

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_8d

    iget-object v2, v5, Lnhj;->c:[Landroid/content/Intent;

    if-eqz v2, :cond_87

    array-length v2, v2

    if-eqz v2, :cond_87

    :cond_81
    if-eqz v5, :cond_f

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_f

    :cond_87
    const-string p0, "Shortcut must have an intent"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return v3

    :cond_8d
    const-string p0, "Shortcut must have a non-empty label"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return v3

    :cond_93
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_a0

    invoke-static {p0, v1}, Lphj;->C0(Landroid/content/ContextWrapper;Ljava/util/List;)Z

    move-result p0

    if-nez p0, :cond_a0

    return v3

    :cond_a0
    const/4 p0, 0x1

    return p0
.end method
