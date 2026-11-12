.class public Lmsh;
.super Loqe;
.source "SourceFile"


# static fields
.field public static final C:Ljava/util/List;


# instance fields
.field public final A:Lkm5;

.field public final B:Lnb8;

.field public final e:Ljava/util/concurrent/atomic/AtomicReference;

.field public final f:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final g:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final h:Ljava/lang/String;

.field public final i:Landroid/net/Uri;

.field public final j:I

.field public final k:Landroid/net/Uri;

.field public final l:Landroid/net/Uri;

.field public final m:Landroid/net/Uri;

.field public final n:Landroid/net/Uri;

.field public final o:J

.field public final p:J

.field public final q:Ljava/lang/String;

.field public final r:Ljava/lang/String;

.field public final s:Ljava/lang/String;

.field public final t:I

.field public final u:Ljava/util/List;

.field public final v:Lp12;

.field public final w:Ljava/util/List;

.field public final x:Ljava/util/List;

.field public final y:Ljava/lang/String;

.field public final z:Lxlg;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    sget-object v0, Llsh;->f:Llsh;

    sget-object v1, Llsh;->g:Llsh;

    sget-object v2, Llsh;->c:Llsh;

    sget-object v3, Llsh;->d:Llsh;

    sget-object v4, Llsh;->e:Llsh;

    filled-new-array {v2, v3, v4, v0, v1}, [Llsh;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lmsh;->C:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;ILandroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;JJLjava/lang/String;Ljava/lang/String;IIILjava/util/ArrayList;Ljava/lang/String;Lp12;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Lqre;Lxlg;Lnb8;)V
    .registers 29

    move-object/from16 v0, p25

    invoke-direct {p0, p1, p2, v0}, Loqe;-><init>(Ljava/lang/String;Ljava/lang/String;Lqre;)V

    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object p2, Llsh;->b:Llsh;

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lmsh;->e:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance p1, Lkm5;

    const/4 p2, 0x5

    invoke-direct {p1, p2}, Lkm5;-><init>(B)V

    iput-object p1, p0, Lmsh;->A:Lkm5;

    iput-object p3, p0, Lmsh;->h:Ljava/lang/String;

    iput-object p4, p0, Lmsh;->i:Landroid/net/Uri;

    iput p5, p0, Lmsh;->j:I

    iput-object p6, p0, Lmsh;->k:Landroid/net/Uri;

    iput-object p7, p0, Lmsh;->l:Landroid/net/Uri;

    iput-object p8, p0, Lmsh;->m:Landroid/net/Uri;

    iput-object p9, p0, Lmsh;->n:Landroid/net/Uri;

    iput-wide p10, p0, Lmsh;->o:J

    iput-wide p12, p0, Lmsh;->p:J

    iput-object p14, p0, Lmsh;->q:Ljava/lang/String;

    move-object/from16 p1, p15

    iput-object p1, p0, Lmsh;->r:Ljava/lang/String;

    move/from16 p1, p16

    iput p1, p0, Lmsh;->t:I

    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    move/from16 p2, p17

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object p1, p0, Lmsh;->f:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    move/from16 p2, p18

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object p1, p0, Lmsh;->g:Ljava/util/concurrent/atomic/AtomicInteger;

    move-object/from16 p1, p20

    iput-object p1, p0, Lmsh;->s:Ljava/lang/String;

    move-object/from16 p1, p21

    iput-object p1, p0, Lmsh;->v:Lp12;

    const/4 p1, 0x0

    if-eqz p22, :cond_54

    invoke-static/range {p22 .. p22}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p2

    goto :goto_55

    :cond_54
    move-object p2, p1

    :goto_55
    iput-object p2, p0, Lmsh;->w:Ljava/util/List;

    if-eqz p23, :cond_5e

    invoke-static/range {p23 .. p23}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p2

    goto :goto_5f

    :cond_5e
    move-object p2, p1

    :goto_5f
    iput-object p2, p0, Lmsh;->x:Ljava/util/List;

    if-eqz p19, :cond_67

    invoke-static/range {p19 .. p19}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    :cond_67
    iput-object p1, p0, Lmsh;->u:Ljava/util/List;

    move-object/from16 p1, p24

    iput-object p1, p0, Lmsh;->y:Ljava/lang/String;

    move-object/from16 p1, p26

    iput-object p1, p0, Lmsh;->z:Lxlg;

    move-object/from16 p1, p27

    iput-object p1, p0, Lmsh;->B:Lnb8;

    return-void
.end method


# virtual methods
.method public final b()Ljava/lang/String;
    .registers 3

    const-string v0, ""

    iget-object p0, p0, Lmsh;->m:Landroid/net/Uri;

    if-eqz p0, :cond_10

    invoke-virtual {p0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p0

    sget-object v1, Laik;->a:[Ljava/lang/String;

    if-nez p0, :cond_f

    return-object v0

    :cond_f
    return-object p0

    :cond_10
    return-object v0
.end method

.method public final c(Llsh;)V
    .registers 9

    iget-object v0, p0, Lmsh;->e:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Llsh;

    sget-object v2, Llsh;->i:Llsh;

    if-eq v1, v2, :cond_44

    if-eq v1, p1, :cond_44

    sget-object v2, Lmsh;->C:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v3

    sget-object v4, Llsh;->h:Llsh;

    const/4 v5, -0x1

    const/4 v6, 0x0

    if-eq v3, v5, :cond_1d

    move v1, v6

    move v6, v5

    goto :goto_22

    :cond_1d
    if-ne v1, v4, :cond_21

    move v1, v5

    goto :goto_22

    :cond_21
    move v1, v6

    :goto_22
    invoke-interface {v2, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v2

    if-eq v2, v5, :cond_2b

    add-int/lit8 v6, v6, 0x1

    goto :goto_2f

    :cond_2b
    if-ne p1, v4, :cond_2f

    add-int/lit8 v1, v1, 0x1

    :cond_2f
    :goto_2f
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    iget-object p1, p0, Lmsh;->f:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1, v6}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    iget-object p1, p0, Lmsh;->g:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    new-instance p1, Lvre;

    invoke-direct {p1, p0}, Lvre;-><init>(Lmsh;)V

    invoke-static {p1}, Lac8;->a(Ljava/lang/Object;)V

    :cond_44
    return-void
.end method

.method public final d(Luqe;Lssh;Z)V
    .registers 16

    iget-object v0, p0, Lmsh;->A:Lkm5;

    iget-object v1, v0, Lkm5;->d:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashSet;

    iget-object v2, v0, Lkm5;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_10

    invoke-interface {p2}, Lssh;->a()V

    return-void

    :cond_10
    iget-boolean v2, v0, Lkm5;->a:Z

    if-eqz v2, :cond_18

    invoke-virtual {v1, p2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void

    :cond_18
    const/4 v2, 0x1

    iput-boolean v2, v0, Lkm5;->a:Z

    invoke-virtual {v1, p2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance p2, Llld;

    invoke-direct {p2, p0}, Llld;-><init>(Lmsh;)V

    instance-of v0, p0, Ldre;

    if-eqz v0, :cond_34

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Ljava/util/ArrayList;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p2, p0}, Llld;->j0(Ljava/util/List;)V

    return-void

    :cond_34
    iget-object v0, p1, Luqe;->k:Lqsh;

    new-instance v1, Lyqa;

    invoke-direct {v1, p1, p2}, Lyqa;-><init>(Luqe;Llld;)V

    iget-object p1, v0, Lqsh;->c:Ljava/lang/Object;

    check-cast p1, Lc6j;

    iget-object p1, p1, Lc6j;->b:Ljava/lang/Object;

    move-object v5, p1

    check-cast v5, Lqtm;

    if-nez v5, :cond_47

    return-void

    :cond_47
    iget-object p1, v0, Lqsh;->b:Ljava/lang/Object;

    check-cast p1, Ls9i;

    iget-object p2, p1, Ls9i;->e:Ljava/lang/Object;

    move-object v10, p2

    check-cast v10, Luy8;

    if-eqz v10, :cond_7b

    new-instance v2, Lpsh;

    iget-object p2, p1, Ls9i;->b:Ljava/lang/Object;

    move-object v3, p2

    check-cast v3, Landroid/content/Context;

    iget-object p1, p1, Ls9i;->d:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Lvr9;

    iget-object p1, p0, Lmsh;->v:Lp12;

    iget-object p2, p1, Lp12;->b:Ljava/lang/Object;

    move-object v6, p2

    check-cast v6, Ljava/lang/String;

    iget-object p1, p1, Lp12;->a:Ljava/lang/Object;

    move-object v7, p1

    check-cast v7, Ljava/lang/String;

    iget-object v8, p0, Loqe;->c:Ljava/lang/String;

    iget-object v9, p0, Loqe;->d:Lqre;

    move v11, p3

    invoke-direct/range {v2 .. v11}, Lpsh;-><init>(Landroid/content/Context;Lywh;Lqtm;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lqre;Luy8;Z)V

    new-instance p0, Lqfb;

    invoke-direct {p0, v0, v1}, Lqfb;-><init>(Lqsh;Lyqa;)V

    invoke-virtual {v2, p0}, Ln82;->U(Lm82;)V

    return-void

    :cond_7b
    invoke-static {}, Lh9o;->e()V

    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4

    if-eqz p1, :cond_1f

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_1f

    check-cast p1, Lmsh;

    iget-object p0, p0, Lmsh;->v:Lp12;

    iget-object p0, p0, Lp12;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    iget-object p1, p1, Lmsh;->v:Lp12;

    iget-object p1, p1, Lp12;->b:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_1f
    const/4 p0, 0x0

    return p0
.end method

.method public hashCode()I
    .registers 1

    iget-object p0, p0, Lmsh;->v:Lp12;

    iget-object p0, p0, Lp12;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    return p0
.end method
