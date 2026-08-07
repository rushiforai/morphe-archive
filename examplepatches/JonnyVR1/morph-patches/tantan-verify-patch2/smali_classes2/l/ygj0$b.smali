.class public Ll/ygj0$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ygj0;->runAnimator(Landroid/animation/Animator;Ll/l01;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/l01;

.field public final synthetic b:Ll/ygj0;


# direct methods
.method public constructor <init>(Ll/ygj0;Ll/l01;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ygj0$b;->b:Ll/ygj0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ygj0$b;->a:Ll/l01;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ygj0$b;->a:Ll/l01;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/oof0;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ygj0$b;->b:Ll/ygj0;

    .line 7
    .line 8
    iget-object p0, p0, Ll/ygj0;->mCurrentAnimators:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ygj0$b;->b:Ll/ygj0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ygj0;->mCurrentAnimators:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method
