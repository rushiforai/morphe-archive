.class public Ll/anm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qvb0;


# static fields
.field public static final d:Ll/qvb0;


# instance fields
.field public a:I

.field public b:Z

.field public c:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const v0, 0x7fffffff

    .line 2
    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    invoke-static {v0, v1, v1}, Ll/anm;->d(IZZ)Ll/qvb0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Ll/anm;->d:Ll/qvb0;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(IZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/anm;->a:I

    .line 5
    .line 6
    iput-boolean p2, p0, Ll/anm;->b:Z

    .line 7
    .line 8
    iput-boolean p3, p0, Ll/anm;->c:Z

    .line 9
    .line 10
    return-void
.end method

.method public static d(IZZ)Ll/qvb0;
    .locals 1

    .line 1
    new-instance v0, Ll/anm;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/anm;-><init>(IZZ)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/anm;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/anm;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/anm;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Ll/anm;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Ll/anm;

    .line 12
    .line 13
    iget v1, p0, Ll/anm;->a:I

    .line 14
    .line 15
    iget v3, p1, Ll/anm;->a:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-boolean v1, p0, Ll/anm;->b:Z

    .line 20
    .line 21
    iget-boolean v3, p1, Ll/anm;->b:Z

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget-boolean p0, p0, Ll/anm;->c:Z

    .line 26
    .line 27
    iget-boolean p1, p1, Ll/anm;->c:Z

    .line 28
    .line 29
    if-ne p0, p1, :cond_2

    .line 30
    .line 31
    return v0

    .line 32
    :cond_2
    return v2
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Ll/anm;->a:I

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/anm;->b:Z

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    const/high16 v1, 0x400000

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v1, v2

    .line 12
    :goto_0
    xor-int/2addr v0, v1

    .line 13
    iget-boolean p0, p0, Ll/anm;->c:Z

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const/high16 v2, 0x800000

    .line 18
    .line 19
    :cond_1
    xor-int p0, v0, v2

    .line 20
    .line 21
    return p0
.end method
