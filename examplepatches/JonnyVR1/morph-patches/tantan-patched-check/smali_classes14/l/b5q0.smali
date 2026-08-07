.class public final synthetic Ll/b5q0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/f5q0;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Ll/f5q0;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b5q0;->a:Ll/f5q0;

    iput-wide p2, p0, Ll/b5q0;->b:J

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/b5q0;->a:Ll/f5q0;

    iget-wide v1, p0, Ll/b5q0;->b:J

    invoke-static {v0, v1, v2, p1}, Ll/f5q0;->w(Ll/f5q0;JLandroid/animation/ValueAnimator;)V

    return-void
.end method
