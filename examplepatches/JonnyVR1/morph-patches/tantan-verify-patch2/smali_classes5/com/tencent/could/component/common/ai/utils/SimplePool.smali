.class public Lcom/tencent/could/component/common/ai/utils/SimplePool;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "SimplePool"


# instance fields
.field public final pool:[Ljava/lang/Object;

.field public poolName:Ljava/lang/String;

.field public poolSize:I


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-lez p1, :cond_0

    .line 5
    .line 6
    new-array p1, p1, [Ljava/lang/Object;

    .line 7
    .line 8
    iput-object p1, p0, Lcom/tencent/could/component/common/ai/utils/SimplePool;->pool:[Ljava/lang/Object;

    .line 9
    .line 10
    iput-object p2, p0, Lcom/tencent/could/component/common/ai/utils/SimplePool;->poolName:Ljava/lang/String;

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string p0, "The max pool size must be > 0"

    .line 14
    .line 15
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    throw p0
.end method

.method private isInPool(Ljava/lang/Object;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget v2, p0, Lcom/tencent/could/component/common/ai/utils/SimplePool;->poolSize:I

    .line 4
    .line 5
    if-ge v1, v2, :cond_1

    .line 6
    .line 7
    iget-object v2, p0, Lcom/tencent/could/component/common/ai/utils/SimplePool;->pool:[Ljava/lang/Object;

    .line 8
    .line 9
    aget-object v2, v2, v1

    .line 10
    .line 11
    if-ne v2, p1, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    return v0
.end method


# virtual methods
.method public acquire()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/tencent/could/component/common/ai/utils/SimplePool;->poolSize:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    add-int/lit8 v0, v0, -0x1

    .line 7
    .line 8
    iget-object v2, p0, Lcom/tencent/could/component/common/ai/utils/SimplePool;->pool:[Ljava/lang/Object;

    .line 9
    .line 10
    aget-object v3, v2, v0

    .line 11
    .line 12
    aput-object v1, v2, v0

    .line 13
    .line 14
    iput v0, p0, Lcom/tencent/could/component/common/ai/utils/SimplePool;->poolSize:I

    .line 15
    .line 16
    return-object v3

    .line 17
    :cond_0
    return-object v1
.end method

.method public release(Ljava/lang/Object;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/could/component/common/ai/utils/SimplePool;->isInPool(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    iget v0, p0, Lcom/tencent/could/component/common/ai/utils/SimplePool;->poolSize:I

    .line 9
    .line 10
    iget-object v2, p0, Lcom/tencent/could/component/common/ai/utils/SimplePool;->pool:[Ljava/lang/Object;

    .line 11
    .line 12
    array-length v3, v2

    .line 13
    if-ge v0, v3, :cond_0

    .line 14
    .line 15
    aput-object p1, v2, v0

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    add-int/2addr v0, p1

    .line 19
    iput v0, p0, Lcom/tencent/could/component/common/ai/utils/SimplePool;->poolSize:I

    .line 20
    .line 21
    return p1

    .line 22
    :cond_0
    return v1

    .line 23
    :cond_1
    const-string p0, "Already in the pool!"

    .line 24
    .line 25
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return v1
.end method
