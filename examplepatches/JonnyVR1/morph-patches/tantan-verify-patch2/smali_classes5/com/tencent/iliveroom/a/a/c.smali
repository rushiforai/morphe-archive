.class public Lcom/tencent/iliveroom/a/a/c;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tencent/iliveroom/a/a/f;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/iliveroom/a/a/c;->a:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 95
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a/c;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/tencent/iliveroom/a/a/f;

    if-eqz v1, :cond_0

    .line 96
    invoke-virtual {v1}, Lcom/tencent/iliveroom/a/a/f;->a()V

    goto :goto_0

    .line 97
    :cond_1
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a/c;->a:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->clear()V

    return-void
.end method

.method public a([Lcom/tencent/iliveroom/a/a/a;)[Lcom/tencent/iliveroom/a/a/a;
    .locals 9

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    move v3, v2

    .line 5
    :goto_0
    if-ge v2, v0, :cond_2

    .line 6
    .line 7
    aget-object v4, p1, v2

    .line 8
    .line 9
    iget-object v5, v4, Lcom/tencent/iliveroom/a/a/a;->b:Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    if-eqz v5, :cond_1

    .line 12
    .line 13
    iget-object v6, p0, Lcom/tencent/iliveroom/a/a/c;->a:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v6

    .line 19
    if-ge v3, v6, :cond_0

    .line 20
    .line 21
    iget-object v6, p0, Lcom/tencent/iliveroom/a/a/c;->a:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v6

    .line 27
    check-cast v6, Lcom/tencent/iliveroom/a/a/f;

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    new-instance v6, Lcom/tencent/iliveroom/a/a/f;

    .line 31
    .line 32
    invoke-direct {v6}, Lcom/tencent/iliveroom/a/a/f;-><init>()V

    .line 33
    .line 34
    .line 35
    iget-object v7, p0, Lcom/tencent/iliveroom/a/a/c;->a:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    :goto_1
    iget v7, v4, Lcom/tencent/iliveroom/a/a/a;->c:I

    .line 41
    .line 42
    iget v8, v4, Lcom/tencent/iliveroom/a/a/a;->d:I

    .line 43
    .line 44
    invoke-virtual {v6, v5, v7, v8}, Lcom/tencent/iliveroom/a/a/f;->a(Ljava/nio/ByteBuffer;II)I

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    iput v5, v4, Lcom/tencent/iliveroom/a/a/a;->a:I

    .line 49
    .line 50
    add-int/lit8 v3, v3, 0x1

    .line 51
    .line 52
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a/c;->a:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    array-length v2, p1

    .line 62
    if-le v0, v2, :cond_4

    .line 63
    .line 64
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a/c;->a:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_4

    .line 75
    .line 76
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Lcom/tencent/iliveroom/a/a/f;

    .line 81
    .line 82
    array-length v2, p1

    .line 83
    if-lt v1, v2, :cond_3

    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/tencent/iliveroom/a/a/f;->a()V

    .line 86
    .line 87
    .line 88
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 89
    .line 90
    .line 91
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_4
    return-object p1
.end method
