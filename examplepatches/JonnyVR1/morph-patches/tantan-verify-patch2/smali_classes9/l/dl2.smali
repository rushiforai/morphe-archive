.class public final synthetic Ll/dl2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/il2;


# direct methods
.method public synthetic constructor <init>(Ll/il2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dl2;->a:Ll/il2;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dl2;->a:Ll/il2;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

    invoke-static {p0, p1, p2}, Ll/il2;->d(Ll/il2;Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;)V

    return-void
.end method
