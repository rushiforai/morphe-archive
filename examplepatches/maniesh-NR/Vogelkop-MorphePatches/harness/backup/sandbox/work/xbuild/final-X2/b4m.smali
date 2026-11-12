.class public final Lb4m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lp5j;
.implements Lmo7;


# instance fields
.field public final a:Lcom/opera/android/settings/SettingsManager;

.field public final b:Lbvn;

.field public final c:Lv3m;

.field public final d:Lx5f;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lbvn;Lv3m;Lx5f;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lb4m;->a:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Lb4m;->c:Lv3m;

    iput-object p4, p0, Lb4m;->d:Lx5f;

    iput-object p2, p0, Lb4m;->b:Lbvn;

    invoke-virtual {p2, p0}, Lno7;->g(Lmo7;)V

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "translate_web_pages_enabled"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_19

    const-string v0, "translate_web_pages_backup_translation_method_enabled"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_19

    const-string v0, "translation_source"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_19

    return-void

    :cond_19
    invoke-virtual {p0}, Lb4m;->a()V

    return-void
.end method

.method public final a()V
    .registers 9

    iget-object v0, p0, Lb4m;->d:Lx5f;

    iget-object v1, v0, Lx5f;->d:Lzpa;

    iget-object v2, p0, Lb4m;->c:Lv3m;

    iget-object v3, v2, Lv3m;->a:Landroid/content/Context;

    invoke-static {v3}, Lv3m;->f(Landroid/content/Context;)Z

    move-result v3

    iget-object p0, p0, Lb4m;->a:Lcom/opera/android/settings/SettingsManager;

    if-nez v3, :cond_13

    sget-object v3, Lns0;->d:Lns0;

    goto :goto_2d

    :cond_13
    iget-object v3, v2, Lv3m;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v3}, Lcom/opera/android/settings/SettingsManager;->E()Lz4m;

    move-result-object v3

    sget-object v4, Lz4m;->b:Lz4m;

    if-ne v3, v4, :cond_2b

    const-string v3, "translate_web_pages_enabled"

    invoke-virtual {p0, v3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_28

    sget-object v3, Lns0;->b:Lns0;

    goto :goto_2d

    :cond_28
    sget-object v3, Lns0;->c:Lns0;

    goto :goto_2d

    :cond_2b
    sget-object v3, Lns0;->e:Lns0;

    :goto_2d
    iget-boolean v4, v0, Lx5f;->h:Z

    const/4 v5, 0x1

    if-eqz v4, :cond_48

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    invoke-virtual {v4, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v6

    invoke-virtual {v6, v1}, Lb66;->C(Lzpa;)Ld66;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v7, 0x0

    invoke-virtual {v6, v7, v5, v3}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v4}, Lx5f;->U0(Lx56;)V

    :cond_48
    iget-object v3, v2, Lv3m;->a:Landroid/content/Context;

    invoke-static {v3}, Lv3m;->f(Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_53

    sget-object p0, Li80;->d:Li80;

    goto :goto_6d

    :cond_53
    iget-object v3, v2, Lv3m;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v3}, Lcom/opera/android/settings/SettingsManager;->E()Lz4m;

    move-result-object v3

    sget-object v4, Lz4m;->b:Lz4m;

    if-ne v3, v4, :cond_6b

    const-string v3, "translate_web_pages_backup_translation_method_enabled"

    invoke-virtual {p0, v3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_68

    sget-object p0, Li80;->b:Li80;

    goto :goto_6d

    :cond_68
    sget-object p0, Li80;->c:Li80;

    goto :goto_6d

    :cond_6b
    sget-object p0, Li80;->e:Li80;

    :goto_6d
    iget-boolean v3, v0, Lx5f;->h:Z

    if-eqz v3, :cond_86

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    invoke-virtual {v3, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v4

    invoke-virtual {v4, v1}, Lb66;->C(Lzpa;)Ld66;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v4, v5, v5, p0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v3}, Lx5f;->U0(Lx56;)V

    :cond_86
    iget-object p0, v2, Lv3m;->d:Lplk;

    iget-object p0, p0, Lplk;->d:Ljava/lang/Object;

    check-cast p0, Lode;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Set;

    if-eqz p0, :cond_9a

    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result p0

    int-to-long v3, p0

    goto :goto_9c

    :cond_9a
    const-wide/16 v3, 0x0

    :goto_9c
    iget-boolean p0, v0, Lx5f;->h:Z

    if-eqz p0, :cond_b3

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p0

    invoke-virtual {p0, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v6

    invoke-virtual {v6, v1}, Lb66;->C(Lzpa;)Ld66;

    move-result-object v6

    const/4 v7, 0x2

    invoke-virtual {v6, v7, v5, v3, v4}, Ljf0;->p(IIJ)V

    invoke-virtual {v0, p0}, Lx5f;->U0(Lx56;)V

    :cond_b3
    iget-object p0, v2, Lv3m;->a:Landroid/content/Context;

    invoke-static {p0}, Lv3m;->f(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_be

    sget-object p0, Lss0;->d:Lss0;

    goto :goto_d2

    :cond_be
    iget-object p0, v2, Lv3m;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->E()Lz4m;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    sget-object v2, Lss0;->b:Lss0;

    if-eqz p0, :cond_d1

    if-ne p0, v5, :cond_d1

    sget-object p0, Lss0;->c:Lss0;

    goto :goto_d2

    :cond_d1
    move-object p0, v2

    :goto_d2
    iget-boolean v2, v0, Lx5f;->h:Z

    if-nez v2, :cond_d7

    return-void

    :cond_d7
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-virtual {v2, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v3

    invoke-virtual {v3, v1}, Lb66;->C(Lzpa;)Ld66;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v3, 0x3

    invoke-virtual {v1, v3, v5, p0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v2}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final o(Z)V
    .registers 5

    iget-object v0, p0, Lb4m;->a:Lcom/opera/android/settings/SettingsManager;

    if-eqz p1, :cond_18

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    iget-object p1, p0, Lb4m;->c:Lv3m;

    iget-object p1, p1, Lv3m;->d:Lplk;

    iget-object p1, p1, Lplk;->d:Ljava/lang/Object;

    check-cast p1, Lode;

    new-instance v1, Lg9l;

    const/4 v2, 0x7

    invoke-direct {v1, p0, v2}, Lg9l;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v1}, Lekc;->k(Lf7f;)V

    :cond_18
    iget-object p1, p0, Lb4m;->b:Lbvn;

    invoke-virtual {p1}, Lno7;->i()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lavn;

    iget p1, p1, Lavn;->a:I

    const/4 v1, 0x1

    and-int/2addr p1, v1

    if-nez p1, :cond_27

    const/4 v1, 0x0

    :cond_27
    const-string p1, "translate_web_pages_enabled"

    invoke-virtual {v0, v1, p1}, Lcom/opera/android/settings/SettingsManager;->R(ILjava/lang/String;)V

    invoke-virtual {p0}, Lb4m;->a()V

    return-void
.end method
