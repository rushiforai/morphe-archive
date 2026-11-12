.class public final Lkcg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lu9j;


# instance fields
.field public final a:Lcom/opera/android/settings/SettingsManager;

.field public final b:Ldb;

.field public final c:Lxb;

.field public final d:Lzwk;

.field public final e:Lrs2;

.field public final f:Lv9j;

.field public final g:Ljava/util/Set;

.field public final h:Ls9;

.field public final i:Ld8d;

.field public final j:Lt53;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Ldb;Lxb;Lzwk;Lrs2;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkcg;->a:Lcom/opera/android/settings/SettingsManager;

    iput-object p2, p0, Lkcg;->b:Ldb;

    iput-object p3, p0, Lkcg;->c:Lxb;

    iput-object p4, p0, Lkcg;->d:Lzwk;

    iput-object p5, p0, Lkcg;->e:Lrs2;

    new-instance p1, Lv9j;

    invoke-direct {p1, p0}, Lv9j;-><init>(Lu9j;)V

    iput-object p1, p0, Lkcg;->f:Lv9j;

    const-string p1, "startup_mode"

    const-string p2, "tab_disposition"

    filled-new-array {p1, p2}, [Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p1

    iput-object p1, p0, Lkcg;->g:Ljava/util/Set;

    new-instance p1, Ls9;

    const/16 p2, 0x1c

    invoke-direct {p1, p0, p2}, Ls9;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lkcg;->h:Ls9;

    new-instance p1, Ld8d;

    const/16 p2, 0x16

    invoke-direct {p1, p0, p2}, Ld8d;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lkcg;->i:Ld8d;

    new-instance p1, Lt53;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lt53;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lkcg;->j:Lt53;

    return-void
.end method


# virtual methods
.method public final a(Lipf;)V
    .registers 9

    new-instance v0, Ljcg;

    instance-of v1, p1, Lfpf;

    if-eqz v1, :cond_26

    check-cast p1, Lfpf;

    iget-object v1, p1, Lfpf;->b:Ljava/lang/String;

    iget-object v2, p1, Lfpf;->c:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_14

    move-object v3, v1

    goto :goto_15

    :cond_14
    move-object v3, v2

    :goto_15
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1d

    const-string v1, ""

    :cond_1d
    iget-object p1, p1, Lfpf;->d:Ljava/lang/String;

    new-instance v2, Lvb;

    invoke-direct {v2, v3, v1, p1}, Lvb;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_24
    move-object v1, v2

    goto :goto_29

    :cond_26
    sget-object v2, Lub;->x:Lub;

    goto :goto_24

    :goto_29
    iget-object p1, p0, Lkcg;->d:Lzwk;

    iget-object v2, p0, Lkcg;->b:Ldb;

    invoke-static {v2, p1}, Lxgh;->s(Ldb;Lzwk;)Z

    move-result p1

    if-eqz p1, :cond_38

    const p1, 0x7f140820

    :goto_36
    move v2, p1

    goto :goto_60

    :cond_38
    invoke-virtual {v2}, Ldb;->f()Z

    move-result p1

    const-string v3, "enable_sync"

    iget-object v4, p0, Lkcg;->a:Lcom/opera/android/settings/SettingsManager;

    if-eqz p1, :cond_4c

    invoke-virtual {v4, v3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4c

    const p1, 0x7f141204

    goto :goto_36

    :cond_4c
    invoke-virtual {v2}, Ldb;->f()Z

    move-result p1

    if-eqz p1, :cond_5c

    invoke-virtual {v4, v3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_5c

    const p1, 0x7f141203

    goto :goto_36

    :cond_5c
    const p1, 0x7f1410b5

    goto :goto_36

    :goto_60
    iget-object p1, p0, Lkcg;->e:Lrs2;

    iget v3, p1, Lrs2;->f:I

    iget v4, p1, Lrs2;->h:I

    iget v5, p1, Lrs2;->g:I

    iget v6, p1, Lrs2;->i:I

    invoke-direct/range {v0 .. v6}, Ljcg;-><init>(Lzi4;IIIII)V

    iget-object p0, p0, Lkcg;->f:Lv9j;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final j()V
    .registers 4

    iget-object v0, p0, Lkcg;->c:Lxb;

    iget-object v1, v0, Lxb;->d:Lkze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lipf;

    invoke-virtual {p0, v1}, Lkcg;->a(Lipf;)V

    iget-object v1, p0, Lkcg;->a:Lcom/opera/android/settings/SettingsManager;

    iget-object v2, p0, Lkcg;->h:Ls9;

    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    iget-object v1, p0, Lkcg;->j:Lt53;

    iget-object v2, p0, Lkcg;->e:Lrs2;

    iget-object v2, v2, Lrs2;->a:Li7f;

    invoke-virtual {v2, v1}, Li7f;->b(Ljava/lang/Object;)Z

    iget-object v0, v0, Lxb;->e:Ljze;

    iget-object p0, p0, Lkcg;->i:Ld8d;

    invoke-virtual {v0, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method

.method public final onStopped()V
    .registers 3

    iget-object v0, p0, Lkcg;->a:Lcom/opera/android/settings/SettingsManager;

    iget-object v1, p0, Lkcg;->h:Ls9;

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    iget-object v0, p0, Lkcg;->j:Lt53;

    iget-object v1, p0, Lkcg;->e:Lrs2;

    iget-object v1, v1, Lrs2;->a:Li7f;

    invoke-virtual {v1, v0}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object v0, p0, Lkcg;->c:Lxb;

    iget-object v0, v0, Lxb;->e:Ljze;

    iget-object p0, p0, Lkcg;->i:Ld8d;

    invoke-virtual {v0, p0}, Lekc;->p(Lf7f;)V

    return-void
.end method
