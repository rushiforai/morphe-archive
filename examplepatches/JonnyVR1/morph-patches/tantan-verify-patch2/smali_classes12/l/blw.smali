.class public final synthetic Ll/blw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/hellogroup/mk/business/widget/MKTabLayout;


# direct methods
.method public synthetic constructor <init>(Lcom/hellogroup/mk/business/widget/MKTabLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/blw;->a:Lcom/hellogroup/mk/business/widget/MKTabLayout;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/blw;->a:Lcom/hellogroup/mk/business/widget/MKTabLayout;

    invoke-static {p0, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->a(Lcom/hellogroup/mk/business/widget/MKTabLayout;Landroid/animation/ValueAnimator;)V

    return-void
.end method
