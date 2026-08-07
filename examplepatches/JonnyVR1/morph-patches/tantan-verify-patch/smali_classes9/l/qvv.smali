.class public final synthetic Ll/qvv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/i6t;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveBonus;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveBonus;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qvv;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/qvv;->b:Ll/i6t;

    iput-object p3, p0, Ll/qvv;->c:Lcom/p1/mobile/putong/live/base/data/BLiveBonus;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qvv;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/qvv;->b:Ll/i6t;

    iget-object p0, p0, Ll/qvv;->c:Lcom/p1/mobile/putong/live/base/data/BLiveBonus;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->i0(Ljava/lang/String;Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveBonus;Landroid/view/View;)V

    return-void
.end method
