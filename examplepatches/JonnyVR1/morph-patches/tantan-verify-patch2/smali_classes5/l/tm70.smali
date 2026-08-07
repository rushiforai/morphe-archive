.class public final synthetic Ll/tm70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/an70;


# direct methods
.method public synthetic constructor <init>(Ll/an70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tm70;->a:Ll/an70;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tm70;->a:Ll/an70;

    invoke-static {p0, p1}, Ll/an70;->e(Ll/an70;Landroid/animation/ValueAnimator;)V

    return-void
.end method
