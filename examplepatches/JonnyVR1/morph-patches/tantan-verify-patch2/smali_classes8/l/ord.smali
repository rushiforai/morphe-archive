.class public final synthetic Ll/ord;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/prd;


# direct methods
.method public synthetic constructor <init>(Ll/prd;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ord;->a:Ll/prd;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ord;->a:Ll/prd;

    invoke-static {p0, p1}, Ll/prd;->j(Ll/prd;Landroid/animation/ValueAnimator;)V

    return-void
.end method
