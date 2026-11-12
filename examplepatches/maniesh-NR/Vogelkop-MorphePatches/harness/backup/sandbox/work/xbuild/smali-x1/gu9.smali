.class public final Lgu9;
.super Lyz;
.source "SourceFile"

# interfaces
.implements Lnq;


# instance fields
.field public final s:Lez;

.field public final t:Ljava/lang/String;

.field public final u:Ljava/util/List;

.field public final v:Ljava/util/List;

.field public final w:Ljava/lang/String;

.field public final x:Ljava/util/List;

.field public final y:J


# direct methods
.method public constructor <init>(Lez;Lh06;Ljava/util/List;Ljava/util/List;Lami;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;J)V
    .registers 26

    move-object/from16 v0, p2

    move-object/from16 v1, p5

    iget-object v2, v0, Lh06;->a:Ljava/lang/String;

    move-object v3, v2

    iget-object v2, v0, Lh06;->b:Ljava/lang/String;

    move-object v4, v3

    iget-object v3, v0, Lh06;->e:Ljava/lang/String;

    move-object v5, v4

    iget-object v4, v0, Lh06;->d:Ljava/lang/String;

    iget-object v6, v0, Lh06;->c:Ljava/lang/String;

    iget-object v9, v0, Lh06;->f:Ljava/lang/String;

    iget-object v0, v1, Lami;->b:Ljava/lang/Object;

    move-object v7, v0

    check-cast v7, Ljava/lang/String;

    iget-object v0, v1, Lami;->c:Ljava/lang/Object;

    move-object v8, v0

    check-cast v8, Ldl;

    iget-object v0, v1, Lami;->d:Ljava/lang/Object;

    move-object v10, v0

    check-cast v10, Lyo;

    iget-object v0, v1, Lami;->f:Ljava/lang/Object;

    move-object v14, v0

    check-cast v14, Ljava/lang/String;

    iget-object v0, v1, Lami;->e:Ljava/lang/Object;

    move-object v11, v0

    check-cast v11, Lrm;

    iget-object v0, v1, Lami;->g:Ljava/lang/Object;

    move-object v12, v0

    check-cast v12, Li3j;

    iget-object v0, v1, Lami;->h:Ljava/lang/Object;

    move-object v13, v0

    check-cast v13, Lap;

    sget-object v0, Laik;->a:[Ljava/lang/String;

    if-nez v6, :cond_3c

    const-string v6, ""

    :cond_3c
    move-object v0, p0

    move-object v1, v5

    move-object v5, v6

    move-object/from16 v6, p8

    invoke-direct/range {v0 .. v13}, Lyz;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ldl;Ljava/lang/String;Lyo;Lrm;Li3j;Lap;)V

    move-object/from16 v1, p1

    iput-object v1, p0, Lgu9;->s:Lez;

    move-object/from16 v1, p3

    iput-object v1, p0, Lgu9;->u:Ljava/util/List;

    move-object/from16 v1, p4

    iput-object v1, p0, Lgu9;->v:Ljava/util/List;

    move-object/from16 v1, p6

    iput-object v1, p0, Lgu9;->w:Ljava/lang/String;

    move-object/from16 v1, p7

    iput-object v1, p0, Lgu9;->x:Ljava/util/List;

    move-wide/from16 v1, p9

    iput-wide v1, p0, Lgu9;->y:J

    iput-object v14, p0, Lgu9;->t:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Ldl;Lkm;Lk8;Lkq;Ljava/util/List;)Lmq;
    .registers 13

    new-instance v0, Lvkf;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lvkf;-><init>(Lgu9;Ldl;Lkm;Lk8;Lkq;Ljava/util/List;)V

    return-object v0
.end method

.method public final f()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lgu9;->w:Ljava/lang/String;

    return-object p0
.end method

.method public final g()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lgu9;->t:Ljava/lang/String;

    return-object p0
.end method

.method public final k()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lgu9;->x:Ljava/util/List;

    return-object p0
.end method

.method public final q()Z
    .registers 5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lgu9;->y:J

    cmp-long p0, v0, v2

    if-lez p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method
