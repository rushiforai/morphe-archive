.class public final Lvl3;
.super Llt8;
.source "SourceFile"


# direct methods
.method public constructor <init>(IIIIIIII)V
    .registers 21

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Llt8;-><init>(B)V

    const/4 v1, 0x0

    const-wide/16 v2, 0x14

    move v4, p1

    move v5, p2

    move v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    move/from16 v10, p7

    move/from16 v11, p8

    invoke-static/range {v1 .. v11}, LJ/N;->MY6OaJyS(ZJIIIIIIII)J

    move-result-wide p1

    invoke-virtual {p0, p1, p2}, Llt8;->e(J)V

    return-void
.end method
