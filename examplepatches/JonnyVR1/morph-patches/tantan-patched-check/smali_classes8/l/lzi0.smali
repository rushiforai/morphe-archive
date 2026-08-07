.class public final synthetic Ll/lzi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lv/TickerView;

.field public final synthetic b:J

.field public final synthetic c:F

.field public final synthetic d:I

.field public final synthetic e:I

.field public final synthetic f:I

.field public final synthetic g:F

.field public final synthetic h:F


# direct methods
.method public synthetic constructor <init>(Lv/TickerView;JFIIIFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lzi0;->a:Lv/TickerView;

    iput-wide p2, p0, Ll/lzi0;->b:J

    iput p4, p0, Ll/lzi0;->c:F

    iput p5, p0, Ll/lzi0;->d:I

    iput p6, p0, Ll/lzi0;->e:I

    iput p7, p0, Ll/lzi0;->f:I

    iput p8, p0, Ll/lzi0;->g:F

    iput p9, p0, Ll/lzi0;->h:F

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/lzi0;->a:Lv/TickerView;

    iget-wide v1, p0, Ll/lzi0;->b:J

    iget v3, p0, Ll/lzi0;->c:F

    iget v4, p0, Ll/lzi0;->d:I

    iget v5, p0, Ll/lzi0;->e:I

    iget v6, p0, Ll/lzi0;->f:I

    iget v7, p0, Ll/lzi0;->g:F

    iget v8, p0, Ll/lzi0;->h:F

    move-object v9, p1

    invoke-static/range {v0 .. v9}, Lv/TickerView;->e(Lv/TickerView;JFIIIFFLandroid/animation/ValueAnimator;)V

    return-void
.end method
