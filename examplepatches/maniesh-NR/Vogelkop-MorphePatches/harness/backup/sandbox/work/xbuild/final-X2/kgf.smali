.class public final Lkgf;
.super Ls0f;
.source "SourceFile"


# instance fields
.field public final c:Lt88;

.field public final d:Ls88;

.field public final e:La98;


# direct methods
.method public constructor <init>(Landroid/os/Bundle;)V
    .registers 9

    invoke-direct {p0, p1}, Ls0f;-><init>(Landroid/os/Bundle;)V

    const-string v0, "action_open_esim_entry_point_id"

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    sget-object v2, Ljgf;->a:Lhv5;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Ljgf;->c:Lh58;

    invoke-virtual {v2}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_15
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v3, :cond_2a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Ljgf;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-ne v5, v0, :cond_15

    goto :goto_2b

    :cond_2a
    move-object v3, v4

    :goto_2b
    check-cast v3, Ljgf;

    if-nez v3, :cond_31

    move-object v0, v4

    goto :goto_48

    :cond_31
    sget-object v0, Lhgf;->a:[I

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    aget v0, v0, v2

    if-ne v0, v5, :cond_ba

    const-string v0, "action_open_esim_plan_id"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_b4

    new-instance v0, Lt88;

    invoke-direct {v0, v2}, Lt88;-><init>(Ljava/lang/String;)V

    :goto_48
    iput-object v0, p0, Lkgf;->c:Lt88;

    const-string v0, "action_open_esim_destination_id"

    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    if-eq v2, v1, :cond_8b

    sget-object v1, Ligf;->b:Lwu5;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Ligf;->d:Lh58;

    invoke-virtual {v1}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_5d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Ligf;

    iget-byte v6, v6, Ligf;->a:B

    if-ne v6, v2, :cond_5d

    goto :goto_70

    :cond_6f
    move-object v3, v4

    :goto_70
    check-cast v3, Ligf;

    if-eqz v3, :cond_ae

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_89

    if-eq v0, v5, :cond_86

    const/4 v1, 0x2

    if-ne v0, v1, :cond_82

    sget-object v4, Ln88;->a:Ln88;

    goto :goto_8b

    :cond_82
    invoke-static {}, Lh9o;->p()V

    throw v4

    :cond_86
    sget-object v4, Lr88;->a:Lr88;

    goto :goto_8b

    :cond_89
    sget-object v4, Lm88;->a:Lm88;

    :cond_8b
    :goto_8b
    iput-object v4, p0, Lkgf;->d:Ls88;

    const-string v0, "ESIM_ATTRIBUTION_RESOLVED"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_99

    sget-object p1, La98;->c:La98;

    goto :goto_ab

    :cond_99
    new-instance v0, La98;

    const-string v1, "ESIM_SOURCE"

    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "ESIM_CAMPAIGN"

    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, p1}, La98;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object p1, v0

    :goto_ab
    iput-object p1, p0, Lkgf;->e:La98;

    return-void

    :cond_ae
    new-instance p0, Ldjb;

    invoke-direct {p0, v0, v4}, Ldjb;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p0

    :cond_b4
    new-instance p0, Ldjb;

    invoke-direct {p0, v0}, Ldjb;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_ba
    invoke-static {}, Lh9o;->p()V

    throw v4
.end method


# virtual methods
.method public final e(Lcom/opera/android/BrowserActivity;)Z
    .registers 5

    invoke-static {p1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object p1

    if-nez p1, :cond_8

    const/4 p0, 0x0

    return p0

    :cond_8
    new-instance v0, Lggf;

    iget-object v1, p0, Lkgf;->e:La98;

    iget-object v2, p0, Lkgf;->d:Ls88;

    iget-object p0, p0, Lkgf;->c:Lt88;

    invoke-direct {v0, p1, p0, v1, v2}, Lggf;-><init>(Lcom/opera/android/BrowserActivity;Lt88;La98;Ls88;)V

    invoke-virtual {v0}, Lggf;->execute()V

    const/4 p0, 0x1

    return p0
.end method
