.class public Ll/h3g$a;
.super Ll/wpf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/h3g;->enterAnimation()Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:I

.field public final synthetic b:Ll/h3g;


# direct methods
.method public constructor <init>(Ll/h3g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/h3g$a;->b:Ll/h3g;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/wpf0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/bnl0;->y0()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Ll/h3g$a;->a:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public c(Ll/syf0;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/syf0;->d()D

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    double-to-float p1, v0

    .line 6
    const/high16 v0, 0x3f800000    # 1.0f

    .line 7
    .line 8
    sub-float/2addr v0, p1

    .line 9
    iget-object p1, p0, Ll/h3g$a;->b:Ll/h3g;

    .line 10
    .line 11
    iget-object p1, p1, Ll/h3g;->o:Lv/VButton_FakeShadow;

    .line 12
    .line 13
    iget v1, p0, Ll/h3g$a;->a:I

    .line 14
    .line 15
    int-to-float v1, v1

    .line 16
    mul-float/2addr v1, v0

    .line 17
    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/h3g$a;->b:Ll/h3g;

    .line 21
    .line 22
    iget-object p1, p1, Ll/h3g;->n:Lv/VText;

    .line 23
    .line 24
    neg-float v0, v0

    .line 25
    iget p0, p0, Ll/h3g$a;->a:I

    .line 26
    .line 27
    int-to-float p0, p0

    .line 28
    mul-float/2addr v0, p0

    .line 29
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
