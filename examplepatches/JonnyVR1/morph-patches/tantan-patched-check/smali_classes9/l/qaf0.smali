.class public final synthetic Ll/qaf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;

.field public final synthetic b:F

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimItem;

.field public final synthetic d:F

.field public final synthetic e:F


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;FLcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimItem;FF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qaf0;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;

    iput p2, p0, Ll/qaf0;->b:F

    iput-object p3, p0, Ll/qaf0;->c:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimItem;

    iput p4, p0, Ll/qaf0;->d:F

    iput p5, p0, Ll/qaf0;->e:F

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/qaf0;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;

    iget v1, p0, Ll/qaf0;->b:F

    iget-object v2, p0, Ll/qaf0;->c:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimItem;

    iget v3, p0, Ll/qaf0;->d:F

    iget v4, p0, Ll/qaf0;->e:F

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->b(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;FLcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimItem;FFLandroid/animation/ValueAnimator;)V

    return-void
.end method
