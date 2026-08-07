.class public final Ll/x3h0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/x3h0;->m(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001f\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0007\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0007*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\'\u0010\u0008\u001a\u00020\u00072\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0017\u0010\n\u001a\u00020\u00072\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0017\u0010\r\u001a\u00020\u00072\u0006\u0010\u000c\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000b\u00a8\u0006\u000e"
    }
    d2 = {
        "l/x3h0$a",
        "Landroidx/viewpager/widget/ViewPager$j;",
        "",
        "position",
        "",
        "positionOffset",
        "positionOffsetPixels",
        "",
        "onPageScrolled",
        "(IFI)V",
        "onPageSelected",
        "(I)V",
        "state",
        "onPageScrollStateChanged",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Ll/x3h0;


# direct methods
.method public constructor <init>(Ll/x3h0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x3h0$a;->a:Ll/x3h0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    .line 1
    return-void
.end method

.method public onPageSelected(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/x3h0$a;->a:Ll/x3h0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/x3h0;->i0(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/x3h0$a;->a:Ll/x3h0;

    .line 7
    .line 8
    invoke-static {v0}, Ll/x3h0;->K(Ll/x3h0;)Lcom/p1/mobile/putong/live/livingroom/increment/supergod/view/SuperGodEffectContainer;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/supergod/view/SuperGodEffectContainer;->j()V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/x3h0$a;->a:Ll/x3h0;

    .line 18
    .line 19
    invoke-static {v0}, Ll/x3h0;->L(Ll/x3h0;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Ll/i4h0;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/i4h0;->b()Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/supergod/view/SuperGodEffectContainer;

    .line 37
    .line 38
    invoke-static {v0, p1}, Ll/x3h0;->M(Ll/x3h0;Lcom/p1/mobile/putong/live/livingroom/increment/supergod/view/SuperGodEffectContainer;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/x3h0$a;->a:Ll/x3h0;

    .line 42
    .line 43
    invoke-static {p0}, Ll/x3h0;->K(Ll/x3h0;)Lcom/p1/mobile/putong/live/livingroom/increment/supergod/view/SuperGodEffectContainer;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    if-eqz p0, :cond_1

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/supergod/view/SuperGodEffectContainer;->k()V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method
