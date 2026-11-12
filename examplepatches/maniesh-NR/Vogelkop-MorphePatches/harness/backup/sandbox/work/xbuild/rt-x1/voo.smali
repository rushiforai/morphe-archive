.class public abstract Lvoo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Loho;

.field public final b:Lpro;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;

.field public final g:Lgzo;

.field public final h:I

.field public final i:Ljava/lang/String;

.field public final j:Ljava/lang/String;

.field public final k:D

.field public final l:Lfuo;

.field public final m:Ljava/lang/Integer;

.field public final n:Ljava/lang/Integer;

.field public final o:Ljava/lang/String;

.field public final p:Ljava/lang/String;

.field public final q:Lmzo;

.field public final r:Lzyk;

.field public final s:Lzyk;

.field public final t:Lzyk;

.field public final u:Ljava/lang/String;

.field public final v:Ljava/lang/String;

.field public final w:Lddp;

.field public x:Ljava/io/File;

.field public final y:Lz4k;


# direct methods
.method public constructor <init>(Lddp;Loho;Lpro;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgzo;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lvoo;->a:Loho;

    iput-object p3, p0, Lvoo;->b:Lpro;

    iput-object p4, p0, Lvoo;->c:Ljava/lang/String;

    iput-object p5, p0, Lvoo;->d:Ljava/lang/String;

    iput-object p6, p0, Lvoo;->e:Ljava/lang/String;

    iput-object p7, p0, Lvoo;->f:Ljava/lang/String;

    iput-object p8, p0, Lvoo;->g:Lgzo;

    iget p3, p2, Loho;->d:I

    iget-object p4, p2, Loho;->l:Lsho;

    iput p3, p0, Lvoo;->h:I

    iget-object p3, p2, Loho;->o:Ljava/lang/String;

    const/4 p5, 0x0

    if-eqz p3, :cond_25

    invoke-static {p3}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    goto :goto_26

    :cond_25
    move-object p3, p5

    :goto_26
    if-eqz p3, :cond_2e

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p6

    if-nez p6, :cond_2f

    :cond_2e
    move-object p3, p5

    :cond_2f
    iput-object p3, p0, Lvoo;->i:Ljava/lang/String;

    iget-object p3, p2, Loho;->g:Ljava/lang/String;

    if-nez p3, :cond_37

    const-string p3, ""

    :cond_37
    iput-object p3, p0, Lvoo;->j:Ljava/lang/String;

    iget-object p3, p2, Loho;->p:Ljava/lang/Double;

    if-eqz p3, :cond_42

    invoke-virtual {p3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p6

    goto :goto_44

    :cond_42
    const-wide/16 p6, 0x0

    :goto_44
    iput-wide p6, p0, Lvoo;->k:D

    sget-object p3, Lfuo;->Companion:Lqto;

    iget p6, p4, Lsho;->a:I

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p6}, Lqto;->a(I)Lfuo;

    move-result-object p3

    iput-object p3, p0, Lvoo;->l:Lfuo;

    iget-object p3, p2, Loho;->h:Ljava/lang/Integer;

    iput-object p3, p0, Lvoo;->m:Ljava/lang/Integer;

    iget-object p2, p2, Loho;->i:Ljava/lang/Integer;

    iput-object p2, p0, Lvoo;->n:Ljava/lang/Integer;

    iget-object p2, p4, Lsho;->b:Ljava/lang/String;

    iput-object p2, p0, Lvoo;->o:Ljava/lang/String;

    iget-object p2, p4, Lsho;->c:Ljava/lang/String;

    iput-object p2, p0, Lvoo;->p:Ljava/lang/String;

    iget-object p2, p4, Lsho;->d:Laio;

    if-eqz p2, :cond_85

    iget-object p3, p2, Laio;->c:Ljava/lang/String;

    iget-object p6, p2, Laio;->b:Ljava/lang/String;

    iget-object p2, p2, Laio;->a:Ljava/lang/String;

    invoke-static {p2}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result p7

    if-nez p7, :cond_85

    invoke-static {p6}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result p7

    if-nez p7, :cond_85

    invoke-static {p3}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result p7

    if-nez p7, :cond_85

    new-instance p7, Lmzo;

    invoke-direct {p7, p2, p6, p3}, Lmzo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_86

    :cond_85
    move-object p7, p5

    :goto_86
    iput-object p7, p0, Lvoo;->q:Lmzo;

    new-instance p2, Lano;

    const/4 p3, 0x2

    invoke-direct {p2, p0, p3}, Lano;-><init>(Lvoo;B)V

    invoke-static {p2}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p2

    iput-object p2, p0, Lvoo;->r:Lzyk;

    new-instance p2, Lano;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p3}, Lano;-><init>(Lvoo;B)V

    invoke-static {p2}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p2

    iput-object p2, p0, Lvoo;->s:Lzyk;

    new-instance p2, Lano;

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Lano;-><init>(Lvoo;B)V

    invoke-static {p2}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p2

    iput-object p2, p0, Lvoo;->t:Lzyk;

    iget-object p2, p4, Lsho;->j:Ljava/lang/String;

    if-eqz p2, :cond_b9

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p3

    if-lez p3, :cond_b7

    move-object p5, p2

    :cond_b7
    if-nez p5, :cond_bb

    :cond_b9
    const-string p5, "https://privacy.adx.opera.com/wta.html?opera_click_id=MDAyMDBjNmQyZDFkMDFkMDlhODAsczEzNTg0OTYyMDQzMTM2LGE5NjI0MjAwMzM0MDE2LG0xMTU5Mzc2NDA2NzUyMCxtMzk3OTk5MzUwOTg4OCxhOWZjYzgyNzFjMmEyODlkLDE5MDM4OGY2LTVlMzAtNGI4YS1hNDkwLTEwY2ExYWQxYWJlMSxISyxARVUsLDMyMHg0ODAsZXAxMzM3NDMwNjI3MTQ4OCwxLTEsQU5EUk9JRCwsLGJhbm5lcixjb20ub3BlcmEuYWRzLmRlbW8sNDllZjE0MTA4MmZkYTM0Yg"

    :cond_bb
    iput-object p5, p0, Lvoo;->u:Ljava/lang/String;

    iget-object p2, p4, Lsho;->k:Ljava/lang/String;

    iput-object p2, p0, Lvoo;->v:Ljava/lang/String;

    if-nez p1, :cond_c8

    new-instance p1, Lddp;

    invoke-direct {p1}, Lddp;-><init>()V

    :cond_c8
    iput-object p1, p0, Lvoo;->w:Lddp;

    new-instance p1, Lz4k;

    const/16 p2, 0x12

    invoke-direct {p1, p0, p2}, Lz4k;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lvoo;->y:Lz4k;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 7

    sget-object v0, Lpn7;->b:Lon7;

    iget v0, p0, Lvoo;->h:I

    sget-object v1, Lun7;->e:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    iget-object p0, p0, Lvoo;->w:Lddp;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iget-wide v4, p0, Lddp;->b:J

    sub-long/2addr v2, v4

    cmp-long p0, v2, v0

    if-ltz p0, :cond_20

    const/4 p0, 0x1

    return p0

    :cond_20
    const/4 p0, 0x0

    return p0
.end method

.method public b()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lvoo;->t:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    return-object p0
.end method

.method public c()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lvoo;->s:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    return-object p0
.end method

.method public d()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lvoo;->r:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    return-object p0
.end method
