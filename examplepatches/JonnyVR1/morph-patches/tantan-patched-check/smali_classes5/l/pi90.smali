.class public final synthetic Ll/pi90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pi90;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pi90;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    check-cast p1, Lcom/p1/mobile/putong/data/PayMethod;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerVIPView;->M(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;Lcom/p1/mobile/putong/data/PayMethod;)V

    return-void
.end method
