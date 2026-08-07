.class public final synthetic Ll/lil0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/yil0;

.field public final synthetic b:I

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/yil0;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lil0;->a:Ll/yil0;

    iput p2, p0, Ll/lil0;->b:I

    iput-boolean p3, p0, Ll/lil0;->c:Z

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lil0;->a:Ll/yil0;

    iget v1, p0, Ll/lil0;->b:I

    iget-boolean p0, p0, Ll/lil0;->c:Z

    invoke-static {v0, v1, p0, p1}, Ll/yil0;->c0(Ll/yil0;IZLandroid/animation/ValueAnimator;)V

    return-void
.end method
