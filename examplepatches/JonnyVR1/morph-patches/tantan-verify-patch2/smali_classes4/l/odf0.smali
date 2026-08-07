.class public Ll/odf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w5m;


# static fields
.field public static b:Ll/odf0;


# instance fields
.field public a:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet<",
            "Ll/w5m;",
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
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/odf0;->a:Ljava/util/LinkedHashSet;

    .line 10
    .line 11
    return-void
.end method

.method public static b()Ll/odf0;
    .locals 2

    .line 1
    sget-object v0, Ll/odf0;->b:Ll/odf0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/odf0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/odf0;->b:Ll/odf0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/odf0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/odf0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/odf0;->b:Ll/odf0;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/odf0;->b:Ll/odf0;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public a(Ll/mdf0;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/odf0;->a:Ljava/util/LinkedHashSet;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Ll/odf0;->a:Ljava/util/LinkedHashSet;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/w5m;

    .line 26
    .line 27
    invoke-interface {v0, p1, p2, p3}, Ll/w5m;->a(Ll/mdf0;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    return p0
.end method
