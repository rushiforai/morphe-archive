.class public final Ll/fy5;
.super Ll/ey5;
.source "SourceFile"

# interfaces
.implements Ll/pke0;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>(JJLl/i710$a;Z)V
    .locals 8

    .line 1
    iget v5, p5, Ll/i710$a;->f:I

    .line 2
    .line 3
    iget v6, p5, Ll/i710$a;->c:I

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    move-wide v1, p1

    .line 7
    move-wide v3, p3

    .line 8
    move v7, p6

    .line 9
    invoke-direct/range {v0 .. v7}, Ll/ey5;-><init>(JJIIZ)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public c(J)J
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ey5;->b(J)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method public g()J
    .locals 2

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    return-wide v0
.end method
