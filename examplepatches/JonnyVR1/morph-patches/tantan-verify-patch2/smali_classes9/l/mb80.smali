.class public final synthetic Ll/mb80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/qb80;

.field public final synthetic b:Landroid/widget/FrameLayout$LayoutParams;

.field public final synthetic c:I

.field public final synthetic d:I

.field public final synthetic e:I

.field public final synthetic f:I

.field public final synthetic g:I


# direct methods
.method public synthetic constructor <init>(Ll/qb80;Landroid/widget/FrameLayout$LayoutParams;IIIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mb80;->a:Ll/qb80;

    iput-object p2, p0, Ll/mb80;->b:Landroid/widget/FrameLayout$LayoutParams;

    iput p3, p0, Ll/mb80;->c:I

    iput p4, p0, Ll/mb80;->d:I

    iput p5, p0, Ll/mb80;->e:I

    iput p6, p0, Ll/mb80;->f:I

    iput p7, p0, Ll/mb80;->g:I

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/mb80;->a:Ll/qb80;

    iget-object v1, p0, Ll/mb80;->b:Landroid/widget/FrameLayout$LayoutParams;

    iget v2, p0, Ll/mb80;->c:I

    iget v3, p0, Ll/mb80;->d:I

    iget v4, p0, Ll/mb80;->e:I

    iget v5, p0, Ll/mb80;->f:I

    iget v6, p0, Ll/mb80;->g:I

    move-object v7, p1

    invoke-static/range {v0 .. v7}, Ll/qb80;->i(Ll/qb80;Landroid/widget/FrameLayout$LayoutParams;IIIIILandroid/animation/ValueAnimator;)V

    return-void
.end method
