.class public final synthetic Ll/z93;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/view/boost/view/BoostRemainingCountViewOpt;

.field public final synthetic b:Landroid/animation/AnimatorSet;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/view/boost/view/BoostRemainingCountViewOpt;Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z93;->a:Lcom/p1/mobile/putong/core/newui/view/boost/view/BoostRemainingCountViewOpt;

    iput-object p2, p0, Ll/z93;->b:Landroid/animation/AnimatorSet;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z93;->a:Lcom/p1/mobile/putong/core/newui/view/boost/view/BoostRemainingCountViewOpt;

    iget-object p0, p0, Ll/z93;->b:Landroid/animation/AnimatorSet;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/newui/view/boost/view/BoostRemainingCountViewOpt;->a(Lcom/p1/mobile/putong/core/newui/view/boost/view/BoostRemainingCountViewOpt;Landroid/animation/AnimatorSet;)V

    return-void
.end method
