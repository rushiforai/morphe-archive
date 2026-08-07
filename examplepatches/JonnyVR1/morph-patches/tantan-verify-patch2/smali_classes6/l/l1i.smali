.class public Ll/l1i;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:Ljava/lang/String;

.field public final f:Z

.field public g:I


# direct methods
.method public constructor <init>(ZIIIILjava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Ll/l1i;->a:Z

    .line 5
    .line 6
    iput p2, p0, Ll/l1i;->b:I

    .line 7
    .line 8
    iput p3, p0, Ll/l1i;->c:I

    .line 9
    .line 10
    iput p4, p0, Ll/l1i;->d:I

    .line 11
    .line 12
    iput p5, p0, Ll/l1i;->g:I

    .line 13
    .line 14
    iput-object p6, p0, Ll/l1i;->e:Ljava/lang/String;

    .line 15
    .line 16
    iput-boolean p7, p0, Ll/l1i;->f:Z

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/l1i;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/l1i;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/l1i;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l1i;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Ll/l1i;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public f()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/l1i;->e()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, -0x1

    .line 6
    if-eq p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/l1i;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/l1i;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public i()Z
    .locals 1

    .line 1
    iget v0, p0, Ll/l1i;->g:I

    .line 2
    .line 3
    iget p0, p0, Ll/l1i;->d:I

    .line 4
    .line 5
    if-ne v0, p0, :cond_0

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
