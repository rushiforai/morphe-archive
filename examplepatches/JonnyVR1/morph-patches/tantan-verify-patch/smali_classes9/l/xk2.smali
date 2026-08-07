.class public final synthetic Ll/xk2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/il2;

.field public final synthetic b:D


# direct methods
.method public synthetic constructor <init>(Ll/il2;D)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xk2;->a:Ll/il2;

    iput-wide p2, p0, Ll/xk2;->b:D

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xk2;->a:Ll/il2;

    iget-wide v1, p0, Ll/xk2;->b:D

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

    invoke-static {v0, v1, v2, p1}, Ll/il2;->k(Ll/il2;DLcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
