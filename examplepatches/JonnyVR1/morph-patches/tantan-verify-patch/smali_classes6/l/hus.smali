.class public final synthetic Ll/hus;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hus;->a:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hus;->a:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->a(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;Landroid/animation/ValueAnimator;)V

    return-void
.end method
