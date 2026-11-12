.class public final Lzi9;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final g:J


# instance fields
.field public final a:Llsf;

.field public final b:Lrs6;

.field public final c:Lode;

.field public d:Ljava/util/Set;

.field public final e:Ljdj;

.field public final f:Ljdj;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/4 v0, 0x1

    sget-object v1, Lun7;->h:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lzi9;->g:J

    return-void
.end method

.method public constructor <init>(Llsf;Lrs6;Lode;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzi9;->a:Llsf;

    iput-object p2, p0, Lzi9;->b:Lrs6;

    iput-object p3, p0, Lzi9;->c:Lode;

    sget-object p1, Lv08;->a:Lv08;

    iput-object p1, p0, Lzi9;->d:Ljava/util/Set;

    const/4 p1, 0x0

    const/4 p2, 0x6

    const/4 p3, 0x1

    const/4 v0, 0x0

    invoke-static {p3, v0, p1, p2}, Lipe;->c(IILh04;I)Ljdj;

    move-result-object p1

    iput-object p1, p0, Lzi9;->e:Ljdj;

    iput-object p1, p0, Lzi9;->f:Ljdj;

    return-void
.end method


# virtual methods
.method public final a(JLnt5;)Ljava/io/Serializable;
    .registers 24

    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    move-object/from16 v3, p3

    instance-of v4, v3, Lxi9;

    if-eqz v4, :cond_1a

    move-object v4, v3

    check-cast v4, Lxi9;

    iget v5, v4, Lxi9;->x:I

    const/high16 v6, -0x80000000

    and-int v7, v5, v6

    if-eqz v7, :cond_1a

    sub-int/2addr v5, v6

    iput v5, v4, Lxi9;->x:I

    :goto_18
    move-object v8, v4

    goto :goto_20

    :cond_1a
    new-instance v4, Lxi9;

    invoke-direct {v4, v0, v3}, Lxi9;-><init>(Lzi9;Lnt5;)V

    goto :goto_18

    :goto_20
    iget-object v3, v8, Lxi9;->v:Ljava/lang/Object;

    sget-object v9, Lpx5;->a:Lpx5;

    iget v4, v8, Lxi9;->x:I

    const-string v10, "fetch_timestamp_team_"

    iget-object v11, v0, Lzi9;->b:Lrs6;

    const/4 v12, 0x1

    if-eqz v4, :cond_46

    if-ne v4, v12, :cond_3f

    iget-wide v0, v8, Lxi9;->u:J

    iget-wide v4, v8, Lxi9;->t:J

    invoke-static {v3}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v3, Lt0i;

    iget-object v2, v3, Lt0i;->a:Ljava/lang/Object;

    move-object/from16 p3, v10

    move-object v15, v11

    goto/16 :goto_d0

    :cond_3f
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0

    :cond_46
    invoke-static {v3}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v3, v11, Lrs6;->a:Lb59;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/SharedPreferences;

    invoke-static {v1, v2, v10}, Lp3p;->l(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-wide/16 v5, 0x0

    invoke-interface {v3, v4, v5, v6}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    sget-object v5, Lpn7;->b:Lon7;

    sub-long v3, v13, v3

    sget-object v5, Lun7;->d:Lun7;

    invoke-static {v3, v4, v5}, Lcs5;->y0(JLun7;)J

    move-result-wide v3

    sget-wide v6, Lzi9;->g:J

    invoke-static {v3, v4, v6, v7}, Lpn7;->c(JJ)I

    move-result v3

    if-gtz v3, :cond_74

    sget-object v0, Ll08;->a:Ll08;

    return-object v0

    :cond_74
    iget-object v3, v0, Lzi9;->c:Lode;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ltpc;

    if-nez v3, :cond_81

    sget-object v0, Ll08;->a:Ll08;

    return-object v0

    :cond_81
    iget-object v0, v0, Lzi9;->a:Llsf;

    iget-object v0, v0, Llsf;->c:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzfo;

    iget-object v3, v3, Ltpc;->c:Ljava/lang/String;

    invoke-static {v13, v14, v5}, Lcs5;->y0(JLun7;)J

    move-result-wide v6

    sget-object v4, Lun7;->h:Lun7;

    move-object/from16 p3, v10

    move-object v15, v11

    invoke-static {v12, v4}, Lcs5;->x0(ILun7;)J

    move-result-wide v10

    invoke-static {v6, v7, v10, v11}, Lpn7;->l(JJ)J

    move-result-wide v6

    sget-object v10, Lun7;->e:Lun7;

    invoke-static {v6, v7, v10}, Lpn7;->p(JLun7;)J

    move-result-wide v6

    move-wide/from16 v16, v6

    invoke-static {v13, v14, v5}, Lcs5;->y0(JLun7;)J

    move-result-wide v5

    const/16 v7, 0x16d

    move-wide/from16 v18, v13

    invoke-static {v7, v4}, Lcs5;->x0(ILun7;)J

    move-result-wide v12

    invoke-static {v5, v6, v12, v13}, Lpn7;->m(JJ)J

    move-result-wide v4

    invoke-static {v4, v5, v10}, Lpn7;->p(JLun7;)J

    move-result-wide v6

    iput-wide v1, v8, Lxi9;->t:J

    move-wide/from16 v12, v18

    iput-wide v12, v8, Lxi9;->u:J

    const/4 v11, 0x1

    iput v11, v8, Lxi9;->x:I

    move-wide/from16 v4, v16

    invoke-virtual/range {v0 .. v8}, Lzfo;->c(JLjava/lang/String;JJLnt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v9, :cond_cc

    return-object v9

    :cond_cc
    move-wide/from16 v4, p1

    move-object v2, v0

    move-wide v0, v12

    :goto_d0
    invoke-static {v2}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v3

    if-nez v3, :cond_125

    check-cast v2, Lkne;

    iget-object v3, v15, Lrs6;->a:Lb59;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/SharedPreferences;

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    move-object/from16 v6, p3

    invoke-static {v4, v5, v6}, Lp3p;->l(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object v0, v2, Lkne;->b:Ljava/util/List;

    check-cast v0, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_fe
    :goto_fe
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_124

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lmme;

    iget-object v4, v3, Lmme;->j:Ljnc;

    sget-object v5, Ljnc;->d:Ljnc;

    if-eq v4, v5, :cond_fe

    sget-object v5, Ljnc;->e:Ljnc;

    if-eq v4, v5, :cond_fe

    iget-object v3, v3, Lmme;->l:Ljava/lang/String;

    const-string v4, "postponed"

    const/4 v11, 0x1

    invoke-static {v3, v4, v11}, Lkotlin/text/c;->m(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_fe

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_fe

    :cond_124
    return-object v1

    :cond_125
    sget-object v0, Ll08;->a:Ll08;

    return-object v0
.end method

.method public final b(Lnt5;)Ljava/lang/Object;
    .registers 12

    instance-of v0, p1, Lyi9;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lyi9;

    iget v1, v0, Lyi9;->y:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lyi9;->y:I

    goto :goto_18

    :cond_13
    new-instance v0, Lyi9;

    invoke-direct {v0, p0, p1}, Lyi9;-><init>(Lzi9;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lyi9;->w:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lyi9;->y:I

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v2, :cond_3b

    if-eq v2, v4, :cond_31

    if-ne v2, v3, :cond_2b

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_85

    :cond_2b
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v5

    :cond_31
    iget-object v2, v0, Lyi9;->v:Ljdj;

    iget-object v6, v0, Lyi9;->u:Ljava/util/Iterator;

    iget-object v7, v0, Lyi9;->t:Ljava/util/ArrayList;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_6e

    :cond_3b
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lzi9;->d:Ljava/util/Set;

    check-cast p1, Ljava/lang/Iterable;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    iget-object v6, p0, Lzi9;->e:Ljdj;

    move-object v7, v2

    move-object v2, v6

    move-object v6, p1

    :goto_50
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_74

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v8

    iput-object v7, v0, Lyi9;->t:Ljava/util/ArrayList;

    iput-object v6, v0, Lyi9;->u:Ljava/util/Iterator;

    iput-object v2, v0, Lyi9;->v:Ljdj;

    iput v4, v0, Lyi9;->y:I

    invoke-virtual {p0, v8, v9, v0}, Lzi9;->a(JLnt5;)Ljava/io/Serializable;

    move-result-object p1

    if-eq p1, v1, :cond_84

    :goto_6e
    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p1, v7}, Lo95;->t(Ljava/lang/Iterable;Ljava/util/Collection;)V

    goto :goto_50

    :cond_74
    check-cast v7, Ljava/util/List;

    iput-object v5, v0, Lyi9;->t:Ljava/util/ArrayList;

    iput-object v5, v0, Lyi9;->u:Ljava/util/Iterator;

    iput-object v5, v0, Lyi9;->v:Ljdj;

    iput v3, v0, Lyi9;->y:I

    invoke-interface {v2, v7, v0}, Lxee;->emit(Ljava/lang/Object;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_85

    :cond_84
    return-object v1

    :cond_85
    :goto_85
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
