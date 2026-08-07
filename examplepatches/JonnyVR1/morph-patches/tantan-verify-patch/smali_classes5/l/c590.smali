.class public final synthetic Ll/c590;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

.field public final synthetic b:Ll/ndb0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;Ll/ndb0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c590;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    iput-object p2, p0, Ll/c590;->b:Ll/ndb0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c590;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    iget-object p0, p0, Ll/c590;->b:Ll/ndb0;

    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseType;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->b(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;Ll/ndb0;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    return-void
.end method
