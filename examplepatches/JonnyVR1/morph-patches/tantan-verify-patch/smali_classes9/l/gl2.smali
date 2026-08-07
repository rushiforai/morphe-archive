.class public final synthetic Ll/gl2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/gl2;->a:I

    iput p2, p0, Ll/gl2;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget v0, p0, Ll/gl2;->a:I

    iget p0, p0, Ll/gl2;->b:I

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;

    invoke-static {v0, p0, p1}, Ll/il2;->e(IILcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;)V

    return-void
.end method
