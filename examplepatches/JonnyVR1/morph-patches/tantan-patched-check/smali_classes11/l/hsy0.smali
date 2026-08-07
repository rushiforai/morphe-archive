.class public final Ll/hsy0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:[Ll/wsu0;

.field public final b:Ll/rty0;

.field public final c:Ll/nwu0;


# direct methods
.method public varargs constructor <init>([Ll/wsu0;)V
    .locals 4

    .line 1
    new-instance v0, Ll/rty0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/rty0;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/nwu0;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/nwu0;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 v2, 0x2

    .line 15
    new-array v2, v2, [Ll/wsu0;

    .line 16
    .line 17
    iput-object v2, p0, Ll/hsy0;->a:[Ll/wsu0;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-static {p1, v3, v2, v3, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/hsy0;->b:Ll/rty0;

    .line 24
    .line 25
    iput-object v1, p0, Ll/hsy0;->c:Ll/nwu0;

    .line 26
    .line 27
    aput-object v0, v2, v3

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    aput-object v1, v2, p0

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public final a(J)J
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hsy0;->c:Ll/nwu0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/nwu0;->c(J)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method public final b()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/hsy0;->b:Ll/rty0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rty0;->i()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public final c(Ll/iet0;)Ll/iet0;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hsy0;->c:Ll/nwu0;

    .line 2
    .line 3
    iget v1, p1, Ll/iet0;->a:F

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/nwu0;->e(F)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/hsy0;->c:Ll/nwu0;

    .line 9
    .line 10
    iget v0, p1, Ll/iet0;->b:F

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/nwu0;->d(F)V

    .line 13
    .line 14
    .line 15
    return-object p1
.end method

.method public final d(Z)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hsy0;->b:Ll/rty0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rty0;->j(Z)V

    .line 4
    .line 5
    .line 6
    return p1
.end method

.method public final e()[Ll/wsu0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hsy0;->a:[Ll/wsu0;

    .line 2
    .line 3
    return-object p0
.end method
