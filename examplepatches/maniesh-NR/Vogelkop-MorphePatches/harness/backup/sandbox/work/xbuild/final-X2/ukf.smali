.class public final Lukf;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Ljava/util/regex/Pattern;


# instance fields
.field public final a:Lb59;

.field public final b:Lay;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "\t"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lukf;->c:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lvml;->d:Lumi;

    const/4 v1, 0x0

    new-array v1, v1, [Lbg1;

    const-string v2, "ads_opera_gb"

    invoke-static {p1, v0, v2, v1}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lukf;->a:Lb59;

    new-instance p1, Lay;

    const/16 v1, 0x9

    invoke-direct {p1, p0, v1}, Lay;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, v0}, Lcom/opera/android/Lazy;->e(Lcom/opera/android/Lazy;Lumi;)V

    iput-object p1, p0, Lukf;->b:Lay;

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/ArrayList;)V
    .registers 11

    iget-object v0, p0, Lukf;->a:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "opera_gb_events_version"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_75

    const/4 v2, -0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v2, v1, :cond_76

    const-string v1, "opera_gb_events_data"

    const/4 v3, 0x0

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_75

    const-string v1, "\n"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v1, v0

    add-int/lit16 v1, v1, -0xc8

    const/4 v3, 0x0

    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    move v4, v1

    :goto_34
    array-length v5, v0

    if-ge v4, v5, :cond_6a

    :try_start_37
    aget-object v5, v0, v4

    sget-object v6, Lukf;->c:Ljava/util/regex/Pattern;

    invoke-static {v5, v6}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/util/regex/Pattern;)[Ljava/lang/String;

    move-result-object v5

    array-length v6, v5

    const/4 v7, 0x3

    if-ne v6, v7, :cond_5d

    aget-object v6, v5, v3

    aget-object v7, v5, v2

    const/4 v8, 0x2

    aget-object v5, v5, v8

    new-instance v8, Ltkf;

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-direct {v8, v6, v7, v5}, Ltkf;-><init>(Ljava/lang/String;II)V

    invoke-virtual {p1, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_34

    :cond_5d
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "invalid gb stats item text"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_65
    .catch Ljava/lang/IllegalArgumentException; {:try_start_37 .. :try_end_65} :catch_65

    :catch_65
    move-exception p0

    invoke-static {p0}, Lt3p;->r(Ljava/lang/Throwable;)V

    return-void

    :cond_6a
    if-lez v1, :cond_75

    new-instance p1, Lvdf;

    const/4 v0, 0x5

    invoke-direct {p1, p0, v0}, Lvdf;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_75
    return-void

    :cond_76
    const-string p0, "gbs version error"

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    return-void
.end method

.method public final b(Lgu9;I)V
    .registers 7

    iget-object v0, p1, Lyz;->n:Luz;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lukf;->b:Lay;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iget-object p1, p1, Lyz;->n:Luz;

    iget-object p1, p1, Luz;->c:Ljava/lang/String;

    const/4 v1, 0x0

    move v2, v1

    :goto_13
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_2a

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ltkf;

    iget-object v3, v3, Ltkf;->a:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2b

    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    :cond_2a
    const/4 v2, -0x1

    :cond_2b
    if-ltz v2, :cond_34

    invoke-interface {v0, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ltkf;

    goto :goto_3a

    :cond_34
    new-instance v2, Ltkf;

    invoke-direct {v2, p1, v1, v1}, Ltkf;-><init>(Ljava/lang/String;II)V

    move-object p1, v2

    :goto_3a
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p2}, Lvep;->A(I)I

    move-result p2

    const/4 v2, 0x1

    if-eqz p2, :cond_4c

    if-ne p2, v2, :cond_51

    iget p2, p1, Ltkf;->c:I

    add-int/2addr p2, v2

    iput p2, p1, Ltkf;->c:I

    goto :goto_51

    :cond_4c
    iget p2, p1, Ltkf;->b:I

    add-int/2addr p2, v2

    iput p2, p1, Ltkf;->b:I

    :cond_51
    :goto_51
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p2

    const/16 v2, 0xc8

    if-lt p2, v2, :cond_66

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p2

    add-int/lit16 p2, p2, -0xc7

    invoke-interface {v0, v1, p2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->clear()V

    :cond_66
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lukf;->c()V

    return-void
.end method

.method public final c()V
    .registers 4

    iget-object v0, p0, Lukf;->a:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "opera_gb_events_version"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object p0, p0, Lukf;->b:Lay;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    const-string v1, "\n"

    invoke-static {v1, p0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "opera_gb_events_data"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method
