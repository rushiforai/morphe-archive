.class public Lurj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/tasks/OnFailureListener;
.implements Lm2k;
.implements Lf06;
.implements Lylo;
.implements Lk2m;
.implements Lee5;


# static fields
.field public static b:Lurj;

.field public static c:Lurj;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 8
    iput-byte p1, p0, Lurj;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lqro;)V
    .registers 2

    const/16 p1, 0xb

    iput-byte p1, p0, Lurj;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static b(Lcom/google/android/material/tabs/TabLayout;Landroid/view/View;)Landroid/graphics/RectF;
    .registers 13

    if-nez p1, :cond_8

    new-instance p0, Landroid/graphics/RectF;

    invoke-direct {p0}, Landroid/graphics/RectF;-><init>()V

    return-object p0

    :cond_8
    iget-boolean p0, p0, Lcom/google/android/material/tabs/TabLayout;->C:Z

    if-nez p0, :cond_c9

    instance-of p0, p1, Lo5l;

    if-eqz p0, :cond_c9

    check-cast p1, Lo5l;

    iget-object p0, p1, Lo5l;->b:Landroid/widget/TextView;

    iget-object v0, p1, Lo5l;->c:Landroid/widget/ImageView;

    iget-object v1, p1, Lo5l;->d:Landroid/view/View;

    const/4 v2, 0x3

    new-array v3, v2, [Landroid/view/View;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    const/4 p0, 0x1

    aput-object v0, v3, p0

    const/4 v0, 0x2

    aput-object v1, v3, v0

    move v1, v4

    move v5, v1

    move v6, v5

    move v7, v6

    :goto_28
    if-ge v1, v2, :cond_56

    aget-object v8, v3, v1

    if-eqz v8, :cond_53

    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    move-result v9

    if-nez v9, :cond_53

    if-eqz v7, :cond_47

    invoke-virtual {v8}, Landroid/view/View;->getLeft()I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    invoke-virtual {v8}, Landroid/view/View;->getRight()I

    move-result v7

    invoke-static {v5, v7}, Ljava/lang/Math;->max(II)I

    move-result v5

    goto :goto_52

    :cond_47
    invoke-virtual {v8}, Landroid/view/View;->getLeft()I

    move-result v5

    invoke-virtual {v8}, Landroid/view/View;->getRight()I

    move-result v6

    move v10, v6

    move v6, v5

    move v5, v10

    :goto_52
    move v7, p0

    :cond_53
    add-int/lit8 v1, v1, 0x1

    goto :goto_28

    :cond_56
    sub-int/2addr v5, v6

    iget-object v1, p1, Lo5l;->b:Landroid/widget/TextView;

    iget-object v3, p1, Lo5l;->c:Landroid/widget/ImageView;

    iget-object v6, p1, Lo5l;->d:Landroid/view/View;

    new-array v7, v2, [Landroid/view/View;

    aput-object v1, v7, v4

    aput-object v3, v7, p0

    aput-object v6, v7, v0

    move v1, v4

    move v3, v1

    move v6, v3

    :goto_68
    if-ge v4, v2, :cond_93

    aget-object v8, v7, v4

    if-eqz v8, :cond_90

    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    move-result v9

    if-nez v9, :cond_90

    if-eqz v6, :cond_87

    invoke-virtual {v8}, Landroid/view/View;->getTop()I

    move-result v6

    invoke-static {v3, v6}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-virtual {v8}, Landroid/view/View;->getBottom()I

    move-result v6

    invoke-static {v1, v6}, Ljava/lang/Math;->max(II)I

    move-result v1

    goto :goto_8f

    :cond_87
    invoke-virtual {v8}, Landroid/view/View;->getTop()I

    move-result v3

    invoke-virtual {v8}, Landroid/view/View;->getBottom()I

    move-result v1

    :goto_8f
    move v6, p0

    :cond_90
    add-int/lit8 v4, v4, 0x1

    goto :goto_68

    :cond_93
    sub-int/2addr v1, v3

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const/16 v2, 0x18

    invoke-static {v2, p0}, Lhn9;->i(ILandroid/content/Context;)F

    move-result p0

    float-to-int p0, p0

    if-ge v5, p0, :cond_a2

    move v5, p0

    :cond_a2
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result p0

    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v2

    add-int/2addr v2, p0

    div-int/2addr v2, v0

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p0

    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result p1

    add-int/2addr p1, p0

    div-int/2addr p1, v0

    div-int/2addr v5, v0

    sub-int p0, v2, v5

    div-int/2addr v1, v0

    sub-int v1, p1, v1

    add-int/2addr v5, v2

    div-int/2addr v2, v0

    add-int/2addr v2, p1

    new-instance p1, Landroid/graphics/RectF;

    int-to-float p0, p0

    int-to-float v0, v1

    int-to-float v1, v5

    int-to-float v2, v2

    invoke-direct {p1, p0, v0, v1, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object p1

    :cond_c9
    new-instance p0, Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result p1

    int-to-float p1, p1

    invoke-direct {p0, v0, v1, v2, p1}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object p0
.end method

.method public static g(Ljava/lang/String;Ljava/util/Map;)Ljava/util/Set;
    .registers 5

    const/4 v0, 0x6

    const/16 v1, 0x5b

    const/4 v2, 0x0

    invoke-static {p0, v1, v2, v0}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v0

    if-ltz v0, :cond_13

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p1}, Lurj;->g(Ljava/lang/String;Ljava/util/Map;)Ljava/util/Set;

    move-result-object p0

    return-object p0

    :cond_13
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-eqz v1, :cond_3f

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_27
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3f

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lajk;

    iget-object v1, v1, Lajk;->b:Ljava/lang/String;

    invoke-static {v1, p1}, Lurj;->g(Ljava/lang/String;Ljava/util/Map;)Ljava/util/Set;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v1, v0}, Lo95;->t(Ljava/lang/Iterable;Ljava/util/Collection;)V

    goto :goto_27

    :cond_3f
    return-object v0
.end method

.method public static h(Lqrm;)Ldtm;
    .registers 2

    instance-of v0, p0, Lswg;

    if-eqz v0, :cond_7

    sget-object p0, Ldtm;->c:Ldtm;

    return-object p0

    :cond_7
    instance-of v0, p0, Lewa;

    if-eqz v0, :cond_e

    sget-object p0, Ldtm;->d:Ldtm;

    return-object p0

    :cond_e
    instance-of v0, p0, Lqva;

    if-eqz v0, :cond_15

    sget-object p0, Ldtm;->e:Ldtm;

    return-object p0

    :cond_15
    invoke-static {p0}, Lz7h;->t(Lqrm;)Z

    move-result v0

    if-eqz v0, :cond_1e

    sget-object p0, Ldtm;->f:Ldtm;

    return-object p0

    :cond_1e
    instance-of p0, p0, Lfgk;

    if-eqz p0, :cond_25

    sget-object p0, Ldtm;->g:Ldtm;

    return-object p0

    :cond_25
    sget-object p0, Ldtm;->h:Ldtm;

    return-object p0
.end method

.method public static i()Lurj;
    .registers 2

    sget-object v0, Lurj;->b:Lurj;

    if-nez v0, :cond_c

    new-instance v0, Lurj;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lurj;-><init>(B)V

    sput-object v0, Lurj;->b:Lurj;

    :cond_c
    return-object v0
.end method

.method public static j(J)Z
    .registers 5

    invoke-static {}, Ljava/time/Clock;->systemUTC()Ljava/time/Clock;

    move-result-object v0

    const/4 v1, 0x0

    sget-object v2, Ljava/time/ZoneOffset;->UTC:Ljava/time/ZoneOffset;

    invoke-static {p0, p1, v1, v2}, Ljava/time/LocalDateTime;->ofEpochSecond(JILjava/time/ZoneOffset;)Ljava/time/LocalDateTime;

    move-result-object p0

    invoke-static {v0}, Ljava/time/LocalDate;->now(Ljava/time/Clock;)Ljava/time/LocalDate;

    move-result-object p1

    invoke-virtual {p1}, Ljava/time/LocalDate;->atStartOfDay()Ljava/time/LocalDateTime;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/time/LocalDateTime;->isBefore(Ljava/time/chrono/ChronoLocalDateTime;)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public final synthetic a()Ljava/lang/Object;
    .registers 2

    new-instance p0, Ligp;

    const-string v0, "StandardIntegrity"

    invoke-direct {p0, v0}, Ligp;-><init>(Ljava/lang/String;)V

    return-object p0
.end method

.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Lcom/google/android/gms/internal/play_billing/zzkr;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/play_billing/zzer;->zzQ()[B

    move-result-object p0

    return-object p0
.end method

.method public final c(Ljava/lang/String;Ljava/util/Map;Lkotlinx/serialization/json/c;)Ljava/lang/String;
    .registers 16

    invoke-static {p1, p2}, Lurj;->g(Ljava/lang/String;Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    invoke-static {v0, p1}, Lb5j;->c(Ljava/util/Set;Ljava/lang/Object;)Ljava/util/LinkedHashSet;

    move-result-object v0

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->b0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0, v1}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_28
    if-ge v3, v2, :cond_66

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v5, 0x28

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-interface {p2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_5f

    check-cast v4, Ljava/util/List;

    move-object v5, v4

    check-cast v5, Ljava/lang/Iterable;

    new-instance v10, Lr4k;

    const/4 v4, 0x7

    invoke-direct {v10, v4}, Lr4k;-><init>(B)V

    const/16 v11, 0x1e

    const-string v6, ","

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static/range {v5 .. v11}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v4, 0x29

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_28

    :cond_5f
    const-string p0, "Required value was null."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_66
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    invoke-static {v0}, Laib;->J([B)[B

    move-result-object v0

    const/16 v1, 0x20

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Ly1;

    new-instance v3, Le2;

    invoke-direct {v3, v1}, Le2;-><init>(Ljava/lang/Integer;)V

    invoke-direct {v2, v3, v0}, Ly1;-><init>(Ll2;Ljava/lang/Object;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ltvk;

    new-instance v3, Loji;

    invoke-direct {v3, p2}, Loji;-><init>(Ljava/lang/Object;)V

    invoke-direct {v1, v3}, Ltvk;-><init>(Ljava/lang/Object;)V

    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-nez p1, :cond_9d

    sget-object p1, Ll08;->a:Ll08;

    :cond_9d
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_a1
    :goto_a1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_db

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lajk;

    iget-object v4, v3, Lajk;->a:Ljava/lang/String;

    iget-object v3, v3, Lajk;->b:Ljava/lang/String;

    invoke-virtual {p3, v4}, Lkotlinx/serialization/json/c;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lkotlinx/serialization/json/b;

    if-eqz v4, :cond_a1

    :try_start_b9
    sget-object v5, Ll2;->a:Lf2;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v5, Lf2;->c:Ltvk;

    invoke-virtual {v5, v3}, Ltvk;->p(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ll2;

    new-instance v6, Lejk;

    invoke-direct {v6, v5}, Lejk;-><init>(Ll2;)V
    :try_end_cb
    .catch Ljava/lang/IllegalArgumentException; {:try_start_b9 .. :try_end_cb} :catch_cc

    goto :goto_d3

    :catch_cc
    invoke-virtual {v1, v3}, Ltvk;->p(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Lhjk;

    :goto_d3
    invoke-virtual {p0, v6, p2, v4}, Lurj;->f(Lhjk;Ljava/util/Map;Lkotlinx/serialization/json/b;)Ly1;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_a1

    :cond_db
    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    check-cast p0, Ljava/util/Collection;

    invoke-static {v0, p0}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-static {p0}, Ly4h;->f(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final d(Lfjk;Ljava/util/Map;Lkotlinx/serialization/json/b;)Ly1;
    .registers 8

    iget-object v0, p1, Lfjk;->a:Lhjk;

    iget-object p1, p1, Lfjk;->b:Ljava/lang/Integer;

    invoke-static {p3}, Lqqb;->g(Lkotlinx/serialization/json/b;)Lkotlinx/serialization/json/a;

    move-result-object p3

    iget-object p3, p3, Lkotlinx/serialization/json/a;->a:Ljava/util/List;

    if-eqz p1, :cond_1d

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-eq p1, v1, :cond_1d

    const-string p0, "Failed requirement."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_1d
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_27
    if-ge v2, v1, :cond_39

    invoke-interface {p3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lkotlinx/serialization/json/b;

    invoke-virtual {p0, v0, p2, v3}, Lurj;->f(Lhjk;Ljava/util/Map;Lkotlinx/serialization/json/b;)Ly1;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_27

    :cond_39
    invoke-static {p1}, Ly4h;->f(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lnaa;->c(Ljava/lang/String;)[B

    move-result-object p0

    invoke-static {p0}, Laib;->J([B)[B

    move-result-object p0

    const/16 p1, 0x20

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    new-instance p2, Ly1;

    new-instance p3, Le2;

    invoke-direct {p3, p1}, Le2;-><init>(Ljava/lang/Integer;)V

    invoke-direct {p2, p3, p0}, Ly1;-><init>(Ll2;Ljava/lang/Object;)V

    return-object p2
.end method

.method public final e(J)J
    .registers 3

    return-wide p1
.end method

.method public final f(Lhjk;Ljava/util/Map;Lkotlinx/serialization/json/b;)Ly1;
    .registers 9

    const/16 v0, 0x20

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    instance-of v1, p1, Lejk;

    const/4 v2, 0x0

    if-eqz v1, :cond_147

    check-cast p1, Lejk;

    iget-object p1, p1, Lejk;->a:Ll2;

    instance-of v1, p1, La2;

    if-eqz v1, :cond_2c

    sget-object p0, Lwv;->Companion:Luv;

    invoke-static {p3}, Lqqb;->i(Lkotlinx/serialization/json/b;)Lkotlinx/serialization/json/d;

    move-result-object p1

    invoke-static {p1}, Lz5i;->L(Lkotlinx/serialization/json/d;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Luv;->b(Ljava/lang/String;)Lwv;

    move-result-object p0

    new-instance p1, Ly1;

    sget-object p2, La2;->b:La2;

    invoke-direct {p1, p2, p0}, Ly1;-><init>(Ll2;Ljava/lang/Object;)V

    return-object p1

    :cond_2c
    instance-of v1, p1, Lb2;

    if-eqz v1, :cond_45

    check-cast p1, Lb2;

    new-instance v0, Lfjk;

    new-instance v1, Lejk;

    iget-object v2, p1, Lb2;->b:Ll2;

    invoke-direct {v1, v2}, Lejk;-><init>(Ll2;)V

    iget-object p1, p1, Lb2;->c:Ljava/lang/Integer;

    invoke-direct {v0, v1, p1}, Lfjk;-><init>(Lhjk;Ljava/lang/Integer;)V

    invoke-virtual {p0, v0, p2, p3}, Lurj;->d(Lfjk;Ljava/util/Map;Lkotlinx/serialization/json/b;)Ly1;

    move-result-object p0

    return-object p0

    :cond_45
    instance-of p0, p1, Ld2;

    if-eqz p0, :cond_68

    new-instance p0, Ljava/math/BigInteger;

    invoke-static {p3}, Lqqb;->i(Lkotlinx/serialization/json/b;)Lkotlinx/serialization/json/d;

    move-result-object p1

    invoke-static {p1}, Lz5i;->L(Lkotlinx/serialization/json/d;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    sget-object p1, Lpe3;->b:Ljava/math/BigInteger;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    new-instance p1, Ly1;

    sget-object p2, Ld2;->b:Ld2;

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-direct {p1, p2, p0}, Ly1;-><init>(Ll2;Ljava/lang/Object;)V

    return-object p1

    :cond_68
    instance-of p0, p1, Le2;

    if-eqz p0, :cond_9c

    invoke-static {p3}, Lqqb;->i(Lkotlinx/serialization/json/b;)Lkotlinx/serialization/json/d;

    move-result-object p0

    invoke-static {p0}, Lz5i;->L(Lkotlinx/serialization/json/d;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lk1g;->N(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ly4h;->i(Ljava/lang/String;)[B

    move-result-object p0

    check-cast p1, Le2;

    iget-object p1, p1, Le2;->b:Ljava/lang/Integer;

    if-nez p1, :cond_91

    invoke-static {p0}, Laib;->J([B)[B

    move-result-object p0

    new-instance p1, Ly1;

    new-instance p2, Le2;

    invoke-direct {p2, v0}, Le2;-><init>(Ljava/lang/Integer;)V

    invoke-direct {p1, p2, p0}, Ly1;-><init>(Ll2;Ljava/lang/Object;)V

    return-object p1

    :cond_91
    new-instance p2, Ly1;

    new-instance p3, Le2;

    invoke-direct {p3, p1}, Le2;-><init>(Ljava/lang/Integer;)V

    invoke-direct {p2, p3, p0}, Ly1;-><init>(Ll2;Ljava/lang/Object;)V

    return-object p2

    :cond_9c
    instance-of p0, p1, Lh2;

    if-eqz p0, :cond_bd

    invoke-static {p3}, Lqqb;->i(Lkotlinx/serialization/json/b;)Lkotlinx/serialization/json/d;

    move-result-object p0

    invoke-static {p0}, Lz5i;->L(Lkotlinx/serialization/json/d;)Ljava/lang/String;

    move-result-object p0

    sget-object p1, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-static {p0, p1}, Lw1h;->z(Ljava/lang/String;Ljava/nio/charset/Charset;)[B

    move-result-object p0

    invoke-static {p0}, Laib;->J([B)[B

    move-result-object p0

    new-instance p1, Ly1;

    new-instance p2, Le2;

    invoke-direct {p2, v0}, Le2;-><init>(Ljava/lang/Integer;)V

    invoke-direct {p1, p2, p0}, Ly1;-><init>(Ll2;Ljava/lang/Object;)V

    return-object p1

    :cond_bd
    instance-of p0, p1, Lj2;

    if-nez p0, :cond_141

    instance-of p0, p1, Lk2;

    const/16 p2, 0x10

    const/4 v0, 0x2

    const/4 v1, 0x1

    const-string v3, "0x"

    const/16 v4, 0x100

    if-eqz p0, :cond_103

    invoke-static {p3}, Lqqb;->i(Lkotlinx/serialization/json/b;)Lkotlinx/serialization/json/d;

    move-result-object p0

    invoke-virtual {p0}, Lkotlinx/serialization/json/d;->b()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v3, v1}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p3

    if-eqz p3, :cond_e5

    new-instance p3, Ljava/math/BigInteger;

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p3, p0, p2}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    goto :goto_ea

    :cond_e5
    new-instance p3, Ljava/math/BigInteger;

    invoke-direct {p3, p0}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    :goto_ea
    check-cast p1, Lk2;

    iget-object p0, p1, Lk2;->d:Ljava/lang/Integer;

    if-eqz p0, :cond_f4

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    :cond_f4
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    new-instance p1, Ly1;

    new-instance p2, Lk2;

    invoke-direct {p2, p0}, Lk2;-><init>(Ljava/lang/Integer;)V

    invoke-direct {p1, p2, p3}, Ly1;-><init>(Ll2;Ljava/lang/Object;)V

    return-object p1

    :cond_103
    instance-of p0, p1, Lg2;

    if-eqz p0, :cond_13d

    invoke-static {p3}, Lqqb;->i(Lkotlinx/serialization/json/b;)Lkotlinx/serialization/json/d;

    move-result-object p0

    invoke-virtual {p0}, Lkotlinx/serialization/json/d;->b()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v3, v1}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p3

    if-eqz p3, :cond_11f

    new-instance p3, Ljava/math/BigInteger;

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p3, p0, p2}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    goto :goto_124

    :cond_11f
    new-instance p3, Ljava/math/BigInteger;

    invoke-direct {p3, p0}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    :goto_124
    check-cast p1, Lg2;

    iget-object p0, p1, Lg2;->d:Ljava/lang/Integer;

    if-eqz p0, :cond_12e

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    :cond_12e
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    new-instance p1, Ly1;

    new-instance p2, Lg2;

    invoke-direct {p2, p0}, Lg2;-><init>(Ljava/lang/Integer;)V

    invoke-direct {p1, p2, p3}, Ly1;-><init>(Ll2;Ljava/lang/Object;)V

    return-object p1

    :cond_13d
    invoke-static {}, Lh9o;->p()V

    return-object v2

    :cond_141
    const-string p0, "Tuples are not supported in EIP-712"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v2

    :cond_147
    instance-of v1, p1, Lfjk;

    if-eqz v1, :cond_152

    check-cast p1, Lfjk;

    invoke-virtual {p0, p1, p2, p3}, Lurj;->d(Lfjk;Ljava/util/Map;Lkotlinx/serialization/json/b;)Ly1;

    move-result-object p0

    return-object p0

    :cond_152
    instance-of v1, p1, Lgjk;

    if-eqz v1, :cond_175

    check-cast p1, Lgjk;

    iget-object p1, p1, Lgjk;->a:Ljava/lang/String;

    invoke-static {p3}, Lqqb;->h(Lkotlinx/serialization/json/b;)Lkotlinx/serialization/json/c;

    move-result-object p3

    invoke-virtual {p0, p1, p2, p3}, Lurj;->c(Ljava/lang/String;Ljava/util/Map;Lkotlinx/serialization/json/c;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lnaa;->c(Ljava/lang/String;)[B

    move-result-object p0

    invoke-static {p0}, Laib;->J([B)[B

    move-result-object p0

    new-instance p1, Ly1;

    new-instance p2, Le2;

    invoke-direct {p2, v0}, Le2;-><init>(Ljava/lang/Integer;)V

    invoke-direct {p1, p2, p0}, Ly1;-><init>(Ll2;Ljava/lang/Object;)V

    return-object p1

    :cond_175
    invoke-static {}, Lh9o;->p()V

    return-object v2
.end method

.method public k(Lcom/google/android/material/tabs/TabLayout;Landroid/view/View;Landroid/view/View;FLandroid/graphics/drawable/Drawable;)V
    .registers 6

    invoke-static {p1, p2}, Lurj;->b(Lcom/google/android/material/tabs/TabLayout;Landroid/view/View;)Landroid/graphics/RectF;

    move-result-object p0

    invoke-static {p1, p3}, Lurj;->b(Lcom/google/android/material/tabs/TabLayout;Landroid/view/View;)Landroid/graphics/RectF;

    move-result-object p1

    iget p2, p0, Landroid/graphics/RectF;->left:F

    float-to-int p2, p2

    iget p3, p1, Landroid/graphics/RectF;->left:F

    float-to-int p3, p3

    invoke-static {p4, p2, p3}, Lze1;->c(FII)I

    move-result p2

    invoke-virtual {p5}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object p3

    iget p3, p3, Landroid/graphics/Rect;->top:I

    iget p0, p0, Landroid/graphics/RectF;->right:F

    float-to-int p0, p0

    iget p1, p1, Landroid/graphics/RectF;->right:F

    float-to-int p1, p1

    invoke-static {p4, p0, p1}, Lze1;->c(FII)I

    move-result p0

    invoke-virtual {p5}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object p1

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p5, p2, p3, p0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    return-void
.end method

.method public final onFailure(Ljava/lang/Exception;)V
    .registers 2

    return-void
.end method

.method public final r(Lx79;)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lqdj;

    const-class v0, Landroid/content/Context;

    invoke-virtual {p1, v0}, Lx79;->a(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/Context;

    invoke-direct {p0, p1}, Lqdj;-><init>(Landroid/content/Context;)V

    return-object p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 5

    iget-byte v0, p0, Lurj;->a:B

    packed-switch v0, :pswitch_data_2e

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    const/16 v0, 0x10

    invoke-static {v0}, Lkotlin/text/CharsKt;->checkRadix(I)I

    move-result v0

    invoke-static {p0, v0}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object p0

    const-class v0, Landroid/app/Application;

    invoke-static {v0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    invoke-virtual {v0}, Ls15;->c()Ljava/lang/String;

    move-result-object v0

    const-string v1, "<"

    const-string v2, ">"

    const-string v3, "CreationExtras.Key@"

    invoke-static {v3, p0, v1, v0, v2}, Lsko;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_2e
    .packed-switch 0x8
        :pswitch_a
    .end packed-switch
.end method
