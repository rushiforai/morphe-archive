.class public final synthetic Ll/d06;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d06;->a:Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationView;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d06;->a:Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationView;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationView;->a(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationView;Landroid/animation/ValueAnimator;)V

    return-void
.end method
