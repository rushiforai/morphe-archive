.class public final Ll/mlr0;
.super Ll/eer0;
.source "SourceFile"

# interfaces
.implements Ll/tlr0;


# direct methods
.method public constructor <init>(JJLl/vfr0;Z)V
    .locals 8

    .line 1
    iget v5, p5, Ll/vfr0;->f:I

    .line 2
    .line 3
    iget v6, p5, Ll/vfr0;->c:I

    .line 4
    .line 5
    const/4 v7, 0x0

    .line 6
    move-object v0, p0

    .line 7
    move-wide v1, p1

    .line 8
    move-wide v3, p3

    .line 9
    invoke-direct/range {v0 .. v7}, Ll/eer0;-><init>(JJIIZ)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final b(J)J
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/eer0;->c(J)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method public final zzc()J
    .locals 2

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    return-wide v0
.end method
