.class public final synthetic Ll/gbi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/jbi;


# direct methods
.method public synthetic constructor <init>(Ll/jbi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gbi;->a:Ll/jbi;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gbi;->a:Ll/jbi;

    invoke-static {p0, p1}, Ll/jbi;->v0(Ll/jbi;Landroid/animation/ValueAnimator;)V

    return-void
.end method
