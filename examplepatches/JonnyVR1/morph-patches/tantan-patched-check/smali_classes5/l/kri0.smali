.class public final synthetic Ll/kri0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Landroid/animation/ArgbEvaluator;

.field public final synthetic b:Ljava/lang/Integer;

.field public final synthetic c:Ljava/lang/Integer;

.field public final synthetic d:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Landroid/animation/ArgbEvaluator;Ljava/lang/Integer;Ljava/lang/Integer;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kri0;->a:Landroid/animation/ArgbEvaluator;

    iput-object p2, p0, Ll/kri0;->b:Ljava/lang/Integer;

    iput-object p3, p0, Ll/kri0;->c:Ljava/lang/Integer;

    iput-object p4, p0, Ll/kri0;->d:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kri0;->a:Landroid/animation/ArgbEvaluator;

    iget-object v1, p0, Ll/kri0;->b:Ljava/lang/Integer;

    iget-object v2, p0, Ll/kri0;->c:Ljava/lang/Integer;

    iget-object p0, p0, Ll/kri0;->d:Landroid/widget/TextView;

    invoke-static {v0, v1, v2, p0, p1}, Ll/lri0;->a(Landroid/animation/ArgbEvaluator;Ljava/lang/Integer;Ljava/lang/Integer;Landroid/widget/TextView;Landroid/animation/ValueAnimator;)V

    return-void
.end method
