.class final Lcom/immomo/mwc/sdk/WebResourcePool$a;
.super Landroid/util/LruCache;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/mwc/sdk/WebResourcePool;->e()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/LruCache<",
        "Ljava/lang/String;",
        "Lcom/immomo/mwc/sdk/WebResourcePool$WorkerResourceHashMap;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/util/LruCache;-><init>(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Lcom/immomo/mwc/sdk/WebResourcePool$WorkerResourceHashMap;)I
    .locals 0

    .line 1
    invoke-static {p2}, Lcom/immomo/mwc/sdk/WebResourcePool$WorkerResourceHashMap;->access$000(Lcom/immomo/mwc/sdk/WebResourcePool$WorkerResourceHashMap;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic sizeOf(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/String;

    .line 2
    .line 3
    check-cast p2, Lcom/immomo/mwc/sdk/WebResourcePool$WorkerResourceHashMap;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mwc/sdk/WebResourcePool$a;->a(Ljava/lang/String;Lcom/immomo/mwc/sdk/WebResourcePool$WorkerResourceHashMap;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
