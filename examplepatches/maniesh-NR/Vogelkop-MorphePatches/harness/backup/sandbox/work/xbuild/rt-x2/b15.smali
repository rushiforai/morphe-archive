.class public final Lb15;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lk7j;
.implements Lq8j;


# instance fields
.field public final a:Lisd;

.field public b:Lfp4;

.field public c:Lz05;

.field public d:Z

.field public e:Z

.field public final synthetic f:Lc15;


# direct methods
.method public constructor <init>(Lc15;Lisd;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lb15;->f:Lc15;

    iput-object p2, p0, Lb15;->a:Lisd;

    iget-object p1, p1, Lc15;->l:Lip4;

    invoke-virtual {p1, p0}, Lt7j;->b(Lq8j;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 1

    iget-object p0, p0, Lb15;->f:Lc15;

    invoke-virtual {p0}, Lt7j;->c()V

    return-void
.end method

.method public final b()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lb15;->d:Z

    return-void
.end method

.method public final c(Ljava/lang/Object;)V
    .registers 25

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    check-cast v1, Lfp4;

    iget-boolean v2, v0, Lb15;->d:Z

    if-nez v2, :cond_27

    if-nez v1, :cond_12

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lb15;->d(Lz05;Z)V

    return-void

    :cond_12
    iput-object v1, v0, Lb15;->b:Lfp4;

    iget-object v2, v0, Lb15;->f:Lc15;

    iget-boolean v3, v2, Lc15;->o:Z

    iget-object v4, v2, Lc15;->j:Lta7;

    invoke-virtual {v4, v1}, Lta7;->v(Lfp4;)Z

    move-result v1

    if-eqz v1, :cond_28

    iget-object v1, v0, Lb15;->b:Lfp4;

    invoke-virtual {v0, v1}, Lb15;->e(Lfp4;)V

    if-nez v3, :cond_28

    :cond_27
    return-void

    :cond_28
    iget-object v1, v0, Lb15;->b:Lfp4;

    iget-boolean v3, v1, Lfp4;->g:Z

    iget-object v4, v1, Ld93;->a:Lyla;

    const/4 v5, 0x1

    if-eqz v3, :cond_68

    iget-object v3, v4, Lyla;->e:Ll0c;

    if-eqz v3, :cond_68

    iget-object v2, v2, Lc15;->k:Ls9i;

    new-instance v3, Lvw9;

    iget-object v4, v2, Ls9i;->b:Ljava/lang/Object;

    check-cast v4, Landroid/content/Context;

    iget-object v2, v2, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Lga6;

    invoke-direct {v3, v4, v2, v1}, Lvw9;-><init>(Landroid/content/Context;Lywh;Lqtm;)V

    invoke-virtual {v3}, Lzb5;->c()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "city/locate"

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    new-instance v2, Lz7;

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v4, ""

    invoke-direct {v2, v1, v4, v5}, Lz7;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    new-instance v1, Lk82;

    const/4 v4, 0x3

    invoke-direct {v1, v3, v0, v4}, Lk82;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v0, v3, Lzb5;->e:Lywh;

    invoke-interface {v0, v2, v1}, Lywh;->a(Lz7;Lz4o;)V

    return-void

    :cond_68
    iget-object v6, v2, Lc15;->j:Lta7;

    iget-wide v7, v1, Ld93;->b:J

    iget-object v9, v1, Ld93;->c:Ljava/lang/String;

    iget-object v10, v4, Lyla;->a:Ljava/net/URL;

    sget-object v19, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v11, v19

    invoke-virtual/range {v6 .. v13}, Lta7;->z(JLjava/lang/String;Ljava/net/URL;Ljava/util/List;Lbre;Z)V

    new-instance v11, Lz05;

    iget-object v1, v0, Lb15;->b:Lfp4;

    iget-object v12, v1, Ld93;->a:Lyla;

    iget-wide v13, v1, Ld93;->b:J

    iget-object v15, v1, Ld93;->c:Ljava/lang/String;

    iget-object v2, v1, Lqtm;->d:Ljava/lang/String;

    iget-object v3, v1, Lfp4;->e:Ljava/util/List;

    iget-object v1, v1, Lfp4;->f:Ljava/util/List;

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v20, -0x1

    move-object/from16 v18, v1

    move-object/from16 v16, v2

    move-object/from16 v17, v3

    invoke-direct/range {v11 .. v22}, Lz05;-><init>(Lyla;JLjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;IZZ)V

    invoke-virtual {v0, v11, v5}, Lb15;->d(Lz05;Z)V

    return-void
.end method

.method public final d(Lz05;Z)V
    .registers 14

    iget-boolean v0, p0, Lb15;->d:Z

    if-nez v0, :cond_10

    iget-boolean v0, p0, Lb15;->e:Z

    if-eqz v0, :cond_11

    iget-object v0, p0, Lb15;->c:Lz05;

    invoke-static {p1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    :cond_10
    return-void

    :cond_11
    iget-object v0, p0, Lb15;->f:Lc15;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lc15;->o:Z

    iget-object v2, v0, Lc15;->j:Lta7;

    iput-object p1, p0, Lb15;->c:Lz05;

    const/4 v3, 0x1

    if-eqz p1, :cond_76

    iget-object v4, v0, Lc15;->m:Li3j;

    invoke-virtual {v2}, Lta7;->t()Lbre;

    move-result-object v5

    invoke-virtual {v2}, Lta7;->u()Z

    move-result v2

    iget-object v6, v4, Li3j;->a:Ljava/lang/Object;

    check-cast v6, Lta7;

    iget-object v7, p1, Ld93;->a:Lyla;

    iget-object v7, v7, Lyla;->e:Ll0c;

    if-eqz v7, :cond_76

    iget-object v8, p1, Lqtm;->d:Ljava/lang/String;

    if-eqz v8, :cond_76

    invoke-static {p1, v5, v2}, Lc15;->g(Lfp4;Lbre;Z)Z

    move-result v8

    const/4 v9, 0x0

    if-nez v8, :cond_3d

    move-object v5, v9

    :cond_3d
    new-instance v8, Lcre;

    iget-object v10, v7, Ll0c;->a:Ljava/lang/String;

    iget-object v7, v7, Ll0c;->b:Ljava/lang/String;

    invoke-direct {v8, v5, v2, v10, v7}, Lcre;-><init>(Lbre;ZLjava/lang/String;Ljava/lang/String;)V

    iput-object v8, v4, Li3j;->c:Ljava/lang/Object;

    iput-object p1, v4, Li3j;->d:Ljava/lang/Object;

    invoke-virtual {v6, v10, v7}, Lta7;->o(Ljava/lang/String;Ljava/lang/String;)Lcre;

    move-result-object v7

    if-eqz v7, :cond_52

    iget-object v9, v7, Lcre;->a:Lbre;

    :cond_52
    if-nez v5, :cond_5a

    if-nez v9, :cond_58

    move v8, v3

    goto :goto_5e

    :cond_58
    move v8, v1

    goto :goto_5e

    :cond_5a
    invoke-virtual {v5, v9}, Lbre;->equals(Ljava/lang/Object;)Z

    move-result v8

    :goto_5e
    if-eqz v8, :cond_73

    if-eqz v7, :cond_67

    iget-boolean v7, v7, Lcre;->b:Z

    if-eqz v7, :cond_67

    move v1, v3

    :cond_67
    if-eqz v5, :cond_76

    if-eq v2, v1, :cond_76

    iget-object v1, v4, Li3j;->c:Ljava/lang/Object;

    check-cast v1, Lcre;

    invoke-virtual {v6, v1, v2}, Lta7;->F(Lcre;Z)V

    goto :goto_76

    :cond_73
    invoke-virtual {v4, v2, v3}, Li3j;->H(ZZ)V

    :cond_76
    :goto_76
    iget-boolean v1, p0, Lb15;->e:Z

    if-eqz v1, :cond_7e

    invoke-virtual {v0}, Lt7j;->c()V

    return-void

    :cond_7e
    iput-boolean v3, p0, Lb15;->e:Z

    iget-object p0, p0, Lb15;->a:Lisd;

    invoke-virtual {p0, p1, p2}, Lisd;->E(Ljava/lang/Object;Z)V

    return-void
.end method

.method public final e(Lfp4;)V
    .registers 16

    iget-object v0, p0, Lb15;->f:Lc15;

    iget-object v1, v0, Lc15;->j:Lta7;

    invoke-virtual {v1}, Lta7;->n()Ljava/util/List;

    move-result-object v10

    iget-object v0, v0, Lc15;->j:Lta7;

    invoke-virtual {v0}, Lta7;->t()Lbre;

    move-result-object v1

    new-instance v2, Lz05;

    iget-object v3, p1, Ld93;->a:Lyla;

    iget-wide v4, p1, Ld93;->b:J

    iget-object v6, p1, Ld93;->c:Ljava/lang/String;

    iget-object v7, p1, Lqtm;->d:Ljava/lang/String;

    iget-object v8, p1, Lfp4;->e:Ljava/util/List;

    iget-object v9, p1, Lfp4;->f:Ljava/util/List;

    invoke-interface {v10, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v11

    invoke-virtual {v0}, Lta7;->u()Z

    move-result v12

    invoke-virtual {v0}, Lta7;->u()Z

    move-result v0

    invoke-static {p1, v1, v0}, Lc15;->g(Lfp4;Lbre;Z)Z

    move-result v13

    invoke-direct/range {v2 .. v13}, Lz05;-><init>(Lyla;JLjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;IZZ)V

    const/4 p1, 0x1

    invoke-virtual {p0, v2, p1}, Lb15;->d(Lz05;Z)V

    return-void
.end method

.method public final f(Ljava/util/ArrayList;Ljava/util/ArrayList;Z)V
    .registers 31

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    iget-boolean v3, v0, Lb15;->d:Z

    if-nez v3, :cond_46

    if-eqz p3, :cond_10

    iget-boolean v3, v0, Lb15;->e:Z

    if-nez v3, :cond_46

    :cond_10
    iget-object v3, v0, Lb15;->b:Lfp4;

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-eqz v3, :cond_e1

    iget-object v3, v3, Ld93;->a:Lyla;

    iget-object v3, v3, Lyla;->e:Ll0c;

    if-eqz v3, :cond_e1

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    if-eqz v1, :cond_26

    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_26
    if-eqz v2, :cond_2b

    invoke-virtual {v11, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_2b
    invoke-virtual {v11}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    iget-object v2, v0, Lb15;->f:Lc15;

    if-eqz v1, :cond_65

    iget-object v1, v2, Lc15;->j:Lta7;

    iget-object v2, v0, Lb15;->b:Lfp4;

    invoke-virtual {v1, v2}, Lta7;->v(Lfp4;)Z

    move-result v1

    if-eqz v1, :cond_47

    iget-boolean v1, v0, Lb15;->e:Z

    if-nez v1, :cond_46

    iget-object v1, v0, Lb15;->b:Lfp4;

    invoke-virtual {v0, v1}, Lb15;->e(Lfp4;)V

    :cond_46
    return-void

    :cond_47
    new-instance v6, Lz05;

    iget-object v1, v0, Lb15;->b:Lfp4;

    iget-object v7, v1, Ld93;->a:Lyla;

    iget-wide v8, v1, Ld93;->b:J

    iget-object v10, v1, Ld93;->c:Ljava/lang/String;

    iget-object v11, v1, Lqtm;->d:Ljava/lang/String;

    iget-object v12, v1, Lfp4;->e:Ljava/util/List;

    iget-object v13, v1, Lfp4;->f:Ljava/util/List;

    sget-object v14, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/4 v15, -0x1

    invoke-direct/range {v6 .. v17}, Lz05;-><init>(Lyla;JLjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;IZZ)V

    invoke-virtual {v0, v6, v5}, Lb15;->d(Lz05;Z)V

    return-void

    :cond_65
    iget-object v1, v2, Lc15;->j:Lta7;

    iget-object v3, v2, Lc15;->j:Lta7;

    iget-object v6, v0, Lb15;->b:Lfp4;

    iget-object v6, v6, Ld93;->a:Lyla;

    iget-object v6, v6, Lyla;->e:Ll0c;

    iget-object v7, v6, Ll0c;->a:Ljava/lang/String;

    iget-object v6, v6, Ll0c;->b:Ljava/lang/String;

    invoke-virtual {v1, v7, v6}, Lta7;->o(Ljava/lang/String;Ljava/lang/String;)Lcre;

    move-result-object v1

    const/4 v14, 0x1

    if-eqz v1, :cond_80

    iget-boolean v6, v1, Lcre;->b:Z

    if-eqz v6, :cond_80

    move v13, v14

    goto :goto_81

    :cond_80
    move v13, v5

    :goto_81
    if-eqz v13, :cond_85

    iget-object v4, v1, Lcre;->a:Lbre;

    :cond_85
    if-nez v4, :cond_94

    invoke-virtual {v11}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_94

    invoke-virtual {v11, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lbre;

    :cond_94
    move-object v12, v4

    iget-object v6, v2, Lc15;->j:Lta7;

    iget-object v1, v0, Lb15;->b:Lfp4;

    iget-wide v7, v1, Ld93;->b:J

    iget-object v9, v1, Ld93;->c:Ljava/lang/String;

    iget-object v1, v1, Ld93;->a:Lyla;

    iget-object v10, v1, Lyla;->a:Ljava/net/URL;

    invoke-virtual/range {v6 .. v13}, Lta7;->z(JLjava/lang/String;Ljava/net/URL;Ljava/util/List;Lbre;Z)V

    invoke-virtual {v3}, Lta7;->n()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v3}, Lta7;->t()Lbre;

    move-result-object v2

    new-instance v15, Lz05;

    iget-object v4, v0, Lb15;->b:Lfp4;

    iget-object v5, v4, Ld93;->a:Lyla;

    iget-wide v6, v4, Ld93;->b:J

    iget-object v8, v4, Ld93;->c:Ljava/lang/String;

    iget-object v9, v4, Lqtm;->d:Ljava/lang/String;

    iget-object v10, v4, Lfp4;->e:Ljava/util/List;

    iget-object v4, v4, Lfp4;->f:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v24

    iget-object v11, v0, Lb15;->b:Lfp4;

    invoke-virtual {v3}, Lta7;->u()Z

    move-result v3

    invoke-static {v11, v2, v3}, Lc15;->g(Lfp4;Lbre;Z)Z

    move-result v26

    move-object/from16 v23, v1

    move-object/from16 v22, v4

    move-object/from16 v16, v5

    move-wide/from16 v17, v6

    move-object/from16 v19, v8

    move-object/from16 v20, v9

    move-object/from16 v21, v10

    move/from16 v25, v13

    invoke-direct/range {v15 .. v26}, Lz05;-><init>(Lyla;JLjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;IZZ)V

    invoke-virtual {v0, v15, v14}, Lb15;->d(Lz05;Z)V

    return-void

    :cond_e1
    invoke-virtual {v0, v4, v5}, Lb15;->d(Lz05;Z)V

    return-void
.end method
