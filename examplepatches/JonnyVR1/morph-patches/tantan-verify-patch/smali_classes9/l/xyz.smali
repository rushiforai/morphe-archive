.class public final synthetic Ll/xyz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/qzz;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/qzz;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xyz;->a:Ll/qzz;

    iput p2, p0, Ll/xyz;->b:I

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xyz;->a:Ll/qzz;

    iget p0, p0, Ll/xyz;->b:I

    invoke-static {v0, p0, p1}, Ll/qzz;->V(Ll/qzz;ILandroid/animation/ValueAnimator;)V

    return-void
.end method
