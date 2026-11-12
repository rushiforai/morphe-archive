.class public final Ln9p;
.super Lbap;
.source "SourceFile"


# direct methods
.method public constructor <init>(ZZZ)V
    .registers 10

    const/4 v2, 0x0

    const/16 v1, 0x9

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lbap;-><init>(IZZZZ)V

    return-void
.end method
