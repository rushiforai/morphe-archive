.class final enum Lcom/p1/mobile/putong/core/data/PurchaseType$25;
.super Lcom/p1/mobile/putong/core/data/PurchaseType;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/PurchaseType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4011
    name = null
.end annotation


# direct methods
.method private constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/data/PurchaseType;-><init>(Ljava/lang/String;ILl/vib0;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILl/vib0;)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/PurchaseType$25;-><init>(Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public getPrivilegeData(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Gender;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/data/Privilege;->likeNoLimit_pkg:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    filled-new-array {p0}, [Lcom/p1/mobile/putong/core/data/Privilege;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;
    .locals 0

    .line 1
    const-string p0, "unlimitedSwipes"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
