.class final Lcom/xiaomi/push/service/n$c$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/service/n$c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field private a:I

.field private a:[Lcom/xiaomi/push/service/n$d;

.field private b:I

.field private c:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x100

    .line 5
    .line 6
    iput v0, p0, Lcom/xiaomi/push/service/n$c$a;->a:I

    .line 7
    .line 8
    new-array v0, v0, [Lcom/xiaomi/push/service/n$d;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/xiaomi/push/service/n$c$a;->a:[Lcom/xiaomi/push/service/n$d;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput v0, p0, Lcom/xiaomi/push/service/n$c$a;->b:I

    .line 14
    .line 15
    iput v0, p0, Lcom/xiaomi/push/service/n$c$a;->c:I

    .line 16
    .line 17
    return-void
.end method

.method public synthetic constructor <init>(Lcom/xiaomi/push/service/n$1;)V
    .locals 0

    .line 18
    invoke-direct {p0}, Lcom/xiaomi/push/service/n$c$a;-><init>()V

    return-void
.end method

.method public static synthetic a(Lcom/xiaomi/push/service/n$c$a;Lcom/xiaomi/push/service/n$d;)I
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/n$c$a;->a(Lcom/xiaomi/push/service/n$d;)I

    move-result p0

    return p0
.end method

.method private a(Lcom/xiaomi/push/service/n$d;)I
    .locals 3

    const/4 v0, 0x0

    .line 47
    :goto_0
    iget-object v1, p0, Lcom/xiaomi/push/service/n$c$a;->a:[Lcom/xiaomi/push/service/n$d;

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 48
    aget-object v1, v1, v0

    if-ne v1, p1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method private c()V
    .locals 10

    .line 58
    iget v0, p0, Lcom/xiaomi/push/service/n$c$a;->b:I

    add-int/lit8 v1, v0, -0x1

    add-int/lit8 v0, v0, -0x2

    .line 59
    div-int/lit8 v0, v0, 0x2

    .line 60
    :goto_0
    iget-object v2, p0, Lcom/xiaomi/push/service/n$c$a;->a:[Lcom/xiaomi/push/service/n$d;

    aget-object v3, v2, v1

    iget-wide v4, v3, Lcom/xiaomi/push/service/n$d;->a:J

    aget-object v6, v2, v0

    iget-wide v7, v6, Lcom/xiaomi/push/service/n$d;->a:J

    cmp-long v4, v4, v7

    if-gez v4, :cond_0

    .line 61
    aput-object v6, v2, v1

    .line 62
    aput-object v3, v2, v0

    add-int/lit8 v1, v0, -0x1

    .line 63
    div-int/lit8 v1, v1, 0x2

    move v9, v1

    move v1, v0

    move v0, v9

    goto :goto_0

    :cond_0
    return-void
.end method

.method private c(I)V
    .locals 9

    .line 1
    mul-int/lit8 v0, p1, 0x2

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    :goto_0
    iget v1, p0, Lcom/xiaomi/push/service/n$c$a;->b:I

    .line 6
    .line 7
    if-ge v0, v1, :cond_2

    .line 8
    .line 9
    if-lez v1, :cond_2

    .line 10
    .line 11
    add-int/lit8 v2, v0, 0x1

    .line 12
    .line 13
    if-ge v2, v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Lcom/xiaomi/push/service/n$c$a;->a:[Lcom/xiaomi/push/service/n$d;

    .line 16
    .line 17
    aget-object v3, v1, v2

    .line 18
    .line 19
    iget-wide v3, v3, Lcom/xiaomi/push/service/n$d;->a:J

    .line 20
    .line 21
    aget-object v1, v1, v0

    .line 22
    .line 23
    iget-wide v5, v1, Lcom/xiaomi/push/service/n$d;->a:J

    .line 24
    .line 25
    cmp-long v1, v3, v5

    .line 26
    .line 27
    if-gez v1, :cond_0

    .line 28
    .line 29
    move v0, v2

    .line 30
    :cond_0
    iget-object v1, p0, Lcom/xiaomi/push/service/n$c$a;->a:[Lcom/xiaomi/push/service/n$d;

    .line 31
    .line 32
    aget-object v2, v1, p1

    .line 33
    .line 34
    iget-wide v3, v2, Lcom/xiaomi/push/service/n$d;->a:J

    .line 35
    .line 36
    aget-object v5, v1, v0

    .line 37
    .line 38
    iget-wide v6, v5, Lcom/xiaomi/push/service/n$d;->a:J

    .line 39
    .line 40
    cmp-long v3, v3, v6

    .line 41
    .line 42
    if-gez v3, :cond_1

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    aput-object v5, v1, p1

    .line 46
    .line 47
    aput-object v2, v1, v0

    .line 48
    .line 49
    mul-int/lit8 p1, v0, 0x2

    .line 50
    .line 51
    add-int/lit8 p1, p1, 0x1

    .line 52
    .line 53
    move v8, v0

    .line 54
    move v0, p1

    .line 55
    move p1, v8

    .line 56
    goto :goto_0

    .line 57
    :cond_2
    :goto_1
    return-void
.end method


# virtual methods
.method public a()Lcom/xiaomi/push/service/n$d;
    .locals 1

    .line 32
    iget-object p0, p0, Lcom/xiaomi/push/service/n$c$a;->a:[Lcom/xiaomi/push/service/n$d;

    const/4 v0, 0x0

    aget-object p0, p0, v0

    return-object p0
.end method

.method public a()V
    .locals 1

    .line 45
    iget v0, p0, Lcom/xiaomi/push/service/n$c$a;->a:I

    new-array v0, v0, [Lcom/xiaomi/push/service/n$d;

    iput-object v0, p0, Lcom/xiaomi/push/service/n$c$a;->a:[Lcom/xiaomi/push/service/n$d;

    const/4 v0, 0x0

    .line 46
    iput v0, p0, Lcom/xiaomi/push/service/n$c$a;->b:I

    return-void
.end method

.method public a(I)V
    .locals 3

    const/4 v0, 0x0

    .line 37
    :goto_0
    iget v1, p0, Lcom/xiaomi/push/service/n$c$a;->b:I

    if-ge v0, v1, :cond_1

    .line 38
    iget-object v1, p0, Lcom/xiaomi/push/service/n$c$a;->a:[Lcom/xiaomi/push/service/n$d;

    aget-object v1, v1, v0

    iget v2, v1, Lcom/xiaomi/push/service/n$d;->a:I

    if-ne v2, p1, :cond_0

    .line 39
    invoke-virtual {v1}, Lcom/xiaomi/push/service/n$d;->a()Z

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 40
    :cond_1
    invoke-virtual {p0}, Lcom/xiaomi/push/service/n$c$a;->b()V

    return-void
.end method

.method public a(ILcom/xiaomi/push/service/n$b;)V
    .locals 2

    const/4 p1, 0x0

    .line 41
    :goto_0
    iget v0, p0, Lcom/xiaomi/push/service/n$c$a;->b:I

    if-ge p1, v0, :cond_1

    .line 42
    iget-object v0, p0, Lcom/xiaomi/push/service/n$c$a;->a:[Lcom/xiaomi/push/service/n$d;

    aget-object v0, v0, p1

    iget-object v1, v0, Lcom/xiaomi/push/service/n$d;->a:Lcom/xiaomi/push/service/n$b;

    if-ne v1, p2, :cond_0

    .line 43
    invoke-virtual {v0}, Lcom/xiaomi/push/service/n$d;->a()Z

    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 44
    :cond_1
    invoke-virtual {p0}, Lcom/xiaomi/push/service/n$c$a;->b()V

    return-void
.end method

.method public a(Lcom/xiaomi/push/service/n$d;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/service/n$c$a;->a:[Lcom/xiaomi/push/service/n$d;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    iget v2, p0, Lcom/xiaomi/push/service/n$c$a;->b:I

    .line 5
    .line 6
    if-ne v1, v2, :cond_0

    .line 7
    .line 8
    mul-int/lit8 v1, v2, 0x2

    .line 9
    .line 10
    new-array v1, v1, [Lcom/xiaomi/push/service/n$d;

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcom/xiaomi/push/service/n$c$a;->a:[Lcom/xiaomi/push/service/n$d;

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lcom/xiaomi/push/service/n$c$a;->a:[Lcom/xiaomi/push/service/n$d;

    .line 19
    .line 20
    iget v1, p0, Lcom/xiaomi/push/service/n$c$a;->b:I

    .line 21
    .line 22
    add-int/lit8 v2, v1, 0x1

    .line 23
    .line 24
    iput v2, p0, Lcom/xiaomi/push/service/n$c$a;->b:I

    .line 25
    .line 26
    aput-object p1, v0, v1

    .line 27
    .line 28
    invoke-direct {p0}, Lcom/xiaomi/push/service/n$c$a;->c()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public a()Z
    .locals 0

    .line 33
    iget p0, p0, Lcom/xiaomi/push/service/n$c$a;->b:I

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public a(I)Z
    .locals 3

    const/4 v0, 0x0

    move v1, v0

    .line 35
    :goto_0
    iget v2, p0, Lcom/xiaomi/push/service/n$c$a;->b:I

    if-ge v1, v2, :cond_1

    .line 36
    iget-object v2, p0, Lcom/xiaomi/push/service/n$c$a;->a:[Lcom/xiaomi/push/service/n$d;

    aget-object v2, v2, v1

    iget v2, v2, Lcom/xiaomi/push/service/n$d;->a:I

    if-ne v2, p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method public b()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget v1, p0, Lcom/xiaomi/push/service/n$c$a;->b:I

    .line 3
    .line 4
    if-ge v0, v1, :cond_1

    .line 5
    .line 6
    iget-object v1, p0, Lcom/xiaomi/push/service/n$c$a;->a:[Lcom/xiaomi/push/service/n$d;

    .line 7
    .line 8
    aget-object v1, v1, v0

    .line 9
    .line 10
    iget-boolean v1, v1, Lcom/xiaomi/push/service/n$d;->a:Z

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    iget v1, p0, Lcom/xiaomi/push/service/n$c$a;->c:I

    .line 15
    .line 16
    add-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    iput v1, p0, Lcom/xiaomi/push/service/n$c$a;->c:I

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/service/n$c$a;->b(I)V

    .line 21
    .line 22
    .line 23
    add-int/lit8 v0, v0, -0x1

    .line 24
    .line 25
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    return-void
.end method

.method public b(I)V
    .locals 3

    if-ltz p1, :cond_0

    .line 29
    iget v0, p0, Lcom/xiaomi/push/service/n$c$a;->b:I

    if-ge p1, v0, :cond_0

    .line 30
    iget-object v1, p0, Lcom/xiaomi/push/service/n$c$a;->a:[Lcom/xiaomi/push/service/n$d;

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/xiaomi/push/service/n$c$a;->b:I

    aget-object v2, v1, v0

    aput-object v2, v1, p1

    const/4 v2, 0x0

    .line 31
    aput-object v2, v1, v0

    .line 32
    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/n$c$a;->c(I)V

    :cond_0
    return-void
.end method
