.class public final synthetic Ll/ncf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

.field public final synthetic b:Landroid/graphics/drawable/Drawable;

.field public final synthetic c:Landroid/graphics/drawable/Drawable;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ncf;->a:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    iput-object p2, p0, Ll/ncf;->b:Landroid/graphics/drawable/Drawable;

    iput-object p3, p0, Ll/ncf;->c:Landroid/graphics/drawable/Drawable;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ncf;->a:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    iget-object v1, p0, Ll/ncf;->b:Landroid/graphics/drawable/Drawable;

    iget-object p0, p0, Ll/ncf;->c:Landroid/graphics/drawable/Drawable;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->d0(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/animation/ValueAnimator;)V

    return-void
.end method
