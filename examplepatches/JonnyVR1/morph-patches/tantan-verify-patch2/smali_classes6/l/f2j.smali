.class public final synthetic Ll/f2j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/i2j;


# direct methods
.method public synthetic constructor <init>(Ll/i2j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f2j;->a:Ll/i2j;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f2j;->a:Ll/i2j;

    invoke-static {p0, p1}, Ll/i2j;->c(Ll/i2j;Landroid/animation/ValueAnimator;)V

    return-void
.end method
