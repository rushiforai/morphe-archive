.class public final synthetic Ll/e8e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/l8e;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/l8e;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e8e;->a:Ll/l8e;

    iput p2, p0, Ll/e8e;->b:I

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e8e;->a:Ll/l8e;

    iget p0, p0, Ll/e8e;->b:I

    invoke-static {v0, p0, p1}, Ll/l8e;->c(Ll/l8e;ILandroid/animation/ValueAnimator;)V

    return-void
.end method
