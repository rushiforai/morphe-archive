.class public final synthetic Ll/ixz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/yxz;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;


# direct methods
.method public synthetic constructor <init>(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ixz;->a:Ll/yxz;

    iput-object p2, p0, Ll/ixz;->b:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ixz;->a:Ll/yxz;

    iget-object p0, p0, Ll/ixz;->b:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;

    invoke-static {v0, p0, p1}, Ll/yxz;->Y2(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$TempDownEnum;Landroid/view/View;)V

    return-void
.end method
