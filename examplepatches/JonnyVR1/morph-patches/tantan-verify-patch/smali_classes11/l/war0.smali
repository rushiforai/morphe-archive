.class public Ll/war0;
.super Ll/gcr0;
.source "SourceFile"


# instance fields
.field public a:[Ljava/lang/Object;

.field public b:I

.field public c:Z


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/gcr0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x4

    .line 5
    new-array p1, p1, [Ljava/lang/Object;

    .line 6
    .line 7
    iput-object p1, p0, Ll/war0;->a:[Ljava/lang/Object;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput p1, p0, Ll/war0;->b:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)Ll/war0;
    .locals 6

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/war0;->b:I

    .line 5
    .line 6
    add-int/lit8 v1, v0, 0x1

    .line 7
    .line 8
    iget-object v2, p0, Ll/war0;->a:[Ljava/lang/Object;

    .line 9
    .line 10
    array-length v3, v2

    .line 11
    const/4 v4, 0x0

    .line 12
    if-ge v3, v1, :cond_2

    .line 13
    .line 14
    shr-int/lit8 v5, v3, 0x1

    .line 15
    .line 16
    add-int/2addr v3, v5

    .line 17
    add-int/lit8 v3, v3, 0x1

    .line 18
    .line 19
    if-ge v3, v1, :cond_0

    .line 20
    .line 21
    invoke-static {v0}, Ljava/lang/Integer;->highestOneBit(I)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int v3, v0, v0

    .line 26
    .line 27
    :cond_0
    if-gez v3, :cond_1

    .line 28
    .line 29
    const v3, 0x7fffffff

    .line 30
    .line 31
    .line 32
    :cond_1
    invoke-static {v2, v3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Ll/war0;->a:[Ljava/lang/Object;

    .line 37
    .line 38
    iput-boolean v4, p0, Ll/war0;->c:Z

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    iget-boolean v0, p0, Ll/war0;->c:Z

    .line 42
    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    invoke-virtual {v2}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, [Ljava/lang/Object;

    .line 50
    .line 51
    iput-object v0, p0, Ll/war0;->a:[Ljava/lang/Object;

    .line 52
    .line 53
    iput-boolean v4, p0, Ll/war0;->c:Z

    .line 54
    .line 55
    :cond_3
    :goto_0
    iget-object v0, p0, Ll/war0;->a:[Ljava/lang/Object;

    .line 56
    .line 57
    iget v1, p0, Ll/war0;->b:I

    .line 58
    .line 59
    add-int/lit8 v2, v1, 0x1

    .line 60
    .line 61
    iput v2, p0, Ll/war0;->b:I

    .line 62
    .line 63
    aput-object p1, v0, v1

    .line 64
    .line 65
    return-object p0
.end method
