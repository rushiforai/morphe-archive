.class public Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;
.super Lv/fresco/photodraweeview/PhotoDraweeView;
.source "SourceFile"


# instance fields
.field public p:Ll/rae;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1}, Lv/fresco/photodraweeview/PhotoDraweeView;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2}, Lv/fresco/photodraweeview/PhotoDraweeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lv/fresco/photodraweeview/PhotoDraweeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/wlj;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lv/fresco/photodraweeview/PhotoDraweeView;-><init>(Landroid/content/Context;Ll/wlj;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public setOnDragDismissListenler(Ll/am50;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lv/fresco/photodraweeview/PhotoDraweeView;->setOnDragDismissListenler(Ll/am50;)V

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Ll/rae;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    check-cast p1, Ll/rae;

    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;->p:Ll/rae;

    .line 11
    .line 12
    :cond_0
    new-instance p1, Ll/wl8;

    .line 13
    .line 14
    invoke-virtual {p0}, Lv/fresco/photodraweeview/PhotoDraweeView;->getOnDismissDragGesterListener()Ll/zl50;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-direct {p1, v0, v1}, Ll/wl8;-><init>(Ll/zl50;Landroid/content/Context;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lv/fresco/photodraweeview/PhotoDraweeView;->setDismissDragDetector(Ll/i5e;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public setTranslationY(F)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;->p:Ll/rae;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;->p:Ll/rae;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-interface {p1, v0, p0}, Ll/rae;->b(FF)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method
