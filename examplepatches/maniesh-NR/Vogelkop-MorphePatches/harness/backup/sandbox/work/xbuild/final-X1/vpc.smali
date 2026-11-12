.class public final Lvpc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ldj9;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Lonc;

.field public final d:Lode;

.field public final e:Lupc;

.field public f:Lc6j;


# direct methods
.method public constructor <init>(Ldj9;Lcom/opera/android/settings/SettingsManager;Lonc;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvpc;->a:Ldj9;

    iput-object p2, p0, Lvpc;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Lvpc;->c:Lonc;

    new-instance p3, Lode;

    invoke-direct {p3}, Lekc;-><init>()V

    iput-object p3, p0, Lvpc;->d:Lode;

    new-instance p3, Lupc;

    const/4 v0, 0x0

    invoke-direct {p3, p0, v0}, Lupc;-><init>(Ljava/lang/Object;B)V

    iput-object p3, p0, Lvpc;->e:Lupc;

    new-instance p3, Ls9;

    const/16 v0, 0x14

    invoke-direct {p3, p0, v0}, Ls9;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p3}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    new-instance p2, Lvy;

    const/4 p3, 0x6

    invoke-direct {p2, p0, p3}, Lvy;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lno7;->g(Lmo7;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 5

    iget-object v0, p0, Lvpc;->f:Lc6j;

    if-eqz v0, :cond_d

    iget-object v0, v0, Lc6j;->b:Ljava/lang/Object;

    check-cast v0, Ll1c;

    if-eqz v0, :cond_d

    iget-object v0, v0, Ll1c;->c:Ll0c;

    goto :goto_e

    :cond_d
    const/4 v0, 0x0

    :goto_e
    iget-object v1, p0, Lvpc;->a:Ldj9;

    invoke-virtual {v1}, Lno7;->i()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcj9;

    iget-object v1, v1, Lcj9;->b:Ljava/lang/String;

    if-eqz v0, :cond_1e

    iget-object v2, v0, Ll0c;->a:Ljava/lang/String;

    if-nez v2, :cond_1f

    :cond_1e
    move-object v2, v1

    :cond_1f
    if-eqz v0, :cond_25

    iget-object v0, v0, Ll0c;->b:Ljava/lang/String;

    if-nez v0, :cond_2d

    :cond_25
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    :cond_2d
    new-instance v3, Ltpc;

    invoke-direct {v3, v1, v2, v0}, Ltpc;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lvpc;->d:Lode;

    invoke-static {p0, v3}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    return-void
.end method

.method public final b()V
    .registers 5

    iget-object v0, p0, Lvpc;->f:Lc6j;

    iget-object v1, p0, Lvpc;->e:Lupc;

    if-eqz v0, :cond_b

    iget-object v0, v0, Lc6j;->c:Ljava/util/HashSet;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    :cond_b
    iget-object v0, p0, Lvpc;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v2, "enable_newsfeed"

    invoke-virtual {v0, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_29

    new-instance v0, Lc6j;

    iget-object v2, p0, Lvpc;->c:Lonc;

    invoke-virtual {v2}, Lonc;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lt7j;

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3}, Lc6j;-><init>(Lt7j;Z)V

    iget-object v2, v0, Lc6j;->c:Ljava/util/HashSet;

    invoke-virtual {v2, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_2a

    :cond_29
    const/4 v0, 0x0

    :goto_2a
    iput-object v0, p0, Lvpc;->f:Lc6j;

    invoke-virtual {p0}, Lvpc;->a()V

    return-void
.end method
