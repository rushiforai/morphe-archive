.class public abstract Lcom/immomo/mwc/sdk/WebResourcePool$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/mwc/sdk/WebResourcePool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final c:Ljava/lang/String;

.field private d:I

.field private e:Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;

.field private f:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/immomo/mwc/sdk/WebResourcePool$b;->d:I

    .line 6
    .line 7
    sget-object v1, Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;->ONCE:Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;

    .line 8
    .line 9
    iput-object v1, p0, Lcom/immomo/mwc/sdk/WebResourcePool$b;->e:Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;

    .line 10
    .line 11
    iput v0, p0, Lcom/immomo/mwc/sdk/WebResourcePool$b;->f:I

    .line 12
    .line 13
    iput-object p1, p0, Lcom/immomo/mwc/sdk/WebResourcePool$b;->a:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p2, p3, p4}, Lcom/immomo/mwc/sdk/WebResourcePool;->f(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Lcom/immomo/mwc/sdk/WebResourcePool$b;->c:Ljava/lang/String;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Lcom/immomo/mwc/sdk/WebResourcePool$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mwc/sdk/WebResourcePool$b;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Lcom/immomo/mwc/sdk/WebResourcePool$b;)Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mwc/sdk/WebResourcePool$b;->e:Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Lcom/immomo/mwc/sdk/WebResourcePool$b;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/mwc/sdk/WebResourcePool$b;->m()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private e()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mwc/sdk/WebResourcePool$b;->f:I

    .line 2
    .line 3
    add-int/lit8 p0, p0, 0x40

    .line 4
    .line 5
    return p0
.end method

.method private m()I
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/mwc/sdk/MWCConstants$WebResourceCache$LRUCacheMode;->RESOURCE:Lcom/immomo/mwc/sdk/MWCConstants$WebResourceCache$LRUCacheMode;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/mwc/sdk/WebResourcePool;->a(Lcom/immomo/mwc/sdk/MWCConstants$WebResourceCache$LRUCacheMode;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-direct {p0}, Lcom/immomo/mwc/sdk/WebResourcePool$b;->e()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private n()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/mwc/sdk/WebResourcePool$b;->b:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/immomo/mwc/sdk/WebResourcePool$b;->d(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/immomo/mwc/sdk/WebResourcePool$b;->c:Ljava/lang/String;

    .line 8
    .line 9
    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    array-length v1, v1

    .line 16
    add-int/2addr v0, v1

    .line 17
    iput v0, p0, Lcom/immomo/mwc/sdk/WebResourcePool$b;->f:I

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public abstract d(Ljava/lang/Object;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mwc/sdk/WebResourcePool$b;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/mwc/sdk/WebResourcePool$b;->b:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mwc/sdk/WebResourcePool$b;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public i()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mwc/sdk/WebResourcePool$b;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mwc/sdk/WebResourcePool$b;->e:Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;

    .line 2
    .line 3
    return-void
.end method

.method public k(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/mwc/sdk/WebResourcePool$b;->b:Ljava/lang/Object;

    .line 2
    .line 3
    sget-object p1, Lcom/immomo/mwc/sdk/MWCConstants$WebResourceCache$LRUCacheMode;->MEMORY:Lcom/immomo/mwc/sdk/MWCConstants$WebResourceCache$LRUCacheMode;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/immomo/mwc/sdk/WebResourcePool;->a(Lcom/immomo/mwc/sdk/MWCConstants$WebResourceCache$LRUCacheMode;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/immomo/mwc/sdk/WebResourcePool$b;->n()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public l(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/mwc/sdk/WebResourcePool$b;->d:I

    .line 2
    .line 3
    return-void
.end method
