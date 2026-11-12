.class public Lcom/google/android/material/appbar/CustomCollapsingToolbarLayout;
.super Lcom/google/android/material/appbar/CollapsingToolbarLayout;
.source "SourceFile"


# instance fields
.field public K:Lz0c;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final f(I)V
    .registers 7

    invoke-super {p0, p1}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->f(I)V

    iget-object p0, p0, Lcom/google/android/material/appbar/CustomCollapsingToolbarLayout;->K:Lz0c;

    if-eqz p0, :cond_26

    iget-object v0, p0, Lz0c;->b:Ljava/lang/Object;

    check-cast v0, Lf9c;

    iget-object p0, p0, Lz0c;->c:Ljava/lang/Object;

    check-cast p0, Le9c;

    int-to-float p1, p1

    const/high16 v1, 0x437f0000    # 255.0f

    div-float/2addr p1, v1

    iget-object v0, v0, Lf9c;->u:Ljava/lang/Object;

    check-cast v0, Lr9i;

    float-to-double v1, p1

    const-wide/high16 v3, 0x3fe0000000000000L    # 0.5

    cmpg-double v1, v1, v3

    if-gez v1, :cond_20

    const/4 v1, 0x1

    goto :goto_21

    :cond_20
    const/4 v1, 0x0

    :goto_21
    invoke-virtual {v0, v1}, Lr9i;->W(Z)V

    iput p1, p0, Le9c;->b:F

    :cond_26
    return-void
.end method
