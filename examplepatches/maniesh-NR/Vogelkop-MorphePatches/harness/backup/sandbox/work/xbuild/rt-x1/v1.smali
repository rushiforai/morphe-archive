.class public final Lv1;
.super Lno7;
.source "SourceFile"


# static fields
.field public static final l:Ly55;


# instance fields
.field public final k:Lu1;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ly55;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lv1;->l:Ly55;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    const/16 v0, 0x11

    const-string v1, "AbTesting"

    invoke-direct {p0, p1, v0, v1}, Lno7;-><init>(Landroid/content/Context;ILjava/lang/String;)V

    new-instance p1, Lu1;

    iget-object v0, p0, Lno7;->a:Landroid/content/Context;

    invoke-direct {p1, v0, p0}, Lu1;-><init>(Landroid/content/Context;Lv1;)V

    iput-object p1, p0, Lv1;->k:Lu1;

    return-void
.end method

.method public static u(Landroid/content/Context;)Lv1;
    .registers 3

    sget-object v0, Lio7;->e:Lio7;

    sget-object v1, Lv1;->l:Ly55;

    invoke-static {p0, v0, v1}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object p0

    check-cast p0, Lv1;

    return-object p0
.end method

.method public static z(Lizd;)Lq1;
    .registers 10

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readByte()B

    move-result v0

    const/4 v1, 0x1

    and-int/2addr v0, v1

    const/4 v2, 0x0

    if-eqz v0, :cond_b

    move v4, v1

    goto :goto_c

    :cond_b
    move v4, v2

    :goto_c
    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Laik;->a:[Ljava/lang/String;

    const-string v1, ""

    if-nez v0, :cond_18

    move-object v5, v1

    goto :goto_19

    :cond_18
    move-object v5, v0

    :goto_19
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    new-array v6, v0, [Ljava/lang/String;

    new-array v7, v0, [Ljava/lang/String;

    :goto_23
    if-ge v2, v0, :cond_3a

    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_2c

    move-object v3, v1

    :cond_2c
    aput-object v3, v6, v2

    invoke-virtual {p0}, Lizd;->h()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_35

    move-object v3, v1

    :cond_35
    aput-object v3, v7, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_23

    :cond_3a
    new-instance v3, Lq1;

    const/4 v8, 0x0

    invoke-direct/range {v3 .. v8}, Lq1;-><init>(ZLjava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Z)V

    return-object v3
.end method


# virtual methods
.method public final l(Ljava/lang/Object;)V
    .registers 5

    check-cast p1, Lq1;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, p0, Lno7;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->J()Z

    move-result v0

    iget-object v1, p0, Lv1;->k:Lu1;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-boolean v2, p1, Lq1;->e:Z

    if-eqz v2, :cond_2a

    iget-object v1, v1, Lu1;->b:Ljava/util/concurrent/atomic/AtomicReference;

    if-eqz v0, :cond_24

    sget-object v0, Lu1;->h:Ls1;

    goto :goto_26

    :cond_24
    sget-object v0, Lu1;->g:Ls1;

    :goto_26
    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    goto :goto_2e

    :cond_2a
    const/4 v0, 0x0

    invoke-virtual {v1, p1, v0}, Lu1;->c(Lq1;Z)V

    :goto_2e
    invoke-super {p0, p1}, Lno7;->l(Ljava/lang/Object;)V

    return-void
.end method

.method public final m(Ljava/lang/Object;)V
    .registers 3

    check-cast p1, Lq1;

    const/16 v0, 0x12

    iget-object p1, p1, Lq1;->b:Ljava/lang/String;

    invoke-static {v0, p1}, Lks3;->I(ILjava/lang/String;)V

    invoke-virtual {p0}, Lv1;->t()V

    return-void
.end method

.method public final r(Ljava/lang/Object;)V
    .registers 4

    check-cast p1, Lq1;

    iget-object v0, p0, Lv1;->k:Lu1;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lu1;->c(Lq1;Z)V

    const/16 v0, 0x12

    iget-object p1, p1, Lq1;->b:Ljava/lang/String;

    invoke-static {v0, p1}, Lks3;->I(ILjava/lang/String;)V

    invoke-virtual {p0}, Lv1;->t()V

    return-void
.end method

.method public final t()V
    .registers 3

    invoke-virtual {p0}, Lv1;->y()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, p0, Lno7;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->u()Lm9c;

    move-result-object v0

    invoke-virtual {p0}, Lv1;->x()Ljava/lang/String;

    move-result-object p0

    iget-object v0, v0, Lm9c;->b:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "ab_group"

    invoke-static {v0, v1, p0}, Lcom/appsflyer/internal/j;->c(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final v()Lr1;
    .registers 9

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    sget-object v0, Lu1;->g:Ls1;

    iget-object p0, p0, Lv1;->k:Lu1;

    iget-object v0, p0, Lu1;->b:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ls1;

    const/4 v1, 0x0

    if-eqz v0, :cond_22

    iget-boolean v2, v0, Ls1;->b:Z

    if-eqz v2, :cond_22

    invoke-virtual {p0, v0}, Lu1;->a(Ls1;)Ljava/lang/String;

    move-result-object p0

    const-string v2, "cc_new_start_page_test"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_23

    :cond_22
    move-object v0, v1

    :cond_23
    if-eqz v0, :cond_29

    iget-object p0, v0, Ls1;->c:Ljava/util/HashMap;

    if-nez p0, :cond_2a

    :cond_29
    return-object v1

    :cond_2a
    const-string v0, "default_wallpaper"

    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Ljava/lang/String;

    const-string v0, "focus_mode"

    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "large_omnibar"

    invoke-virtual {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v3, "show_omnibar_button_strip"

    invoke-virtual {p0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "hide_opera_logo_by_default"

    invoke-virtual {p0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string v5, "enable_weather_widget"

    invoke-virtual {p0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    move-object v5, v1

    new-instance v1, Lr1;

    const-string v6, "1"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v6, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    move v6, v4

    move v4, v5

    move v5, v3

    move v3, v0

    invoke-direct/range {v1 .. v7}, Lr1;-><init>(Ljava/lang/String;ZZZZZ)V

    return-object v1
.end method

.method public final x()Ljava/lang/String;
    .registers 3

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    iget-object p0, p0, Lv1;->k:Lu1;

    iget-object v0, p0, Lu1;->d:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_14

    return-object v0

    :cond_14
    iget-object p0, p0, Lu1;->b:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ls1;

    const-string v0, ""

    if-eqz p0, :cond_23

    iget-object p0, p0, Ls1;->a:Ljava/lang/String;

    goto :goto_24

    :cond_23
    move-object p0, v0

    :goto_24
    sget-object v1, Laik;->a:[Ljava/lang/String;

    if-nez p0, :cond_29

    return-object v0

    :cond_29
    return-object p0
.end method

.method public final y()Z
    .registers 3

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    iget-object p0, p0, Lv1;->k:Lu1;

    iget-object v0, p0, Lu1;->d:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_36

    iget-object v0, p0, Lu1;->c:Lv1;

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lq1;

    iget-boolean v0, v0, Lq1;->e:Z

    if-eqz v0, :cond_21

    const/4 v0, 0x0

    goto :goto_36

    :cond_21
    iget-object p0, p0, Lu1;->b:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ls1;

    const-string v0, ""

    if-eqz p0, :cond_30

    iget-object p0, p0, Ls1;->a:Ljava/lang/String;

    goto :goto_31

    :cond_30
    move-object p0, v0

    :goto_31
    sget-object v1, Laik;->a:[Ljava/lang/String;

    if-eqz p0, :cond_36

    move-object v0, p0

    :cond_36
    :goto_36
    if-eqz v0, :cond_3a

    const/4 p0, 0x1

    return p0

    :cond_3a
    const/4 p0, 0x0

    return p0
.end method
