.class public final synthetic Ll/syh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lv/a;

.field public final synthetic b:Z

.field public final synthetic c:F


# direct methods
.method public synthetic constructor <init>(Lv/a;ZF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/syh0;->a:Lv/a;

    iput-boolean p2, p0, Ll/syh0;->b:Z

    iput p3, p0, Ll/syh0;->c:F

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/syh0;->a:Lv/a;

    iget-boolean v1, p0, Ll/syh0;->b:Z

    iget p0, p0, Ll/syh0;->c:F

    invoke-static {v0, v1, p0, p1}, Lv/a;->b(Lv/a;ZFLandroid/animation/ValueAnimator;)V

    return-void
.end method
