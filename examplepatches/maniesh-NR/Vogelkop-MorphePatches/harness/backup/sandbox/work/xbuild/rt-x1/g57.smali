.class public final Lg57;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field public final A:Ljava/lang/Boolean;

.field public final B:Ljava/lang/Boolean;

.field public final C:Ljava/lang/Boolean;

.field public final D:Ljava/lang/String;

.field public final E:Ljava/lang/String;

.field public final F:Ljava/lang/Boolean;

.field public final G:Ljava/util/List;

.field public final transient a:Lg54;

.field public transient b:I

.field public final c:Z

.field public final d:Z

.field public final e:Z

.field public final f:Ljava/lang/Boolean;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/Boolean;

.field public final i:Ljava/lang/Boolean;

.field public final j:I

.field public final k:Z

.field public final l:Z

.field public final m:Ljava/lang/String;

.field public final n:Ljava/lang/Boolean;

.field public final o:Ljava/lang/Boolean;

.field public final p:Ljava/lang/Boolean;

.field public final q:Ljava/lang/String;

.field public final r:Ljava/lang/Boolean;

.field public final s:Z

.field public final t:Z

.field public final u:Z

.field public final v:Z

.field public final w:Ljava/lang/Boolean;

.field public final x:Ljava/lang/Boolean;

.field public final y:Ljava/lang/String;

.field public final z:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    sget-object v0, Lyz8;->c:Lyz8;

    const-class v1, Lg57;

    invoke-static {v1}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v1

    sget-object v2, Lczk;->c:Lczk;

    new-instance v3, Lf57;

    const/4 v4, 0x0

    invoke-direct {v3, v0, v1, v2, v4}, Lm6h;-><init>(Lyz8;Litb;Lczk;Ljava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(ZZZLjava/lang/Boolean;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;IZZLjava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Boolean;ZZLjava/util/List;ZZLjava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lg54;)V
    .registers 35

    move-object/from16 v0, p19

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    move-object/from16 v1, p32

    iput-object v1, p0, Lg57;->a:Lg54;

    iput-boolean p1, p0, Lg57;->c:Z

    iput-boolean p2, p0, Lg57;->d:Z

    iput-boolean p3, p0, Lg57;->e:Z

    iput-object p4, p0, Lg57;->f:Ljava/lang/Boolean;

    iput-object p5, p0, Lg57;->g:Ljava/lang/String;

    iput-object p6, p0, Lg57;->h:Ljava/lang/Boolean;

    iput-object p7, p0, Lg57;->i:Ljava/lang/Boolean;

    iput p8, p0, Lg57;->j:I

    iput-boolean p9, p0, Lg57;->k:Z

    iput-boolean p10, p0, Lg57;->l:Z

    iput-object p11, p0, Lg57;->m:Ljava/lang/String;

    iput-object p12, p0, Lg57;->n:Ljava/lang/Boolean;

    iput-object p13, p0, Lg57;->o:Ljava/lang/Boolean;

    move-object/from16 p1, p14

    iput-object p1, p0, Lg57;->p:Ljava/lang/Boolean;

    move-object/from16 p1, p15

    iput-object p1, p0, Lg57;->q:Ljava/lang/String;

    move-object/from16 p1, p16

    iput-object p1, p0, Lg57;->r:Ljava/lang/Boolean;

    move/from16 p1, p17

    iput-boolean p1, p0, Lg57;->s:Z

    move/from16 p1, p18

    iput-boolean p1, p0, Lg57;->t:Z

    move/from16 p1, p20

    iput-boolean p1, p0, Lg57;->u:Z

    move/from16 p1, p21

    iput-boolean p1, p0, Lg57;->v:Z

    move-object/from16 p1, p22

    iput-object p1, p0, Lg57;->w:Ljava/lang/Boolean;

    move-object/from16 p1, p23

    iput-object p1, p0, Lg57;->x:Ljava/lang/Boolean;

    move-object/from16 p1, p24

    iput-object p1, p0, Lg57;->y:Ljava/lang/String;

    move-object/from16 p1, p25

    iput-object p1, p0, Lg57;->z:Ljava/lang/Boolean;

    move-object/from16 p1, p26

    iput-object p1, p0, Lg57;->A:Ljava/lang/Boolean;

    move-object/from16 p1, p27

    iput-object p1, p0, Lg57;->B:Ljava/lang/Boolean;

    move-object/from16 p1, p28

    iput-object p1, p0, Lg57;->C:Ljava/lang/Boolean;

    move-object/from16 p1, p29

    iput-object p1, p0, Lg57;->D:Ljava/lang/String;

    move-object/from16 p1, p30

    iput-object p1, p0, Lg57;->E:Ljava/lang/String;

    move-object/from16 p1, p31

    iput-object p1, p0, Lg57;->F:Ljava/lang/Boolean;

    instance-of p1, v0, Leee;

    if-nez p1, :cond_8a

    sget-object p1, Ll08;->a:Ll08;

    if-eq v0, p1, :cond_86

    instance-of p1, v0, Lf1b;

    if-nez p1, :cond_86

    new-instance p1, Lf1b;

    invoke-direct {p1, v0}, Lf1b;-><init>(Ljava/util/List;)V

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, La4;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_87

    const-string p0, "saved_test_page_urls.contains(null)"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0

    :cond_86
    move-object p1, v0

    :cond_87
    iput-object p1, p0, Lg57;->G:Ljava/util/List;

    return-void

    :cond_8a
    invoke-static {}, Lh9o;->t()V

    const/4 p0, 0x0

    throw p0
.end method

.method public static d(Lg57;ZZZLjava/lang/Boolean;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;IZZLjava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Boolean;ZZZZLjava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;II)Lg57;
    .registers 51

    move-object/from16 v0, p0

    move/from16 v1, p31

    and-int/lit8 v2, v1, 0x1

    if-eqz v2, :cond_b

    iget-boolean v2, v0, Lg57;->c:Z

    goto :goto_d

    :cond_b
    move/from16 v2, p1

    :goto_d
    and-int/lit8 v3, v1, 0x2

    if-eqz v3, :cond_14

    iget-boolean v3, v0, Lg57;->d:Z

    goto :goto_16

    :cond_14
    move/from16 v3, p2

    :goto_16
    and-int/lit8 v4, v1, 0x4

    if-eqz v4, :cond_1d

    iget-boolean v4, v0, Lg57;->e:Z

    goto :goto_1f

    :cond_1d
    move/from16 v4, p3

    :goto_1f
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    and-int/lit8 v5, v1, 0x10

    if-eqz v5, :cond_29

    iget-object v5, v0, Lg57;->f:Ljava/lang/Boolean;

    goto :goto_2b

    :cond_29
    move-object/from16 v5, p4

    :goto_2b
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    and-int/lit8 v6, v1, 0x40

    if-eqz v6, :cond_35

    iget-object v6, v0, Lg57;->g:Ljava/lang/String;

    goto :goto_37

    :cond_35
    move-object/from16 v6, p5

    :goto_37
    and-int/lit16 v7, v1, 0x80

    if-eqz v7, :cond_3e

    iget-object v7, v0, Lg57;->h:Ljava/lang/Boolean;

    goto :goto_40

    :cond_3e
    move-object/from16 v7, p6

    :goto_40
    and-int/lit16 v8, v1, 0x100

    if-eqz v8, :cond_47

    iget-object v8, v0, Lg57;->i:Ljava/lang/Boolean;

    goto :goto_49

    :cond_47
    move-object/from16 v8, p7

    :goto_49
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    and-int/lit16 v9, v1, 0x400

    if-eqz v9, :cond_53

    iget v9, v0, Lg57;->j:I

    goto :goto_55

    :cond_53
    move/from16 v9, p8

    :goto_55
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    and-int/lit16 v10, v1, 0x1000

    if-eqz v10, :cond_5f

    iget-boolean v10, v0, Lg57;->k:Z

    goto :goto_61

    :cond_5f
    move/from16 v10, p9

    :goto_61
    and-int/lit16 v11, v1, 0x2000

    if-eqz v11, :cond_68

    iget-boolean v11, v0, Lg57;->l:Z

    goto :goto_6a

    :cond_68
    move/from16 v11, p10

    :goto_6a
    and-int/lit16 v12, v1, 0x4000

    if-eqz v12, :cond_71

    iget-object v12, v0, Lg57;->m:Ljava/lang/String;

    goto :goto_73

    :cond_71
    move-object/from16 v12, p11

    :goto_73
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/high16 v13, 0x10000

    and-int/2addr v13, v1

    if-eqz v13, :cond_7e

    iget-object v13, v0, Lg57;->n:Ljava/lang/Boolean;

    goto :goto_80

    :cond_7e
    move-object/from16 v13, p12

    :goto_80
    const/high16 v14, 0x20000

    and-int/2addr v14, v1

    if-eqz v14, :cond_88

    iget-object v14, v0, Lg57;->o:Ljava/lang/Boolean;

    goto :goto_8a

    :cond_88
    move-object/from16 v14, p13

    :goto_8a
    const/high16 v15, 0x40000

    and-int/2addr v15, v1

    if-eqz v15, :cond_92

    iget-object v15, v0, Lg57;->p:Ljava/lang/Boolean;

    goto :goto_94

    :cond_92
    move-object/from16 v15, p14

    :goto_94
    const/high16 v16, 0x80000

    and-int v16, v1, v16

    if-eqz v16, :cond_9d

    iget-object v1, v0, Lg57;->q:Ljava/lang/String;

    goto :goto_9f

    :cond_9d
    move-object/from16 v1, p15

    :goto_9f
    const/high16 v16, 0x100000

    and-int v16, p31, v16

    move-object/from16 p15, v1

    if-eqz v16, :cond_aa

    iget-object v1, v0, Lg57;->r:Ljava/lang/Boolean;

    goto :goto_ac

    :cond_aa
    move-object/from16 v1, p16

    :goto_ac
    const/high16 v16, 0x200000

    and-int v16, p31, v16

    move-object/from16 p16, v1

    if-eqz v16, :cond_b7

    iget-boolean v1, v0, Lg57;->s:Z

    goto :goto_b9

    :cond_b7
    move/from16 v1, p17

    :goto_b9
    const/high16 v16, 0x400000

    and-int v16, p31, v16

    move/from16 p17, v1

    if-eqz v16, :cond_c5

    iget-boolean v1, v0, Lg57;->t:Z

    move/from16 p18, v1

    :cond_c5
    iget-object v1, v0, Lg57;->G:Ljava/util/List;

    const/high16 v16, 0x1000000

    and-int v16, p31, v16

    if-eqz v16, :cond_d2

    move-object/from16 v16, v1

    iget-boolean v1, v0, Lg57;->u:Z

    goto :goto_d6

    :cond_d2
    move-object/from16 v16, v1

    move/from16 v1, p19

    :goto_d6
    const/high16 v17, 0x2000000

    and-int v17, p31, v17

    move/from16 p1, v1

    if-eqz v17, :cond_e1

    iget-boolean v1, v0, Lg57;->v:Z

    goto :goto_e3

    :cond_e1
    move/from16 v1, p20

    :goto_e3
    const/high16 v17, 0x4000000

    and-int v17, p31, v17

    move/from16 p2, v1

    if-eqz v17, :cond_ee

    iget-object v1, v0, Lg57;->w:Ljava/lang/Boolean;

    goto :goto_f0

    :cond_ee
    move-object/from16 v1, p21

    :goto_f0
    const/high16 v17, 0x8000000

    and-int v17, p31, v17

    move-object/from16 p3, v1

    if-eqz v17, :cond_fb

    iget-object v1, v0, Lg57;->x:Ljava/lang/Boolean;

    goto :goto_fd

    :cond_fb
    move-object/from16 v1, p22

    :goto_fd
    const/high16 v17, 0x10000000

    and-int v17, p31, v17

    move-object/from16 p4, v1

    if-eqz v17, :cond_108

    iget-object v1, v0, Lg57;->y:Ljava/lang/String;

    goto :goto_10a

    :cond_108
    move-object/from16 v1, p23

    :goto_10a
    const/high16 v17, 0x20000000

    and-int v17, p31, v17

    move-object/from16 p5, v1

    if-eqz v17, :cond_115

    iget-object v1, v0, Lg57;->z:Ljava/lang/Boolean;

    goto :goto_117

    :cond_115
    move-object/from16 v1, p24

    :goto_117
    const/high16 v17, 0x40000000    # 2.0f

    and-int v17, p31, v17

    move-object/from16 p6, v1

    if-eqz v17, :cond_122

    iget-object v1, v0, Lg57;->A:Ljava/lang/Boolean;

    goto :goto_124

    :cond_122
    move-object/from16 v1, p25

    :goto_124
    const/high16 v17, -0x80000000

    and-int v17, p31, v17

    move-object/from16 p7, v1

    if-eqz v17, :cond_12f

    iget-object v1, v0, Lg57;->B:Ljava/lang/Boolean;

    goto :goto_131

    :cond_12f
    move-object/from16 v1, p26

    :goto_131
    and-int/lit8 v17, p32, 0x1

    move-object/from16 p8, v1

    if-eqz v17, :cond_13a

    iget-object v1, v0, Lg57;->C:Ljava/lang/Boolean;

    goto :goto_13c

    :cond_13a
    move-object/from16 v1, p27

    :goto_13c
    and-int/lit8 v17, p32, 0x2

    move-object/from16 p9, v1

    if-eqz v17, :cond_145

    iget-object v1, v0, Lg57;->D:Ljava/lang/String;

    goto :goto_147

    :cond_145
    move-object/from16 v1, p28

    :goto_147
    and-int/lit8 v17, p32, 0x4

    move-object/from16 p10, v1

    if-eqz v17, :cond_150

    iget-object v1, v0, Lg57;->E:Ljava/lang/String;

    goto :goto_152

    :cond_150
    move-object/from16 v1, p29

    :goto_152
    and-int/lit8 v17, p32, 0x8

    move-object/from16 p11, v1

    if-eqz v17, :cond_15d

    iget-object v1, v0, Lg57;->F:Ljava/lang/Boolean;

    move-object/from16 p31, v1

    goto :goto_15f

    :cond_15d
    move-object/from16 p31, p30

    :goto_15f
    iget-object v1, v0, Lg57;->a:Lg54;

    if-nez v1, :cond_165

    sget-object v1, Lg54;->d:Lg54;

    :cond_165
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lg57;

    move/from16 p20, p1

    move/from16 p21, p2

    move-object/from16 p22, p3

    move-object/from16 p23, p4

    move-object/from16 p24, p5

    move-object/from16 p25, p6

    move-object/from16 p26, p7

    move-object/from16 p27, p8

    move-object/from16 p28, p9

    move-object/from16 p29, p10

    move-object/from16 p30, p11

    move-object/from16 p0, v0

    move-object/from16 p32, v1

    move/from16 p1, v2

    move/from16 p2, v3

    move/from16 p3, v4

    move-object/from16 p4, v5

    move-object/from16 p5, v6

    move-object/from16 p6, v7

    move-object/from16 p7, v8

    move/from16 p8, v9

    move/from16 p9, v10

    move/from16 p10, v11

    move-object/from16 p11, v12

    move-object/from16 p12, v13

    move-object/from16 p13, v14

    move-object/from16 p14, v15

    move-object/from16 p19, v16

    invoke-direct/range {p0 .. p32}, Lg57;-><init>(ZZZLjava/lang/Boolean;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;IZZLjava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Boolean;ZZLjava/util/List;ZZLjava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lg54;)V

    return-object v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    if-eq p1, p0, :cond_12a

    instance-of v0, p1, Lg57;

    if-eqz v0, :cond_128

    sget-object v0, Lg54;->d:Lg54;

    iget-object v1, p0, Lg57;->a:Lg54;

    if-nez v1, :cond_d

    move-object v1, v0

    :cond_d
    check-cast p1, Lg57;

    iget-object v2, p1, Lg57;->a:Lg54;

    if-eqz v2, :cond_14

    move-object v0, v2

    :cond_14
    invoke-virtual {v1, v0}, Lg54;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_128

    iget-boolean v0, p0, Lg57;->c:Z

    iget-boolean v1, p1, Lg57;->c:Z

    if-ne v0, v1, :cond_128

    iget-boolean v0, p0, Lg57;->d:Z

    iget-boolean v1, p1, Lg57;->d:Z

    if-ne v0, v1, :cond_128

    iget-boolean v0, p0, Lg57;->e:Z

    iget-boolean v1, p1, Lg57;->e:Z

    if-ne v0, v1, :cond_128

    iget-object v0, p0, Lg57;->f:Ljava/lang/Boolean;

    iget-object v1, p1, Lg57;->f:Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_128

    iget-object v0, p0, Lg57;->g:Ljava/lang/String;

    iget-object v1, p1, Lg57;->g:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_128

    iget-object v0, p0, Lg57;->h:Ljava/lang/Boolean;

    iget-object v1, p1, Lg57;->h:Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_128

    iget-object v0, p0, Lg57;->i:Ljava/lang/Boolean;

    iget-object v1, p1, Lg57;->i:Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_128

    iget v0, p0, Lg57;->j:I

    iget v1, p1, Lg57;->j:I

    if-ne v0, v1, :cond_128

    iget-boolean v0, p0, Lg57;->k:Z

    iget-boolean v1, p1, Lg57;->k:Z

    if-ne v0, v1, :cond_128

    iget-boolean v0, p0, Lg57;->l:Z

    iget-boolean v1, p1, Lg57;->l:Z

    if-ne v0, v1, :cond_128

    iget-object v0, p0, Lg57;->m:Ljava/lang/String;

    iget-object v1, p1, Lg57;->m:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_128

    iget-object v0, p0, Lg57;->n:Ljava/lang/Boolean;

    iget-object v1, p1, Lg57;->n:Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_128

    iget-object v0, p0, Lg57;->o:Ljava/lang/Boolean;

    iget-object v1, p1, Lg57;->o:Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_128

    iget-object v0, p0, Lg57;->p:Ljava/lang/Boolean;

    iget-object v1, p1, Lg57;->p:Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_128

    iget-object v0, p0, Lg57;->q:Ljava/lang/String;

    iget-object v1, p1, Lg57;->q:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_128

    iget-object v0, p0, Lg57;->r:Ljava/lang/Boolean;

    iget-object v1, p1, Lg57;->r:Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_128

    iget-boolean v0, p0, Lg57;->s:Z

    iget-boolean v1, p1, Lg57;->s:Z

    if-ne v0, v1, :cond_128

    iget-boolean v0, p0, Lg57;->t:Z

    iget-boolean v1, p1, Lg57;->t:Z

    if-ne v0, v1, :cond_128

    iget-object v0, p0, Lg57;->G:Ljava/util/List;

    iget-object v1, p1, Lg57;->G:Ljava/util/List;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_128

    iget-boolean v0, p0, Lg57;->u:Z

    iget-boolean v1, p1, Lg57;->u:Z

    if-ne v0, v1, :cond_128

    iget-boolean v0, p0, Lg57;->v:Z

    iget-boolean v1, p1, Lg57;->v:Z

    if-ne v0, v1, :cond_128

    iget-object v0, p0, Lg57;->w:Ljava/lang/Boolean;

    iget-object v1, p1, Lg57;->w:Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_128

    iget-object v0, p0, Lg57;->x:Ljava/lang/Boolean;

    iget-object v1, p1, Lg57;->x:Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_128

    iget-object v0, p0, Lg57;->y:Ljava/lang/String;

    iget-object v1, p1, Lg57;->y:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_128

    iget-object v0, p0, Lg57;->z:Ljava/lang/Boolean;

    iget-object v1, p1, Lg57;->z:Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_128

    iget-object v0, p0, Lg57;->A:Ljava/lang/Boolean;

    iget-object v1, p1, Lg57;->A:Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_128

    iget-object v0, p0, Lg57;->B:Ljava/lang/Boolean;

    iget-object v1, p1, Lg57;->B:Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_128

    iget-object v0, p0, Lg57;->C:Ljava/lang/Boolean;

    iget-object v1, p1, Lg57;->C:Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_128

    iget-object v0, p0, Lg57;->D:Ljava/lang/String;

    iget-object v1, p1, Lg57;->D:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_128

    iget-object v0, p0, Lg57;->E:Ljava/lang/String;

    iget-object v1, p1, Lg57;->E:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_128

    iget-object p0, p0, Lg57;->F:Ljava/lang/Boolean;

    iget-object p1, p1, Lg57;->F:Ljava/lang/Boolean;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12a

    :cond_128
    const/4 p0, 0x0

    return p0

    :cond_12a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 6

    iget v0, p0, Lg57;->b:I

    if-nez v0, :cond_184

    iget-object v0, p0, Lg57;->a:Lg54;

    if-nez v0, :cond_a

    sget-object v0, Lg54;->d:Lg54;

    :cond_a
    invoke-virtual {v0}, Lg54;->hashCode()I

    move-result v0

    const/16 v1, 0x25

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lg57;->c:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lg57;->d:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lg57;->e:Z

    const/16 v3, 0x559

    invoke-static {v0, v3, v2}, Lfki;->k(IIZ)I

    move-result v0

    const/4 v2, 0x0

    iget-object v4, p0, Lg57;->f:Ljava/lang/Boolean;

    if-eqz v4, :cond_33

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v4

    goto :goto_34

    :cond_33
    move v4, v2

    :goto_34
    add-int/2addr v0, v4

    mul-int/2addr v0, v3

    iget-object v3, p0, Lg57;->g:Ljava/lang/String;

    if-eqz v3, :cond_3f

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto :goto_40

    :cond_3f
    move v3, v2

    :goto_40
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lg57;->h:Ljava/lang/Boolean;

    if-eqz v3, :cond_4f

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v3

    goto :goto_50

    :cond_4f
    move v3, v2

    :goto_50
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lg57;->i:Ljava/lang/Boolean;

    if-eqz v3, :cond_5f

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v3

    goto :goto_60

    :cond_5f
    move v3, v2

    :goto_60
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    add-int/lit16 v0, v0, 0x4d5

    mul-int/2addr v0, v1

    iget v3, p0, Lg57;->j:I

    invoke-static {v3}, Ljava/lang/Integer;->hashCode(I)I

    move-result v3

    add-int/2addr v3, v0

    mul-int/2addr v3, v1

    add-int/lit16 v3, v3, 0x4d5

    mul-int/2addr v3, v1

    iget-boolean v0, p0, Lg57;->k:Z

    invoke-static {v3, v1, v0}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v3, p0, Lg57;->l:Z

    invoke-static {v0, v1, v3}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v3, p0, Lg57;->m:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    add-int/2addr v3, v0

    mul-int/2addr v3, v1

    add-int/lit16 v3, v3, 0x4d5

    mul-int/2addr v3, v1

    iget-object v0, p0, Lg57;->n:Ljava/lang/Boolean;

    if-eqz v0, :cond_94

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    goto :goto_95

    :cond_94
    move v0, v2

    :goto_95
    add-int/2addr v3, v0

    mul-int/2addr v3, v1

    iget-object v0, p0, Lg57;->o:Ljava/lang/Boolean;

    if-eqz v0, :cond_a4

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    goto :goto_a5

    :cond_a4
    move v0, v2

    :goto_a5
    add-int/2addr v3, v0

    mul-int/2addr v3, v1

    iget-object v0, p0, Lg57;->p:Ljava/lang/Boolean;

    if-eqz v0, :cond_b4

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    goto :goto_b5

    :cond_b4
    move v0, v2

    :goto_b5
    add-int/2addr v3, v0

    mul-int/2addr v3, v1

    iget-object v0, p0, Lg57;->q:Ljava/lang/String;

    if-eqz v0, :cond_c0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_c1

    :cond_c0
    move v0, v2

    :goto_c1
    add-int/2addr v3, v0

    mul-int/2addr v3, v1

    iget-object v0, p0, Lg57;->r:Ljava/lang/Boolean;

    if-eqz v0, :cond_d0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    goto :goto_d1

    :cond_d0
    move v0, v2

    :goto_d1
    add-int/2addr v3, v0

    mul-int/2addr v3, v1

    iget-boolean v0, p0, Lg57;->s:Z

    invoke-static {v3, v1, v0}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v3, p0, Lg57;->t:Z

    invoke-static {v0, v1, v3}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v3, p0, Lg57;->G:Ljava/util/List;

    invoke-static {v0, v1, v3}, Lrfp;->f(IILjava/util/List;)I

    move-result v0

    iget-boolean v3, p0, Lg57;->u:Z

    invoke-static {v0, v1, v3}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v3, p0, Lg57;->v:Z

    invoke-static {v0, v1, v3}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v3, p0, Lg57;->w:Ljava/lang/Boolean;

    if-eqz v3, :cond_fe

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v3

    goto :goto_ff

    :cond_fe
    move v3, v2

    :goto_ff
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lg57;->x:Ljava/lang/Boolean;

    if-eqz v3, :cond_10e

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v3

    goto :goto_10f

    :cond_10e
    move v3, v2

    :goto_10f
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lg57;->y:Ljava/lang/String;

    if-eqz v3, :cond_11a

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto :goto_11b

    :cond_11a
    move v3, v2

    :goto_11b
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lg57;->z:Ljava/lang/Boolean;

    if-eqz v3, :cond_12a

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v3

    goto :goto_12b

    :cond_12a
    move v3, v2

    :goto_12b
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lg57;->A:Ljava/lang/Boolean;

    if-eqz v3, :cond_13a

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v3

    goto :goto_13b

    :cond_13a
    move v3, v2

    :goto_13b
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lg57;->B:Ljava/lang/Boolean;

    if-eqz v3, :cond_14a

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v3

    goto :goto_14b

    :cond_14a
    move v3, v2

    :goto_14b
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lg57;->C:Ljava/lang/Boolean;

    if-eqz v3, :cond_15a

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v3

    goto :goto_15b

    :cond_15a
    move v3, v2

    :goto_15b
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lg57;->D:Ljava/lang/String;

    if-eqz v3, :cond_166

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto :goto_167

    :cond_166
    move v3, v2

    :goto_167
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lg57;->E:Ljava/lang/String;

    if-eqz v3, :cond_172

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto :goto_173

    :cond_172
    move v3, v2

    :goto_173
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v1, p0, Lg57;->F:Ljava/lang/Boolean;

    if-eqz v1, :cond_181

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v2

    :cond_181
    add-int/2addr v0, v2

    iput v0, p0, Lg57;->b:I

    :cond_184
    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 11

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "developer_mode_enabled="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v2, p0, Lg57;->c:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "web_view_debug_enabled="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v2, p0, Lg57;->d:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "use_test_net="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v2, p0, Lg57;->e:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lg57;->f:Ljava/lang/Boolean;

    if-eqz v1, :cond_53

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "use_mobile_auth_staging="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_53
    iget-object v1, p0, Lg57;->g:Ljava/lang/String;

    if-eqz v1, :cond_64

    invoke-static {v1}, Lsgb;->V(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "country_code="

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_64
    iget-object v1, p0, Lg57;->h:Ljava/lang/Boolean;

    if-eqz v1, :cond_79

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "simulate_full_cloud_storage="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_79
    iget-object v1, p0, Lg57;->i:Ljava/lang/Boolean;

    if-eqz v1, :cond_8e

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "simulate_save_error_cloud_storage="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_8e
    const-string v1, "enable_add_cash_v3=false"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "navigation_session_timeout="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lg57;->j:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v1, "enable_withdraw_v3=false"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "highlight_provisional_transaction="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v2, p0, Lg57;->k:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "enable_virtual_account="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v2, p0, Lg57;->l:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lg57;->m:Ljava/lang/String;

    invoke-static {v1}, Lsgb;->V(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "discover_environment="

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v1, "force_enable_local_payments=false"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lg57;->n:Ljava/lang/Boolean;

    if-eqz v1, :cond_fa

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "enable_virtual_cards="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_fa
    iget-object v1, p0, Lg57;->o:Ljava/lang/Boolean;

    if-eqz v1, :cond_10f

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "use_fake_gnosis_api="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_10f
    iget-object v1, p0, Lg57;->p:Ljava/lang/Boolean;

    if-eqz v1, :cond_124

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "filter_discover_data="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_124
    iget-object v1, p0, Lg57;->q:Ljava/lang/String;

    if-eqz v1, :cond_135

    invoke-static {v1}, Lsgb;->V(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "virtual_card_provider="

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_135
    iget-object v1, p0, Lg57;->r:Ljava/lang/Boolean;

    if-eqz v1, :cond_14a

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "show_provider_label_for_local_payments="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_14a
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "enable_sumsub_kyc="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v2, p0, Lg57;->s:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "force_enable_lock_screen="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v2, p0, Lg57;->t:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lg57;->G:Ljava/util/List;

    move-object v2, v1

    check-cast v2, Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_195

    move-object v3, v1

    check-cast v3, Ljava/lang/Iterable;

    sget-object v8, Lrgb;->a:Lrgb;

    const/16 v9, 0x19

    const/4 v4, 0x0

    const-string v5, "["

    const-string v6, "]"

    const/4 v7, 0x0

    invoke-static/range {v3 .. v9}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "saved_test_page_urls="

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_195
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "use_gnosis_sandbox="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v2, p0, Lg57;->u:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "skip_virtual_card_account_restoration_onboarding="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v2, p0, Lg57;->v:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lg57;->w:Ljava/lang/Boolean;

    if-eqz v1, :cond_1d0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "fail_gnosis_api="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1d0
    iget-object v1, p0, Lg57;->x:Ljava/lang/Boolean;

    if-eqz v1, :cond_1e5

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "squid_withdraws="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1e5
    iget-object v1, p0, Lg57;->y:Ljava/lang/String;

    if-eqz v1, :cond_1f6

    invoke-static {v1}, Lsgb;->V(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "feature_environment="

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1f6
    iget-object v1, p0, Lg57;->z:Ljava/lang/Boolean;

    if-eqz v1, :cond_20b

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "enable_apple_pay="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_20b
    iget-object v1, p0, Lg57;->A:Ljava/lang/Boolean;

    if-eqz v1, :cond_220

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "dynamic_tipping="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_220
    iget-object v1, p0, Lg57;->B:Ljava/lang/Boolean;

    if-eqz v1, :cond_235

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "report_to_osp_dump="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_235
    iget-object v1, p0, Lg57;->C:Ljava/lang/Boolean;

    if-eqz v1, :cond_24a

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "enable_wc_pay="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_24a
    iget-object v1, p0, Lg57;->D:Ljava/lang/String;

    if-eqz v1, :cond_25b

    invoke-static {v1}, Lsgb;->V(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "rain_api_key="

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_25b
    iget-object v1, p0, Lg57;->E:Ljava/lang/String;

    if-eqz v1, :cond_26c

    invoke-static {v1}, Lsgb;->V(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "sumsub_environment="

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_26c
    iget-object p0, p0, Lg57;->F:Ljava/lang/Boolean;

    if-eqz p0, :cond_281

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "enable_native_intercom="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_281
    const/4 v5, 0x0

    const/16 v6, 0x38

    const-string v1, ", "

    const-string v2, "DeveloperPreferencesProto{"

    const-string v3, "}"

    const/4 v4, 0x0

    invoke-static/range {v0 .. v6}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
