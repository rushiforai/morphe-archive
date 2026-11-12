.class public final Lyk6;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final z:Ljava/util/Set;


# instance fields
.field public final a:Lumi;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Lmv0;

.field public final d:Ldj9;

.field public final e:Lxb;

.field public final f:Lru9;

.field public final g:Lx5f;

.field public final h:Lwjh;

.field public final i:Lkze;

.field public final j:Lkze;

.field public final k:Lkze;

.field public final l:Lkze;

.field public final m:Lkze;

.field public final n:Lkze;

.field public final o:Lkze;

.field public final p:Lode;

.field public final q:Lkze;

.field public final r:Lkze;

.field public final s:Lkze;

.field public final t:Lkze;

.field public final u:Lkze;

.field public final v:Lkze;

.field public final w:Lkze;

.field public final x:Lk32;

.field public final y:Lk32;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    const-string v4, "ru"

    const-string v5, "ve"

    const-string v0, "by"

    const-string v1, "cn"

    const-string v2, "ir"

    const-string v3, "kp"

    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lyk6;->z:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;Lcom/opera/android/settings/SettingsManager;Lmv0;Ldj9;Lxb;Lru9;Lx5f;Lx5f;)V
    .registers 16

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lyk6;->a:Lumi;

    iput-object p3, p0, Lyk6;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p4, p0, Lyk6;->c:Lmv0;

    iput-object p5, p0, Lyk6;->d:Ldj9;

    iput-object p6, p0, Lyk6;->e:Lxb;

    iput-object p7, p0, Lyk6;->f:Lru9;

    iput-object p9, p0, Lyk6;->g:Lx5f;

    new-instance p6, Lk32;

    const/4 p9, 0x4

    invoke-direct {p6, p1, p9}, Lk32;-><init>(Landroid/content/Context;B)V

    iput-object p6, p0, Lyk6;->x:Lk32;

    new-instance p6, Lk32;

    const/4 p9, 0x3

    invoke-direct {p6, p1, p9}, Lk32;-><init>(Landroid/content/Context;B)V

    iput-object p6, p0, Lyk6;->y:Lk32;

    invoke-virtual {p4}, Lno7;->i()Ljava/lang/Object;

    move-result-object p6

    check-cast p6, Lkv0;

    new-instance p9, Lkze;

    invoke-virtual {p0, p6}, Lyk6;->c(Lkv0;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-direct {p9, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p9, p0, Lyk6;->i:Lkze;

    new-instance v0, Lkze;

    invoke-virtual {p9}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    const-string v2, "ai_assistant_menu_shortcut"

    const/4 v3, 0x0

    if-nez v1, :cond_49

    move v1, v3

    goto :goto_4d

    :cond_49
    invoke-virtual {p3, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    :goto_4d
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lyk6;->j:Lkze;

    new-instance v0, Lkze;

    iget-boolean v1, p6, Lkv0;->c:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lyk6;->k:Lkze;

    new-instance v1, Lkze;

    iget-object v4, p6, Lkv0;->b:Lbw0;

    invoke-direct {v1, v4}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lyk6;->l:Lkze;

    new-instance v1, Lkze;

    invoke-virtual {p9}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-direct {v1, v4}, Lekc;-><init>(Ljava/lang/Object;)V

    new-instance v1, Lkze;

    invoke-virtual {p9}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_8f

    move v4, v3

    goto :goto_93

    :cond_8f
    invoke-virtual {p3, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v4

    :goto_93
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-direct {v1, v4}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lyk6;->m:Lkze;

    new-instance v1, Lkze;

    invoke-virtual {p0}, Lyk6;->b()Lpv0;

    move-result-object v4

    invoke-direct {v1, v4}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lyk6;->n:Lkze;

    new-instance v1, Lkze;

    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v4

    invoke-virtual {v4, p1}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v4

    const/4 v5, 0x1

    if-nez v4, :cond_b6

    move v4, v5

    goto :goto_b7

    :cond_b6
    move v4, v3

    :goto_b7
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-direct {v1, v4}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lyk6;->o:Lkze;

    new-instance v1, Lwjh;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v1, p9, p1, p2, p8}, Lwjh;-><init>(Lkze;Landroid/content/Context;Lumi;Lx5f;)V

    iput-object v1, p0, Lyk6;->h:Lwjh;

    new-instance p1, Lode;

    invoke-direct {p1}, Lekc;-><init>()V

    iput-object p1, p0, Lyk6;->p:Lode;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lyk6;->f(Ljava/lang/Boolean;)V

    new-instance p1, Lkze;

    invoke-virtual {p9}, Lekc;->g()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lyk6;->q:Lkze;

    new-instance p1, Lkze;

    invoke-virtual {p9}, Lekc;->g()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_104

    invoke-virtual {p3, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_104

    const-string p2, "ai_assistant_ask_aria"

    invoke-virtual {p3, p2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_104

    move p2, v5

    goto :goto_105

    :cond_104
    move p2, v3

    :goto_105
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lyk6;->r:Lkze;

    new-instance p1, Lkze;

    invoke-virtual {p9}, Lekc;->g()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    new-instance p1, Lkze;

    invoke-virtual {p0}, Lyk6;->a()Z

    move-result p2

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lyk6;->s:Lkze;

    new-instance p1, Lkze;

    iget-object p2, p6, Lkv0;->j:Ljava/util/Set;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p8

    invoke-virtual {p8}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p8

    invoke-interface {p2, p8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p2

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lyk6;->t:Lkze;

    new-instance p1, Lkze;

    invoke-virtual {p9}, Lekc;->g()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_158

    iget-boolean p2, p6, Lkv0;->g:Z

    if-eqz p2, :cond_158

    move p2, v5

    goto :goto_159

    :cond_158
    move p2, v3

    :goto_159
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lyk6;->u:Lkze;

    new-instance p1, Lkze;

    iget-object p2, p7, Lru9;->a:Landroid/content/SharedPreferences;

    const-string p7, "ai.tos_accepted"

    invoke-interface {p2, p7, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lyk6;->v:Lkze;

    new-instance p1, Lkze;

    iget-boolean p2, p6, Lkv0;->h:Z

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lyk6;->w:Lkze;

    new-instance p1, Ls9;

    const/16 p2, 0xc

    invoke-direct {p1, p0, p2}, Ls9;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p3, p1}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    new-instance p1, Lwk6;

    invoke-direct {p1, p0, v3}, Lwk6;-><init>(Lyk6;B)V

    invoke-virtual {p5, p1}, Lno7;->g(Lmo7;)V

    new-instance p1, Lwk6;

    invoke-direct {p1, p0, v5}, Lwk6;-><init>(Lyk6;B)V

    invoke-virtual {p4, p1}, Lno7;->g(Lmo7;)V

    iget-object p1, v1, Lwjh;->f:Ljava/lang/Object;

    check-cast p1, Lode;

    new-instance p2, Lk9;

    const/16 p3, 0x1d

    invoke-direct {p2, p0, p3}, Lk9;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2}, Lxf8;->h0(Lekc;Lf7f;)V

    new-instance p1, Ltb6;

    const/16 p2, 0x15

    invoke-direct {p1, p2}, Ltb6;-><init>(B)V

    new-instance p2, Lcl4;

    const/16 p3, 0x8

    invoke-direct {p2, p1, p3}, Lcl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p2}, Lekc;->k(Lf7f;)V

    invoke-virtual {p0}, Lyk6;->d()V

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 2

    iget-object v0, p0, Lyk6;->i:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_28

    iget-object v0, p0, Lyk6;->j:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_28

    iget-object p0, p0, Lyk6;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "ai_assistant_ask_aria"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_28

    const/4 p0, 0x1

    return p0

    :cond_28
    const/4 p0, 0x0

    return p0
.end method

.method public final b()Lpv0;
    .registers 2

    iget-object v0, p0, Lyk6;->i:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1f

    iget-object p0, p0, Lyk6;->j:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_1f

    sget-object p0, Lpv0;->a:Lpv0;

    return-object p0

    :cond_1f
    sget-object p0, Lpv0;->b:Lpv0;

    return-object p0
.end method

.method public final c(Lkv0;)Z
    .registers 4

    iget-object v0, p1, Lkv0;->a:Ljava/util/Set;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_73

    iget-boolean p1, p1, Lkv0;->e:Z

    if-nez p1, :cond_75

    iget-object p1, p0, Lyk6;->d:Ldj9;

    invoke-virtual {p1}, Lno7;->i()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcj9;

    new-instance v0, Lp4j;

    invoke-direct {v0}, Lp4j;-><init>()V

    iget-object v1, p1, Lcj9;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lp4j;->add(Ljava/lang/Object;)Z

    iget-object p1, p1, Lcj9;->b:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lp4j;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lyk6;->x:Lk32;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_38

    invoke-virtual {v0, p1}, Lp4j;->add(Ljava/lang/Object;)Z

    :cond_38
    iget-object p0, p0, Lyk6;->y:Lk32;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_45

    invoke-virtual {v0, p0}, Lp4j;->add(Ljava/lang/Object;)Z

    :cond_45
    invoke-static {v0}, Lz4j;->a(Lp4j;)Lp4j;

    move-result-object p0

    if-eqz p0, :cond_53

    iget-object p1, p0, Lp4j;->a:Lu9d;

    invoke-virtual {p1}, Lu9d;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_75

    :cond_53
    invoke-virtual {p0}, Lp4j;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_57
    move-object p1, p0

    check-cast p1, Lt9d;

    invoke-virtual {p1}, Lt9d;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_75

    move-object p1, p0

    check-cast p1, Lr9d;

    invoke-virtual {p1}, Lr9d;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    sget-object v0, Lyk6;->z:Ljava/util/Set;

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0, p1}, Lkotlin/collections/CollectionsKt;->E(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_57

    :cond_73
    const/4 p0, 0x0

    return p0

    :cond_75
    const/4 p0, 0x1

    return p0
.end method

.method public final d()V
    .registers 4

    iget-object v0, p0, Lyk6;->i:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iget-object v1, p0, Lyk6;->g:Lx5f;

    if-nez v0, :cond_16

    sget-object p0, Lb70;->b:Lb70;

    invoke-virtual {v1, p0}, Lx5f;->x(Lb70;)V

    return-void

    :cond_16
    iget-object v0, p0, Lyk6;->j:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_2a

    sget-object p0, Lb70;->h:Lb70;

    invoke-virtual {v1, p0}, Lx5f;->x(Lb70;)V

    return-void

    :cond_2a
    new-instance v0, Liu2;

    const/16 v1, 0x18

    invoke-direct {v0, p0, v1}, Liu2;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lyk6;->e:Lxb;

    iget-object p0, p0, Lxb;->d:Lkze;

    new-instance v1, Ly0a;

    const/16 v2, 0x11

    invoke-direct {v1, v0, v2}, Ly0a;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lnsc;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lnsc;-><init>(Lekc;Lcom/opera/api/Callback;B)V

    return-void
.end method

.method public final e()V
    .registers 8

    iget-object v0, p0, Lyk6;->c:Lmv0;

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkv0;

    invoke-virtual {p0, v0}, Lyk6;->c(Lkv0;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iget-object v2, p0, Lyk6;->i:Lkze;

    invoke-virtual {v2, v1}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    const-string v3, "ai_assistant_menu_shortcut"

    iget-object v4, p0, Lyk6;->b:Lcom/opera/android/settings/SettingsManager;

    const/4 v5, 0x0

    if-nez v1, :cond_28

    move v1, v5

    goto :goto_2c

    :cond_28
    invoke-virtual {v4, v3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    :goto_2c
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iget-object v6, p0, Lyk6;->j:Lkze;

    invoke-virtual {v6, v1}, Lekc;->r(Ljava/lang/Object;)V

    iget-boolean v1, v0, Lkv0;->c:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iget-object v6, p0, Lyk6;->k:Lkze;

    invoke-virtual {v6, v1}, Lekc;->r(Ljava/lang/Object;)V

    iget-object v1, p0, Lyk6;->l:Lkze;

    iget-object v6, v0, Lkv0;->b:Lbw0;

    invoke-virtual {v1, v6}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_55

    move v1, v5

    goto :goto_59

    :cond_55
    invoke-virtual {v4, v3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    :goto_59
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iget-object v6, p0, Lyk6;->m:Lkze;

    invoke-virtual {v6, v1}, Lekc;->r(Ljava/lang/Object;)V

    iget-object v1, p0, Lyk6;->n:Lkze;

    invoke-virtual {p0}, Lyk6;->b()Lpv0;

    move-result-object v6

    invoke-virtual {v1, v6}, Lekc;->r(Ljava/lang/Object;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lyk6;->f(Ljava/lang/Boolean;)V

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    iget-object v6, p0, Lyk6;->q:Lkze;

    invoke-virtual {v6, v1}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    const/4 v6, 0x1

    if-eqz v1, :cond_9a

    invoke-virtual {v4, v3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9a

    const-string v1, "ai_assistant_ask_aria"

    invoke-virtual {v4, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9a

    move v1, v6

    goto :goto_9b

    :cond_9a
    move v1, v5

    :goto_9b
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iget-object v3, p0, Lyk6;->r:Lkze;

    invoke-virtual {v3, v1}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lyk6;->a()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iget-object v3, p0, Lyk6;->s:Lkze;

    invoke-virtual {v3, v1}, Lekc;->r(Ljava/lang/Object;)V

    iget-object v1, v0, Lkv0;->j:Ljava/util/Set;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iget-object v3, p0, Lyk6;->t:Lkze;

    invoke-virtual {v3, v1}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_d9

    iget-boolean v1, v0, Lkv0;->g:Z

    if-eqz v1, :cond_d9

    move v5, v6

    :cond_d9
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iget-object v2, p0, Lyk6;->u:Lkze;

    invoke-virtual {v2, v1}, Lekc;->r(Ljava/lang/Object;)V

    iget-boolean v0, v0, Lkv0;->h:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iget-object v1, p0, Lyk6;->w:Lkze;

    invoke-virtual {v1, v0}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lyk6;->d()V

    iget-object p0, p0, Lyk6;->g:Lx5f;

    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-virtual {v1, v0}, Lx56;->O(Lzpa;)Le66;

    move-result-object v0

    const/16 v2, 0x16

    invoke-virtual {v0, v2, v6, v6}, Ljf0;->r(IIZ)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final f(Ljava/lang/Boolean;)V
    .registers 6

    iget-object v0, p0, Lyk6;->h:Lwjh;

    invoke-virtual {v0}, Lwjh;->n()Z

    move-result v1

    iget-object v2, p0, Lyk6;->p:Lode;

    if-eqz v1, :cond_56

    iget-object v0, v0, Lwjh;->f:Ljava/lang/Object;

    check-cast v0, Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    if-eqz v1, :cond_22

    invoke-virtual {v2, v3}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :cond_22
    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4f

    if-nez p1, :cond_4b

    new-instance p1, Lrml;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object v1, p0, Lyk6;->a:Lumi;

    invoke-direct {p1, v0, v1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Lxk6;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lxk6;-><init>(Lyk6;B)V

    invoke-virtual {p1, v0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    new-instance v0, Lxk6;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lxk6;-><init>(Lyk6;B)V

    invoke-virtual {p1, v0}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void

    :cond_4b
    invoke-virtual {v2, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :cond_4f
    if-nez v0, :cond_52

    return-void

    :cond_52
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_56
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v2, p0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
