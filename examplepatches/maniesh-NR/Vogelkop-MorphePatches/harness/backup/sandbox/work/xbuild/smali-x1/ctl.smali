.class public final Lctl;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/settings/SettingsManager;

.field public final b:Likc;

.field public final c:Lz7f;

.field public final d:Lpo7;

.field public final e:Lpde;

.field public f:Z

.field public final g:Latl;


# direct methods
.method public constructor <init>(Lhjf;Lcom/opera/android/settings/SettingsManager;Likc;Lz7f;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lctl;->a:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Lctl;->b:Likc;

    iput-object p4, p0, Lctl;->c:Lz7f;

    new-instance v0, Lpo7;

    invoke-direct {v0, p4}, Lpo7;-><init>(Lno7;)V

    iput-object v0, p0, Lctl;->d:Lpo7;

    new-instance p4, Lpde;

    invoke-virtual {p0}, Lctl;->a()Lbtl;

    move-result-object v1

    invoke-direct {p4, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p4, p0, Lctl;->e:Lpde;

    new-instance p4, Latl;

    invoke-direct {p4, p1}, Latl;-><init>(Lhjf;)V

    iput-object p4, p0, Lctl;->g:Latl;

    new-instance p1, Lezg;

    const/16 v1, 0x8

    invoke-direct {p1, p0, v1}, Lezg;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lp7l;

    const/16 v2, 0x10

    invoke-direct {v1, p0, v2}, Lp7l;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p4}, Latl;->getLifecycle()Ltcc;

    move-result-object v2

    invoke-static {p2, v2, p1, v1}, Laib;->A(Lw6f;Ltcc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    new-instance p1, Lzsl;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lzsl;-><init>(Lctl;B)V

    new-instance p2, Lt7d;

    const/16 v1, 0x19

    invoke-direct {p2, p1, v1}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p3, p4, p2}, Lekc;->j(Lndc;Lf7f;)V

    new-instance p1, Lzsl;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lzsl;-><init>(Lctl;B)V

    new-instance p0, Lt7d;

    invoke-direct {p0, p1, v1}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, p4, p0}, Lekc;->j(Lndc;Lf7f;)V

    iget-object p0, p4, Latl;->b:Lqdc;

    sget-object p1, Lqcc;->e:Lqcc;

    invoke-virtual {p0, p1}, Lqdc;->g(Lqcc;)V

    return-void
.end method


# virtual methods
.method public final a()Lbtl;
    .registers 9

    iget-object v0, p0, Lctl;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->c()Lb7j;

    move-result-object v2

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->f()Le7j;

    move-result-object v0

    sget-object v1, Le7j;->d:Le7j;

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-ne v0, v1, :cond_12

    move v0, v3

    goto :goto_14

    :cond_12
    move v0, v3

    move v3, v4

    :goto_14
    const-string v1, "CompactBottomToolbar"

    sget-object v5, Lb7j;->d:Lb7j;

    if-ne v2, v5, :cond_61

    if-nez v3, :cond_61

    iget-object v6, p0, Lctl;->b:Likc;

    invoke-virtual {v6}, Lekc;->g()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lkl5;

    iget-object v6, v6, Lkl5;->a:Landroid/content/res/Configuration;

    iget v6, v6, Landroid/content/res/Configuration;->screenWidthDp:I

    const/16 v7, 0x258

    if-ge v6, v7, :cond_5f

    invoke-static {v1}, LJ/N;->Mvrw6zZz(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_38

    invoke-static {v1}, LJ/N;->M$PqApPr(Ljava/lang/Object;)Z

    move-result p0

    :goto_36
    move-object v6, v1

    goto :goto_63

    :cond_38
    iget-object p0, p0, Lctl;->d:Lpo7;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ly7f;

    instance-of v6, p0, Lv7f;

    if-eqz v6, :cond_49

    check-cast p0, Lv7f;

    iget-boolean p0, p0, Lv7f;->f:Z

    goto :goto_5d

    :cond_49
    instance-of v6, p0, Lw7f;

    if-nez v6, :cond_5c

    sget-object v6, Lx7f;->a:Lx7f;

    invoke-static {p0, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_5c

    if-eqz p0, :cond_5c

    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :cond_5c
    move p0, v4

    :goto_5d
    if-nez p0, :cond_61

    :cond_5f
    move p0, v0

    goto :goto_36

    :cond_61
    move-object v6, v1

    move p0, v4

    :goto_63
    new-instance v1, Lbtl;

    if-eqz p0, :cond_69

    if-eqz v3, :cond_6c

    :cond_69
    if-ne v2, v5, :cond_6c

    move v4, v0

    :cond_6c
    invoke-static {v6}, LJ/N;->Mvrw6zZz(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_77

    sget-object v0, Lop0;->b:Lop0;

    :goto_74
    move v5, p0

    move-object v6, v0

    goto :goto_7a

    :cond_77
    sget-object v0, Lop0;->d:Lop0;

    goto :goto_74

    :goto_7a
    invoke-direct/range {v1 .. v6}, Lbtl;-><init>(Lb7j;ZZZLop0;)V

    return-object v1
.end method

.method public final b()V
    .registers 3

    iget-object v0, p0, Lctl;->c:Lz7f;

    invoke-virtual {v0}, Lno7;->s()V

    iget-object v0, p0, Lctl;->g:Latl;

    iget-object v0, v0, Latl;->b:Lqdc;

    sget-object v1, Lqcc;->a:Lqcc;

    invoke-virtual {v0, v1}, Lqdc;->g(Lqcc;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lctl;->f:Z

    return-void
.end method

.method public final c()V
    .registers 2

    iget-boolean v0, p0, Lctl;->f:Z

    if-nez v0, :cond_d

    iget-object v0, p0, Lctl;->e:Lpde;

    invoke-virtual {p0}, Lctl;->a()Lbtl;

    move-result-object p0

    invoke-static {v0, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    :cond_d
    return-void
.end method
