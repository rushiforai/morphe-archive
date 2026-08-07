.class public final synthetic Ll/e00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/r00;

.field public final synthetic b:I

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/r00;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e00;->a:Ll/r00;

    iput p2, p0, Ll/e00;->b:I

    iput-boolean p3, p0, Ll/e00;->c:Z

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/e00;->a:Ll/r00;

    iget v1, p0, Ll/e00;->b:I

    iget-boolean p0, p0, Ll/e00;->c:Z

    invoke-static {v0, v1, p0, p1}, Ll/r00;->i0(Ll/r00;IZLandroid/animation/ValueAnimator;)V

    return-void
.end method
