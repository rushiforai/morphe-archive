.class public Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$i;
.super Ll/gt0$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->l(ILcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;D)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$i;->b:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$i;->a:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/gt0$j;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/gt0$j;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$i;->b:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->t:Landroid/view/View;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$i;->a:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->k(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
