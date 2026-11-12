.class public final synthetic Ljte;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lh93;
.implements Livc;
.implements Lvlf;


# instance fields
.field public final synthetic a:Lpte;


# direct methods
.method public synthetic constructor <init>(Lpte;)V
    .registers 2

    iput-object p1, p0, Ljte;->a:Lpte;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b(Lbre;)V
    .registers 3

    iget-object p0, p0, Ljte;->a:Lpte;

    invoke-virtual {p0}, Lpte;->H0()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object p0

    invoke-virtual {p0}, Lfqe;->c()Luqe;

    move-result-object p0

    iget-object p0, p0, Luqe;->m:Lc15;

    invoke-virtual {p0, p1}, Lc15;->h(Lbre;)V

    return-void
.end method

.method public final s()V
    .registers 2

    iget-object p0, p0, Ljte;->a:Lpte;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object p0

    if-eqz p0, :cond_17

    const-class v0, Ld8j;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ld8j;

    goto :goto_18

    :cond_17
    const/4 p0, 0x0

    :goto_18
    if-eqz p0, :cond_1f

    check-cast p0, Lg8j;

    invoke-virtual {p0}, Lg8j;->h()V

    :cond_1f
    return-void
.end method

.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 4

    iget-object p0, p0, Ljte;->a:Lpte;

    if-nez p2, :cond_d

    iget-object p1, p0, Lpte;->u:Lskm;

    sget-object v0, Lfc0;->c:Lfc0;

    check-cast p1, Lx5f;

    invoke-virtual {p1, v0}, Lx5f;->h0(Lfc0;)V

    :cond_d
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    const-string p1, "enable_newsfeed"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void
.end method
