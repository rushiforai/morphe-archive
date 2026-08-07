.class public final synthetic Ll/jfe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/kfe;


# direct methods
.method public synthetic constructor <init>(Ll/kfe;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jfe;->a:Ll/kfe;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jfe;->a:Ll/kfe;

    invoke-static {p0, p1}, Ll/kfe$a;->c(Ll/kfe;Landroid/animation/ValueAnimator;)V

    return-void
.end method
