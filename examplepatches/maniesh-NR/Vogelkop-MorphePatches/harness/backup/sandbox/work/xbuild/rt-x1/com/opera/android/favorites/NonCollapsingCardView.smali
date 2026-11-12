.class public Lcom/opera/android/favorites/NonCollapsingCardView;
.super Lcom/opera/android/custom_views/CardView;
.source "SourceFile"


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

    invoke-direct {p0, p1, p2}, Lcom/opera/android/custom_views/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final getSuggestedMinimumHeight()I
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final getSuggestedMinimumWidth()I
    .registers 1

    const/4 p0, 0x1

    return p0
.end method
