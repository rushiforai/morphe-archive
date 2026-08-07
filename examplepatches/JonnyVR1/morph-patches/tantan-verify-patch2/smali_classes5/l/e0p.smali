.class public final synthetic Ll/e0p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeExclusivePrivilegeView;

.field public final synthetic b:Ll/be90;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/PurchaseType;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeExclusivePrivilegeView;Ll/be90;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e0p;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeExclusivePrivilegeView;

    iput-object p2, p0, Ll/e0p;->b:Ll/be90;

    iput-object p3, p0, Ll/e0p;->c:Lcom/p1/mobile/putong/core/data/PurchaseType;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/e0p;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeExclusivePrivilegeView;

    iget-object v1, p0, Ll/e0p;->b:Ll/be90;

    iget-object p0, p0, Ll/e0p;->c:Lcom/p1/mobile/putong/core/data/PurchaseType;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeExclusivePrivilegeView;->a(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeExclusivePrivilegeView;Ll/be90;Lcom/p1/mobile/putong/core/data/PurchaseType;Landroid/view/View;)V

    return-void
.end method
