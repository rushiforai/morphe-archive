.class public abstract Lwbh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqyl;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lorm;

.field public final c:Lskm;

.field public final d:Ls0f;

.field public e:I

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public final h:B

.field public final i:Z

.field public final j:I

.field public k:Ljava/lang/String;

.field public final l:Ljava/lang/String;

.field public final m:Z

.field public final n:Z

.field public final o:Z

.field public final p:Z

.field public final q:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorm;Lskm;Landroid/os/Bundle;Ls0f;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwbh;->a:Landroid/content/Context;

    iput-object p2, p0, Lwbh;->b:Lorm;

    iput-object p3, p0, Lwbh;->c:Lskm;

    iput-object p5, p0, Lwbh;->d:Ls0f;

    if-eqz p5, :cond_24

    invoke-virtual {p0}, Lwbh;->p()I

    move-result p1

    invoke-static {p1}, Lv0g;->f(I)B

    move-result p1

    const-string p2, "notification_type"

    invoke-virtual {p4, p2, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    iget-object p1, p5, Ls0f;->b:Landroid/os/Bundle;

    if-nez p1, :cond_21

    iput-object p4, p5, Ls0f;->b:Landroid/os/Bundle;

    goto :goto_24

    :cond_21
    invoke-virtual {p1, p4}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    :cond_24
    :goto_24
    const-string p1, "origin"

    invoke-virtual {p4, p1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_c1

    const/4 p2, -0x1

    invoke-virtual {p4, p1, p2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result p2

    const/4 p3, 0x0

    const/4 p5, 0x1

    if-eq p2, p5, :cond_4d

    const/4 v0, 0x4

    if-eq p2, v0, :cond_4a

    const/4 v0, 0x5

    if-eq p2, v0, :cond_47

    const/4 v0, 0x6

    if-ne p2, v0, :cond_41

    iput-byte v0, p0, Lwbh;->h:B

    goto :goto_4f

    :cond_41
    new-instance p0, Ldjb;

    invoke-direct {p0, p1, p3}, Ldjb;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p0

    :cond_47
    iput-byte v0, p0, Lwbh;->h:B

    goto :goto_4f

    :cond_4a
    iput-byte v0, p0, Lwbh;->h:B

    goto :goto_4f

    :cond_4d
    iput-byte p5, p0, Lwbh;->h:B

    :goto_4f
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p1

    long-to-int p1, p1

    const-string p2, "id"

    invoke-virtual {p4, p2, p1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lwbh;->e:I

    invoke-virtual {p0, p4}, Lwbh;->r(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lwbh;->f:Ljava/lang/String;

    invoke-virtual {p0, p4}, Lwbh;->q(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lwbh;->g:Ljava/lang/String;

    const-string p1, "visibility"

    invoke-virtual {p4, p1, p5}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lwbh;->j:I

    const-string p1, "enable_sound"

    const/4 p2, 0x0

    invoke-virtual {p4, p1, p2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lwbh;->m:Z

    const-string p1, "enable_vibration"

    invoke-virtual {p4, p1, p2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lwbh;->n:Z

    const-string p1, "enable_lights"

    invoke-virtual {p4, p1, p2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lwbh;->o:Z

    const-string p1, "force_heads_up"

    invoke-virtual {p4, p1, p2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lwbh;->p:Z

    const-string p1, "show_state"

    invoke-virtual {p4, p1, p2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_a4

    if-ne v0, p5, :cond_9e

    iput-boolean p5, p0, Lwbh;->i:Z

    goto :goto_a6

    :cond_9e
    new-instance p0, Ldjb;

    invoke-direct {p0, p1, p3}, Ldjb;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p0

    :cond_a4
    iput-boolean p2, p0, Lwbh;->i:Z

    :goto_a6
    const-string p1, "tracking_id"

    const-string p2, ""

    invoke-virtual {p4, p1, p2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lwbh;->k:Ljava/lang/String;

    const-string p1, "rule_id"

    invoke-virtual {p4, p1, p2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lwbh;->l:Ljava/lang/String;

    const-string p1, "report_stats"

    invoke-virtual {p4, p1, p5}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lwbh;->q:Z

    return-void

    :cond_c1
    new-instance p0, Ldjb;

    invoke-direct {p0, p1}, Ldjb;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static m(Landroid/content/Context;Ljava/lang/String;)I
    .registers 4

    const-string v0, "notification"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    invoke-virtual {p0}, Landroid/app/NotificationManager;->areNotificationsEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_10

    return v1

    :cond_10
    invoke-virtual {p0, p1}, Landroid/app/NotificationManager;->getNotificationChannel(Ljava/lang/String;)Landroid/app/NotificationChannel;

    move-result-object p1

    if-nez p1, :cond_18

    const/4 p0, -0x1

    return p0

    :cond_18
    invoke-virtual {p1}, Landroid/app/NotificationChannel;->getGroup()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2d

    :try_start_1e
    invoke-virtual {p0, v0}, Landroid/app/NotificationManager;->getNotificationChannelGroup(Ljava/lang/String;)Landroid/app/NotificationChannelGroup;

    move-result-object p0
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_22} :catch_29

    if-eqz p0, :cond_29

    invoke-virtual {p0}, Landroid/app/NotificationChannelGroup;->isBlocked()Z

    move-result p0

    goto :goto_2a

    :catch_29
    :cond_29
    move p0, v1

    :goto_2a
    if-eqz p0, :cond_2d

    return v1

    :cond_2d
    invoke-virtual {p1}, Landroid/app/NotificationChannel;->getImportance()I

    move-result p0

    if-nez p0, :cond_34

    return v1

    :cond_34
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public a()V
    .registers 1

    return-void
.end method

.method public final c()Lyn0;
    .registers 2

    const/4 v0, 0x1

    iget-byte p0, p0, Lwbh;->h:B

    if-eq p0, v0, :cond_1a

    const/4 v0, 0x4

    if-eq p0, v0, :cond_17

    const/4 v0, 0x5

    if-eq p0, v0, :cond_14

    const/4 v0, 0x6

    if-eq p0, v0, :cond_11

    sget-object p0, Lyn0;->h:Lyn0;

    return-object p0

    :cond_11
    sget-object p0, Lyn0;->o:Lyn0;

    return-object p0

    :cond_14
    sget-object p0, Lyn0;->n:Lyn0;

    return-object p0

    :cond_17
    sget-object p0, Lyn0;->m:Lyn0;

    return-object p0

    :cond_1a
    sget-object p0, Lyn0;->f:Lyn0;

    return-object p0
.end method

.method public d()Lua7;
    .registers 8

    iget-boolean v0, p0, Lwbh;->n:Z

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-eqz v0, :cond_8

    move v0, v1

    goto :goto_9

    :cond_8
    move v0, v2

    :goto_9
    iget-boolean v3, p0, Lwbh;->m:Z

    or-int/2addr v3, v0

    iget-boolean v0, p0, Lwbh;->o:Z

    if-eqz v0, :cond_12

    const/4 v0, 0x4

    goto :goto_13

    :cond_12
    move v0, v2

    :goto_13
    or-int/2addr v3, v0

    iget-boolean v0, p0, Lwbh;->p:Z

    if-eqz v0, :cond_1b

    or-int/lit8 v3, v3, 0x2

    goto :goto_1c

    :cond_1b
    move v1, v2

    :goto_1c
    invoke-virtual {p0}, Lwbh;->l()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Lcm;

    invoke-virtual {p0}, Lwbh;->o()Ljava/lang/String;

    move-result-object v4

    iget v5, p0, Lwbh;->e:I

    const/4 v6, 0x5

    invoke-direct {v2, v4, v5, v6}, Lcm;-><init>(Ljava/lang/String;IB)V

    invoke-static {v0, v2}, Lzi4;->t(Ljava/lang/String;Lcm;)Lua7;

    move-result-object v0

    iget-object v2, v0, Lua7;->b:Ljava/lang/Object;

    check-cast v2, Ll1f;

    const v4, 0x7f080413

    invoke-virtual {v0, v4}, Lua7;->S(I)V

    iget v4, p0, Lwbh;->j:I

    iput v4, v2, Ll1f;->z:I

    const/16 v4, 0x8

    const/4 v5, 0x1

    invoke-virtual {v2, v4, v5}, Ll1f;->h(IZ)V

    invoke-virtual {v2, v5}, Ll1f;->d(Z)V

    invoke-virtual {v2, v3}, Ll1f;->g(I)V

    iput v1, v2, Ll1f;->j:I

    iget-object v1, p0, Lwbh;->f:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lua7;->P(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lwbh;->g:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lua7;->O(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lwbh;->d:Ls0f;

    if-eqz v1, :cond_63

    iget-object v3, p0, Lwbh;->a:Landroid/content/Context;

    invoke-virtual {v1, v3}, Ls0f;->d(Landroid/content/Context;)Lyhe;

    move-result-object v1

    invoke-virtual {v0, v1}, Lua7;->N(Lyhe;)V

    :cond_63
    invoke-virtual {p0}, Lwbh;->n()Lw1f;

    move-result-object p0

    if-eqz p0, :cond_6d

    iget-object p0, p0, Lw1f;->b:Ljava/lang/String;

    iput-object p0, v2, Ll1f;->r:Ljava/lang/String;

    :cond_6d
    return-object v0
.end method

.method public final e()Z
    .registers 1

    iget-boolean p0, p0, Lwbh;->n:Z

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    const/4 v0, 0x1

    if-ne p1, p0, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lwbh;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lwbh;

    iget p1, p1, Lwbh;->e:I

    iget p0, p0, Lwbh;->e:I

    if-ne p1, p0, :cond_13

    return v0

    :cond_13
    return v2
.end method

.method public final f()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lwbh;->k:Ljava/lang/String;

    return-object p0
.end method

.method public final g()Z
    .registers 1

    iget-boolean p0, p0, Lwbh;->o:Z

    return p0
.end method

.method public final h()Z
    .registers 1

    iget-boolean p0, p0, Lwbh;->m:Z

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget p0, p0, Lwbh;->e:I

    return p0
.end method

.method public final j()Z
    .registers 1

    iget-boolean p0, p0, Lwbh;->p:Z

    return p0
.end method

.method public k()Li16;
    .registers 1

    invoke-virtual {p0}, Lwbh;->d()Lua7;

    move-result-object p0

    invoke-virtual {p0}, Lua7;->l()Li16;

    move-result-object p0

    return-object p0
.end method

.method public l()Ljava/lang/String;
    .registers 1

    const-string p0, "livescore"

    return-object p0
.end method

.method public n()Lw1f;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public o()Ljava/lang/String;
    .registers 1

    const-string p0, "live_score"

    return-object p0
.end method

.method public p()I
    .registers 1

    const/4 p0, 0x3

    return p0
.end method

.method public q(Landroid/os/Bundle;)Ljava/lang/String;
    .registers 3

    const-string p0, "text"

    const-string v0, ""

    invoke-virtual {p1, p0, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public r(Landroid/os/Bundle;)Ljava/lang/String;
    .registers 3

    const-string p0, "title"

    const-string v0, ""

    invoke-virtual {p1, p0, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public s(JZ)V
    .registers 5

    iget-boolean v0, p0, Lwbh;->q:Z

    if-eqz v0, :cond_26

    iget-object v0, p0, Lwbh;->b:Lorm;

    check-cast v0, Lx5f;

    invoke-virtual {v0, p0, p3, p1, p2}, Lx5f;->q0(Lqyl;ZJ)V

    iget-object p1, p0, Lwbh;->d:Ls0f;

    if-eqz p1, :cond_26

    iget-object p2, p0, Lwbh;->a:Landroid/content/Context;

    invoke-virtual {p1, p2}, Ls0f;->f(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_26

    iget-object p2, p0, Lwbh;->c:Lskm;

    check-cast p2, Lx5f;

    invoke-virtual {p0}, Lwbh;->f()Ljava/lang/String;

    move-result-object p0

    sget-object p3, Lsj0;->b:Lsj0;

    sget-object v0, Lxn0;->b:Lxn0;

    invoke-virtual {p2, p0, p1, p3, v0}, Lx5f;->o0(Ljava/lang/String;Landroid/net/Uri;Lsj0;Lxn0;)V

    :cond_26
    return-void
.end method

.method public final t(Lvn0;)V
    .registers 3

    iget-boolean v0, p0, Lwbh;->q:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lwbh;->b:Lorm;

    check-cast v0, Lx5f;

    invoke-virtual {v0, p0, p1}, Lx5f;->r0(Lqyl;Lvn0;)V

    return-void
.end method

.method public u()V
    .registers 5

    iget-boolean v0, p0, Lwbh;->q:Z

    if-eqz v0, :cond_2f

    iget-object v0, p0, Lwbh;->b:Lorm;

    check-cast v0, Lx5f;

    iget-boolean v1, v0, Lx5f;->h:Z

    sget-object v2, Lxn0;->d:Lxn0;

    if-eqz v1, :cond_16

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v2, v1}, Lx5f;->b(Lqyl;Lxn0;Z)Lwn0;

    move-result-object v1

    invoke-virtual {v0, v1}, Lx5f;->V0(Lwn0;)V

    :cond_16
    iget-object v0, p0, Lwbh;->d:Ls0f;

    if-eqz v0, :cond_2f

    iget-object v1, p0, Lwbh;->a:Landroid/content/Context;

    invoke-virtual {v0, v1}, Ls0f;->f(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_2f

    iget-object v1, p0, Lwbh;->c:Lskm;

    check-cast v1, Lx5f;

    invoke-virtual {p0}, Lwbh;->f()Ljava/lang/String;

    move-result-object p0

    sget-object v3, Lsj0;->b:Lsj0;

    invoke-virtual {v1, p0, v0, v3, v2}, Lx5f;->o0(Ljava/lang/String;Landroid/net/Uri;Lsj0;Lxn0;)V

    :cond_2f
    return-void
.end method

.method public v(Z)V
    .registers 5

    iget-boolean v0, p0, Lwbh;->q:Z

    if-eqz v0, :cond_26

    iget-object v0, p0, Lwbh;->b:Lorm;

    check-cast v0, Lx5f;

    invoke-virtual {v0, p0, p1}, Lx5f;->s0(Lqyl;Z)V

    iget-object p1, p0, Lwbh;->d:Ls0f;

    if-eqz p1, :cond_26

    iget-object v0, p0, Lwbh;->a:Landroid/content/Context;

    invoke-virtual {p1, v0}, Ls0f;->f(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_26

    iget-object v0, p0, Lwbh;->c:Lskm;

    check-cast v0, Lx5f;

    invoke-virtual {p0}, Lwbh;->f()Ljava/lang/String;

    move-result-object p0

    sget-object v1, Lsj0;->b:Lsj0;

    sget-object v2, Lxn0;->f:Lxn0;

    invoke-virtual {v0, p0, p1, v1, v2}, Lx5f;->o0(Ljava/lang/String;Landroid/net/Uri;Lsj0;Lxn0;)V

    :cond_26
    return-void
.end method

.method public abstract w()Z
.end method
