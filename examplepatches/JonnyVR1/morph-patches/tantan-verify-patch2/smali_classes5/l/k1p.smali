.class public final synthetic Ll/k1p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeExclusivePrivilegeView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/PurchaseType;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeExclusivePrivilegeView;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k1p;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeExclusivePrivilegeView;

    iput-object p2, p0, Ll/k1p;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    iput-object p3, p0, Ll/k1p;->c:Lcom/p1/mobile/putong/core/data/PurchaseType;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k1p;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeExclusivePrivilegeView;

    iget-object v1, p0, Ll/k1p;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    iget-object p0, p0, Ll/k1p;->c:Lcom/p1/mobile/putong/core/data/PurchaseType;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeSVipContent;->X(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeExclusivePrivilegeView;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    return-void
.end method
