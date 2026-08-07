.class public final Ll/xhd;
.super Ll/bid;
.source "SourceFile"


# instance fields
.field public final b:C


# direct methods
.method public constructor <init>(IC)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bid;-><init>(I)V

    .line 2
    .line 3
    .line 4
    iput-char p2, p0, Ll/xhd;->b:C

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b()C
    .locals 0

    .line 1
    iget-char p0, p0, Ll/xhd;->b:C

    .line 2
    .line 3
    return p0
.end method

.method public c()Z
    .locals 1

    .line 1
    iget-char p0, p0, Ll/xhd;->b:C

    .line 2
    .line 3
    const/16 v0, 0x24

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method
