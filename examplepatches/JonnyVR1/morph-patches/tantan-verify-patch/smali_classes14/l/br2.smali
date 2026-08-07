.class public abstract Ll/br2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/Merchandise;

.field public b:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public c:Ljava/text/DecimalFormat;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/data/Merchandise;)V
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/core/data/Merchandise;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/br2;->a:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 5
    .line 6
    new-instance v0, Ljava/text/DecimalFormat;

    .line 7
    .line 8
    const-string v1, "#.#"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/br2;->c:Ljava/text/DecimalFormat;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 16
    .line 17
    const-string v0, "svip"

    .line 18
    .line 19
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 26
    .line 27
    iput-object p1, p0, Ll/br2;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    const-string v0, "tttVip"

    .line 31
    .line 32
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 39
    .line 40
    iput-object p1, p0, Ll/br2;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    const-string v0, "oDiamond"

    .line 44
    .line 45
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_2

    .line 50
    .line 51
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 52
    .line 53
    iput-object p1, p0, Ll/br2;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 54
    .line 55
    :cond_2
    return-void
.end method


# virtual methods
.method public abstract a(Lcom/p1/mobile/android/app/Act;)Ljava/lang/CharSequence;
.end method
