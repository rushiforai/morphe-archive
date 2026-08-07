.class public final Ll/t2u0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final f:Ljava/lang/String;

.field public static final g:Ljava/lang/String;

.field public static final h:Ll/mhy0;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;

.field public final c:I

.field public final d:[Ll/sqr0;

.field public e:I


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
    sput-object v0, Ll/t2u0;->f:Ljava/lang/String;

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
    sput-object v0, Ll/t2u0;->g:Ljava/lang/String;

    .line 16
    .line 17
    sget-object v0, Ll/k1u0;->a:Ll/k1u0;

    .line 18
    .line 19
    sput-object v0, Ll/t2u0;->h:Ll/mhy0;

    .line 20
    .line 21
    return-void
.end method

.method public varargs constructor <init>(Ljava/lang/String;[Ll/sqr0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/t2u0;->b:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/t2u0;->d:[Ll/sqr0;

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput p1, p0, Ll/t2u0;->a:I

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    aget-object v0, p2, p1

    .line 13
    .line 14
    iget-object v0, v0, Ll/sqr0;->l:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v0}, Ll/a8t0;->b(Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v1, -0x1

    .line 21
    if-ne v0, v1, :cond_0

    .line 22
    .line 23
    aget-object v0, p2, p1

    .line 24
    .line 25
    iget-object v0, v0, Ll/sqr0;->k:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0}, Ll/a8t0;->b(Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    :cond_0
    iput v0, p0, Ll/t2u0;->c:I

    .line 32
    .line 33
    aget-object p0, p2, p1

    .line 34
    .line 35
    iget-object p0, p0, Ll/sqr0;->c:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p0}, Ll/t2u0;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    aget-object p0, p2, p1

    .line 41
    .line 42
    iget p0, p0, Ll/sqr0;->e:I

    .line 43
    .line 44
    return-void
.end method

.method public static d(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    const-string v0, "und"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-object p0

    .line 13
    :cond_1
    :goto_0
    const-string p0, ""

    .line 14
    .line 15
    return-object p0
.end method


# virtual methods
.method public final a(Ll/sqr0;)I
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    if-gtz v0, :cond_1

    .line 3
    .line 4
    iget-object v1, p0, Ll/t2u0;->d:[Ll/sqr0;

    .line 5
    .line 6
    aget-object v1, v1, v0

    .line 7
    .line 8
    if-ne p1, v1, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    const/4 p0, -0x1

    .line 15
    return p0
.end method

.method public final b(I)Ll/sqr0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t2u0;->d:[Ll/sqr0;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    return-object p0
.end method

.method public final c(Ljava/lang/String;)Ll/t2u0;
    .locals 1
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/t2u0;->d:[Ll/sqr0;

    .line 2
    .line 3
    new-instance v0, Ll/t2u0;

    .line 4
    .line 5
    invoke-direct {v0, p1, p0}, Ll/t2u0;-><init>(Ljava/lang/String;[Ll/sqr0;)V

    .line 6
    .line 7
    .line 8
    return-object v0
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
    const-class v2, Ll/t2u0;

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
    check-cast p1, Ll/t2u0;

    .line 18
    .line 19
    iget-object v2, p0, Ll/t2u0;->b:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v3, p1, Ll/t2u0;->b:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_2

    .line 28
    .line 29
    iget-object p0, p0, Ll/t2u0;->d:[Ll/sqr0;

    .line 30
    .line 31
    iget-object p1, p1, Ll/t2u0;->d:[Ll/sqr0;

    .line 32
    .line 33
    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    return v0

    .line 40
    :cond_2
    :goto_0
    return v1
.end method

.method public final hashCode()I
    .locals 2

    .line 1
    iget v0, p0, Ll/t2u0;->e:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/t2u0;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    add-int/lit16 v0, v0, 0x20f

    .line 12
    .line 13
    iget-object v1, p0, Ll/t2u0;->d:[Ll/sqr0;

    .line 14
    .line 15
    mul-int/lit8 v0, v0, 0x1f

    .line 16
    .line 17
    invoke-static {v1}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    add-int/2addr v0, v1

    .line 22
    iput v0, p0, Ll/t2u0;->e:I

    .line 23
    .line 24
    :cond_0
    return v0
.end method
