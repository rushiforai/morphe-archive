.class public Lv/smart_refresh/footer/TTRefreshFooter;
.super Lv/smart_refresh/simple/SimpleComponent;
.source "SourceFile"

# interfaces
.implements Ll/jvc0;


# instance fields
.field public d:Ll/lvc0;

.field public e:Landroid/widget/ImageView;

.field public f:I

.field public g:I

.field public h:Lv/smart_refresh/constant/RefreshState;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 29
    invoke-direct {p0, p1, v0}, Lv/smart_refresh/footer/TTRefreshFooter;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 28
    invoke-direct {p0, p1, p2, v0}, Lv/smart_refresh/footer/TTRefreshFooter;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/smart_refresh/simple/SimpleComponent;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/16 p2, 0x1f4

    .line 5
    .line 6
    iput p2, p0, Lv/smart_refresh/footer/TTRefreshFooter;->g:I

    .line 7
    .line 8
    sget-object p2, Ll/wwf0;->d:Ll/wwf0;

    .line 9
    .line 10
    iput-object p2, p0, Lv/smart_refresh/simple/SimpleComponent;->b:Ll/wwf0;

    .line 11
    .line 12
    sget p2, Ll/gec0;->t:I

    .line 13
    .line 14
    invoke-static {p1, p2, p0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    sget p1, Ll/vcc0;->L:I

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Landroid/widget/ImageView;

    .line 24
    .line 25
    iput-object p1, p0, Lv/smart_refresh/footer/TTRefreshFooter;->e:Landroid/widget/ImageView;

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public f(Ll/mvc0;Lv/smart_refresh/constant/RefreshState;Lv/smart_refresh/constant/RefreshState;)V
    .locals 0
    .param p1    # Ll/mvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lv/smart_refresh/constant/RefreshState;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lv/smart_refresh/constant/RefreshState;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p3, p0, Lv/smart_refresh/footer/TTRefreshFooter;->h:Lv/smart_refresh/constant/RefreshState;

    .line 2
    .line 3
    return-void
.end method

.method public h(Ll/mvc0;Z)I
    .locals 0
    .param p1    # Ll/mvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget p0, p0, Lv/smart_refresh/footer/TTRefreshFooter;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public i(Ll/lvc0;II)V
    .locals 0
    .param p1    # Ll/lvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lv/smart_refresh/footer/TTRefreshFooter;->d:Ll/lvc0;

    .line 2
    .line 3
    iget p2, p0, Lv/smart_refresh/footer/TTRefreshFooter;->f:I

    .line 4
    .line 5
    invoke-interface {p1, p0, p2}, Ll/lvc0;->b(Ll/gvc0;I)Ll/lvc0;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setSpinnerStyle(Ll/wwf0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/smart_refresh/simple/SimpleComponent;->b:Ll/wwf0;

    .line 2
    .line 3
    return-void
.end method
