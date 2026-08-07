.class public final Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/b090;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00ac\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u000b\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\r\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000f\u0010\n\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\n\u0010\tJ\u000f\u0010\u000b\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\u000b\u0010\tJ\u001f\u0010\u0011\u001a\u00020\u00102\u0006\u0010\r\u001a\u00020\u000c2\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u000e\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u0017\u0010\u0014\u001a\u00020\u00072\u0006\u0010\u0013\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J!\u0010\u0016\u001a\u00020\u00102\u0006\u0010\r\u001a\u00020\u000c2\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u0016\u00a2\u0006\u0004\u0008\u0016\u0010\u0012J\u000f\u0010\u0017\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0017\u0010\tJ\u0011\u0010\u0019\u001a\u0004\u0018\u00010\u0018H\u0016\u00a2\u0006\u0004\u0008\u0019\u0010\u001aJ\u0015\u0010\u001d\u001a\u00020\u00072\u0006\u0010\u001c\u001a\u00020\u001b\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ\r\u0010\u001f\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u001f\u0010\tJ\u001d\u0010\"\u001a\u00020\u00072\u0006\u0010 \u001a\u00020\u001b2\u0006\u0010!\u001a\u00020\u001b\u00a2\u0006\u0004\u0008\"\u0010#J\r\u0010$\u001a\u00020\u0007\u00a2\u0006\u0004\u0008$\u0010\tJ\r\u0010%\u001a\u00020\u0007\u00a2\u0006\u0004\u0008%\u0010\tJ\r\u0010&\u001a\u00020\u0007\u00a2\u0006\u0004\u0008&\u0010\tJ#\u0010+\u001a\u00020\u00072\u000c\u0010)\u001a\u0008\u0012\u0004\u0012\u00020(0\'2\u0006\u0010*\u001a\u00020\u001b\u00a2\u0006\u0004\u0008+\u0010,J\r\u0010-\u001a\u00020\u001b\u00a2\u0006\u0004\u0008-\u0010.R\u0017\u0010\u0004\u001a\u00020\u00038\u0006\u00a2\u0006\u000c\n\u0004\u0008/\u00100\u001a\u0004\u00081\u00102R\"\u0010:\u001a\u0002038\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u00084\u00105\u001a\u0004\u00086\u00107\"\u0004\u00088\u00109R\"\u0010B\u001a\u00020;8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008<\u0010=\u001a\u0004\u0008>\u0010?\"\u0004\u0008@\u0010AR\"\u0010J\u001a\u00020C8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008D\u0010E\u001a\u0004\u0008F\u0010G\"\u0004\u0008H\u0010IR\"\u0010R\u001a\u00020K8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008L\u0010M\u001a\u0004\u0008N\u0010O\"\u0004\u0008P\u0010QR\"\u0010Z\u001a\u00020S8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008T\u0010U\u001a\u0004\u0008V\u0010W\"\u0004\u0008X\u0010YR\"\u0010b\u001a\u00020[8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\\\u0010]\u001a\u0004\u0008^\u0010_\"\u0004\u0008`\u0010aR\"\u0010j\u001a\u00020c8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008d\u0010e\u001a\u0004\u0008f\u0010g\"\u0004\u0008h\u0010iR\"\u0010r\u001a\u00020k8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008l\u0010m\u001a\u0004\u0008n\u0010o\"\u0004\u0008p\u0010qR\"\u0010y\u001a\u00020s8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u0011\u0010t\u001a\u0004\u0008u\u0010v\"\u0004\u0008w\u0010xR#\u0010\u0080\u0001\u001a\u00020z8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u0014\u0010{\u001a\u0004\u0008|\u0010}\"\u0004\u0008~\u0010\u007fR\u001d\u0010\u0086\u0001\u001a\u00030\u0081\u00018\u0006\u00a2\u0006\u0010\n\u0006\u0008\u0082\u0001\u0010\u0083\u0001\u001a\u0006\u0008\u0084\u0001\u0010\u0085\u0001R\'\u0010\u008b\u0001\u001a\u00020\u00028\u0006@\u0006X\u0086.\u00a2\u0006\u0016\n\u0005\u00081\u0010\u0087\u0001\u001a\u0006\u0008\u0088\u0001\u0010\u0089\u0001\"\u0005\u0008\u008a\u0001\u0010\u0015R\'\u0010\u008e\u0001\u001a\u00020\u001b8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0016\n\u0006\u0008\u0088\u0001\u0010\u008c\u0001\u001a\u0005\u0008\u0082\u0001\u0010.\"\u0005\u0008\u008d\u0001\u0010\u001eR,\u0010\u0096\u0001\u001a\u0005\u0018\u00010\u008f\u00018\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0018\n\u0006\u0008\u0090\u0001\u0010\u0091\u0001\u001a\u0006\u0008\u0092\u0001\u0010\u0093\u0001\"\u0006\u0008\u0094\u0001\u0010\u0095\u0001\u00a8\u0006\u0097\u0001"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;",
        "Ll/iam;",
        "Ll/b090;",
        "Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;",
        "frag",
        "<init>",
        "(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;)V",
        "",
        "r",
        "()V",
        "z",
        "A",
        "Landroid/view/LayoutInflater;",
        "inflater",
        "Landroid/view/ViewGroup;",
        "parent",
        "Landroid/view/View;",
        "j",
        "(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;",
        "presenter",
        "k",
        "(Ll/b090;)V",
        "inflateView",
        "destroy",
        "Landroid/content/Context;",
        "C0",
        "()Landroid/content/Context;",
        "",
        "show",
        "G",
        "(Z)V",
        "H",
        "hasIdealTypesSelected",
        "hasSupremePartner",
        "F",
        "(ZZ)V",
        "E",
        "J",
        "K",
        "",
        "Ll/yna$a;",
        "users",
        "hasPrivateCustomPrivilege",
        "C",
        "(Ljava/util/List;Z)V",
        "B",
        "()Z",
        "a",
        "Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;",
        "m",
        "()Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;",
        "Lv/VFrame;",
        "b",
        "Lv/VFrame;",
        "v",
        "()Lv/VFrame;",
        "set_loading",
        "(Lv/VFrame;)V",
        "_loading",
        "Lv/VProgressBar;",
        "c",
        "Lv/VProgressBar;",
        "w",
        "()Lv/VProgressBar;",
        "set_loading_progress",
        "(Lv/VProgressBar;)V",
        "_loading_progress",
        "Landroid/widget/RelativeLayout;",
        "d",
        "Landroid/widget/RelativeLayout;",
        "y",
        "()Landroid/widget/RelativeLayout;",
        "set_rl_error_view",
        "(Landroid/widget/RelativeLayout;)V",
        "_rl_error_view",
        "Lv/VImage;",
        "e",
        "Lv/VImage;",
        "get_img_network_error",
        "()Lv/VImage;",
        "set_img_network_error",
        "(Lv/VImage;)V",
        "_img_network_error",
        "Lv/VText;",
        "f",
        "Lv/VText;",
        "get_tv_network_tips",
        "()Lv/VText;",
        "set_tv_network_tips",
        "(Lv/VText;)V",
        "_tv_network_tips",
        "Lv/VButton;",
        "g",
        "Lv/VButton;",
        "x",
        "()Lv/VButton;",
        "set_reload",
        "(Lv/VButton;)V",
        "_reload",
        "Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultCountDownView;",
        "h",
        "Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultCountDownView;",
        "p",
        "()Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultCountDownView;",
        "set_countdown",
        "(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultCountDownView;)V",
        "_countdown",
        "Landroid/widget/FrameLayout;",
        "i",
        "Landroid/widget/FrameLayout;",
        "q",
        "()Landroid/widget/FrameLayout;",
        "set_fl_content_layout",
        "(Landroid/widget/FrameLayout;)V",
        "_fl_content_layout",
        "Lv/VPullUpRecyclerView;",
        "Lv/VPullUpRecyclerView;",
        "u",
        "()Lv/VPullUpRecyclerView;",
        "set_list",
        "(Lv/VPullUpRecyclerView;)V",
        "_list",
        "Landroid/widget/TextView;",
        "Landroid/widget/TextView;",
        "s",
        "()Landroid/widget/TextView;",
        "set_get_privilege",
        "(Landroid/widget/TextView;)V",
        "_get_privilege",
        "Lcom/p1/mobile/android/app/Act;",
        "l",
        "Lcom/p1/mobile/android/app/Act;",
        "getAct",
        "()Lcom/p1/mobile/android/app/Act;",
        "act",
        "Ll/b090;",
        "n",
        "()Ll/b090;",
        "I",
        "privateCustomPresenter",
        "Z",
        "setEnableScroll",
        "enableScroll",
        "Ll/kcg0;",
        "o",
        "Ll/kcg0;",
        "getCountDown",
        "()Ll/kcg0;",
        "setCountDown",
        "(Ll/kcg0;)V",
        "countDown",
        "member_intlGmsRelease"
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
.field public final a:Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:Lv/VFrame;

.field public c:Lv/VProgressBar;

.field public d:Landroid/widget/RelativeLayout;

.field public e:Lv/VImage;

.field public f:Lv/VText;

.field public g:Lv/VButton;

.field public h:Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultCountDownView;

.field public i:Landroid/widget/FrameLayout;

.field public j:Lv/VPullUpRecyclerView;

.field public k:Landroid/widget/TextView;

.field public final l:Lcom/p1/mobile/android/app/Act;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public m:Ll/b090;

.field public n:Z

.field public o:Ll/kcg0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->a:Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->l:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    return-void
.end method

.method private final A()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->u()Lv/VPullUpRecyclerView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->a:Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    new-instance v2, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel$initRecyclerView$1$1;

    .line 12
    .line 13
    invoke-direct {v2, p0, v1}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel$initRecyclerView$1$1;-><init>(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;Lcom/p1/mobile/android/app/Act;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel$a;

    .line 17
    .line 18
    invoke-direct {v1, p0, v2}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel$a;-><init>(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel$initRecyclerView$1$1;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->a:Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;->U4()Lcom/p1/mobile/putong/core/newui/customized/result/a;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->a:Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;->U4()Lcom/p1/mobile/putong/core/newui/customized/result/a;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel$b;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel$b;-><init>(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/customized/result/a;->J(Lcom/p1/mobile/putong/core/newui/customized/result/a$b;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->n()Ll/b090;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/b090;->z0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->a:Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "e_personalized_button"

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->n()Ll/b090;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 p1, 0x0

    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-static {p0, p1, v0, p1}, Ll/b090;->D0(Ll/b090;Ljava/lang/String;ILjava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static c(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static d(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;Ljava/lang/Long;)Lkotlin/Unit;
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x3e8

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-gez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->K()V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->p()Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultCountDownView;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultCountDownView;->b(J)V

    .line 24
    .line 25
    .line 26
    :goto_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 27
    .line 28
    return-object p0
.end method

.method public static e(Ljava/lang/Long;)Ljava/lang/Long;
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    invoke-static {p0, p0, v0}, Ll/pzi0;->s(III)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static f(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->n()Ll/b090;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/b090;->A0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static i(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Long;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Long;

    .line 6
    .line 7
    return-object p0
.end method

.method private final r()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->A()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->z()V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final B()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->b:Lv/VFrame;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final C(Ljava/util/List;Z)V
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Ll/yna$a;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->G(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->s()Landroid/widget/TextView;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    xor-int/lit8 v1, p2, 0x1

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->n:Z

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->a:Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;->U4()Lcom/p1/mobile/putong/core/newui/customized/result/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/customized/result/a;->H(Ljava/util/List;Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->l:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public final E()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->v()Lv/VFrame;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->y()Landroid/widget/RelativeLayout;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->q()Landroid/widget/FrameLayout;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->p()Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultCountDownView;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->J()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final F(ZZ)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->v()Lv/VFrame;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->y()Landroid/widget/RelativeLayout;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->p()Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultCountDownView;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->q()Landroid/widget/FrameLayout;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->a:Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;->U4()Lcom/p1/mobile/putong/core/newui/customized/result/a;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/customized/result/a;->I(Z)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->s()Landroid/widget/TextView;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    xor-int/lit8 p2, p2, 0x1

    .line 46
    .line 47
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->K()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final G(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->p()Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultCountDownView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->y()Landroid/widget/RelativeLayout;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->v()Lv/VFrame;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->w()Lv/VProgressBar;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->q()Landroid/widget/FrameLayout;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->v()Lv/VFrame;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->q()Landroid/widget/FrameLayout;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 54
    .line 55
    .line 56
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->K()V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final H()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->v()Lv/VFrame;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->y()Landroid/widget/RelativeLayout;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->q()Landroid/widget/FrameLayout;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->p()Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultCountDownView;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->K()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final I(Ll/b090;)V
    .locals 0
    .param p1    # Ll/b090;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->m:Ll/b090;

    .line 5
    .line 6
    return-void
.end method

.method public final J()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-static {v0, v0, v1}, Ll/pzi0;->s(III)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->p()Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultCountDownView;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2, v0, v1}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultCountDownView;->b(J)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->o:Ll/kcg0;

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->l:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    const-wide/16 v1, 0x1

    .line 21
    .line 22
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 23
    .line 24
    invoke-static {v1, v2, v3}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/e090;

    .line 37
    .line 38
    invoke-direct {v1}, Ll/e090;-><init>()V

    .line 39
    .line 40
    .line 41
    new-instance v2, Ll/f090;

    .line 42
    .line 43
    invoke-direct {v2, v1}, Ll/f090;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/g090;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/g090;-><init>(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lrx/c;->doOnUnsubscribe(Ll/x20;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/h090;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/h090;-><init>(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;)V

    .line 70
    .line 71
    .line 72
    new-instance v2, Ll/i090;

    .line 73
    .line 74
    invoke-direct {v2, v1}, Ll/i090;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->o:Ll/kcg0;

    .line 82
    .line 83
    :cond_0
    return-void
.end method

.method public final K()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->o:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bsj0;->U(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->o:Ll/kcg0;

    .line 8
    .line 9
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/b090;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->k(Ll/b090;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
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
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->r()V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method

.method public final j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
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
    invoke-static {p0, p1, p2}, Ll/j090;->b(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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

.method public k(Ll/b090;)V
    .locals 0
    .param p1    # Ll/b090;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->I(Ll/b090;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final l()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method public final m()Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->a:Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;

    .line 2
    .line 3
    return-object p0
.end method

.method public final n()Ll/b090;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->m:Ll/b090;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "privateCustomPresenter"

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

.method public final p()Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultCountDownView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->h:Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultCountDownView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_countdown"

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

.method public final q()Landroid/widget/FrameLayout;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->i:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_fl_content_layout"

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

.method public final s()Landroid/widget/TextView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->k:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_get_privilege"

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

.method public final u()Lv/VPullUpRecyclerView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->j:Lv/VPullUpRecyclerView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_list"

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

.method public final v()Lv/VFrame;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->b:Lv/VFrame;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_loading"

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

.method public final w()Lv/VProgressBar;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->c:Lv/VProgressBar;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_loading_progress"

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

.method public final x()Lv/VButton;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->g:Lv/VButton;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_reload"

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

.method public final y()Landroid/widget/RelativeLayout;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->d:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_rl_error_view"

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

.method public final z()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->x()Lv/VButton;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/c090;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/c090;-><init>(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->s()Landroid/widget/TextView;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/d090;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/d090;-><init>(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
