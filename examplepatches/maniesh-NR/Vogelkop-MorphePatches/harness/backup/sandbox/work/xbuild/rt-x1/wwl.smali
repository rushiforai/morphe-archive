.class public final Lwwl;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/custom_views/StylingImageView;

.field public final b:Landroid/graphics/Rect;

.field public final c:Landroid/view/TouchDelegate;


# direct methods
.method public constructor <init>(Lcom/opera/android/custom_views/StylingImageView;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwwl;->a:Lcom/opera/android/custom_views/StylingImageView;

    new-instance v0, Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v2

    const/4 v3, 0x0

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v0, p0, Lwwl;->b:Landroid/graphics/Rect;

    new-instance v1, Landroid/view/TouchDelegate;

    invoke-direct {v1, v0, p1}, Landroid/view/TouchDelegate;-><init>(Landroid/graphics/Rect;Landroid/view/View;)V

    iput-object v1, p0, Lwwl;->c:Landroid/view/TouchDelegate;

    return-void
.end method
