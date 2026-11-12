.class public final synthetic Lfc9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcdb;


# instance fields
.field public final synthetic a:Lpc9;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/opera/android/BrowserActivity;

.field public final synthetic d:J


# direct methods
.method public synthetic constructor <init>(Lpc9;Ljava/lang/String;Lcom/opera/android/BrowserActivity;J)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfc9;->a:Lpc9;

    iput-object p2, p0, Lfc9;->b:Ljava/lang/String;

    iput-object p3, p0, Lfc9;->c:Lcom/opera/android/BrowserActivity;

    iput-wide p4, p0, Lfc9;->d:J

    return-void
.end method


# virtual methods
.method public final execute()V
    .registers 16

    iget-object v0, p0, Lfc9;->a:Lpc9;

    iget-object v1, v0, Lpc9;->a:Landroid/content/Context;

    const-string v2, "notification"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    const-string v2, "flow"

    const/4 v3, 0x0

    if-eqz v1, :cond_14

    invoke-virtual {v1, v2, v3}, Landroid/app/NotificationManager;->cancel(Ljava/lang/String;I)V

    :cond_14
    iget-object v1, p0, Lfc9;->b:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    const/4 v5, 0x1

    const-string v6, "_download_"

    if-nez v4, :cond_37

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_37

    sget-object p0, Llqm;->t:Llqm;

    invoke-static {v1, p0, v3}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p0

    invoke-virtual {p0, v5}, Lvx3;->c(Z)V

    new-instance v0, Lay3;

    invoke-direct {v0, p0}, Lay3;-><init>(Lvx3;)V

    invoke-static {v0}, Lac8;->a(Ljava/lang/Object;)V

    return-void

    :cond_37
    iget-object v4, p0, Lfc9;->c:Lcom/opera/android/BrowserActivity;

    invoke-static {v4}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v4

    if-eqz v4, :cond_a7

    iget-object v7, v0, Lpc9;->i:Lcom/opera/android/settings/SettingsManager;

    iget-object v0, v0, Lpc9;->c:Lbf9;

    invoke-virtual {v7, v0}, Lcom/opera/android/settings/SettingsManager;->r(Lbf9;)Z

    move-result v0

    if-eqz v0, :cond_a7

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {v4}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v1

    const-class v6, Lfge;

    invoke-static {v1, v6}, Llcp;->o(Landroidx/fragment/app/w;Ljava/lang/Class;)Landroidx/fragment/app/Fragment;

    move-result-object v7

    check-cast v7, Lfge;

    iget-wide v8, p0, Lfc9;->d:J

    if-eqz v7, :cond_67

    const/4 p0, -0x1

    invoke-virtual {v1, p0, v3, v2}, Landroidx/fragment/app/w;->Y(IILjava/lang/String;)Z

    if-eqz v0, :cond_a7

    invoke-virtual {v7, v8, v9}, Lfge;->J0(J)V

    return-void

    :cond_67
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v4, v5}, Lcom/opera/android/BrowserActivity;->o1(I)V

    new-instance p0, Lfge;

    iget-object v1, v4, Lcom/opera/android/BrowserActivity;->x:Lumi;

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v4}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v2, v2, Ld6j;->c:Lx5f;

    invoke-direct {p0, v4, v1, v2}, Lfge;-><init>(Lcom/opera/android/BrowserActivity;Ltcl;Lx5f;)V

    if-eqz v0, :cond_89

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lfge;->N:Ljava/lang/Long;

    :cond_89
    iget-object v0, v4, Ldx3;->o:Lqim;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-array v1, v3, [Ln6h;

    new-instance v8, Lwzg;

    const/4 v2, 0x4

    invoke-direct {v8, p0, v6, v2}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v7, Lzhj;

    const/4 v12, 0x0

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v14

    const/4 v9, 0x0

    const/4 v10, 0x1

    const/4 v11, -0x1

    const/4 v13, 0x0

    invoke-direct/range {v7 .. v14}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v0, v7}, Lqim;->g(Lzhj;)V

    :cond_a7
    return-void
.end method
