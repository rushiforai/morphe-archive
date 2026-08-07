.class public Lv/VFrame_ColorFilter;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Ll/mqh0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-direct {p0, p1, v0, v1}, Lv/VFrame_ColorFilter;->p(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 10
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, p1, p2, v0}, Lv/VFrame_ColorFilter;->p(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private p(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 1
    new-instance v0, Ll/mqh0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mqh0;-><init>(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lv/VFrame_ColorFilter;->a:Ll/mqh0;

    .line 7
    .line 8
    invoke-virtual {v0, p1, p2, p3}, Ll/mqh0;->g(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 9
    .line 10
    .line 11
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
    iget-object p0, p0, Lv/VFrame_ColorFilter;->a:Ll/mqh0;

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
    iget-object p0, p0, Lv/VFrame_ColorFilter;->a:Ll/mqh0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/nqh0;->c()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
