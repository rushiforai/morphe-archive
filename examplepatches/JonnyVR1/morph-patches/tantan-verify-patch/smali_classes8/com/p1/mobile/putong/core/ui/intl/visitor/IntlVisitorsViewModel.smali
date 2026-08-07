.class public final Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$t;",
        "Ll/iam<",
        "Ll/eqp;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00c0\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u00012\u00020\u0003B\u000f\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0017\u0010\r\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\u000bH\u0002\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u000f\u0010\nJ\u000f\u0010\u0010\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u0010\u0010\nJ\u0017\u0010\u0013\u001a\u00020\u00082\u0006\u0010\u0012\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u001f\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u0016\u001a\u00020\u00152\u0008\u0010\u0018\u001a\u0004\u0018\u00010\u0017\u00a2\u0006\u0004\u0008\u001a\u0010\u001bJ\r\u0010\u001c\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u001c\u0010\nJ\r\u0010\u001d\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u001d\u0010\nJ\r\u0010\u001e\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u001e\u0010\nJ\r\u0010\u001f\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u001f\u0010\nJ\u0017\u0010!\u001a\u00020\u00082\u0006\u0010 \u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008!\u0010\"J!\u0010#\u001a\u00020\u00192\u0006\u0010\u0016\u001a\u00020\u00152\u0008\u0010\u0018\u001a\u0004\u0018\u00010\u0017H\u0016\u00a2\u0006\u0004\u0008#\u0010\u001bJ\u000f\u0010\u0005\u001a\u00020$H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010%J\u000f\u0010&\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008&\u0010\nJ\u000f\u0010(\u001a\u00020\'H\u0016\u00a2\u0006\u0004\u0008(\u0010)J%\u0010.\u001a\u00020\u00082\u000e\u0010,\u001a\n\u0012\u0004\u0012\u00020+\u0018\u00010*2\u0006\u0010-\u001a\u00020\u0011\u00a2\u0006\u0004\u0008.\u0010/J\u0015\u00100\u001a\u00020\u00082\u0006\u0010-\u001a\u00020\u0011\u00a2\u0006\u0004\u00080\u0010\u0014J\u001f\u00104\u001a\u00020\u00082\u0006\u00102\u001a\u0002012\u0006\u00103\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u00084\u00105J\'\u00107\u001a\u00020\u00082\u0006\u00102\u001a\u0002012\u0006\u00106\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u00087\u00108R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u00089\u0010:R\"\u0010B\u001a\u00020;8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008<\u0010=\u001a\u0004\u0008>\u0010?\"\u0004\u0008@\u0010AR\"\u0010J\u001a\u00020C8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008D\u0010E\u001a\u0004\u0008F\u0010G\"\u0004\u0008H\u0010IR\"\u0010R\u001a\u00020K8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008L\u0010M\u001a\u0004\u0008N\u0010O\"\u0004\u0008P\u0010QR\"\u0010Z\u001a\u00020S8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008T\u0010U\u001a\u0004\u0008V\u0010W\"\u0004\u0008X\u0010YR\"\u0010b\u001a\u00020[8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\\\u0010]\u001a\u0004\u0008^\u0010_\"\u0004\u0008`\u0010aR\"\u0010f\u001a\u00020K8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008c\u0010M\u001a\u0004\u0008d\u0010O\"\u0004\u0008e\u0010QR\"\u0010n\u001a\u00020g8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008h\u0010i\u001a\u0004\u0008j\u0010k\"\u0004\u0008l\u0010mR\"\u0010u\u001a\u00020o8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u001a\u0010p\u001a\u0004\u0008q\u0010r\"\u0004\u0008s\u0010tR\"\u0010y\u001a\u00020C8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008v\u0010E\u001a\u0004\u0008w\u0010G\"\u0004\u0008x\u0010IR$\u0010\u0081\u0001\u001a\u00020z8\u0006@\u0006X\u0086.\u00a2\u0006\u0013\n\u0004\u0008{\u0010|\u001a\u0004\u0008}\u0010~\"\u0005\u0008\u007f\u0010\u0080\u0001R\u001c\u0010\u0085\u0001\u001a\u0005\u0018\u00010\u0082\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u0083\u0001\u0010\u0084\u0001R\u0017\u0010 \u001a\u00020\u00028\u0002@\u0002X\u0082.\u00a2\u0006\u0007\n\u0005\u0008\u001e\u0010\u0086\u0001R\u0018\u0010\u0088\u0001\u001a\u00020\u00118\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u0008\u001d\u0010\u0087\u0001R\u0019\u0010\u008a\u0001\u001a\u00020\u00118\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u0089\u0001\u0010\u0087\u0001R\u0017\u0010\u008b\u0001\u001a\u00020\u000b8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008!\u0010\u0013R\u001b\u0010\u008e\u0001\u001a\u0005\u0018\u00010\u008c\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u0008\r\u0010\u008d\u0001R\u001b\u0010\u0091\u0001\u001a\u0005\u0018\u00010\u008f\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u0008\u001c\u0010\u0090\u0001\u00a8\u0006\u0092\u0001"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;",
        "Ll/iam;",
        "Ll/eqp;",
        "Landroidx/recyclerview/widget/RecyclerView$t;",
        "Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsAct;",
        "act",
        "<init>",
        "(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsAct;)V",
        "",
        "F",
        "()V",
        "",
        "dy",
        "q",
        "(I)V",
        "C",
        "J",
        "",
        "show",
        "I",
        "(Z)V",
        "Landroid/view/LayoutInflater;",
        "inflater",
        "Landroid/view/ViewGroup;",
        "parent",
        "Landroid/view/View;",
        "i",
        "(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;",
        "r",
        "n",
        "m",
        "G",
        "presenter",
        "p",
        "(Ll/eqp;)V",
        "inflateView",
        "Lcom/p1/mobile/android/app/Act;",
        "()Lcom/p1/mobile/android/app/Act;",
        "destroy",
        "Landroid/content/Context;",
        "C0",
        "()Landroid/content/Context;",
        "",
        "Lcom/p1/mobile/putong/core/data/IntlVisitor;",
        "visitorItems",
        "hasPrivilege",
        "H",
        "(Ljava/util/List;Z)V",
        "E",
        "Landroidx/recyclerview/widget/RecyclerView;",
        "recyclerView",
        "newState",
        "onScrollStateChanged",
        "(Landroidx/recyclerview/widget/RecyclerView;I)V",
        "dx",
        "onScrolled",
        "(Landroidx/recyclerview/widget/RecyclerView;II)V",
        "a",
        "Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsAct;",
        "Lv/navigationbar/VNavigationBar;",
        "b",
        "Lv/navigationbar/VNavigationBar;",
        "y",
        "()Lv/navigationbar/VNavigationBar;",
        "set_navigation_bar",
        "(Lv/navigationbar/VNavigationBar;)V",
        "_navigation_bar",
        "Landroid/widget/FrameLayout;",
        "c",
        "Landroid/widget/FrameLayout;",
        "x",
        "()Landroid/widget/FrameLayout;",
        "set_intl_visitors_discount_banner_container",
        "(Landroid/widget/FrameLayout;)V",
        "_intl_visitors_discount_banner_container",
        "Lv/VLinear;",
        "d",
        "Lv/VLinear;",
        "B",
        "()Lv/VLinear;",
        "set_visitors_ll",
        "(Lv/VLinear;)V",
        "_visitors_ll",
        "Lv/VPullDownRefreshLayout;",
        "e",
        "Lv/VPullDownRefreshLayout;",
        "z",
        "()Lv/VPullDownRefreshLayout;",
        "set_swipe_refresh",
        "(Lv/VPullDownRefreshLayout;)V",
        "_swipe_refresh",
        "Lv/VPullUpRecyclerView;",
        "f",
        "Lv/VPullUpRecyclerView;",
        "A",
        "()Lv/VPullUpRecyclerView;",
        "set_visitors",
        "(Lv/VPullUpRecyclerView;)V",
        "_visitors",
        "g",
        "w",
        "set_empty",
        "_empty",
        "Landroid/widget/ImageView;",
        "h",
        "Landroid/widget/ImageView;",
        "get_empty_empty_img",
        "()Landroid/widget/ImageView;",
        "set_empty_empty_img",
        "(Landroid/widget/ImageView;)V",
        "_empty_empty_img",
        "Lv/VText;",
        "Lv/VText;",
        "get_empty_empty_tv",
        "()Lv/VText;",
        "set_empty_empty_tv",
        "(Lv/VText;)V",
        "_empty_empty_tv",
        "j",
        "u",
        "set_bottom_bg",
        "_bottom_bg",
        "Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundTextView;",
        "k",
        "Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundTextView;",
        "v",
        "()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundTextView;",
        "set_bottom_bg_get_privilege",
        "(Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundTextView;)V",
        "_bottom_bg_get_privilege",
        "Ll/uop;",
        "l",
        "Ll/uop;",
        "adapter",
        "Ll/eqp;",
        "Z",
        "isDragging",
        "o",
        "isShowed",
        "scrollY",
        "Ll/yop;",
        "Ll/yop;",
        "intlVisitorsAffiliateDiscountBannerHost",
        "Ll/kcg0;",
        "Ll/kcg0;",
        "loadSub",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsAct;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:Lv/navigationbar/VNavigationBar;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lv/VLinear;

.field public e:Lv/VPullDownRefreshLayout;

.field public f:Lv/VPullUpRecyclerView;

.field public g:Lv/VLinear;

.field public h:Landroid/widget/ImageView;

.field public i:Lv/VText;

.field public j:Landroid/widget/FrameLayout;

.field public k:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundTextView;

.field public l:Ll/uop;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public m:Ll/eqp;

.field public n:Z

.field public o:Z

.field public p:I

.field public q:Ll/yop;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public r:Ll/kcg0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsAct;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsAct;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->a:Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsAct;

    .line 8
    .line 9
    return-void
.end method

.method private final C()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->r:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->a:Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsAct;

    .line 17
    .line 18
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->fh(Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    new-instance v1, Ll/jqp;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/jqp;-><init>(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;)V

    .line 27
    .line 28
    .line 29
    new-instance v2, Ll/kqp;

    .line 30
    .line 31
    invoke-direct {v2}, Ll/kqp;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    goto :goto_0

    .line 43
    :cond_1
    const/4 v0, 0x0

    .line 44
    :goto_0
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->r:Ll/kcg0;

    .line 45
    .line 46
    return-void
.end method

.method private final F()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->q:Ll/yop;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/yop;->j()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private final J()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->w()Lv/VLinear;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->B()Lv/VLinear;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/16 v1, 0x8

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->F()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;)Lkotlin/Unit;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->a:Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsAct;

    .line 2
    .line 3
    new-instance v1, Ll/iqp;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/iqp;-><init>(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 12
    .line 13
    return-object p0
.end method

.method public static c(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;Landroid/view/View;)V
    .locals 6

    .line 1
    sget-object v0, Ll/rop;->INSTANCE:Ll/rop;

    .line 2
    .line 3
    const-string p1, "e_intl_visitors_list_unlock_btn"

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/rop;->i(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->a:Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsAct;

    .line 9
    .line 10
    const/4 v4, 0x4

    .line 11
    const/4 v5, 0x0

    .line 12
    const-string v2, "p_intl_visitors_list,e_intl_visitors_list_unlock_btn,check"

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-static/range {v0 .. v5}, Ll/rop;->p(Ll/rop;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lkotlin/jvm/functions/Function0;ILjava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->s(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;)V

    return-void
.end method

.method public static e(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->A()Lv/VPullUpRecyclerView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static f(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlVisitor;->new_()Lcom/p1/mobile/putong/core/data/IntlVisitor;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "fake_visitor_list_admob_id"

    .line 12
    .line 13
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/IntlVisitor;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->l:Ll/uop;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0, v0, p1}, Ll/uop;->F(Lcom/p1/mobile/putong/core/data/IntlVisitor;Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static final synthetic j(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->q(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic k(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic l(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method public static final s(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->A()Lv/VPullUpRecyclerView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 7
    .line 8
    .line 9
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->o:Z

    .line 10
    .line 11
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->n:Z

    .line 12
    .line 13
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->p:I

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final A()Lv/VPullUpRecyclerView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->f:Lv/VPullUpRecyclerView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_visitors"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final B()Lv/VLinear;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->d:Lv/VLinear;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_visitors_ll"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->a:Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final E(Z)V
    .locals 1

    .line 1
    xor-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->I(Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->l:Ll/uop;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/uop;->K(Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final G()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->A()Lv/VPullUpRecyclerView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->removeOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->n:Z

    .line 12
    .line 13
    return-void
.end method

.method public final H(Ljava/util/List;Z)V
    .locals 1
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/core/data/IntlVisitor;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    xor-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->I(Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-nez p2, :cond_0

    .line 19
    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->J()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    if-eqz p1, :cond_2

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->w()Lv/VLinear;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    const/16 v0, 0x8

    .line 31
    .line 32
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->B()Lv/VLinear;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    const/4 v0, 0x0

    .line 40
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->l:Ll/uop;

    .line 44
    .line 45
    if-eqz p2, :cond_1

    .line 46
    .line 47
    invoke-virtual {p2, p1}, Ll/uop;->L(Ljava/util/List;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    check-cast p1, Ljava/util/Collection;

    .line 51
    .line 52
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-nez p1, :cond_2

    .line 57
    .line 58
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->C()V

    .line 59
    .line 60
    .line 61
    :cond_2
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->F()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final I(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object v0, Ll/rop;->INSTANCE:Ll/rop;

    .line 4
    .line 5
    const-string v1, "e_intl_visitors_list_unlock_btn"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/rop;->j(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->p0:Ll/z99;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/z99;->l3()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->v()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundTextView;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget v1, Ll/gbc0;->O:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->v()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundTextView;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "#F9E7FF"

    .line 34
    .line 35
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->p0:Ll/z99;

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/z99;->i3()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->v()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundTextView;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    sget v1, Ll/gbc0;->Q:I

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->v()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundTextView;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const-string v1, "#000000"

    .line 67
    .line 68
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->v()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundTextView;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    sget v1, Ll/gbc0;->P:I

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->v()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundTextView;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    const-string v1, "#FFFFFF"

    .line 90
    .line 91
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 96
    .line 97
    .line 98
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->v()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundTextView;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->u()Landroid/widget/FrameLayout;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->a:Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->q:Ll/yop;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/yop;->g()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->q:Ll/yop;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->r:Ll/kcg0;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 16
    .line 17
    .line 18
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->l:Ll/uop;

    .line 19
    .line 20
    if-eqz p0, :cond_2

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/uop;->H()V

    .line 23
    .line 24
    .line 25
    :cond_2
    return-void
.end method

.method public final i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p0, p1, p2}, Ll/lqp;->b(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/eqp;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->p(Ll/eqp;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->y()Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->a:Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsAct;

    .line 13
    .line 14
    invoke-virtual {p2, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->a:Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsAct;

    .line 18
    .line 19
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    sget v0, Ll/c9c0;->c2:I

    .line 24
    .line 25
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->v()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundTextView;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    new-instance v0, Ll/fqp;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/fqp;-><init>(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;)V

    .line 39
    .line 40
    .line 41
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    return-object p1
.end method

.method public final m()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->A()Lv/VPullUpRecyclerView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final n()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->q:Ll/yop;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/yop;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->a:Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsAct;

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->m:Ll/eqp;

    .line 11
    .line 12
    if-nez v2, :cond_1

    .line 13
    .line 14
    const-string v2, "presenter"

    .line 15
    .line 16
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    :cond_1
    invoke-direct {v0, v1, v2}, Ll/yop;-><init>(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsAct;Ll/eqp;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->q:Ll/yop;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->x()Landroid/widget/FrameLayout;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Ll/yop;->e(Landroid/widget/FrameLayout;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 2
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    const/4 v0, 0x1

    .line 9
    if-eq p2, v0, :cond_1

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    if-ne p2, v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v0, p1

    .line 16
    :cond_1
    :goto_0
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->n:Z

    .line 17
    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->p:I

    .line 19
    .line 20
    return-void
.end method

.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p(Ll/eqp;)V
    .locals 0
    .param p1    # Ll/eqp;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->m:Ll/eqp;

    .line 5
    .line 6
    return-void
.end method

.method public final q(I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->p:I

    .line 2
    .line 3
    add-int/2addr v0, p1

    .line 4
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->p:I

    .line 5
    .line 6
    sget p1, Ll/qa00;->Q:I

    .line 7
    .line 8
    if-le v0, p1, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->o:Z

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->a:Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsAct;

    .line 14
    .line 15
    new-instance v0, Ll/gqp;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/gqp;-><init>(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1, v0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    sget-object p1, Ll/rop;->INSTANCE:Ll/rop;

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->a:Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsAct;

    .line 26
    .line 27
    new-instance v1, Ll/hqp;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/hqp;-><init>(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;)V

    .line 30
    .line 31
    .line 32
    const-string p0, "p_intl_visitors_list,swipe"

    .line 33
    .line 34
    invoke-virtual {p1, v0, p0, v1}, Ll/rop;->o(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public final r()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->y()Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->a:Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsAct;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->y()Lv/navigationbar/VNavigationBar;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget v1, Lcom/p1/mobile/putong/core/R$string;->ac:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(I)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Ll/uop;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->a:Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsAct;

    .line 22
    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->m:Ll/eqp;

    .line 24
    .line 25
    if-nez v2, :cond_0

    .line 26
    .line 27
    const-string v2, "presenter"

    .line 28
    .line 29
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    :cond_0
    invoke-direct {v0, v1, v2}, Ll/uop;-><init>(Lcom/p1/mobile/android/app/Act;Ll/eqp;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->l:Ll/uop;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->z()Lv/VPullDownRefreshLayout;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->I(Z)Ll/mvc0;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->A()Lv/VPullUpRecyclerView;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->C0()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    new-instance v2, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel$initView$1;

    .line 55
    .line 56
    invoke-direct {v2, p0, v1}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel$initView$1;-><init>(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;Landroid/content/Context;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->A()Lv/VPullUpRecyclerView;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->l:Ll/uop;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->n()V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final u()Landroid/widget/FrameLayout;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->j:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_bottom_bg"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final v()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundTextView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->k:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundTextView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_bottom_bg_get_privilege"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final w()Lv/VLinear;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->g:Lv/VLinear;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_empty"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final x()Landroid/widget/FrameLayout;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->c:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_intl_visitors_discount_banner_container"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final y()Lv/navigationbar/VNavigationBar;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->b:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_navigation_bar"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final z()Lv/VPullDownRefreshLayout;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->e:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_swipe_refresh"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method
