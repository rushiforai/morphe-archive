.class public final Ll/yp1;
.super Ll/dzd;
.source "SourceFile"


# instance fields
.field public final c:Z

.field public final d:I

.field public final e:I


# direct methods
.method public constructor <init>(Ll/d13;[Ll/s5d0;ZII)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dzd;-><init>(Ll/d13;[Ll/s5d0;)V

    .line 2
    .line 3
    .line 4
    iput-boolean p3, p0, Ll/yp1;->c:Z

    .line 5
    .line 6
    iput p4, p0, Ll/yp1;->d:I

    .line 7
    .line 8
    iput p5, p0, Ll/yp1;->e:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/yp1;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Ll/yp1;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/yp1;->c:Z

    .line 2
    .line 3
    return p0
.end method
