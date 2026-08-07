.class public final synthetic Ll/mza0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/q3m;

.field public final synthetic b:Ljava/util/HashSet;


# direct methods
.method public synthetic constructor <init>(Ll/q3m;Ljava/util/HashSet;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mza0;->a:Ll/q3m;

    iput-object p2, p0, Ll/mza0;->b:Ljava/util/HashSet;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mza0;->a:Ll/q3m;

    iget-object p0, p0, Ll/mza0;->b:Ljava/util/HashSet;

    invoke-static {v0, p0, p1}, Ll/pza0;->c(Ll/q3m;Ljava/util/HashSet;Landroid/animation/ValueAnimator;)V

    return-void
.end method
