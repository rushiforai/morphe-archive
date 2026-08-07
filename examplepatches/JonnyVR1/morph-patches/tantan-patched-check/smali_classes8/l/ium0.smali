.class public final synthetic Ll/ium0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/kum0;

.field public final synthetic b:Z

.field public final synthetic c:I

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Ll/kum0;ZII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ium0;->a:Ll/kum0;

    iput-boolean p2, p0, Ll/ium0;->b:Z

    iput p3, p0, Ll/ium0;->c:I

    iput p4, p0, Ll/ium0;->d:I

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ium0;->a:Ll/kum0;

    iget-boolean v1, p0, Ll/ium0;->b:Z

    iget v2, p0, Ll/ium0;->c:I

    iget p0, p0, Ll/ium0;->d:I

    invoke-static {v0, v1, v2, p0, p1}, Ll/kum0;->I(Ll/kum0;ZIILandroid/animation/ValueAnimator;)V

    return-void
.end method
