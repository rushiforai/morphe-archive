.class public final Ll/mgu0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final e:Ljava/lang/String;

.field public static final f:Ljava/lang/String;

.field public static final g:Ljava/lang/String;

.field public static final h:Ljava/lang/String;

.field public static final i:Ll/mhy0;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# instance fields
.field public final a:I

.field public final b:Ll/t2u0;

.field public final c:[I

.field public final d:[Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/16 v1, 0x24

    .line 3
    .line 4
    invoke-static {v0, v1}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sput-object v0, Ll/mgu0;->e:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-static {v0, v1}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ll/mgu0;->f:Ljava/lang/String;

    .line 16
    .line 17
    const/4 v0, 0x3

    .line 18
    invoke-static {v0, v1}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sput-object v0, Ll/mgu0;->g:Ljava/lang/String;

    .line 23
    .line 24
    const/4 v0, 0x4

    .line 25
    invoke-static {v0, v1}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Ll/mgu0;->h:Ljava/lang/String;

    .line 30
    .line 31
    sget-object v0, Ll/ffu0;->a:Ll/ffu0;

    .line 32
    .line 33
    sput-object v0, Ll/mgu0;->i:Ll/mhy0;

    .line 34
    .line 35
    return-void
.end method

.method public constructor <init>(Ll/t2u0;Z[I[Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget p2, p1, Ll/t2u0;->a:I

    .line 5
    .line 6
    const/4 p2, 0x1

    .line 7
    iput p2, p0, Ll/mgu0;->a:I

    .line 8
    .line 9
    iput-object p1, p0, Ll/mgu0;->b:Ll/t2u0;

    .line 10
    .line 11
    invoke-virtual {p3}, [I->clone()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, [I

    .line 16
    .line 17
    iput-object p1, p0, Ll/mgu0;->c:[I

    .line 18
    .line 19
    invoke-virtual {p4}, [Z->clone()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, [Z

    .line 24
    .line 25
    iput-object p1, p0, Ll/mgu0;->d:[Z

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mgu0;->b:Ll/t2u0;

    .line 2
    .line 3
    iget p0, p0, Ll/t2u0;->c:I

    .line 4
    .line 5
    return p0
.end method

.method public final b(I)Ll/sqr0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mgu0;->b:Ll/t2u0;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Ll/t2u0;->b(I)Ll/sqr0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public final c()Z
    .locals 5

    .line 1
    iget-object p0, p0, Ll/mgu0;->d:[Z

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    :goto_0
    if-ge v2, v0, :cond_1

    .line 7
    .line 8
    aget-boolean v3, p0, v2

    .line 9
    .line 10
    const/4 v4, 0x1

    .line 11
    if-ne v3, v4, :cond_0

    .line 12
    .line 13
    return v4

    .line 14
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    return v1
.end method

.method public final d(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mgu0;->d:[Z

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    aget-boolean p0, p0, p1

    .line 5
    .line 6
    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    const-class v2, Ll/mgu0;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    if-eq v2, v3, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    check-cast p1, Ll/mgu0;

    .line 18
    .line 19
    iget-object v2, p0, Ll/mgu0;->b:Ll/t2u0;

    .line 20
    .line 21
    iget-object v3, p1, Ll/mgu0;->b:Ll/t2u0;

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Ll/t2u0;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_2

    .line 28
    .line 29
    iget-object v2, p0, Ll/mgu0;->c:[I

    .line 30
    .line 31
    iget-object v3, p1, Ll/mgu0;->c:[I

    .line 32
    .line 33
    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([I[I)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_2

    .line 38
    .line 39
    iget-object p0, p0, Ll/mgu0;->d:[Z

    .line 40
    .line 41
    iget-object p1, p1, Ll/mgu0;->d:[Z

    .line 42
    .line 43
    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([Z[Z)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_2

    .line 48
    .line 49
    return v0

    .line 50
    :cond_2
    :goto_0
    return v1
.end method

.method public final hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mgu0;->b:Ll/t2u0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/t2u0;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit16 v0, v0, 0x3c1

    .line 8
    .line 9
    iget-object v1, p0, Ll/mgu0;->c:[I

    .line 10
    .line 11
    invoke-static {v1}, Ljava/util/Arrays;->hashCode([I)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/2addr v0, v1

    .line 16
    iget-object p0, p0, Ll/mgu0;->d:[Z

    .line 17
    .line 18
    mul-int/lit8 v0, v0, 0x1f

    .line 19
    .line 20
    invoke-static {p0}, Ljava/util/Arrays;->hashCode([Z)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    add-int/2addr v0, p0

    .line 25
    return v0
.end method
