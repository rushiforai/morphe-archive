.class public Ll/sww$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/sww;->J(ILl/bf3;Ll/l3h0;Lcom/p1/mobile/android/app/c;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/sww;


# direct methods
.method public constructor <init>(Ll/sww;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sww$a;->a:Ll/sww;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/sww$a;->a:Ll/sww;

    .line 4
    .line 5
    invoke-static {p1}, Ll/sww;->p(Ll/sww;)Ll/eww;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ll/eww;->q0()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Ll/sww$a;->a:Ll/sww;

    .line 16
    .line 17
    iget-object p1, p1, Ll/sww;->a:Lcom/p1/mobile/putong/core/ui/map/TouchProxyForMap;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iget-object p0, p0, Ll/sww$a;->a:Ll/sww;

    .line 24
    .line 25
    iget-object p0, p0, Ll/sww;->g:Landroid/widget/FrameLayout;

    .line 26
    .line 27
    div-int/lit8 p1, p1, 0x2

    .line 28
    .line 29
    int-to-float p1, p1

    .line 30
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 0

    .line 1
    return-void
.end method
