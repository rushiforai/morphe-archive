.class public final Lwc7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lp5j;


# instance fields
.field public final a:Lcom/opera/android/settings/SettingsManager;

.field public final b:Lydn;

.field public final c:Lh7f;

.field public d:I

.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lydn;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lwc7;->c:Lh7f;

    const/4 v0, -0x1

    iput v0, p0, Lwc7;->d:I

    iput-object p1, p0, Lwc7;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    iput-object p2, p0, Lwc7;->b:Lydn;

    new-instance p1, Lvc7;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lvc7;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1}, Lydn;->b(Ltdn;)V

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "dns_over_https_enabled"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_19

    const-string v0, "dns_over_https_mode"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_19

    const-string v0, "dns_over_https_custom_server_template"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_19

    return-void

    :cond_19
    invoke-virtual {p0}, Lwc7;->c()V

    return-void
.end method

.method public final a()I
    .registers 3

    const-string v0, "dns_over_https_enabled"

    iget-object v1, p0, Lwc7;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_26

    iget-object p0, p0, Lwc7;->b:Lydn;

    iget-object v0, p0, Lydn;->d:Lvdn;

    iget-boolean v0, v0, Lvdn;->a:Z

    if-eqz v0, :cond_1a

    iget-object p0, p0, Lydn;->c:Lgfn;

    invoke-interface {p0}, Lgfn;->isEnabled()Z

    move-result p0

    if-nez p0, :cond_26

    :cond_1a
    invoke-virtual {v1}, Lcom/opera/android/settings/SettingsManager;->l()Ll7j;

    move-result-object p0

    sget-object v0, Ll7j;->b:Ll7j;

    if-ne p0, v0, :cond_24

    const/4 p0, 0x1

    return p0

    :cond_24
    const/4 p0, 0x2

    return p0

    :cond_26
    const/4 p0, 0x0

    return p0
.end method

.method public final b()Ljava/lang/String;
    .registers 4

    const-string v0, "dns_over_https_enabled"

    iget-object v1, p0, Lwc7;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    iget-object p0, p0, Lwc7;->b:Lydn;

    iget-object v2, p0, Lydn;->d:Lvdn;

    iget-boolean v2, v2, Lvdn;->a:Z

    if-eqz v2, :cond_1a

    iget-object p0, p0, Lydn;->c:Lgfn;

    invoke-interface {p0}, Lgfn;->isEnabled()Z

    move-result p0

    if-eqz p0, :cond_1a

    const/4 p0, 0x1

    goto :goto_1b

    :cond_1a
    const/4 p0, 0x0

    :goto_1b
    invoke-virtual {v1}, Lcom/opera/android/settings/SettingsManager;->l()Ll7j;

    move-result-object v2

    if-nez p0, :cond_37

    if-eqz v0, :cond_37

    sget-object p0, Ll7j;->c:Ll7j;

    if-ne v2, p0, :cond_34

    const-string p0, "dns_over_https_custom_server_template"

    invoke-virtual {v1, p0}, Lcom/opera/android/settings/SettingsManager;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, LJ/N;->MLC1dld3(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_37

    return-object p0

    :cond_34
    iget-object p0, v2, Ll7j;->a:Ljava/lang/String;

    return-object p0

    :cond_37
    const-string p0, ""

    return-object p0
.end method

.method public final c()V
    .registers 4

    invoke-virtual {p0}, Lwc7;->a()I

    move-result v0

    invoke-virtual {p0}, Lwc7;->b()Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lwc7;->d:I

    if-ne v0, v2, :cond_14

    iget-object v2, p0, Lwc7;->e:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1b

    :cond_14
    iput v0, p0, Lwc7;->d:I

    iput-object v1, p0, Lwc7;->e:Ljava/lang/String;

    invoke-static {}, LJ/N;->MnODEeX4()V

    :cond_1b
    iget-object p0, p0, Lwc7;->c:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_21
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_40

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldzg;

    iget-byte v1, v0, Ldzg;->a:B

    iget-object v0, v0, Ldzg;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_42

    check-cast v0, Lvzk;

    invoke-virtual {v0}, Lvzk;->h0()V

    goto :goto_21

    :pswitch_3a
    check-cast v0, Lhzg;

    invoke-virtual {v0}, Lhzg;->g()V

    goto :goto_21

    :cond_40
    return-void

    nop

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_3a
    .end packed-switch
.end method
