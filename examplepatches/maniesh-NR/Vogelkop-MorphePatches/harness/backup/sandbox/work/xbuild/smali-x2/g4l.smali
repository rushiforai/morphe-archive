.class public final Lg4l;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lpde;

.field public final b:Lc9l;

.field public final c:Lc4l;

.field public final d:Lpde;

.field public final e:Lz77;

.field public final f:Lj1k;

.field public final g:Lbp3;

.field public final h:Ltn;

.field public final i:Lpde;

.field public final j:Ljava/util/ArrayList;

.field public k:Z

.field public l:Lbz0;

.field public m:Z

.field public n:F

.field public o:La4l;

.field public p:Z


# direct methods
.method public constructor <init>(Lpde;Lpde;Lr9l;Lc9l;Lpde;Lc9l;Lc4l;Lpde;Lz77;Lj1k;)V
    .registers 20

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p5, p0, Lg4l;->a:Lpde;

    iput-object p6, p0, Lg4l;->b:Lc9l;

    iput-object v7, p0, Lg4l;->c:Lc4l;

    iput-object v8, p0, Lg4l;->d:Lpde;

    move-object/from16 v0, p9

    iput-object v0, p0, Lg4l;->e:Lz77;

    move-object/from16 v0, p10

    iput-object v0, p0, Lg4l;->f:Lj1k;

    new-instance v0, Lbp3;

    iget-object v3, v7, Lc4l;->d:Lzg;

    new-instance v4, Ld4l;

    const/4 v1, 0x3

    invoke-direct {v4, p0, v1}, Ld4l;-><init>(Lg4l;B)V

    new-instance v5, Ld4l;

    const/4 v1, 0x4

    invoke-direct {v5, p0, v1}, Ld4l;-><init>(Lg4l;B)V

    new-instance v6, Ld4l;

    const/4 v1, 0x5

    invoke-direct {v6, p0, v1}, Ld4l;-><init>(Lg4l;B)V

    move-object v1, p3

    move-object v2, p6

    invoke-direct/range {v0 .. v6}, Lbp3;-><init>(Lr9l;Lc9l;Lzg;Ld4l;Ld4l;Ld4l;)V

    iput-object v0, p0, Lg4l;->g:Lbp3;

    new-instance p3, Ltn;

    iget-object v0, v7, Lc4l;->e:Lwci;

    const/4 v1, 0x0

    invoke-direct {p3, v1, v0, p4, p6}, Ltn;-><init>(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object p3, p0, Lg4l;->h:Ltn;

    new-instance p3, Lpde;

    sget-object p4, La4l;->c:La4l;

    invoke-direct {p3, p4}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p3, p0, Lg4l;->i:Lpde;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lg4l;->j:Ljava/util/ArrayList;

    invoke-virtual {v8}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->floatValue()F

    move-result v2

    iput v2, p0, Lg4l;->n:F

    iput-object p4, p0, Lg4l;->o:La4l;

    new-instance p4, Llqh;

    invoke-direct {p4}, Ljava/lang/Object;-><init>()V

    new-instance v2, Lwj;

    const/16 v3, 0x9

    invoke-direct {v2, p4, p0, v3}, Lwj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p1, p2, v2}, La26;->T(Lekc;Likc;Lf7f;)V

    iget-object p1, v0, Lwci;->b:Ljava/lang/Object;

    check-cast p1, Lnw3;

    iget-object p1, p1, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    iget-object p1, p1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string p4, "tab_gallery.tabui2_selection_menu_hint_bubble_shown"

    invoke-interface {p1, p4, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-nez p1, :cond_87

    new-instance p1, Le4l;

    invoke-direct {p1, p0, v1}, Le4l;-><init>(Lg4l;B)V

    invoke-static {p5, p2, p1}, La26;->T(Lekc;Likc;Lf7f;)V

    :cond_87
    new-instance p1, Le4l;

    const/4 p4, 0x1

    invoke-direct {p1, p0, p4}, Le4l;-><init>(Lg4l;B)V

    invoke-static {p3, p2, p1}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p1, Lw4i;

    const/16 p3, 0x15

    invoke-direct {p1, p0, p3}, Lw4i;-><init>(Ljava/lang/Object;B)V

    invoke-static {v8, p2, p1}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method

.method public static a(Lg4l;Luz3;I)V
    .registers 4

    sget-object v0, Lf4l;->a:Lf4l;

    and-int/lit8 p2, p2, 0x2

    if-eqz p2, :cond_7

    const/4 p1, 0x0

    :cond_7
    iget-object p2, p0, Lg4l;->j:Ljava/util/ArrayList;

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance p2, Leek;

    const/4 v0, 0x7

    invoke-direct {p2, p0, p1, v0}, Leek;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, p2}, Lg4l;->d(Lkotlin/jvm/functions/Function0;)V

    return-void
.end method

.method public static e(Lg4l;)V
    .registers 3

    sget-object v0, Lf4l;->a:Lf4l;

    iget-object v1, p0, Lg4l;->j:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    new-instance v0, Ld4l;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Ld4l;-><init>(Lg4l;B)V

    invoke-virtual {p0, v0}, Lg4l;->d(Lkotlin/jvm/functions/Function0;)V

    return-void
.end method


# virtual methods
.method public final b(Z)Z
    .registers 6

    iget-object v0, p0, Lg4l;->d:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    const/4 v1, 0x0

    if-gtz v0, :cond_42

    iget-boolean v0, p0, Lg4l;->k:Z

    if-nez v0, :cond_42

    iget-boolean v0, p0, Lg4l;->m:Z

    if-nez v0, :cond_42

    iget-object p0, p0, Lg4l;->j:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_40

    if-eqz p1, :cond_42

    if-eqz p0, :cond_2c

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_40

    :cond_2c
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    move v0, v1

    :cond_31
    if-ge v0, p1, :cond_40

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v0, v0, 0x1

    check-cast v2, Lf4l;

    sget-object v3, Lf4l;->b:Lf4l;

    if-eq v2, v3, :cond_31

    goto :goto_42

    :cond_40
    const/4 p0, 0x1

    return p0

    :cond_42
    :goto_42
    return v1
.end method

.method public final c()V
    .registers 14

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lg4l;->b(Z)Z

    move-result v1

    if-eqz v1, :cond_13d

    iget-object v1, p0, Lg4l;->i:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, La4l;

    iget-object v3, p0, Lg4l;->c:Lc4l;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v4, v3, Lc4l;->a:Lnw3;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    const/4 v5, 0x2

    const/4 v6, 0x1

    if-eqz v2, :cond_8e

    if-eq v2, v6, :cond_8e

    if-eq v2, v5, :cond_29

    const/4 v3, 0x3

    if-eq v2, v3, :cond_8e

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_29
    iget-object v2, v4, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-static {v2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v2

    iget-object v2, v2, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v7, "tab_gallery.installed_with_tabui2"

    invoke-interface {v2, v7, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    const-string v7, "tab_gallery.tabui2_bubble_tour_shown"

    const-string v8, "tab_gallery.tabui2_upgrade_dialog_shown"

    if-nez v2, :cond_5c

    iget-object v2, v4, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-static {v2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v2

    iget-object v2, v2, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {v2, v8, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_5c

    iget-object v2, v4, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-static {v2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v2

    iget-object v2, v2, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {v2, v7, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_5c

    sget-object v2, Lb4l;->a:Lb4l;

    goto :goto_90

    :cond_5c
    iget-object v2, v3, Lc4l;->b:Lnw3;

    iget-object v2, v2, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v2

    const-string v3, "feature_tips_notification"

    invoke-virtual {v2, v3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8b

    iget-object v2, v4, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-static {v2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v2

    iget-object v2, v2, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {v2, v8, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_8b

    iget-object v2, v4, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-static {v2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v2

    iget-object v2, v2, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {v2, v7, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_8b

    sget-object v2, Lb4l;->b:Lb4l;

    goto :goto_90

    :cond_8b
    sget-object v2, Lb4l;->c:Lb4l;

    goto :goto_90

    :cond_8e
    sget-object v2, Lb4l;->b:Lb4l;

    :goto_90
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    if-eqz v2, :cond_11f

    if-eq v2, v6, :cond_a4

    if-ne v2, v5, :cond_a0

    sget-object p0, La4l;->c:La4l;

    invoke-static {v1, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void

    :cond_a0
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_a4
    iput-boolean v6, p0, Lg4l;->m:Z

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    sget-object v2, La4l;->d:La4l;

    const/4 v3, 0x0

    iget-object v9, p0, Lg4l;->g:Lbp3;

    if-ne v1, v2, :cond_bd

    iget-object p0, v9, Lbp3;->j:Ljava/lang/Object;

    check-cast p0, Lsz3;

    if-eqz p0, :cond_13d

    iput-object v3, v9, Lbp3;->j:Ljava/lang/Object;

    invoke-virtual {p0}, Lsz3;->invoke()Ljava/lang/Object;

    return-void

    :cond_bd
    iget-object p0, v9, Lbp3;->e:Ljava/lang/Object;

    move-object v8, p0

    check-cast v8, Lzg;

    iget-object p0, v8, Lzg;->d:Ljava/lang/Object;

    check-cast p0, Luz3;

    if-nez p0, :cond_ca

    const/4 p0, -0x1

    goto :goto_d0

    :cond_ca
    sget-object v1, Luz3;->j:Lh58;

    invoke-virtual {v1, p0}, Lh58;->indexOf(Ljava/lang/Object;)I

    move-result p0

    :goto_d0
    sget-object v1, Luz3;->j:Lh58;

    add-int/2addr p0, v6

    invoke-virtual {v1}, La4;->d()I

    move-result v2

    if-ge p0, v2, :cond_da

    move v0, p0

    :cond_da
    invoke-virtual {v1}, La4;->d()I

    move-result p0

    invoke-virtual {v1, v0, p0}, Lz4;->subList(II)Ljava/util/List;

    move-result-object p0

    check-cast p0, Ljava/util/Collection;

    check-cast p0, Ljava/lang/Iterable;

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_ef
    :goto_ef
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_10c

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Luz3;

    iget-object v1, v9, Lbp3;->c:Ljava/lang/Object;

    check-cast v1, Lr9l;

    invoke-virtual {v1, v0}, Lr9l;->e(Luz3;)Landroid/view/View;

    move-result-object v1

    if-nez v1, :cond_106

    move-object v0, v3

    :cond_106
    if-eqz v0, :cond_ef

    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_ef

    :cond_10c
    new-instance v7, Ltz3;

    iget p0, v8, Lzg;->a:I

    add-int/lit8 v11, p0, 0x1

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int v12, v0, p0

    invoke-direct/range {v7 .. v12}, Ltz3;-><init>(Lzg;Lbp3;Ljava/util/List;II)V

    invoke-virtual {v7}, Ltz3;->c()V

    return-void

    :cond_11f
    iput-boolean v6, p0, Lg4l;->k:Z

    new-instance v0, Lh4l;

    iget-object v1, p0, Lg4l;->f:Lj1k;

    invoke-virtual {v1}, Lj1k;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    new-instance v2, Ltvk;

    invoke-direct {v2, p0}, Ltvk;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lh4l;-><init>(Landroid/content/Context;Ltvk;)V

    iget-object p0, p0, Lg4l;->e:Lz77;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lijm;->b:Lijm;

    invoke-virtual {p0, v0, v1}, Lr22;->b(Ljjm;Lijm;)V

    :cond_13d
    return-void
.end method

.method public final d(Lkotlin/jvm/functions/Function0;)V
    .registers 4

    iget-object p0, p0, Lg4l;->b:Lc9l;

    iget-object p0, p0, Lc9l;->b:Lr9l;

    iget-object p0, p0, Lr9l;->p:Li03;

    new-instance v0, Ll31;

    const/4 v1, 0x6

    invoke-direct {v0, p1, v1}, Ll31;-><init>(Lkotlin/jvm/functions/Function0;B)V

    invoke-virtual {p0, v0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void
.end method
