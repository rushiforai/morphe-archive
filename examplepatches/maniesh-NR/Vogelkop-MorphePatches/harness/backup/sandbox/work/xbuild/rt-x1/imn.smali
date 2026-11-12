.class public final synthetic Limn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/TimeAnimator$TimeListener;


# instance fields
.field public final synthetic a:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Limn;->a:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onTimeUpdate(Landroid/animation/TimeAnimator;JJ)V
    .registers 6

    long-to-double p1, p2

    const-wide p3, 0x408f400000000000L    # 1000.0

    div-double/2addr p1, p3

    const-wide p3, 0x400921fb54442d18L    # Math.PI

    mul-double/2addr p1, p3

    invoke-static {p1, p2}, Ljava/lang/Math;->sin(D)D

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Math;->abs(D)D

    move-result-wide p1

    double-to-float p1, p1

    const p2, 0x3df5c28f    # 0.12f

    mul-float/2addr p1, p2

    add-float/2addr p1, p2

    iget-object p0, p0, Limn;->a:Landroid/view/View;

    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    return-void
.end method
