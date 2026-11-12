.class public final Le9c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final a:Lcom/google/android/material/appbar/CustomCollapsingToolbarLayout;

.field public b:F

.field public final synthetic c:Lf9c;


# direct methods
.method public constructor <init>(Lf9c;Lcom/google/android/material/appbar/CustomCollapsingToolbarLayout;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le9c;->c:Lf9c;

    iput-object p2, p0, Le9c;->a:Lcom/google/android/material/appbar/CustomCollapsingToolbarLayout;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 5

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f040a16

    const v1, 0x7f0608b5

    invoke-static {v0, p1, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    iget-object v1, p0, Le9c;->a:Lcom/google/android/material/appbar/CustomCollapsingToolbarLayout;

    invoke-virtual {v1, v0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->e(I)V

    new-instance v0, Lr9i;

    iget-object v1, p0, Le9c;->c:Lf9c;

    invoke-direct {v0, v1, p1}, Lr9i;-><init>(Lf9c;Landroid/content/Context;)V

    iput-object v0, v1, Lf9c;->u:Ljava/lang/Object;

    iget p0, p0, Le9c;->b:F

    float-to-double p0, p0

    const-wide/high16 v1, 0x3fe0000000000000L    # 0.5

    cmpg-double p0, p0, v1

    if-gez p0, :cond_27

    const/4 p0, 0x1

    goto :goto_28

    :cond_27
    const/4 p0, 0x0

    :goto_28
    invoke-virtual {v0, p0}, Lr9i;->W(Z)V

    return-void
.end method
