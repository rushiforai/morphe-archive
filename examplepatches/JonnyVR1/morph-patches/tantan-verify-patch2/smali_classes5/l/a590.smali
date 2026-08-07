.class public final synthetic Ll/a590;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$e;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public final synthetic c:Ll/ndb0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/ndb0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a590;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    iput-object p2, p0, Ll/a590;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    iput-object p3, p0, Ll/a590;->c:Ll/ndb0;

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/List;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/a590;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    iget-object v1, p0, Ll/a590;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    iget-object p0, p0, Ll/a590;->c:Ll/ndb0;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->c(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/ndb0;Ljava/util/List;)V

    return-void
.end method
