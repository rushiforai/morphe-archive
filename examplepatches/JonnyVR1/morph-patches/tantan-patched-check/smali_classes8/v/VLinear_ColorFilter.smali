.class public Lv/VLinear_ColorFilter;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public final a:Ll/mqh0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 16
    invoke-direct {p0, p1, v0}, Lv/VLinear_ColorFilter;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 15
    invoke-direct {p0, p1, p2, v0}, Lv/VLinear_ColorFilter;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/mqh0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/mqh0;-><init>(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lv/VLinear_ColorFilter;->a:Ll/mqh0;

    .line 10
    .line 11
    invoke-virtual {v0, p1, p2, p3}, Ll/mqh0;->g(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public childDrawableStateChanged(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->childDrawableStateChanged(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lv/VLinear_ColorFilter;->a:Ll/mqh0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/nqh0;->b()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public drawableStateChanged()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->drawableStateChanged()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lv/VLinear_ColorFilter;->a:Ll/mqh0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/nqh0;->c()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
