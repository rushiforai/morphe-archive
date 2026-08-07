.class public final synthetic Ll/yk2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/il2;


# direct methods
.method public synthetic constructor <init>(Ll/il2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yk2;->a:Ll/il2;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yk2;->a:Ll/il2;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

    invoke-static {p0, p1}, Ll/il2;->m(Ll/il2;Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
