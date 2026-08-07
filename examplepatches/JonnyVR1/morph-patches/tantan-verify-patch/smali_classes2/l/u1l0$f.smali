.class public abstract Ll/u1l0$f;
.super Ll/u1l0$e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/u1l0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "f"
.end annotation


# instance fields
.field public a:[Ll/cj60$b;

.field public b:Ljava/lang/String;

.field public c:I

.field public d:I


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 27
    invoke-direct {p0, v0}, Ll/u1l0$e;-><init>(Ll/u1l0$a;)V

    .line 28
    iput-object v0, p0, Ll/u1l0$f;->a:[Ll/cj60$b;

    const/4 v0, 0x0

    .line 29
    iput v0, p0, Ll/u1l0$f;->c:I

    return-void
.end method

.method public constructor <init>(Ll/u1l0$f;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Ll/u1l0$e;-><init>(Ll/u1l0$a;)V

    .line 3
    .line 4
    .line 5
    iput-object v0, p0, Ll/u1l0$f;->a:[Ll/cj60$b;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Ll/u1l0$f;->c:I

    .line 9
    .line 10
    iget-object v0, p1, Ll/u1l0$f;->b:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Ll/u1l0$f;->b:Ljava/lang/String;

    .line 13
    .line 14
    iget v0, p1, Ll/u1l0$f;->d:I

    .line 15
    .line 16
    iput v0, p0, Ll/u1l0$f;->d:I

    .line 17
    .line 18
    iget-object p1, p1, Ll/u1l0$f;->a:[Ll/cj60$b;

    .line 19
    .line 20
    invoke-static {p1}, Ll/cj60;->e([Ll/cj60$b;)[Ll/cj60$b;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Ll/u1l0$f;->a:[Ll/cj60$b;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public c()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public d(Landroid/graphics/Path;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Path;->reset()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/u1l0$f;->a:[Ll/cj60$b;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/cj60$b;->h([Ll/cj60$b;Landroid/graphics/Path;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public getPathData()[Ll/cj60$b;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1l0$f;->a:[Ll/cj60$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPathName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1l0$f;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setPathData([Ll/cj60$b;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u1l0$f;->a:[Ll/cj60$b;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/cj60;->b([Ll/cj60$b;[Ll/cj60$b;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Ll/cj60;->e([Ll/cj60$b;)[Ll/cj60$b;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/u1l0$f;->a:[Ll/cj60$b;

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p0, p0, Ll/u1l0$f;->a:[Ll/cj60$b;

    .line 17
    .line 18
    invoke-static {p0, p1}, Ll/cj60;->j([Ll/cj60$b;[Ll/cj60$b;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
