.class public final Lxc9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public final a:Lh7f;

.field public final b:Lnrl;

.field public final c:Lb59;

.field public d:Lwc9;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ltcl;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lxc9;->a:Lh7f;

    new-instance v0, Lnrl;

    const/16 v1, 0x1a

    invoke-direct {v0, v1}, Lnrl;-><init>(B)V

    iput-object v0, p0, Lxc9;->b:Lnrl;

    new-instance v0, Ldg7;

    const/16 v1, 0x16

    invoke-direct {v0, p0, v1}, Ldg7;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lb94;

    const/4 v2, 0x0

    invoke-direct {v1, p2, v0, v2}, Lb94;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 v0, 0x1

    new-array v0, v0, [Lbg1;

    aput-object v1, v0, v2

    const-string v1, "flow"

    invoke-static {p1, p2, v1, v0}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lxc9;->c:Lb59;

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 4

    check-cast p1, Ls1f;

    iget-object v0, p0, Lxc9;->d:Lwc9;

    if-nez v0, :cond_1b

    new-instance v0, Lwc9;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lwc9;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lxc9;->d:Lwc9;

    iget-object v0, p0, Lxc9;->c:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    iget-object v1, p0, Lxc9;->d:Lwc9;

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    :cond_1b
    iget-object p0, p0, Lxc9;->a:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 3

    check-cast p1, Ls1f;

    iget-object v0, p0, Lxc9;->a:Lh7f;

    invoke-virtual {v0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object p1, p0, Lxc9;->d:Lwc9;

    if-eqz p1, :cond_21

    invoke-virtual {v0}, Lh7f;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_21

    iget-object p1, p0, Lxc9;->c:Lb59;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    iget-object v0, p0, Lxc9;->d:Lwc9;

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lxc9;->d:Lwc9;

    :cond_21
    return-void
.end method

.method public final a()V
    .registers 2

    iget-object p0, p0, Lxc9;->c:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "unread_message"

    invoke-static {p0, v0}, Lcom/appsflyer/internal/j;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    return-void
.end method
