.class public final synthetic Ll/qzb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/szb0;


# direct methods
.method public synthetic constructor <init>(Ll/szb0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qzb0;->a:Ll/szb0;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qzb0;->a:Ll/szb0;

    invoke-static {p0, p1}, Ll/szb0;->j(Ll/szb0;Landroid/animation/ValueAnimator;)V

    return-void
.end method
