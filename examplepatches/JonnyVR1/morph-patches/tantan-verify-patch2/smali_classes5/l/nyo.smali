.class public final synthetic Ll/nyo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nyo;->a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nyo;->a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;

    check-cast p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;->g(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/IntlPrivilegeCard;Lcom/p1/mobile/putong/core/data/UserPrivilege;)V

    return-void
.end method
