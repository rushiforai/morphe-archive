.class public final Lx2l;
.super Ldt1;
.source "SourceFile"

# interfaces
.implements Ld4a;


# static fields
.field public static final r:Lo2l;

.field public static final s:Lo2l;

.field public static final t:Lnv6;


# instance fields
.field public final e:Lpde;

.field public final f:Lk6l;

.field public final g:Lu4l;

.field public final h:Ls9i;

.field public final i:Lpde;

.field public final j:Lypd;

.field public final k:Lt5l;

.field public l:Lp2l;

.field public final m:Lh5k;

.field public final n:Ltsd;

.field public o:Lo2l;

.field public final p:Lw2l;

.field public final q:Lqz;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lo2l;

    sget-object v1, Ll08;->a:Ll08;

    new-instance v2, Lz6l;

    invoke-direct {v2}, Lz6l;-><init>()V

    sget-object v3, Lp6l;->a:Lp6l;

    invoke-direct {v0, v1, v1, v2, v3}, Lo2l;-><init>(Ljava/util/List;Ljava/util/List;Lz6l;Lp6l;)V

    sput-object v0, Lx2l;->r:Lo2l;

    new-instance v0, Lo2l;

    new-instance v2, Lz6l;

    invoke-direct {v2}, Lz6l;-><init>()V

    sget-object v3, Lp6l;->b:Lp6l;

    invoke-direct {v0, v1, v1, v2, v3}, Lo2l;-><init>(Ljava/util/List;Ljava/util/List;Lz6l;Lp6l;)V

    sput-object v0, Lx2l;->s:Lo2l;

    new-instance v0, Lnv6;

    new-instance v1, Lbvk;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Lbvk;-><init>(B)V

    invoke-direct {v0, v1}, Lnv6;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lx2l;->t:Lnv6;

    return-void
.end method

.method public constructor <init>(Lpde;Lk6l;Lu4l;Lpde;Ls9i;Lpde;Lpde;Lpde;Lypd;Likc;Likc;Lt5l;Ls5l;Lv8a;Lyqa;)V
    .registers 32

    move-object/from16 v0, p0

    invoke-direct {v0}, Ldt1;-><init>()V

    move-object/from16 v1, p1

    iput-object v1, v0, Lx2l;->e:Lpde;

    move-object/from16 v1, p2

    iput-object v1, v0, Lx2l;->f:Lk6l;

    move-object/from16 v1, p3

    iput-object v1, v0, Lx2l;->g:Lu4l;

    move-object/from16 v1, p5

    iput-object v1, v0, Lx2l;->h:Ls9i;

    move-object/from16 v1, p7

    iput-object v1, v0, Lx2l;->i:Lpde;

    move-object/from16 v1, p9

    iput-object v1, v0, Lx2l;->j:Lypd;

    move-object/from16 v1, p12

    iput-object v1, v0, Lx2l;->k:Lt5l;

    sget-object v1, Lp2l;->a:Lp2l;

    iput-object v1, v0, Lx2l;->l:Lp2l;

    new-instance v1, Lh5k;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v0, v1, Lh5k;->d:Ljava/lang/Object;

    new-instance v2, Ljri;

    const/16 v3, 0x16

    invoke-direct {v2, v1, v0, v3}, Ljri;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v2, v1, Lh5k;->b:Ljava/lang/Object;

    new-instance v2, Lvl9;

    invoke-direct {v2}, Lvl9;-><init>()V

    iput-object v2, v1, Lh5k;->c:Ljava/lang/Object;

    iput-object v1, v0, Lx2l;->m:Lh5k;

    new-instance v8, Lc2l;

    move-object/from16 v1, p13

    invoke-direct {v8, v1}, Lc2l;-><init>(Ls5l;)V

    new-instance v9, Lwnm;

    const/4 v1, 0x5

    new-array v1, v1, [Lekc;

    const/4 v10, 0x0

    aput-object p4, v1, v10

    const/4 v11, 0x1

    aput-object p8, v1, v11

    const/4 v12, 0x2

    aput-object p10, v1, v12

    const/4 v2, 0x3

    aput-object p11, v1, v2

    const/4 v13, 0x4

    aput-object p6, v1, v13

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Ljava/lang/Iterable;

    new-instance v1, Ln12;

    const/4 v7, 0x2

    move-object/from16 v2, p4

    move-object/from16 v6, p6

    move-object/from16 v3, p8

    move-object/from16 v4, p10

    move-object/from16 v5, p11

    invoke-direct/range {v1 .. v7}, Ln12;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object v15, v1

    new-instance v1, Lkkc;

    move-object/from16 v3, p4

    move-object/from16 v7, p6

    move-object/from16 v4, p8

    move-object/from16 v5, p10

    move-object/from16 v6, p11

    move-object v2, v8

    invoke-direct/range {v1 .. v7}, Lkkc;-><init>(Ler9;Lekc;Likc;Lekc;Lekc;Lekc;)V

    move-object v3, v4

    const/4 v2, 0x0

    invoke-direct {v9, v2, v14, v15, v1}, Lwnm;-><init>(Ljava/lang/Object;Ljava/lang/Iterable;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    invoke-static {v9}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v1

    iput-object v1, v0, Lx2l;->n:Ltsd;

    invoke-virtual/range {p11 .. p11}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lp6l;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_a1

    if-ne v1, v11, :cond_9d

    sget-object v1, Lx2l;->s:Lo2l;

    goto :goto_a3

    :cond_9d
    invoke-static {}, Lh9o;->p()V

    throw v2

    :cond_a1
    sget-object v1, Lx2l;->r:Lo2l;

    :goto_a3
    iput-object v1, v0, Lx2l;->o:Lo2l;

    new-instance v1, Lw2l;

    invoke-direct {v1, v0, v3}, Lw2l;-><init>(Lx2l;Lpde;)V

    iput-object v1, v0, Lx2l;->p:Lw2l;

    new-instance v1, Lqz;

    const/16 v2, 0x1c

    invoke-direct {v1, v0, v2}, Lqz;-><init>(Ljava/lang/Object;B)V

    iput-object v1, v0, Lx2l;->q:Lqz;

    invoke-virtual {v0, v11}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    sget-object v1, Lb3c;->i:Lh58;

    invoke-static {v1, v1}, Lsko;->e(Lh58;Lh58;)Lw4;

    move-result-object v1

    :goto_be
    invoke-virtual {v1}, Lw4;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_e4

    invoke-virtual {v1}, Lw4;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb3c;

    new-instance v5, Lvdi;

    const/4 v6, 0x7

    move-object/from16 v7, p15

    invoke-direct {v5, v0, v4, v7, v6}, Lvdi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v6, Lgpk;

    const/16 v8, 0xa

    invoke-direct {v6, v8}, Lgpk;-><init>(B)V

    new-instance v8, Le2l;

    invoke-direct {v8, v3, v4, v10}, Le2l;-><init>(Lpde;Lb3c;B)V

    const-class v4, Lu2l;

    invoke-virtual {v0, v4, v5, v6, v8}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    goto :goto_be

    :cond_e4
    move-object/from16 v7, p15

    sget-object v1, Lb3c;->i:Lh58;

    invoke-static {v1, v1}, Lsko;->e(Lh58;Lh58;)Lw4;

    move-result-object v1

    :goto_ec
    invoke-virtual {v1}, Lw4;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_113

    invoke-virtual {v1}, Lw4;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb3c;

    new-instance v5, Lvdi;

    const/16 v6, 0x8

    move-object/from16 v8, p14

    invoke-direct {v5, v0, v4, v8, v6}, Lvdi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v6, Lgpk;

    const/16 v9, 0xb

    invoke-direct {v6, v9}, Lgpk;-><init>(B)V

    new-instance v9, Le2l;

    invoke-direct {v9, v3, v4, v11}, Le2l;-><init>(Lpde;Lb3c;B)V

    const-class v4, Ll2l;

    invoke-virtual {v0, v4, v5, v6, v9}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    goto :goto_ec

    :cond_113
    move-object/from16 v8, p14

    sget-object v1, Lb3c;->i:Lh58;

    invoke-static {v1, v1}, Lsko;->e(Lh58;Lh58;)Lw4;

    move-result-object v1

    :goto_11b
    invoke-virtual {v1}, Lw4;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_150

    invoke-virtual {v1}, Lw4;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb3c;

    new-instance v5, Lws1;

    const/16 v6, 0xf

    move-object/from16 p2, v0

    move-object/from16 p3, v4

    move-object/from16 p1, v5

    move/from16 p6, v6

    move-object/from16 p5, v7

    move-object/from16 p4, v8

    invoke-direct/range {p1 .. p6}, Lws1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v6, Lgpk;

    const/16 v7, 0xd

    invoke-direct {v6, v7}, Lgpk;-><init>(B)V

    new-instance v7, Le2l;

    invoke-direct {v7, v3, v4, v12}, Le2l;-><init>(Lpde;Lb3c;B)V

    const-class v4, Lg2l;

    invoke-virtual {v0, v4, v5, v6, v7}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    move-object/from16 v8, p14

    move-object/from16 v7, p15

    goto :goto_11b

    :cond_150
    new-instance v1, Lgpk;

    const/16 v3, 0xc

    invoke-direct {v1, v3}, Lgpk;-><init>(B)V

    new-instance v3, Lgpk;

    const/16 v4, 0xe

    invoke-direct {v3, v4}, Lgpk;-><init>(B)V

    new-instance v4, La3j;

    invoke-direct {v4, v13}, La3j;-><init>(B)V

    const-class v5, Lh2l;

    invoke-virtual {v0, v5, v1, v3, v4}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    new-instance v1, Lgpk;

    const/16 v3, 0xf

    invoke-direct {v1, v3}, Lgpk;-><init>(B)V

    new-instance v3, Lgpk;

    const/16 v4, 0x10

    invoke-direct {v3, v4}, Lgpk;-><init>(B)V

    new-instance v4, La3j;

    invoke-direct {v4, v13}, La3j;-><init>(B)V

    const-class v5, Li2l;

    invoke-virtual {v0, v5, v1, v3, v4}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    new-instance v1, Lf2l;

    invoke-direct {v1, v0, v10}, Lf2l;-><init>(Lx2l;B)V

    new-instance v3, Lgpk;

    const/16 v4, 0x11

    invoke-direct {v3, v4}, Lgpk;-><init>(B)V

    new-instance v4, La3j;

    invoke-direct {v4, v13}, La3j;-><init>(B)V

    const-class v5, Lk2l;

    invoke-virtual {v0, v5, v1, v3, v4}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    new-instance v1, Lf2l;

    invoke-direct {v1, v0, v11}, Lf2l;-><init>(Lx2l;B)V

    new-instance v3, Lgpk;

    const/16 v4, 0x12

    invoke-direct {v3, v4}, Lgpk;-><init>(B)V

    new-instance v4, La3j;

    invoke-direct {v4, v13}, La3j;-><init>(B)V

    const-class v5, Lj2l;

    invoke-virtual {v0, v5, v1, v3, v4}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    new-instance v1, Lf2l;

    invoke-direct {v1, v0, v12}, Lf2l;-><init>(Lx2l;B)V

    new-instance v3, Lgpk;

    const/16 v4, 0x9

    invoke-direct {v3, v4}, Lgpk;-><init>(B)V

    new-instance v4, La3j;

    invoke-direct {v4, v13}, La3j;-><init>(B)V

    const-class v5, Lr2l;

    invoke-virtual {v0, v5, v1, v3, v4}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    iget-object v1, v0, Lx2l;->f:Lk6l;

    iget-object v3, v0, Lx2l;->e:Lpde;

    iget-object v4, v0, Lx2l;->p:Lw2l;

    new-instance v5, Ld2l;

    invoke-direct {v5, v0, v10}, Ld2l;-><init>(Lx2l;B)V

    invoke-static {v1, v3, v4, v5}, La26;->U(Lw6f;Likc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    iget-object v1, v0, Lx2l;->f:Lk6l;

    iget-object v1, v1, Lk6l;->s:Lg6l;

    iget-object v3, v0, Lx2l;->e:Lpde;

    iget-object v4, v0, Lx2l;->q:Lqz;

    new-instance v5, Ld2l;

    invoke-direct {v5, v0, v11}, Ld2l;-><init>(Lx2l;B)V

    invoke-static {v1, v3, v4, v5}, La26;->U(Lw6f;Likc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    iget-object v1, v0, Lx2l;->n:Ltsd;

    iget-object v3, v0, Lx2l;->e:Lpde;

    new-instance v4, Lqzg;

    invoke-direct {v4, v0, v2}, Lqzg;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1, v3, v4}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final P(Ljava/lang/Runnable;)V
    .registers 3

    iget-object p0, p0, Lx2l;->m:Lh5k;

    iget-object v0, p0, Lh5k;->c:Ljava/lang/Object;

    check-cast v0, Lvl9;

    invoke-virtual {v0, p1}, Lvl9;->a(Ljava/lang/Runnable;)V

    iget-boolean p1, p0, Lh5k;->a:Z

    if-nez p1, :cond_22

    iget-object p1, p0, Lh5k;->d:Ljava/lang/Object;

    check-cast p1, Lx2l;

    iget-object p1, p1, Lx2l;->e:Lpde;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    sget-object v0, Lng;->a:Lng;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_22

    invoke-virtual {p0}, Lh5k;->f()V

    :cond_22
    return-void
.end method

.method public final getItem(I)Le4a;
    .registers 2

    iget-object p0, p0, Ldt1;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le4a;

    return-object p0
.end method

.method public final getItemId(I)J
    .registers 2

    iget-object p0, p0, Ldt1;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lm2l;

    invoke-interface {p0}, Lm2l;->getId()J

    move-result-wide p0

    return-wide p0
.end method
