.class public final Le29;
.super Ll7n;
.source "SourceFile"


# instance fields
.field public final b:Lv61;

.field public final c:Lcom/opera/android/settings/SettingsManager;

.field public final d:Ld8j;

.field public final e:Lnak;

.field public final f:Lrlh;

.field public final g:Ls9;


# direct methods
.method public constructor <init>(Lv61;Lcom/opera/android/settings/SettingsManager;Ld8j;)V
    .registers 13

    sget-object v0, Ls8f;->m:Ls8f;

    invoke-direct {p0}, Ll7n;-><init>()V

    iput-object p1, p0, Le29;->b:Lv61;

    iput-object p2, p0, Le29;->c:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Le29;->d:Ld8j;

    new-instance p3, Ld29;

    invoke-virtual {p2}, Lcom/opera/android/settings/SettingsManager;->m()Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p1, Lv61;->a:Landroid/content/Context;

    invoke-static {v2, v1}, Lv61;->b(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "~/"

    invoke-static {v2, v1}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Lcom/opera/android/settings/SettingsManager;->O()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_26

    move-object v3, v0

    goto :goto_39

    :cond_26
    new-instance v3, Lt8f;

    invoke-virtual {p2, v4}, Lcom/opera/android/settings/SettingsManager;->t(Z)Landroid/net/Uri;

    move-result-object v5

    iget-object v6, p1, Lv61;->a:Landroid/content/Context;

    invoke-static {v6, v5}, Lv61;->b(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Lt8f;-><init>(Ljava/lang/String;)V

    :goto_39
    const-string v5, "concurrent_downloads"

    invoke-virtual {p2, v5}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v6

    const-string v7, "ask_before_downloading"

    invoke-virtual {p2, v7}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v8

    invoke-direct {p3, v1, v3, v6, v8}, Ld29;-><init>(Ljava/lang/String;Lwxe;IZ)V

    invoke-static {p3}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object p3

    iput-object p3, p0, Le29;->e:Lnak;

    invoke-static {p3}, La26;->j(Lnak;)Lrlh;

    move-result-object v1

    iput-object v1, p0, Le29;->f:Lrlh;

    new-instance v1, Ls9;

    const/16 v3, 0xd

    invoke-direct {v1, p0, v3}, Ls9;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Le29;->g:Ls9;

    new-instance p0, Ld29;

    invoke-virtual {p2}, Lcom/opera/android/settings/SettingsManager;->m()Landroid/net/Uri;

    move-result-object v3

    iget-object v6, p1, Lv61;->a:Landroid/content/Context;

    invoke-static {v6, v3}, Lv61;->b(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2}, Lcom/opera/android/settings/SettingsManager;->O()Z

    move-result v6

    if-nez v6, :cond_86

    new-instance v0, Lt8f;

    invoke-virtual {p2, v4}, Lcom/opera/android/settings/SettingsManager;->t(Z)Landroid/net/Uri;

    move-result-object v4

    iget-object p1, p1, Lv61;->a:Landroid/content/Context;

    invoke-static {p1, v4}, Lv61;->b(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lt8f;-><init>(Ljava/lang/String;)V

    :cond_86
    invoke-virtual {p2, v5}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p2, v7}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v2

    invoke-direct {p0, v3, v0, p1, v2}, Ld29;-><init>(Ljava/lang/String;Lwxe;IZ)V

    const/4 p1, 0x0

    invoke-virtual {p3, p1, p0}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    invoke-virtual {p2, v1}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    return-void
.end method


# virtual methods
.method public final e()V
    .registers 2

    iget-object v0, p0, Le29;->c:Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Le29;->g:Ls9;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    return-void
.end method
