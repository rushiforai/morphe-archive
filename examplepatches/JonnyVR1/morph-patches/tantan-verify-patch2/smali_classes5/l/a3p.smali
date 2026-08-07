.class public final synthetic Ll/a3p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeSeeContent;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeSeeContent;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a3p;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeSeeContent;

    iput-object p2, p0, Ll/a3p;->b:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a3p;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeSeeContent;

    iget-object p0, p0, Ll/a3p;->b:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeSeeContent;->K(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeSeeContent;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
