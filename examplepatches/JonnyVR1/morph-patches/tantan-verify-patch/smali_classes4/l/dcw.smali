.class public final synthetic Ll/dcw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/fcw$a;


# direct methods
.method public synthetic constructor <init>(Ll/fcw$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dcw;->a:Ll/fcw$a;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dcw;->a:Ll/fcw$a;

    invoke-static {p0, p1}, Ll/fcw$a;->a(Ll/fcw$a;Landroid/animation/ValueAnimator;)V

    return-void
.end method
