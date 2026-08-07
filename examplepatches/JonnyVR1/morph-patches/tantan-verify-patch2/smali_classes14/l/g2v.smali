.class public final synthetic Ll/g2v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:I

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Ll/y20;Ll/y20;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g2v;->a:Ll/y20;

    iput-object p2, p0, Ll/g2v;->b:Ll/y20;

    iput p3, p0, Ll/g2v;->c:I

    iput p4, p0, Ll/g2v;->d:I

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/g2v;->a:Ll/y20;

    iget-object v1, p0, Ll/g2v;->b:Ll/y20;

    iget v2, p0, Ll/g2v;->c:I

    iget p0, p0, Ll/g2v;->d:I

    invoke-static {v0, v1, v2, p0, p1}, Ll/h2v;->N(Ll/y20;Ll/y20;IILandroid/animation/ValueAnimator;)V

    return-void
.end method
