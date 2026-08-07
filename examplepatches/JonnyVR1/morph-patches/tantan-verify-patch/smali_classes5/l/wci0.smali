.class public Ll/wci0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 1

    .line 1
    invoke-static {}, Ll/wci0;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_INTL_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    :cond_0
    return-object p0
.end method

.method public static b()Z
    .locals 2

    .line 1
    const-string v0, "diamond"

    .line 2
    .line 3
    sget-object v1, Ll/uqb0;->D0:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    return v0
.end method
