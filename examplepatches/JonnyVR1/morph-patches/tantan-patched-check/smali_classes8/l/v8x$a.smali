.class public Ll/v8x$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/v8x;->R0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/v8x;


# direct methods
.method public constructor <init>(Ll/v8x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/v8x$a;->a:Ll/v8x;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p0, p0, Ll/v8x$a;->a:Ll/v8x;

    .line 12
    .line 13
    invoke-static {p0}, Ll/v8x;->P0(Ll/v8x;)Ll/iam;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ll/g9x;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/g9x;->K(I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
