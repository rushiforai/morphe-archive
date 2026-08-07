.class public final synthetic Ll/ceq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim$c;

.field public final synthetic b:Landroid/animation/Animator;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim$c;Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ceq0;->a:Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim$c;

    iput-object p2, p0, Ll/ceq0;->b:Landroid/animation/Animator;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ceq0;->a:Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim$c;

    iget-object p0, p0, Ll/ceq0;->b:Landroid/animation/Animator;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim$c;->a(Lcom/p1/mobile/putong/core/newui/messages/anim/view/wengweng/WengwengPullHeadAnim$c;Landroid/animation/Animator;)V

    return-void
.end method
