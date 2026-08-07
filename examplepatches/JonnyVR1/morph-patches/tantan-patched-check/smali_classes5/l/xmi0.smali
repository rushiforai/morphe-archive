.class public final synthetic Ll/xmi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/tarot/a;

.field public final synthetic b:F

.field public final synthetic c:F

.field public final synthetic d:F


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/tarot/a;FFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xmi0;->a:Lcom/p1/mobile/putong/core/ui/tarot/a;

    iput p2, p0, Ll/xmi0;->b:F

    iput p3, p0, Ll/xmi0;->c:F

    iput p4, p0, Ll/xmi0;->d:F

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xmi0;->a:Lcom/p1/mobile/putong/core/ui/tarot/a;

    iget v1, p0, Ll/xmi0;->b:F

    iget v2, p0, Ll/xmi0;->c:F

    iget p0, p0, Ll/xmi0;->d:F

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/tarot/a;->d(Lcom/p1/mobile/putong/core/ui/tarot/a;FFFLandroid/animation/ValueAnimator;)V

    return-void
.end method
