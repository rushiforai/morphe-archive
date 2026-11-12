.class public abstract Lqkj;
.super Lb63;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lvql;Lwwd;Lrxh;Lrxh;I)V
    .registers 14

    and-int/lit8 v0, p5, 0x1

    if-eqz v0, :cond_b

    new-instance p1, Lvql;

    const/4 v0, 0x0

    const/4 v1, 0x3

    invoke-direct {p1, v0, v1}, Lvql;-><init>(Lrxh;I)V

    :cond_b
    move-object v3, p1

    and-int/lit8 p1, p5, 0x8

    if-eqz p1, :cond_17

    new-instance p4, Lqxh;

    const-string p1, ""

    invoke-direct {p4, p1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    :cond_17
    move-object v6, p4

    and-int/lit8 p5, p5, 0x10

    if-eqz p5, :cond_24

    const p1, 0x7f15028f

    :goto_1f
    move-object v2, p0

    move v7, p1

    move-object v4, p2

    move-object v5, p3

    goto :goto_28

    :cond_24
    const p1, 0x7f150290

    goto :goto_1f

    :goto_28
    invoke-direct/range {v2 .. v7}, Lb63;-><init>(Lvql;Lwwd;Lpxh;Lpxh;I)V

    return-void
.end method
