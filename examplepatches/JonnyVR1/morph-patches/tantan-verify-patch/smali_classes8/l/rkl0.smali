.class public final synthetic Ll/rkl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/tkl0;


# direct methods
.method public synthetic constructor <init>(Ll/tkl0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rkl0;->a:Ll/tkl0;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rkl0;->a:Ll/tkl0;

    invoke-static {p0, p1}, Ll/tkl0;->a(Ll/tkl0;Landroid/animation/ValueAnimator;)V

    return-void
.end method
