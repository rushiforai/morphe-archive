.class public Lcom/opera/android/custom_views/Shadow;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public final a:Lz5n;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v0, Lz5n;

    invoke-direct {v0, p0, p1, p2}, Lz5n;-><init>(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v0, p0, Lcom/opera/android/custom_views/Shadow;->a:Lz5n;

    return-void
.end method


# virtual methods
.method public final dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 9

    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    const/high16 v5, 0x3f800000    # 1.0f

    const/high16 v6, 0x3f800000    # 1.0f

    iget-object v0, p0, Lcom/opera/android/custom_views/Shadow;->a:Lz5n;

    const/high16 v3, 0x3f800000    # 1.0f

    const/high16 v4, 0x3f800000    # 1.0f

    move-object v2, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lz5n;->a(Landroid/graphics/Canvas;Landroid/view/View;FFFF)V

    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 6

    return-void
.end method
