.class public final synthetic Ll/gml0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/lml0;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/lml0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gml0;->a:Ll/lml0;

    iput-object p2, p0, Ll/gml0;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gml0;->a:Ll/lml0;

    iget-object p0, p0, Ll/gml0;->b:Landroid/view/View;

    invoke-static {v0, p0, p1}, Ll/hml0;->a(Ll/lml0;Landroid/view/View;Landroid/animation/ValueAnimator;)V

    return-void
.end method
