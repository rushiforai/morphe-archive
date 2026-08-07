.class public final synthetic Ll/lbg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/tbg0;


# direct methods
.method public synthetic constructor <init>(Ll/tbg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lbg0;->a:Ll/tbg0;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lbg0;->a:Ll/tbg0;

    invoke-static {p0, p1}, Ll/tbg0;->m(Ll/tbg0;Landroid/animation/ValueAnimator;)V

    return-void
.end method
