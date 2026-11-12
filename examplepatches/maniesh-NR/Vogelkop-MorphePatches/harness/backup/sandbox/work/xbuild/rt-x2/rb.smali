.class public final Lrb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldjn;


# instance fields
.field public final a:Lb59;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    sget-object v0, Lvml;->d:Lumi;

    const/4 v1, 0x0

    new-array v1, v1, [Lbg1;

    const-string v2, "feature_usage"

    invoke-static {p1, v0, v2, v1}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lrb;->a:Lb59;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lb94;)V
    .registers 6

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    sget-object v0, Lvml;->d:Lumi;

    const/4 v1, 0x1

    new-array v1, v1, [Lbg1;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    .line 38
    const-string p2, "accounts"

    invoke-static {p1, v0, p2, v1}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lrb;->a:Lb59;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;B)V
    .registers 5

    const/4 v0, 0x0

    packed-switch p3, :pswitch_data_24

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string p3, "FavoriteCatalogPrefs"

    new-array v0, v0, [Lbg1;

    invoke-static {p1, p2, p3, v0}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p2

    iput-object p2, p0, Lrb;->a:Lb59;

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    return-void

    :pswitch_15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-array p3, v0, [Lbg1;

    const-string v0, "wallet2-sprefs"

    invoke-static {p1, p2, v0, p3}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lrb;->a:Lb59;

    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x3
        :pswitch_15
    .end packed-switch
.end method


# virtual methods
.method public final a(Lcom/opera/api/Callback;Lcom/opera/api/Callback;)V
    .registers 3

    iget-object p0, p0, Lrb;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string p2, "wallet-secrets"

    invoke-static {p0, p2}, Lcom/appsflyer/internal/j;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final b(Lcom/opera/api/Callback;Lcom/opera/api/Callback;)V
    .registers 4

    iget-object p0, p0, Lrb;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const/4 p2, 0x0

    const-string v0, "wallet-secrets"

    invoke-interface {p0, v0, p2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final c(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    iget-object p0, p0, Lrb;->a:Lb59;

    if-eqz p2, :cond_e

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-static {p0, p1, p2}, Lcom/appsflyer/internal/j;->c(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_e
    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-static {p0, p1}, Lcom/appsflyer/internal/j;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    return-void
.end method
