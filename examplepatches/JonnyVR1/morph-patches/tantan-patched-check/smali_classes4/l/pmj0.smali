.class public final synthetic Ll/pmj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/qmj0;

.field public final synthetic b:F

.field public final synthetic c:F

.field public final synthetic d:F

.field public final synthetic e:F

.field public final synthetic f:I

.field public final synthetic g:I

.field public final synthetic h:F

.field public final synthetic i:F

.field public final synthetic j:I

.field public final synthetic k:I


# direct methods
.method public synthetic constructor <init>(Ll/qmj0;FFFFIIFFII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pmj0;->a:Ll/qmj0;

    iput p2, p0, Ll/pmj0;->b:F

    iput p3, p0, Ll/pmj0;->c:F

    iput p4, p0, Ll/pmj0;->d:F

    iput p5, p0, Ll/pmj0;->e:F

    iput p6, p0, Ll/pmj0;->f:I

    iput p7, p0, Ll/pmj0;->g:I

    iput p8, p0, Ll/pmj0;->h:F

    iput p9, p0, Ll/pmj0;->i:F

    iput p10, p0, Ll/pmj0;->j:I

    iput p11, p0, Ll/pmj0;->k:I

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 12

    .line 1
    iget-object v0, p0, Ll/pmj0;->a:Ll/qmj0;

    iget v1, p0, Ll/pmj0;->b:F

    iget v2, p0, Ll/pmj0;->c:F

    iget v3, p0, Ll/pmj0;->d:F

    iget v4, p0, Ll/pmj0;->e:F

    iget v5, p0, Ll/pmj0;->f:I

    iget v6, p0, Ll/pmj0;->g:I

    iget v7, p0, Ll/pmj0;->h:F

    iget v8, p0, Ll/pmj0;->i:F

    iget v9, p0, Ll/pmj0;->j:I

    iget v10, p0, Ll/pmj0;->k:I

    move-object v11, p1

    invoke-static/range {v0 .. v11}, Ll/qmj0;->a(Ll/qmj0;FFFFIIFFIILandroid/animation/ValueAnimator;)V

    return-void
.end method
