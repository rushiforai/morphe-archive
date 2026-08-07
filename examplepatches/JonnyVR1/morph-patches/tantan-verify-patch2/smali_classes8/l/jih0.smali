.class public final synthetic Ll/jih0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;IILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jih0;->a:Landroid/view/View;

    iput p2, p0, Ll/jih0;->b:I

    iput p3, p0, Ll/jih0;->c:I

    iput-object p4, p0, Ll/jih0;->d:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jih0;->a:Landroid/view/View;

    iget v1, p0, Ll/jih0;->b:I

    iget v2, p0, Ll/jih0;->c:I

    iget-object p0, p0, Ll/jih0;->d:Landroid/view/View;

    invoke-static {v0, v1, v2, p0, p1}, Ll/uih0;->c(Landroid/view/View;IILandroid/view/View;Landroid/animation/ValueAnimator;)V

    return-void
.end method
