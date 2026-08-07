.class public Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Ll/yql;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/LinearLayout;",
        "Ll/iam<",
        "Ll/yh2;",
        ">;",
        "Ll/yql;"
    }
.end annotation


# static fields
.field public static final m:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lcom/p1/mobile/putong/live/base/view/LiveFadeRecyclerView;

.field public d:Lv/VText;

.field public e:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;

.field public f:Ll/gt4;

.field public g:Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;

.field public h:Ll/yh2;

.field public i:Z

.field public j:Z

.field public k:Z

.field public l:Ll/p9s;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-direct {v0, v1, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->m:Ll/pf60;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->j:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->k:Z

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->j:Z

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->k:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->j:Z

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->k:Z

    return-void
.end method

.method private synthetic A(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->d:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->g:Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->F()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->A(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(JLjava/util/Map;)V
    .locals 1

    .line 1
    const-string v0, "watch_duration"

    .line 2
    .line 3
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p2, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/live/base/data/BLiveTemplateMenu;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateMenu;->title:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->G(Z)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->z()V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/d3q;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    instance-of v0, p1, Ll/dh2;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/dh2;

    .line 6
    .line 7
    iget-object p1, p1, Ll/dh2;->a:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 23
    .line 24
    return-object p0
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;Ljava/util/List;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->B(Ljava/util/List;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Ll/d3q;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->C(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Ll/d3q;)V

    return-void
.end method

.method private synthetic z()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->h:Ll/yh2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/yh2;->M4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final synthetic B(Ljava/util/List;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-interface {p1, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateMenu;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateMenu;->h5:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic C(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Ll/d3q;)V
    .locals 3

    .line 1
    instance-of v0, p2, Ll/ban0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Ll/ban0;

    .line 7
    .line 8
    iget-object v1, v0, Ll/dh2;->a:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->liveUserInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userId:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    iget-object v0, v0, Ll/dh2;->a:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->liveUserInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 25
    .line 26
    iput-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->f:Ll/gt4;

    .line 29
    .line 30
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->O(Ll/d3q;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    instance-of v0, p2, Ll/can0;

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    move-object v0, p2

    .line 39
    check-cast v0, Ll/can0;

    .line 40
    .line 41
    iget-object v1, v0, Ll/dh2;->a:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->liveUserInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userId:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    iget-object v0, v0, Ll/dh2;->a:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->liveUserInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 58
    .line 59
    iput-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->f:Ll/gt4;

    .line 62
    .line 63
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->O(Ll/d3q;)V

    .line 64
    .line 65
    .line 66
    :cond_1
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->h:Ll/yh2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public E()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->f:Ll/gt4;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public F(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->spanList:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x2

    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->spanList:Ljava/util/List;

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Landroid/text/SpannableStringBuilder;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget-object v0, Ll/e810;->c:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    sget-object v0, Ll/e810;->c:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    sget-object v0, Ll/e810;->c:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr v0, p1

    .line 44
    invoke-virtual {p0, p1, v0}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public final G(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->d:Lv/VText;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public H()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->c:Lcom/p1/mobile/putong/live/base/view/LiveFadeRecyclerView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public I()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->d:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public J()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->g:Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->F()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final K(Ljava/util/List;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->g:Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;

    .line 9
    .line 10
    if-eqz p2, :cond_1

    .line 11
    .line 12
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->p(I)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->h()Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-eqz p2, :cond_2

    .line 25
    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->g:Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;

    .line 27
    .line 28
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->w()Z

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    if-eqz p2, :cond_2

    .line 33
    .line 34
    const/4 p2, 0x1

    .line 35
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->G(Z)V

    .line 36
    .line 37
    .line 38
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->f:Ll/gt4;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ll/gt4;->g0(Ljava/util/List;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public L(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->d:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public M(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->f:Ll/gt4;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/jy4;

    .line 8
    .line 9
    invoke-direct {v1, p1}, Ll/jy4;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Ll/d3q;

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->f:Ll/gt4;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->O(Ll/d3q;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public N(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->f:Ll/gt4;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/my4;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Ll/my4;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->h:Ll/yh2;

    .line 2
    .line 3
    const/16 v0, 0x64

    .line 4
    .line 5
    invoke-static {v0}, Ll/px50;->c(I)Ll/px50$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p1}, Ll/px50$a;->B(Ljava/lang/String;)Ll/px50$a;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Ll/px50$a;->q()Ll/px50;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Ll/yh2;->P4(Ll/px50;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/live/livingroom/common/chat/IChatItemLongClickArea;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->h:Ll/yh2;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/yh2;->H4(Lcom/p1/mobile/putong/live/livingroom/common/chat/IChatItemLongClickArea;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->k:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->k:Z

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->h:Ll/yh2;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->h:Ll/yh2;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string v1, "liveMessage_notification"

    .line 21
    .line 22
    invoke-static {v0, p0, v1}, Ll/i35;->d(Ljava/lang/String;Ll/oo2;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->h:Ll/yh2;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->scheme:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/yh2;->r4(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    :goto_0
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;J)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->h:Ll/yh2;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->j:Z

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3, p0}, Ll/yh2;->Q4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;JZ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplateMenu;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/ky4;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/ky4;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->e0(Ljava/util/List;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 23
    .line 24
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->z:I

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->m0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/ly4;

    .line 35
    .line 36
    invoke-direct {v1, p0, p1}, Ll/ly4;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;Ljava/util/List;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public getAdapter()Ll/gt4;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->f:Ll/gt4;

    .line 2
    .line 3
    return-object p0
.end method

.method public getChatRecyclerViewVisiblePosition()Ll/pf60;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->g:Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->t()Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->m:Ll/pf60;

    .line 11
    .line 12
    return-object p0
.end method

.method public getChatScene()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->h:Ll/yh2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/yh2;->p4()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getLiveDragonListViewHelper()Ll/p9s;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->l:Ll/p9s;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/p9s;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->h:Ll/yh2;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->getAdapter()Ll/gt4;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-direct {v0, v1, v2}, Ll/p9s;-><init>(Ll/yh2;Ll/gt4;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->l:Ll/p9s;

    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->l:Ll/p9s;

    .line 19
    .line 20
    return-object p0
.end method

.method public getLiveMode()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->h:Ll/yh2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0
.end method

.method public i(Ll/p9t;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/p9t;->g()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "follow"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->h:Ll/yh2;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/yh2;->m4()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {v1}, Ll/xzs;->R2()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->h:Ll/yh2;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/xzs;->E2()Ll/oo2;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v0, v1, p1}, Ll/i35;->g(Ljava/lang/String;Ll/oo2;Ll/p9t;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->h:Ll/yh2;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    new-instance v0, Ll/bae0$a;

    .line 45
    .line 46
    const/16 v1, 0x64

    .line 47
    .line 48
    invoke-direct {v0, v1}, Ll/bae0$a;-><init>(I)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1}, Ll/p9t;->d()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->getSchema()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {v0, p1}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1}, Ll/bae0$a;->c()Ll/bae0;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/yh2;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->x(Ll/yh2;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public j()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->h:Ll/yh2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceVirtualLiveEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;->showVirtualMaskDialog()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public k(Ll/a5s;Landroid/view/View;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->h:Ll/yh2;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/yh2;->K4(Ll/a5s;Landroid/view/View;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->w(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public r()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->j:Z

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->k:Z

    .line 6
    .line 7
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->h:Ll/yh2;

    .line 11
    .line 12
    invoke-virtual {v1}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Ll/vp20;->p()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->i:Z

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->h:Ll/yh2;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/yh2;->t4()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    new-instance v1, Ll/m5n0;

    .line 31
    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->h:Ll/yh2;

    .line 33
    .line 34
    invoke-direct {v1, p0, v2}, Ll/m5n0;-><init>(Ll/yql;Ll/yh2;)V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->f:Ll/gt4;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    new-instance v1, Ll/gt4;

    .line 41
    .line 42
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-direct {v1, p0, v2}, Ll/gt4;-><init>(Ll/yql;Lcom/p1/mobile/android/app/Act;)V

    .line 47
    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->f:Ll/gt4;

    .line 50
    .line 51
    :goto_0
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;

    .line 52
    .line 53
    new-instance v2, Ll/gy4;

    .line 54
    .line 55
    invoke-direct {v2, p0}, Ll/gy4;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;)V

    .line 56
    .line 57
    .line 58
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->f:Ll/gt4;

    .line 59
    .line 60
    invoke-direct {v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;-><init>(Ll/y20;Ll/gt4;)V

    .line 61
    .line 62
    .line 63
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->g:Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;

    .line 64
    .line 65
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->c:Lcom/p1/mobile/putong/live/base/view/LiveFadeRecyclerView;

    .line 66
    .line 67
    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->c:Lcom/p1/mobile/putong/live/base/view/LiveFadeRecyclerView;

    .line 71
    .line 72
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->f:Ll/gt4;

    .line 73
    .line 74
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 75
    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->c:Lcom/p1/mobile/putong/live/base/view/LiveFadeRecyclerView;

    .line 78
    .line 79
    const/4 v2, 0x0

    .line 80
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$l;)V

    .line 81
    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->c:Lcom/p1/mobile/putong/live/base/view/LiveFadeRecyclerView;

    .line 84
    .line 85
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/view/LiveFadeRecyclerView;->G()V

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->c:Lcom/p1/mobile/putong/live/base/view/LiveFadeRecyclerView;

    .line 89
    .line 90
    const/4 v2, 0x2

    .line 91
    invoke-virtual {v1, v2}, Landroid/view/View;->setOverScrollMode(I)V

    .line 92
    .line 93
    .line 94
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->c:Lcom/p1/mobile/putong/live/base/view/LiveFadeRecyclerView;

    .line 95
    .line 96
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->h:Ll/yh2;

    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->c:Lcom/p1/mobile/putong/live/base/view/LiveFadeRecyclerView;

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Ll/yh2;->O4(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->g:Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;

    .line 107
    .line 108
    new-instance v1, Ll/hy4;

    .line 109
    .line 110
    invoke-direct {v1, p0}, Ll/hy4;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->A(Ll/x20;)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->d:Lv/VText;

    .line 117
    .line 118
    new-instance v1, Ll/iy4;

    .line 119
    .line 120
    invoke-direct {v1, p0}, Ll/iy4;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public final setNewData(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-wide v2, Ll/uhd0;->l:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->h:Ll/yh2;

    .line 9
    .line 10
    new-instance v3, Ll/fy4;

    .line 11
    .line 12
    invoke-direct {v3, v0, v1}, Ll/fy4;-><init>(J)V

    .line 13
    .line 14
    .line 15
    const-string v0, "audience_message_list_loaded"

    .line 16
    .line 17
    invoke-static {v2, v0, v3}, Ll/fgt;->c(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->K(Ljava/util/List;Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final w(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ny4;->a(Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public x(Ll/yh2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->h:Ll/yh2;

    .line 2
    .line 3
    return-void
.end method

.method public y()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->j:Z

    .line 3
    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->g:Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->B()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->c:Lcom/p1/mobile/putong/live/base/view/LiveFadeRecyclerView;

    .line 15
    .line 16
    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-direct {v2, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->c:Lcom/p1/mobile/putong/live/base/view/LiveFadeRecyclerView;

    .line 29
    .line 30
    new-instance v2, Ll/gt4;

    .line 31
    .line 32
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->h:Ll/yh2;

    .line 33
    .line 34
    invoke-virtual {v3}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-direct {v2, p0, v3}, Ll/gt4;-><init>(Ll/yql;Lcom/p1/mobile/android/app/Act;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->L(Z)V

    .line 45
    .line 46
    .line 47
    return-void
.end method
