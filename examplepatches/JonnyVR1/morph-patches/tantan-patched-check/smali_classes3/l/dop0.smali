.class public Ll/dop0;
.super Ll/dmj;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ll/dmj;-><init>()V

    return-void
.end method

.method public constructor <init>(DD)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/dmj;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Ll/dmj;->b:D

    .line 5
    .line 6
    iput-wide p3, p0, Ll/dmj;->a:D

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public c()Ll/fej;
    .locals 8

    .line 1
    iget-wide v0, p0, Ll/dmj;->b:D

    .line 2
    .line 3
    iget-wide v2, p0, Ll/dmj;->a:D

    .line 4
    .line 5
    invoke-static {v0, v1, v2, v3}, Ll/sgj0;->a(DD)[D

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/fej;

    .line 10
    .line 11
    iget-wide v2, p0, Ll/dmj;->b:D

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    aget-wide v4, v0, v4

    .line 15
    .line 16
    add-double/2addr v2, v4

    .line 17
    iget-wide v4, p0, Ll/dmj;->a:D

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    aget-wide v6, v0, p0

    .line 21
    .line 22
    add-double/2addr v4, v6

    .line 23
    invoke-direct {v1, v2, v3, v4, v5}, Ll/fej;-><init>(DD)V

    .line 24
    .line 25
    .line 26
    return-object v1
.end method
