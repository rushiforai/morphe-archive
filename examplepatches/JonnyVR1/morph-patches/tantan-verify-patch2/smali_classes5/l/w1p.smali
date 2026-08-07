.class public final synthetic Ll/w1p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeSVipContent;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

.field public final synthetic c:Ll/pf60;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeSVipContent;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w1p;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeSVipContent;

    iput-object p2, p0, Ll/w1p;->b:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    iput-object p3, p0, Ll/w1p;->c:Ll/pf60;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w1p;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeSVipContent;

    iget-object v1, p0, Ll/w1p;->b:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    iget-object p0, p0, Ll/w1p;->c:Ll/pf60;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeSVipContent;->c0(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeSVipContent;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Ll/pf60;)V

    return-void
.end method
