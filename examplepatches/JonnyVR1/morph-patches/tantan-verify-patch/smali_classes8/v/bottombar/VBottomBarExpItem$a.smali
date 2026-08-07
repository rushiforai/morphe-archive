.class public Lv/bottombar/VBottomBarExpItem$a;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/bottombar/VBottomBarExpItem;->g(Ljava/lang/String;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lv/bottombar/VBottomBarExpItem;


# direct methods
.method public constructor <init>(Lv/bottombar/VBottomBarExpItem;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/bottombar/VBottomBarExpItem$a;->a:Lv/bottombar/VBottomBarExpItem;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onFinished()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lv/bottombar/VBottomBarExpItem$a;->a:Lv/bottombar/VBottomBarExpItem;

    .line 5
    .line 6
    invoke-static {v0}, Lv/bottombar/VBottomBarExpItem;->f(Lv/bottombar/VBottomBarExpItem;)Lcom/tantan/library/svga/SVGAnimationView;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lv/bottombar/VBottomBarExpItem$a;->a:Lv/bottombar/VBottomBarExpItem;

    .line 15
    .line 16
    invoke-static {p0}, Lv/bottombar/VBottomBarExpItem;->e(Lv/bottombar/VBottomBarExpItem;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public onStart()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lv/bottombar/VBottomBarExpItem$a;->a:Lv/bottombar/VBottomBarExpItem;

    .line 5
    .line 6
    invoke-static {v0}, Lv/bottombar/VBottomBarExpItem;->f(Lv/bottombar/VBottomBarExpItem;)Lcom/tantan/library/svga/SVGAnimationView;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lv/bottombar/VBottomBarExpItem$a;->a:Lv/bottombar/VBottomBarExpItem;

    .line 15
    .line 16
    invoke-static {p0}, Lv/bottombar/VBottomBarExpItem;->e(Lv/bottombar/VBottomBarExpItem;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
