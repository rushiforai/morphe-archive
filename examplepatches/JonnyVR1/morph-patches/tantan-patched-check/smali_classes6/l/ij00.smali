.class public final synthetic Ll/ij00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/nk00;


# direct methods
.method public synthetic constructor <init>(Ll/nk00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ij00;->a:Ll/nk00;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ij00;->a:Ll/nk00;

    invoke-static {p0, p1}, Ll/nk00;->a(Ll/nk00;Landroid/animation/ValueAnimator;)V

    return-void
.end method
