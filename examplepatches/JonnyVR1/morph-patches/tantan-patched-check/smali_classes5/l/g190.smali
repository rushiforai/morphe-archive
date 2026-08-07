.class public final synthetic Ll/g190;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g190;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g190;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;

    check-cast p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->q0(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;Lcom/p1/mobile/putong/core/data/UserPrivilege;)V

    return-void
.end method
