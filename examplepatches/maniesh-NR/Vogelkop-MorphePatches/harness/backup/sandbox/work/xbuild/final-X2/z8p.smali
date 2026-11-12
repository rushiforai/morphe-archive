.class public final Lz8p;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Ld8p;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final L:[Lkotlinx/serialization/KSerializer;


# instance fields
.field public final A:Z

.field public final B:Z

.field public final C:J

.field public final D:J

.field public final E:I

.field public final F:J

.field public final G:J

.field public final H:J

.field public final I:J

.field public final J:Ljava/util/Set;

.field public final K:Ljava/lang/String;

.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:D

.field public final e:Ljava/util/List;

.field public final f:Ljava/util/Set;

.field public final g:Ljava/util/Set;

.field public final h:I

.field public final i:I

.field public final j:Z

.field public final k:Z

.field public final l:Ljava/util/Set;

.field public final m:Ljava/util/Set;

.field public final n:Z

.field public final o:Ljava/util/Set;

.field public final p:Ljava/util/Set;

.field public final q:D

.field public final r:Z

.field public final s:I

.field public final t:I

.field public final u:Ljava/util/Set;

.field public final v:Ljava/util/Set;

.field public final w:Ljava/lang/String;

.field public final x:Ljava/lang/String;

.field public final y:Ljava/lang/String;

.field public final z:Lkotlinx/serialization/json/c;


# direct methods
.method static constructor <clinit>()V
    .registers 13

    new-instance v0, Ld8p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lz8p;->Companion:Ld8p;

    new-instance v0, Lk72;

    sget-object v1, Lxhk;->a:Lxhk;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    new-instance v3, Lk72;

    const/4 v4, 0x2

    invoke-direct {v3, v1, v4}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    new-instance v5, Lk72;

    invoke-direct {v5, v1, v4}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    new-instance v6, Lk72;

    invoke-direct {v6, v1, v4}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    new-instance v7, Lk72;

    invoke-direct {v7, v1, v4}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    new-instance v8, Lk72;

    sget-object v9, Lecb;->a:Lecb;

    invoke-direct {v8, v9, v4}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    new-instance v10, Lk72;

    invoke-direct {v10, v9, v4}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    new-instance v9, Lk72;

    invoke-direct {v9, v1, v4}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    new-instance v11, Lk72;

    invoke-direct {v11, v1, v4}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    const/16 v1, 0x1c

    new-array v1, v1, [Lkotlinx/serialization/KSerializer;

    const/4 v12, 0x0

    aput-object v12, v1, v2

    const/4 v2, 0x1

    aput-object v12, v1, v2

    aput-object v12, v1, v4

    const/4 v2, 0x3

    aput-object v12, v1, v2

    const/4 v2, 0x4

    aput-object v0, v1, v2

    const/4 v0, 0x5

    aput-object v3, v1, v0

    const/4 v0, 0x6

    aput-object v5, v1, v0

    const/4 v0, 0x7

    aput-object v12, v1, v0

    const/16 v0, 0x8

    aput-object v12, v1, v0

    const/16 v0, 0x9

    aput-object v12, v1, v0

    const/16 v0, 0xa

    aput-object v12, v1, v0

    const/16 v0, 0xb

    aput-object v6, v1, v0

    const/16 v0, 0xc

    aput-object v7, v1, v0

    const/16 v0, 0xd

    aput-object v12, v1, v0

    const/16 v0, 0xe

    aput-object v8, v1, v0

    const/16 v0, 0xf

    aput-object v10, v1, v0

    const/16 v0, 0x10

    aput-object v12, v1, v0

    const/16 v0, 0x11

    aput-object v12, v1, v0

    const/16 v0, 0x12

    aput-object v12, v1, v0

    const/16 v0, 0x13

    aput-object v12, v1, v0

    const/16 v0, 0x14

    aput-object v9, v1, v0

    const/16 v0, 0x15

    aput-object v11, v1, v0

    const/16 v0, 0x16

    aput-object v12, v1, v0

    const/16 v0, 0x17

    aput-object v12, v1, v0

    const/16 v0, 0x18

    aput-object v12, v1, v0

    const/16 v0, 0x19

    aput-object v12, v1, v0

    const/16 v0, 0x1a

    aput-object v12, v1, v0

    const/16 v0, 0x1b

    aput-object v12, v1, v0

    sput-object v1, Lz8p;->L:[Lkotlinx/serialization/KSerializer;

    return-void
.end method

.method public constructor <init>()V
    .registers 17

    move-object/from16 v0, p0

    .line 601
    sget-object v1, Lpn7;->b:Lon7;

    sget-object v1, Lun7;->h:Lun7;

    const/4 v2, 0x1

    invoke-static {v2, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v3

    .line 602
    sget-object v5, Lun7;->g:Lun7;

    invoke-static {v3, v4, v5}, Lpn7;->p(JLun7;)J

    move-result-wide v3

    long-to-int v3, v3

    const/16 v4, 0xf

    .line 603
    invoke-static {v4, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v6

    .line 604
    invoke-static {v6, v7, v5}, Lpn7;->p(JLun7;)J

    move-result-wide v6

    long-to-double v6, v6

    .line 605
    const-string v4, "cdn.rtbai.com"

    .line 606
    invoke-static {v4}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v4

    .line 607
    const-string v8, "adx.opera.com"

    .line 608
    invoke-static {v8}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v8

    .line 609
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput v3, v0, Lz8p;->a:I

    const/16 v9, 0x1e

    iput v9, v0, Lz8p;->b:I

    const/16 v10, 0x32

    iput v10, v0, Lz8p;->c:I

    iput-wide v6, v0, Lz8p;->d:D

    const/4 v11, 0x0

    iput-object v11, v0, Lz8p;->e:Ljava/util/List;

    iput-object v11, v0, Lz8p;->f:Ljava/util/Set;

    iput-object v11, v0, Lz8p;->g:Ljava/util/Set;

    const/16 v12, 0x3c

    iput v12, v0, Lz8p;->h:I

    const/16 v13, 0x3e8

    iput v13, v0, Lz8p;->i:I

    const/4 v14, 0x0

    iput-boolean v14, v0, Lz8p;->j:Z

    iput-boolean v2, v0, Lz8p;->k:Z

    iput-object v11, v0, Lz8p;->l:Ljava/util/Set;

    iput-object v11, v0, Lz8p;->m:Ljava/util/Set;

    iput-boolean v2, v0, Lz8p;->n:Z

    iput-object v11, v0, Lz8p;->o:Ljava/util/Set;

    iput-object v11, v0, Lz8p;->p:Ljava/util/Set;

    const-wide/high16 v12, 0x4028000000000000L    # 12.0

    iput-wide v12, v0, Lz8p;->q:D

    iput-boolean v14, v0, Lz8p;->r:Z

    iput v9, v0, Lz8p;->s:I

    iput v9, v0, Lz8p;->t:I

    iput-object v4, v0, Lz8p;->u:Ljava/util/Set;

    iput-object v8, v0, Lz8p;->v:Ljava/util/Set;

    iput-object v11, v0, Lz8p;->w:Ljava/lang/String;

    iput-object v11, v0, Lz8p;->x:Ljava/lang/String;

    iput-object v11, v0, Lz8p;->y:Ljava/lang/String;

    iput-object v11, v0, Lz8p;->z:Lkotlinx/serialization/json/c;

    iput-boolean v14, v0, Lz8p;->A:Z

    iput-boolean v14, v0, Lz8p;->B:Z

    const/4 v8, 0x7

    invoke-static {v8, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v11

    .line 610
    invoke-static {v11, v12, v5}, Lpn7;->p(JLun7;)J

    move-result-wide v11

    long-to-int v8, v11

    .line 611
    sget-object v11, Laap;->a:Lzyk;

    .line 612
    invoke-static {v3, v2, v8}, Lnb6;->j(III)I

    move-result v3

    .line 613
    invoke-static {v3, v5}, Lcs5;->x0(ILun7;)J

    move-result-wide v11

    invoke-static {v11, v12}, Lpn7;->f(J)J

    move-result-wide v11

    iput-wide v11, v0, Lz8p;->C:J

    const/4 v3, 0x3

    const/16 v15, 0x3c

    .line 614
    invoke-static {v9, v3, v15}, Lnb6;->j(III)I

    move-result v3

    .line 615
    sget-object v8, Lun7;->e:Lun7;

    invoke-static {v3, v8}, Lcs5;->x0(ILun7;)J

    move-result-wide v11

    iput-wide v11, v0, Lz8p;->D:J

    const/16 v3, 0x1f4

    .line 616
    invoke-static {v10, v2, v3}, Lnb6;->j(III)I

    move-result v2

    .line 617
    iput v2, v0, Lz8p;->E:I

    const/16 v2, 0x16d

    invoke-static {v2, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v1

    .line 618
    invoke-static {v1, v2, v5}, Lpn7;->p(JLun7;)J

    move-result-wide v1

    long-to-double v1, v1

    const-wide v10, 0x3f91111111111111L    # 0.016666666666666666

    cmpg-double v3, v6, v10

    if-gez v3, :cond_b7

    move-wide v6, v10

    goto :goto_bc

    :cond_b7
    cmpl-double v3, v6, v1

    if-lez v3, :cond_bc

    move-wide v6, v1

    .line 619
    :cond_bc
    :goto_bc
    invoke-static {v6, v7, v5}, Lcs5;->w0(DLun7;)J

    move-result-wide v1

    invoke-static {v1, v2}, Lpn7;->f(J)J

    move-result-wide v1

    iput-wide v1, v0, Lz8p;->F:J

    const/16 v1, 0x78

    const/16 v15, 0x3c

    .line 620
    invoke-static {v15, v9, v1}, Lnb6;->j(III)I

    move-result v1

    .line 621
    invoke-static {v1, v8}, Lcs5;->x0(ILun7;)J

    move-result-wide v1

    invoke-static {v1, v2}, Lpn7;->f(J)J

    move-result-wide v1

    iput-wide v1, v0, Lz8p;->G:J

    const/16 v1, 0x12c

    const/16 v2, 0x7d0

    const/16 v3, 0x3e8

    .line 622
    invoke-static {v3, v1, v2}, Lnb6;->j(III)I

    move-result v1

    int-to-long v1, v1

    .line 623
    iput-wide v1, v0, Lz8p;->H:J

    const-wide/high16 v1, 0x4028000000000000L    # 12.0

    invoke-static {v1, v2, v5}, Lcs5;->w0(DLun7;)J

    move-result-wide v1

    invoke-static {v1, v2}, Lpn7;->f(J)J

    move-result-wide v1

    iput-wide v1, v0, Lz8p;->I:J

    if-eqz v4, :cond_122

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_fc
    :goto_fc
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_11d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-gtz v4, :cond_117

    const/4 v3, 0x0

    :cond_117
    if-eqz v3, :cond_fc

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_fc

    :cond_11d
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v1

    goto :goto_123

    :cond_122
    const/4 v1, 0x0

    :goto_123
    iput-object v1, v0, Lz8p;->J:Ljava/util/Set;

    iget-object v1, v0, Lz8p;->x:Ljava/lang/String;

    if-eqz v1, :cond_131

    invoke-static {v1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_131

    move-object v11, v1

    goto :goto_132

    :cond_131
    const/4 v11, 0x0

    :goto_132
    iput-object v11, v0, Lz8p;->K:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(IIIIDLjava/util/List;Ljava/util/Set;Ljava/util/Set;IIZZLjava/util/Set;Ljava/util/Set;ZLjava/util/Set;Ljava/util/Set;DZIILjava/util/Set;Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lkotlinx/serialization/json/c;ZZ)V
    .registers 49

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    and-int/lit8 v2, v1, 0x1

    const/4 v3, 0x1

    if-nez v2, :cond_1e

    sget-object v2, Lpn7;->b:Lon7;

    sget-object v2, Lun7;->h:Lun7;

    invoke-static {v3, v2}, Lcs5;->x0(ILun7;)J

    move-result-wide v4

    sget-object v2, Lun7;->g:Lun7;

    invoke-static {v4, v5, v2}, Lpn7;->p(JLun7;)J

    move-result-wide v4

    long-to-int v2, v4

    :goto_1b
    iput v2, v0, Lz8p;->a:I

    goto :goto_21

    :cond_1e
    move/from16 v2, p2

    goto :goto_1b

    :goto_21
    and-int/lit8 v4, v1, 0x2

    const/16 v5, 0x1e

    if-nez v4, :cond_2b

    iput v5, v0, Lz8p;->b:I

    move v4, v5

    goto :goto_2f

    :cond_2b
    move/from16 v4, p3

    iput v4, v0, Lz8p;->b:I

    :goto_2f
    and-int/lit8 v6, v1, 0x4

    if-nez v6, :cond_38

    const/16 v6, 0x32

    :goto_35
    iput v6, v0, Lz8p;->c:I

    goto :goto_3b

    :cond_38
    move/from16 v6, p4

    goto :goto_35

    :goto_3b
    and-int/lit8 v7, v1, 0x8

    if-nez v7, :cond_53

    sget-object v7, Lpn7;->b:Lon7;

    sget-object v7, Lun7;->h:Lun7;

    const/16 v8, 0xf

    invoke-static {v8, v7}, Lcs5;->x0(ILun7;)J

    move-result-wide v7

    sget-object v9, Lun7;->g:Lun7;

    invoke-static {v7, v8, v9}, Lpn7;->p(JLun7;)J

    move-result-wide v7

    long-to-double v7, v7

    :goto_50
    iput-wide v7, v0, Lz8p;->d:D

    goto :goto_56

    :cond_53
    move-wide/from16 v7, p5

    goto :goto_50

    :goto_56
    and-int/lit8 v9, v1, 0x10

    const/4 v10, 0x0

    if-nez v9, :cond_5e

    iput-object v10, v0, Lz8p;->e:Ljava/util/List;

    goto :goto_62

    :cond_5e
    move-object/from16 v9, p7

    iput-object v9, v0, Lz8p;->e:Ljava/util/List;

    :goto_62
    and-int/lit8 v9, v1, 0x20

    if-nez v9, :cond_69

    iput-object v10, v0, Lz8p;->f:Ljava/util/Set;

    goto :goto_6d

    :cond_69
    move-object/from16 v9, p8

    iput-object v9, v0, Lz8p;->f:Ljava/util/Set;

    :goto_6d
    and-int/lit8 v9, v1, 0x40

    if-nez v9, :cond_74

    iput-object v10, v0, Lz8p;->g:Ljava/util/Set;

    goto :goto_78

    :cond_74
    move-object/from16 v9, p9

    iput-object v9, v0, Lz8p;->g:Ljava/util/Set;

    :goto_78
    and-int/lit16 v9, v1, 0x80

    const/16 v11, 0x3c

    if-nez v9, :cond_82

    iput v11, v0, Lz8p;->h:I

    move v9, v11

    goto :goto_86

    :cond_82
    move/from16 v9, p10

    iput v9, v0, Lz8p;->h:I

    :goto_86
    and-int/lit16 v12, v1, 0x100

    if-nez v12, :cond_8f

    const/16 v12, 0x3e8

    :goto_8c
    iput v12, v0, Lz8p;->i:I

    goto :goto_92

    :cond_8f
    move/from16 v12, p11

    goto :goto_8c

    :goto_92
    and-int/lit16 v13, v1, 0x200

    const/4 v14, 0x0

    if-nez v13, :cond_9a

    iput-boolean v14, v0, Lz8p;->j:Z

    goto :goto_9e

    :cond_9a
    move/from16 v13, p12

    iput-boolean v13, v0, Lz8p;->j:Z

    :goto_9e
    and-int/lit16 v13, v1, 0x400

    if-nez v13, :cond_a5

    iput-boolean v3, v0, Lz8p;->k:Z

    goto :goto_a9

    :cond_a5
    move/from16 v13, p13

    iput-boolean v13, v0, Lz8p;->k:Z

    :goto_a9
    and-int/lit16 v13, v1, 0x800

    if-nez v13, :cond_b0

    iput-object v10, v0, Lz8p;->l:Ljava/util/Set;

    goto :goto_b4

    :cond_b0
    move-object/from16 v13, p14

    iput-object v13, v0, Lz8p;->l:Ljava/util/Set;

    :goto_b4
    and-int/lit16 v13, v1, 0x1000

    if-nez v13, :cond_bb

    iput-object v10, v0, Lz8p;->m:Ljava/util/Set;

    goto :goto_bf

    :cond_bb
    move-object/from16 v13, p15

    iput-object v13, v0, Lz8p;->m:Ljava/util/Set;

    :goto_bf
    and-int/lit16 v13, v1, 0x2000

    if-nez v13, :cond_c6

    iput-boolean v3, v0, Lz8p;->n:Z

    goto :goto_ca

    :cond_c6
    move/from16 v13, p16

    iput-boolean v13, v0, Lz8p;->n:Z

    :goto_ca
    and-int/lit16 v13, v1, 0x4000

    if-nez v13, :cond_d1

    iput-object v10, v0, Lz8p;->o:Ljava/util/Set;

    goto :goto_d5

    :cond_d1
    move-object/from16 v13, p17

    iput-object v13, v0, Lz8p;->o:Ljava/util/Set;

    :goto_d5
    const v13, 0x8000

    and-int/2addr v13, v1

    if-nez v13, :cond_de

    iput-object v10, v0, Lz8p;->p:Ljava/util/Set;

    goto :goto_e2

    :cond_de
    move-object/from16 v13, p18

    iput-object v13, v0, Lz8p;->p:Ljava/util/Set;

    :goto_e2
    const/high16 v13, 0x10000

    and-int/2addr v13, v1

    if-nez v13, :cond_ed

    move v13, v12

    const-wide/high16 v11, 0x4028000000000000L    # 12.0

    :goto_ea
    iput-wide v11, v0, Lz8p;->q:D

    goto :goto_f1

    :cond_ed
    move v13, v12

    move-wide/from16 v11, p19

    goto :goto_ea

    :goto_f1
    const/high16 v15, 0x20000

    and-int/2addr v15, v1

    if-nez v15, :cond_f9

    iput-boolean v14, v0, Lz8p;->r:Z

    goto :goto_fd

    :cond_f9
    move/from16 v15, p21

    iput-boolean v15, v0, Lz8p;->r:Z

    :goto_fd
    const/high16 v15, 0x40000

    and-int/2addr v15, v1

    if-nez v15, :cond_105

    iput v5, v0, Lz8p;->s:I

    goto :goto_109

    :cond_105
    move/from16 v15, p22

    iput v15, v0, Lz8p;->s:I

    :goto_109
    const/high16 v15, 0x80000

    and-int/2addr v15, v1

    if-nez v15, :cond_111

    iput v5, v0, Lz8p;->t:I

    goto :goto_115

    :cond_111
    move/from16 v15, p23

    iput v15, v0, Lz8p;->t:I

    :goto_115
    const/high16 v15, 0x100000

    and-int/2addr v15, v1

    if-nez v15, :cond_123

    const-string v15, "cdn.rtbai.com"

    invoke-static {v15}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v15

    :goto_120
    iput-object v15, v0, Lz8p;->u:Ljava/util/Set;

    goto :goto_126

    :cond_123
    move-object/from16 v15, p24

    goto :goto_120

    :goto_126
    const/high16 v16, 0x200000

    and-int v16, v1, v16

    if-nez v16, :cond_135

    const-string v16, "adx.opera.com"

    invoke-static/range {v16 .. v16}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v5

    :goto_132
    iput-object v5, v0, Lz8p;->v:Ljava/util/Set;

    goto :goto_138

    :cond_135
    move-object/from16 v5, p25

    goto :goto_132

    :goto_138
    const/high16 v5, 0x400000

    and-int/2addr v5, v1

    if-nez v5, :cond_140

    iput-object v10, v0, Lz8p;->w:Ljava/lang/String;

    goto :goto_144

    :cond_140
    move-object/from16 v5, p26

    iput-object v5, v0, Lz8p;->w:Ljava/lang/String;

    :goto_144
    const/high16 v5, 0x800000

    and-int/2addr v5, v1

    if-nez v5, :cond_14c

    iput-object v10, v0, Lz8p;->x:Ljava/lang/String;

    goto :goto_150

    :cond_14c
    move-object/from16 v5, p27

    iput-object v5, v0, Lz8p;->x:Ljava/lang/String;

    :goto_150
    const/high16 v5, 0x1000000

    and-int/2addr v5, v1

    if-nez v5, :cond_158

    iput-object v10, v0, Lz8p;->y:Ljava/lang/String;

    goto :goto_15c

    :cond_158
    move-object/from16 v5, p28

    iput-object v5, v0, Lz8p;->y:Ljava/lang/String;

    :goto_15c
    const/high16 v5, 0x2000000

    and-int/2addr v5, v1

    if-nez v5, :cond_164

    iput-object v10, v0, Lz8p;->z:Lkotlinx/serialization/json/c;

    goto :goto_168

    :cond_164
    move-object/from16 v5, p29

    iput-object v5, v0, Lz8p;->z:Lkotlinx/serialization/json/c;

    :goto_168
    const/high16 v5, 0x4000000

    and-int/2addr v5, v1

    if-nez v5, :cond_170

    iput-boolean v14, v0, Lz8p;->A:Z

    goto :goto_174

    :cond_170
    move/from16 v5, p30

    iput-boolean v5, v0, Lz8p;->A:Z

    :goto_174
    const/high16 v5, 0x8000000

    and-int/2addr v1, v5

    if-nez v1, :cond_17c

    iput-boolean v14, v0, Lz8p;->B:Z

    goto :goto_180

    :cond_17c
    move/from16 v1, p31

    iput-boolean v1, v0, Lz8p;->B:Z

    :goto_180
    sget-object v1, Lpn7;->b:Lon7;

    sget-object v1, Lun7;->h:Lun7;

    const/4 v5, 0x7

    move-wide/from16 p4, v11

    invoke-static {v5, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v10

    sget-object v5, Lun7;->g:Lun7;

    invoke-static {v10, v11, v5}, Lpn7;->p(JLun7;)J

    move-result-wide v10

    long-to-int v10, v10

    sget-object v11, Laap;->a:Lzyk;

    invoke-static {v2, v3, v10}, Lnb6;->j(III)I

    move-result v2

    invoke-static {v2, v5}, Lcs5;->x0(ILun7;)J

    move-result-wide v10

    invoke-static {v10, v11}, Lpn7;->f(J)J

    move-result-wide v10

    iput-wide v10, v0, Lz8p;->C:J

    const/4 v2, 0x3

    const/16 v10, 0x3c

    invoke-static {v4, v2, v10}, Lnb6;->j(III)I

    move-result v2

    sget-object v4, Lun7;->e:Lun7;

    invoke-static {v2, v4}, Lcs5;->x0(ILun7;)J

    move-result-wide v10

    iput-wide v10, v0, Lz8p;->D:J

    const/16 v2, 0x1f4

    invoke-static {v6, v3, v2}, Lnb6;->j(III)I

    move-result v2

    iput v2, v0, Lz8p;->E:I

    const/16 v2, 0x16d

    invoke-static {v2, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v1

    invoke-static {v1, v2, v5}, Lpn7;->p(JLun7;)J

    move-result-wide v1

    long-to-double v1, v1

    const-wide v10, 0x3f91111111111111L    # 0.016666666666666666

    cmpg-double v3, v7, v10

    if-gez v3, :cond_1cf

    move-wide v7, v10

    goto :goto_1d4

    :cond_1cf
    cmpl-double v3, v7, v1

    if-lez v3, :cond_1d4

    move-wide v7, v1

    :cond_1d4
    :goto_1d4
    invoke-static {v7, v8, v5}, Lcs5;->w0(DLun7;)J

    move-result-wide v1

    invoke-static {v1, v2}, Lpn7;->f(J)J

    move-result-wide v1

    iput-wide v1, v0, Lz8p;->F:J

    const/16 v1, 0x78

    const/16 v2, 0x1e

    invoke-static {v9, v2, v1}, Lnb6;->j(III)I

    move-result v1

    invoke-static {v1, v4}, Lcs5;->x0(ILun7;)J

    move-result-wide v1

    invoke-static {v1, v2}, Lpn7;->f(J)J

    move-result-wide v1

    iput-wide v1, v0, Lz8p;->G:J

    const/16 v1, 0x12c

    const/16 v2, 0x7d0

    invoke-static {v13, v1, v2}, Lnb6;->j(III)I

    move-result v1

    int-to-long v1, v1

    iput-wide v1, v0, Lz8p;->H:J

    const-wide/16 v1, 0x0

    cmpg-double v3, p4, v1

    if-ltz v3, :cond_207

    const-wide/high16 v1, 0x4038000000000000L    # 24.0

    cmpl-double v3, p4, v1

    if-lez v3, :cond_209

    :cond_207
    move-wide v11, v1

    goto :goto_20b

    :cond_209
    move-wide/from16 v11, p4

    :goto_20b
    invoke-static {v11, v12, v5}, Lcs5;->w0(DLun7;)J

    move-result-wide v1

    invoke-static {v1, v2}, Lpn7;->f(J)J

    move-result-wide v1

    iput-wide v1, v0, Lz8p;->I:J

    if-eqz v15, :cond_246

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v15}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_220
    :goto_220
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_241

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-gtz v4, :cond_23b

    const/4 v3, 0x0

    :cond_23b
    if-eqz v3, :cond_220

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_220

    :cond_241
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v1

    goto :goto_247

    :cond_246
    const/4 v1, 0x0

    :goto_247
    iput-object v1, v0, Lz8p;->J:Ljava/util/Set;

    iget-object v1, v0, Lz8p;->x:Ljava/lang/String;

    if-eqz v1, :cond_255

    invoke-static {v1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_255

    move-object v10, v1

    goto :goto_256

    :cond_255
    const/4 v10, 0x0

    :goto_256
    iput-object v10, v0, Lz8p;->K:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Z
    .registers 6

    const/4 v0, 0x0

    if-eqz p1, :cond_5a

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_5a

    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_5a

    invoke-static {p1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_16

    const/4 p1, 0x0

    :cond_16
    if-eqz p1, :cond_5a

    iget-object p0, p0, Lz8p;->v:Ljava/util/Set;

    if-eqz p0, :cond_5a

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_5a

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_26
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5a

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_58

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "."

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v1, v3}, Lkotlin/text/StringsKt;->T(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1, v0}, Lkotlin/text/c;->l(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_26

    :cond_58
    const/4 p0, 0x1

    return p0

    :cond_5a
    return v0
.end method
