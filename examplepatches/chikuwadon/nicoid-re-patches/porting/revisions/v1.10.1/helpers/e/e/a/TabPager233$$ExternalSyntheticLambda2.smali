.class public final synthetic Le/e/a/TabPager233$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic f$0:Le/e/a/TabPager233$Drag;


# direct methods
.method public synthetic constructor <init>(Le/e/a/TabPager233$Drag;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/TabPager233$$ExternalSyntheticLambda2;->f$0:Le/e/a/TabPager233$Drag;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/TabPager233$$ExternalSyntheticLambda2;->f$0:Le/e/a/TabPager233$Drag;

    invoke-static {v0, p1}, Le/e/a/TabPager233;->lambda$0(Le/e/a/TabPager233$Drag;Landroid/animation/ValueAnimator;)V

    return-void
.end method
