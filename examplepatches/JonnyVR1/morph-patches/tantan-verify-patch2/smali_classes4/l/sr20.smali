.class public final synthetic Ll/sr20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/as20;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/PictureView;

.field public final synthetic c:Ll/bnl0$g;

.field public final synthetic d:Ll/bnl0$g;

.field public final synthetic e:Z

.field public final synthetic f:F

.field public final synthetic g:F

.field public final synthetic h:Z

.field public final synthetic i:[F


# direct methods
.method public synthetic constructor <init>(Ll/as20;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/bnl0$g;Ll/bnl0$g;ZFFZ[F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sr20;->a:Ll/as20;

    iput-object p2, p0, Ll/sr20;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    iput-object p3, p0, Ll/sr20;->c:Ll/bnl0$g;

    iput-object p4, p0, Ll/sr20;->d:Ll/bnl0$g;

    iput-boolean p5, p0, Ll/sr20;->e:Z

    iput p6, p0, Ll/sr20;->f:F

    iput p7, p0, Ll/sr20;->g:F

    iput-boolean p8, p0, Ll/sr20;->h:Z

    iput-object p9, p0, Ll/sr20;->i:[F

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/sr20;->a:Ll/as20;

    iget-object v1, p0, Ll/sr20;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    iget-object v2, p0, Ll/sr20;->c:Ll/bnl0$g;

    iget-object v3, p0, Ll/sr20;->d:Ll/bnl0$g;

    iget-boolean v4, p0, Ll/sr20;->e:Z

    iget v5, p0, Ll/sr20;->f:F

    iget v6, p0, Ll/sr20;->g:F

    iget-boolean v7, p0, Ll/sr20;->h:Z

    iget-object v8, p0, Ll/sr20;->i:[F

    move-object v9, p1

    invoke-static/range {v0 .. v9}, Ll/as20;->n(Ll/as20;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/bnl0$g;Ll/bnl0$g;ZFFZ[FLandroid/animation/ValueAnimator;)V

    return-void
.end method
