.class public final synthetic Ll/rfn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/sfn0;


# direct methods
.method public synthetic constructor <init>(Ll/sfn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rfn0;->a:Ll/sfn0;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rfn0;->a:Ll/sfn0;

    invoke-static {p0, p1}, Ll/sfn0;->a(Ll/sfn0;Landroid/animation/ValueAnimator;)V

    return-void
.end method
