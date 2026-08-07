.class public Lkotlin/reflect/jvm/internal/impl/utils/SmartList;
.super Ljava/util/AbstractList;
.source "SourceFile"

# interfaces
.implements Ljava/util/RandomAccess;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/reflect/jvm/internal/impl/utils/SmartList$c;,
        Lkotlin/reflect/jvm/internal/impl/utils/SmartList$d;,
        Lkotlin/reflect/jvm/internal/impl/utils/SmartList$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractList<",
        "TE;>;",
        "Ljava/util/RandomAccess;"
    }
.end annotation


# instance fields
.field public a:I

.field public b:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(I)V
    .locals 10

    .line 1
    const/4 v0, 0x7

    const/4 v1, 0x6

    const/4 v2, 0x5

    const/4 v3, 0x3

    const/4 v4, 0x2

    if-eq p0, v4, :cond_0

    if-eq p0, v3, :cond_0

    if-eq p0, v2, :cond_0

    if-eq p0, v1, :cond_0

    if-eq p0, v0, :cond_0

    const-string v5, "Argument for @NotNull parameter \'%s\' of %s.%s must not be null"

    goto :goto_0

    :cond_0
    const-string v5, "@NotNull method %s.%s must not return null"

    :goto_0
    if-eq p0, v4, :cond_1

    if-eq p0, v3, :cond_1

    if-eq p0, v2, :cond_1

    if-eq p0, v1, :cond_1

    if-eq p0, v0, :cond_1

    move v6, v3

    goto :goto_1

    :cond_1
    move v6, v4

    :goto_1
    new-array v6, v6, [Ljava/lang/Object;

    const-string v7, "kotlin/reflect/jvm/internal/impl/utils/SmartList"

    const/4 v8, 0x0

    packed-switch p0, :pswitch_data_0

    const-string v9, "elements"

    aput-object v9, v6, v8

    goto :goto_2

    :pswitch_0
    const-string v9, "a"

    aput-object v9, v6, v8

    goto :goto_2

    :pswitch_1
    aput-object v7, v6, v8

    :goto_2
    const-string v8, "toArray"

    const/4 v9, 0x1

    if-eq p0, v4, :cond_3

    if-eq p0, v3, :cond_3

    if-eq p0, v2, :cond_2

    if-eq p0, v1, :cond_2

    if-eq p0, v0, :cond_2

    aput-object v7, v6, v9

    goto :goto_3

    :cond_2
    aput-object v8, v6, v9

    goto :goto_3

    :cond_3
    const-string v7, "iterator"

    aput-object v7, v6, v9

    :goto_3
    packed-switch p0, :pswitch_data_1

    const-string v7, "<init>"

    aput-object v7, v6, v4

    goto :goto_4

    :pswitch_2
    aput-object v8, v6, v4

    :goto_4
    :pswitch_3
    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    if-eq p0, v4, :cond_4

    if-eq p0, v3, :cond_4

    if-eq p0, v2, :cond_4

    if-eq p0, v1, :cond_4

    if-eq p0, v0, :cond_4

    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :cond_4
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    :goto_5
    throw p0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x2
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_3
    .end packed-switch
.end method

.method public static synthetic c(Lkotlin/reflect/jvm/internal/impl/utils/SmartList;)I
    .locals 0

    .line 1
    iget p0, p0, Ljava/util/AbstractList;->modCount:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic f(Lkotlin/reflect/jvm/internal/impl/utils/SmartList;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->b:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g(Lkotlin/reflect/jvm/internal/impl/utils/SmartList;)I
    .locals 0

    .line 1
    iget p0, p0, Ljava/util/AbstractList;->modCount:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic h(Lkotlin/reflect/jvm/internal/impl/utils/SmartList;)I
    .locals 0

    .line 1
    iget p0, p0, Ljava/util/AbstractList;->modCount:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)V"
        }
    .end annotation

    .line 1
    if-ltz p1, :cond_3

    .line 2
    .line 3
    iget v0, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a:I

    .line 4
    .line 5
    if-gt p1, v0, :cond_3

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iput-object p2, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->b:Ljava/lang/Object;

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    if-ne v0, v1, :cond_1

    .line 14
    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->b:Ljava/lang/Object;

    .line 18
    .line 19
    filled-new-array {p2, p1}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->b:Ljava/lang/Object;

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    add-int/lit8 v2, v0, 0x1

    .line 27
    .line 28
    new-array v2, v2, [Ljava/lang/Object;

    .line 29
    .line 30
    iget-object v3, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->b:Ljava/lang/Object;

    .line 31
    .line 32
    const/4 v4, 0x0

    .line 33
    if-ne v0, v1, :cond_2

    .line 34
    .line 35
    aput-object v3, v2, v4

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    check-cast v3, [Ljava/lang/Object;

    .line 39
    .line 40
    invoke-static {v3, v4, v2, v4, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 41
    .line 42
    .line 43
    add-int/lit8 v0, p1, 0x1

    .line 44
    .line 45
    iget v4, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a:I

    .line 46
    .line 47
    sub-int/2addr v4, p1

    .line 48
    invoke-static {v3, p1, v2, v0, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 49
    .line 50
    .line 51
    :goto_0
    aput-object p2, v2, p1

    .line 52
    .line 53
    iput-object v2, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->b:Ljava/lang/Object;

    .line 54
    .line 55
    :goto_1
    iget p1, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a:I

    .line 56
    .line 57
    add-int/2addr p1, v1

    .line 58
    iput p1, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a:I

    .line 59
    .line 60
    iget p1, p0, Ljava/util/AbstractList;->modCount:I

    .line 61
    .line 62
    add-int/2addr p1, v1

    .line 63
    iput p1, p0, Ljava/util/AbstractList;->modCount:I

    .line 64
    .line 65
    return-void

    .line 66
    :cond_3
    const-string p2, ", Size: "

    .line 67
    .line 68
    iget p0, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a:I

    .line 69
    .line 70
    const-string v0, "Index: "

    .line 71
    .line 72
    invoke-static {v0, p1, p2, p0}, Ll/nvc0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public add(Ljava/lang/Object;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .line 76
    iget v0, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a:I

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 77
    iput-object p1, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->b:Ljava/lang/Object;

    goto :goto_0

    .line 78
    :cond_0
    iget-object v2, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->b:Ljava/lang/Object;

    if-ne v0, v1, :cond_1

    .line 79
    filled-new-array {v2, p1}, [Ljava/lang/Object;

    move-result-object p1

    .line 80
    iput-object p1, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->b:Ljava/lang/Object;

    goto :goto_0

    .line 81
    :cond_1
    check-cast v2, [Ljava/lang/Object;

    .line 82
    array-length v3, v2

    if-lt v0, v3, :cond_3

    mul-int/lit8 v4, v3, 0x3

    .line 83
    div-int/lit8 v4, v4, 0x2

    add-int/2addr v4, v1

    add-int/2addr v0, v1

    if-ge v4, v0, :cond_2

    move v4, v0

    .line 84
    :cond_2
    new-array v0, v4, [Ljava/lang/Object;

    iput-object v0, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->b:Ljava/lang/Object;

    const/4 v4, 0x0

    .line 85
    invoke-static {v2, v4, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v2, v0

    .line 86
    :cond_3
    iget v0, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a:I

    aput-object p1, v2, v0

    .line 87
    :goto_0
    iget p1, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a:I

    add-int/2addr p1, v1

    iput p1, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a:I

    .line 88
    iget p1, p0, Ljava/util/AbstractList;->modCount:I

    add-int/2addr p1, v1

    iput p1, p0, Ljava/util/AbstractList;->modCount:I

    return v1
.end method

.method public clear()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->b:Ljava/lang/Object;

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a:I

    .line 6
    .line 7
    iget v0, p0, Ljava/util/AbstractList;->modCount:I

    .line 8
    .line 9
    add-int/lit8 v0, v0, 0x1

    .line 10
    .line 11
    iput v0, p0, Ljava/util/AbstractList;->modCount:I

    .line 12
    .line 13
    return-void
.end method

.method public get(I)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .line 1
    if-ltz p1, :cond_1

    .line 2
    .line 3
    iget v0, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a:I

    .line 4
    .line 5
    if-ge p1, v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->b:Ljava/lang/Object;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    check-cast p0, [Ljava/lang/Object;

    .line 14
    .line 15
    aget-object p0, p0, p1

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_1
    const-string v0, ", Size: "

    .line 19
    .line 20
    iget p0, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a:I

    .line 21
    .line 22
    const-string v1, "Index: "

    .line 23
    .line 24
    invoke-static {v1, p1, v0, p0}, Ll/nvc0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    return-object p0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TE;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget v0, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a:I

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Lkotlin/reflect/jvm/internal/impl/utils/SmartList$b;->a()Lkotlin/reflect/jvm/internal/impl/utils/SmartList$b;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    invoke-static {v0}, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-object p0

    .line 16
    :cond_1
    const/4 v1, 0x1

    .line 17
    if-ne v0, v1, :cond_2

    .line 18
    .line 19
    new-instance v0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList$c;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Lkotlin/reflect/jvm/internal/impl/utils/SmartList$c;-><init>(Lkotlin/reflect/jvm/internal/impl/utils/SmartList;)V

    .line 22
    .line 23
    .line 24
    return-object v0

    .line 25
    :cond_2
    invoke-super {p0}, Ljava/util/AbstractList;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    if-nez p0, :cond_3

    .line 30
    .line 31
    const/4 v0, 0x3

    .line 32
    invoke-static {v0}, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a(I)V

    .line 33
    .line 34
    .line 35
    :cond_3
    return-object p0
.end method

.method public remove(I)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-ltz p1, :cond_3

    .line 3
    .line 4
    iget v1, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a:I

    .line 5
    .line 6
    if-ge p1, v1, :cond_3

    .line 7
    .line 8
    iget-object v2, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->b:Ljava/lang/Object;

    .line 9
    .line 10
    const/4 v3, 0x1

    .line 11
    if-ne v1, v3, :cond_0

    .line 12
    .line 13
    iput-object v0, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->b:Ljava/lang/Object;

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    check-cast v2, [Ljava/lang/Object;

    .line 17
    .line 18
    aget-object v4, v2, p1

    .line 19
    .line 20
    const/4 v5, 0x2

    .line 21
    if-ne v1, v5, :cond_1

    .line 22
    .line 23
    rsub-int/lit8 p1, p1, 0x1

    .line 24
    .line 25
    aget-object p1, v2, p1

    .line 26
    .line 27
    iput-object p1, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->b:Ljava/lang/Object;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    sub-int/2addr v1, p1

    .line 31
    sub-int/2addr v1, v3

    .line 32
    if-lez v1, :cond_2

    .line 33
    .line 34
    add-int/lit8 v5, p1, 0x1

    .line 35
    .line 36
    invoke-static {v2, v5, v2, p1, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 37
    .line 38
    .line 39
    :cond_2
    iget p1, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a:I

    .line 40
    .line 41
    sub-int/2addr p1, v3

    .line 42
    aput-object v0, v2, p1

    .line 43
    .line 44
    :goto_0
    move-object v2, v4

    .line 45
    :goto_1
    iget p1, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a:I

    .line 46
    .line 47
    sub-int/2addr p1, v3

    .line 48
    iput p1, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a:I

    .line 49
    .line 50
    iget p1, p0, Ljava/util/AbstractList;->modCount:I

    .line 51
    .line 52
    add-int/2addr p1, v3

    .line 53
    iput p1, p0, Ljava/util/AbstractList;->modCount:I

    .line 54
    .line 55
    return-object v2

    .line 56
    :cond_3
    const-string v1, ", Size: "

    .line 57
    .line 58
    iget p0, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a:I

    .line 59
    .line 60
    const-string v2, "Index: "

    .line 61
    .line 62
    invoke-static {v2, p1, v1, p0}, Ll/nvc0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 63
    .line 64
    .line 65
    return-object v0
.end method

.method public set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)TE;"
        }
    .end annotation

    .line 1
    if-ltz p1, :cond_1

    .line 2
    .line 3
    iget v0, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a:I

    .line 4
    .line 5
    if-ge p1, v0, :cond_1

    .line 6
    .line 7
    iget-object v1, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->b:Ljava/lang/Object;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-ne v0, v2, :cond_0

    .line 11
    .line 12
    iput-object p2, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->b:Ljava/lang/Object;

    .line 13
    .line 14
    return-object v1

    .line 15
    :cond_0
    check-cast v1, [Ljava/lang/Object;

    .line 16
    .line 17
    aget-object p0, v1, p1

    .line 18
    .line 19
    aput-object p2, v1, p1

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    const-string p2, ", Size: "

    .line 23
    .line 24
    iget p0, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a:I

    .line 25
    .line 26
    const-string v0, "Index: "

    .line 27
    .line 28
    invoke-static {v0, p1, p2, p0}, Ll/nvc0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    return-object p0
.end method

.method public size()I
    .locals 0

    .line 1
    iget p0, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public sort(Ljava/util/Comparator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "-TE;>;)V"
        }
    .end annotation

    .line 1
    iget v0, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-lt v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->b:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, [Ljava/lang/Object;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {p0, v1, v0, p1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;IILjava/util/Comparator;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 4
    .param p1    # [Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    invoke-static {v0}, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a(I)V

    .line 5
    .line 6
    .line 7
    :cond_0
    array-length v0, p1

    .line 8
    iget v1, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a:I

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    const/4 v3, 0x0

    .line 12
    if-ne v1, v2, :cond_2

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v1, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->b:Ljava/lang/Object;

    .line 17
    .line 18
    aput-object v1, p1, v3

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, [Ljava/lang/Object;

    .line 34
    .line 35
    iget-object p0, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->b:Ljava/lang/Object;

    .line 36
    .line 37
    aput-object p0, p1, v3

    .line 38
    .line 39
    return-object p1

    .line 40
    :cond_2
    if-ge v0, v1, :cond_4

    .line 41
    .line 42
    iget-object p0, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->b:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast p0, [Ljava/lang/Object;

    .line 45
    .line 46
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-static {p0, v1, p1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;ILjava/lang/Class;)[Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    if-nez p0, :cond_3

    .line 55
    .line 56
    const/4 p1, 0x6

    .line 57
    invoke-static {p1}, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a(I)V

    .line 58
    .line 59
    .line 60
    :cond_3
    return-object p0

    .line 61
    :cond_4
    if-eqz v1, :cond_5

    .line 62
    .line 63
    iget-object v2, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->b:Ljava/lang/Object;

    .line 64
    .line 65
    invoke-static {v2, v3, p1, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 66
    .line 67
    .line 68
    :cond_5
    :goto_0
    iget p0, p0, Lkotlin/reflect/jvm/internal/impl/utils/SmartList;->a:I

    .line 69
    .line 70
    if-le v0, p0, :cond_6

    .line 71
    .line 72
    const/4 v0, 0x0

    .line 73
    aput-object v0, p1, p0

    .line 74
    .line 75
    :cond_6
    return-object p1
.end method
