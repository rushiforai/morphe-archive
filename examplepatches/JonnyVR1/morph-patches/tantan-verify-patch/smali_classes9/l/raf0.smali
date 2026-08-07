.class public final synthetic Ll/raf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;

.field public final synthetic b:I

.field public final synthetic c:Ljava/util/Map;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;ILjava/util/Map;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/raf0;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;

    iput p2, p0, Ll/raf0;->b:I

    iput-object p3, p0, Ll/raf0;->c:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/raf0;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;

    iget v1, p0, Ll/raf0;->b:I

    iget-object p0, p0, Ll/raf0;->c:Ljava/util/Map;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->a(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;ILjava/util/Map;Landroid/animation/ValueAnimator;)V

    return-void
.end method
