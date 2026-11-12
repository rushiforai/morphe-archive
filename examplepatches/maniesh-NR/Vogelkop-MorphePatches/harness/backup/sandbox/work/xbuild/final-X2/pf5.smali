.class public final Lpf5;
.super Lyf5;
.source "SourceFile"


# instance fields
.field public final a:Lkotlin/jvm/functions/Function0;

.field public final b:Lkotlin/jvm/functions/Function0;

.field public final c:Lkotlin/jvm/functions/Function0;

.field public final d:I

.field public final e:I

.field public final f:I


# direct methods
.method public constructor <init>(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;IIILkotlin/jvm/functions/Function0;)V
    .registers 8

    invoke-direct {p0, p7}, Lyf5;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object p1, p0, Lpf5;->a:Lkotlin/jvm/functions/Function0;

    iput-object p2, p0, Lpf5;->b:Lkotlin/jvm/functions/Function0;

    iput-object p3, p0, Lpf5;->c:Lkotlin/jvm/functions/Function0;

    iput p4, p0, Lpf5;->d:I

    iput p5, p0, Lpf5;->e:I

    iput p6, p0, Lpf5;->f:I

    return-void
.end method


# virtual methods
.method public final content(Lwf5;Lih5;I)V
    .registers 15

    move-object v8, p2

    check-cast v8, Lvt9;

    const p2, 0x49d0fc24    # 1712004.5f

    invoke-virtual {v8, p2}, Lvt9;->Y(I)Lvt9;

    invoke-virtual {v8, p1}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result p2

    const/4 v0, 0x4

    if-eqz p2, :cond_12

    move p2, v0

    goto :goto_13

    :cond_12
    const/4 p2, 0x2

    :goto_13
    or-int/2addr p2, p3

    invoke-virtual {v8, p0}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1d

    const/16 v1, 0x20

    goto :goto_1f

    :cond_1d
    const/16 v1, 0x10

    :goto_1f
    or-int/2addr p2, v1

    and-int/lit8 v1, p2, 0x13

    const/16 v2, 0x12

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eq v1, v2, :cond_2a

    move v1, v4

    goto :goto_2b

    :cond_2a
    move v1, v3

    :goto_2b
    and-int/lit8 v2, p2, 0x1

    invoke-virtual {v8, v2, v1}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_6c

    invoke-virtual {v8, p0}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v1

    and-int/lit8 p2, p2, 0xe

    if-eq p2, v0, :cond_3c

    move v4, v3

    :cond_3c
    or-int/2addr v1, v4

    invoke-virtual {v8}, Lvt9;->K()Ljava/lang/Object;

    move-result-object p2

    if-nez v1, :cond_47

    sget-object v0, Lhh5;->a:Lzpa;

    if-ne p2, v0, :cond_4f

    :cond_47
    new-instance p2, Lnf5;

    invoke-direct {p2, p0, p1, v3}, Lnf5;-><init>(Lpf5;Lwf5;B)V

    invoke-virtual {v8, p2}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_4f
    move-object v0, p2

    check-cast v0, Lkotlin/jvm/functions/Function0;

    new-instance p2, Lof5;

    invoke-direct {p2, p0, p1, v3}, Lof5;-><init>(Lpf5;Lwf5;B)V

    const v1, -0x1105d626

    invoke-static {v1, p2, v8}, Lgyg;->P(ILbr9;Lih5;)Lue5;

    move-result-object v7

    const/high16 v9, 0x180000

    const/16 v10, 0x3e

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    invoke-static/range {v0 .. v10}, Lyi4;->g(Lkotlin/jvm/functions/Function0;Lc8e;ZZJLu8i;Lue5;Lih5;II)V

    goto :goto_6f

    :cond_6c
    invoke-virtual {v8}, Lvt9;->Q()V

    :goto_6f
    invoke-virtual {v8}, Lvt9;->r()Lznh;

    move-result-object p2

    if-eqz p2, :cond_7c

    new-instance v0, Lof5;

    invoke-direct {v0, p0, p1, p3}, Lof5;-><init>(Lpf5;Lwf5;I)V

    iput-object v0, p2, Lznh;->d:Lkotlin/jvm/functions/Function2;

    :cond_7c
    return-void
.end method
