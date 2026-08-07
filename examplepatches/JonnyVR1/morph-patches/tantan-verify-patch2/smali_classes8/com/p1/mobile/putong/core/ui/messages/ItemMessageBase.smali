.class public Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;
.super Lcom/p1/mobile/putong/core/ui/messages/ItemBase;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;
.implements Ll/x6q;
.implements Lcom/p1/mobile/putong/core/ui/messages/a$a;


# static fields
.field public static K:I


# instance fields
.field public A:Ljava/lang/String;

.field public B:Landroid/widget/TextView;

.field public C:Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;

.field public D:Lcom/p1/mobile/putong/core/ui/messages/view/AiTranslateView;

.field public E:Landroid/graphics/drawable/Drawable;

.field public F:Landroid/view/ViewStub;

.field public G:Landroid/widget/PopupWindow;

.field public H:Lv/VCheckBox;

.field public I:Lv/VRelative;

.field public J:Lcom/p1/mobile/putong/core/data/Message;

.field public v:Lcom/p1/mobile/putong/core/ui/messages/a;

.field public w:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

.field public x:Lv/VText;

.field public y:Lv/VText;

.field public z:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 10
    invoke-virtual {p0, p1}, Landroid/view/View;->setWillNotDraw(Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, p1}, Landroid/view/View;->setWillNotDraw(Z)V

    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Lcom/p1/mobile/putong/core/data/Conversation;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->k0(Lcom/p1/mobile/putong/core/data/Conversation;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/clz;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->Z(Ll/clz;)V

    return-void
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->b0(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Z)V

    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->q0(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->m0()V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)Landroid/widget/PopupWindow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->G:Landroid/widget/PopupWindow;

    return-object p0
.end method

.method public static R(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Landroid/view/View;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->R(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static Y(Landroid/content/Context;)Z
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 17
    .line 18
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/api/g;->jg(Ljava/lang/String;Z)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_0
    return v1
.end method

.method private getRecallConfig()Lcom/p1/mobile/putong/core/data/RecallConfig;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "recall_config"

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/data/RecallConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/data/RecallConfig;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    return-object p0

    .line 16
    :catch_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/clz;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->e0(Ll/clz;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->p0(Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/clz;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->n0(Ll/clz;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l([Ll/w30;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    aget-object p0, p0, p1

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;[Ll/w30;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->h0([Ll/w30;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/clz;Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->r0(Ll/clz;Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V

    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->a0(Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->d0()V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->f0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/clz;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->l0(Ll/clz;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->i0()V

    return-void
.end method

.method private setWindowBackground(F)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->alpha:F

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic t(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->g0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/ruy;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->s0(Ll/ruy;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/clz;ZLcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->c0(Ll/clz;ZLcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    return-void
.end method

.method public static synthetic x(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/clz;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->o0(Ll/clz;Landroid/view/View;)V

    return-void
.end method

.method private y0(Ljava/lang/String;)J
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    return-wide v0

    .line 10
    :cond_0
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 11
    .line 12
    .line 13
    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    return-wide p0

    .line 15
    :catch_0
    return-wide v0
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/clz;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->j0(Ll/clz;)V

    return-void
.end method


# virtual methods
.method public final A0(Landroid/view/View;Ljava/util/List;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;Z)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/view/MenuCustomView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1, p3}, Lcom/p1/mobile/putong/core/ui/messages/view/MenuCustomView;-><init>(Landroid/content/Context;Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MenuCustomView;->setData(Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    new-instance p2, Landroid/widget/PopupWindow;

    .line 14
    .line 15
    const/4 v1, -0x2

    .line 16
    invoke-direct {p2, v0, v1, v1}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    .line 17
    .line 18
    .line 19
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->G:Landroid/widget/PopupWindow;

    .line 20
    .line 21
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MenuCustomView;->setPopupWindow(Landroid/widget/PopupWindow;)V

    .line 22
    .line 23
    .line 24
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->G:Landroid/widget/PopupWindow;

    .line 25
    .line 26
    invoke-virtual {p2}, Landroid/widget/PopupWindow;->getWidth()I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->t0(I)I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->G:Landroid/widget/PopupWindow;

    .line 35
    .line 36
    invoke-virtual {v1}, Landroid/widget/PopupWindow;->getHeight()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->t0(I)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {v0, p2, v1}, Landroid/view/View;->measure(II)V

    .line 45
    .line 46
    .line 47
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->G:Landroid/widget/PopupWindow;

    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    invoke-virtual {p2, v1}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 51
    .line 52
    .line 53
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->G:Landroid/widget/PopupWindow;

    .line 54
    .line 55
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    .line 56
    .line 57
    invoke-direct {v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p2, v1}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 61
    .line 62
    .line 63
    const/16 p2, 0xa

    .line 64
    .line 65
    if-eqz p3, :cond_0

    .line 66
    .line 67
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 68
    .line 69
    .line 70
    move-result p3

    .line 71
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    sub-int/2addr p3, v1

    .line 76
    div-int/lit8 p3, p3, 0x2

    .line 77
    .line 78
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    neg-int v0, v0

    .line 83
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    sub-int/2addr v0, v1

    .line 88
    add-int/lit8 p2, v0, -0xa

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 92
    .line 93
    .line 94
    move-result p3

    .line 95
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    sub-int/2addr p3, v0

    .line 100
    div-int/lit8 p3, p3, 0x2

    .line 101
    .line 102
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->G:Landroid/widget/PopupWindow;

    .line 103
    .line 104
    const v1, 0x800003

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, p1, p3, p2, v1}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;III)V

    .line 108
    .line 109
    .line 110
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase$b;

    .line 111
    .line 112
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase$b;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V

    .line 113
    .line 114
    .line 115
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->G:Landroid/widget/PopupWindow;

    .line 116
    .line 117
    new-instance p3, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase$c;

    .line 118
    .line 119
    invoke-direct {p3, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase$c;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/pn50;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p2, p3}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 130
    .line 131
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 132
    .line 133
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    iget-object p0, p0, Ll/qzz;->n1:Ll/iwl;

    .line 138
    .line 139
    invoke-interface {p0, p1}, Ll/iwl;->n(Ll/pn50;)V

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method public final B0()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->getRecallConfig()Lcom/p1/mobile/putong/core/data/RecallConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_2

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/RecallConfig;->enable:Z

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    iget-object p0, p0, Ll/dkb;->S3:Ll/jxd0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-nez p0, :cond_1

    .line 29
    .line 30
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 33
    .line 34
    iget-object p0, p0, Ll/dkb;->S3:Ll/jxd0;

    .line 35
    .line 36
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 44
    .line 45
    iget-object p0, p0, Ll/dkb;->T3:Ll/vxd0;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Ljava/lang/Integer;

    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    const/4 v0, 0x5

    .line 58
    if-ge p0, v0, :cond_2

    .line 59
    .line 60
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 63
    .line 64
    iget-object p0, p0, Ll/dkb;->T3:Ll/vxd0;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Ljava/lang/Integer;

    .line 71
    .line 72
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    add-int/lit8 v0, v0, 0x1

    .line 77
    .line 78
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    const-string p0, "\u4ec5\u652f\u6301\u64a4\u56de2\u5206\u949f\u5185\u53d1\u51fa\u7684\u6d88\u606f"

    .line 86
    .line 87
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :cond_2
    :goto_0
    return-void
.end method

.method public H()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public final I(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ll/r97;->g1()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_5

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->X()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto/16 :goto_0

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Message;->audio()Lcom/p1/mobile/putong/data/Audio;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    goto/16 :goto_0

    .line 30
    .line 31
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ll/clz;->p4(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-nez v1, :cond_5

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isLocal()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ll/clz;->Z3(Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    const/4 v2, 0x0

    .line 67
    if-eqz v1, :cond_3

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 70
    .line 71
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ll/clz;->n4(Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-nez v1, :cond_4

    .line 78
    .line 79
    :cond_3
    invoke-virtual {v0}, Ll/clz;->pageId()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    const/4 v3, 0x0

    .line 84
    new-array v3, v3, [Ll/sfj0$a;

    .line 85
    .line 86
    const-string v4, "e_chat_message_convert_to_text_hold_press_button"

    .line 87
    .line 88
    invoke-static {v4, v1, v3}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->b2:I

    .line 96
    .line 97
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    new-instance v3, Ll/c9q;

    .line 102
    .line 103
    invoke-direct {v3, p0, v0}, Ll/c9q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/clz;)V

    .line 104
    .line 105
    .line 106
    sget v4, Ll/ibc0;->o5:I

    .line 107
    .line 108
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 109
    .line 110
    .line 111
    move-result-object v4

    .line 112
    invoke-static {v1, v3, v4, v2}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 120
    .line 121
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 122
    .line 123
    invoke-virtual {v0, v1}, Ll/clz;->n4(Ljava/lang/String;)Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    if-eqz v1, :cond_5

    .line 128
    .line 129
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->a2:I

    .line 134
    .line 135
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    new-instance v3, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase$a;

    .line 140
    .line 141
    invoke-direct {v3, p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/clz;)V

    .line 142
    .line 143
    .line 144
    sget p0, Ll/ibc0;->n5:I

    .line 145
    .line 146
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-static {v1, v3, p0, v2}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    :cond_5
    :goto_0
    return-void
.end method

.method public final J(Ljava/util/List;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ll/r97;->E()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_4

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->X()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_4

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_4

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 30
    .line 31
    const-string v1, "group"

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_4

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_4

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Message;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v1, "normal"

    .line 54
    .line 55
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_4

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 66
    .line 67
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 68
    .line 69
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 70
    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 72
    .line 73
    invoke-virtual {v3}, Ll/clz;->r3()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/e;->s6(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 78
    .line 79
    .line 80
    move-result-object v7

    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 82
    .line 83
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 84
    .line 85
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 86
    .line 87
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 88
    .line 89
    invoke-virtual {v3}, Ll/clz;->r3()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {v1, v2, v0}, Lcom/p1/mobile/putong/core/api/e;->W8(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 94
    .line 95
    .line 96
    move-result-object v5

    .line 97
    iget-object v1, v5, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 98
    .line 99
    const-string v2, "default"

    .line 100
    .line 101
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-eqz v1, :cond_4

    .line 106
    .line 107
    invoke-virtual {p0, v0, v7, v5}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->S(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_4

    .line 112
    .line 113
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupMemberName()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-nez v0, :cond_0

    .line 122
    .line 123
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupMemberName()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-static {v0}, Ll/jek;->o(Ljava/lang/String;)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    :goto_0
    move-object v6, v0

    .line 132
    goto :goto_1

    .line 133
    :cond_0
    const-string v0, ""

    .line 134
    .line 135
    goto :goto_0

    .line 136
    :goto_1
    iget-object v0, v5, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 137
    .line 138
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->enable:Z

    .line 139
    .line 140
    if-eqz v0, :cond_2

    .line 141
    .line 142
    invoke-static {}, Ll/pzi0;->o()J

    .line 143
    .line 144
    .line 145
    move-result-wide v0

    .line 146
    long-to-double v0, v0

    .line 147
    iget-object v2, v5, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 148
    .line 149
    iget-wide v8, v2, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->until:D

    .line 150
    .line 151
    cmpl-double v0, v0, v8

    .line 152
    .line 153
    if-ltz v0, :cond_1

    .line 154
    .line 155
    goto :goto_3

    .line 156
    :cond_1
    const/4 v0, 0x0

    .line 157
    :goto_2
    move v4, v0

    .line 158
    goto :goto_4

    .line 159
    :cond_2
    :goto_3
    const/4 v0, 0x1

    .line 160
    goto :goto_2

    .line 161
    :goto_4
    if-eqz v4, :cond_3

    .line 162
    .line 163
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 164
    .line 165
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->M:I

    .line 166
    .line 167
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    goto :goto_5

    .line 172
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 173
    .line 174
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->J:I

    .line 175
    .line 176
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    :goto_5
    new-instance v1, Ll/d9q;

    .line 181
    .line 182
    move-object v2, p0

    .line 183
    invoke-direct/range {v1 .. v7}, Ll/d9q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/clz;ZLcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    .line 184
    .line 185
    .line 186
    sget p0, Ll/ibc0;->q1:I

    .line 187
    .line 188
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    const/4 v2, 0x0

    .line 193
    invoke-static {v0, v1, p0, v2}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    :cond_4
    return-void
.end method

.method public final K(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->E()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->X()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 32
    .line 33
    const-string v1, "group"

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Message;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const-string v1, "normal"

    .line 48
    .line 49
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->O2:I

    .line 68
    .line 69
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    new-instance v2, Ll/m8q;

    .line 74
    .line 75
    invoke-direct {v2, p0, v0}, Ll/m8q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/clz;)V

    .line 76
    .line 77
    .line 78
    sget p0, Ll/ibc0;->t1:I

    .line 79
    .line 80
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const/4 v0, 0x0

    .line 85
    invoke-static {v1, v2, p0, v0}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    :cond_0
    return-void
.end method

.method public L(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->T(Lcom/p1/mobile/putong/core/data/Message;Z)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    goto/16 :goto_0

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_9

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Message;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "normal"

    .line 27
    .line 28
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_9

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 35
    .line 36
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->likeOfMoment:Ljava/lang/String;

    .line 37
    .line 38
    if-nez v1, :cond_9

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/MessageType;->isUnknownType()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    goto/16 :goto_0

    .line 51
    .line 52
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Message;->isGroupMessage()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_2

    .line 59
    .line 60
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 65
    .line 66
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_2

    .line 77
    .line 78
    goto/16 :goto_0

    .line 79
    .line 80
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 81
    .line 82
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 83
    .line 84
    const-string v1, "reminder"

    .line 85
    .line 86
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_3

    .line 91
    .line 92
    goto/16 :goto_0

    .line 93
    .line 94
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 95
    .line 96
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 97
    .line 98
    const-string v1, "group_invitation"

    .line 99
    .line 100
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_4

    .line 105
    .line 106
    goto/16 :goto_0

    .line 107
    .line 108
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 109
    .line 110
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    const-string v1, "picture_text_deeplink"

    .line 115
    .line 116
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-eqz v0, :cond_5

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Yg()Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eqz v0, :cond_6

    .line 136
    .line 137
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->J:Lcom/p1/mobile/putong/core/data/Message;

    .line 138
    .line 139
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-nez v0, :cond_6

    .line 144
    .line 145
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 154
    .line 155
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 156
    .line 157
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 158
    .line 159
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 160
    .line 161
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->sc(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-eqz v0, :cond_6

    .line 170
    .line 171
    goto :goto_0

    .line 172
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 173
    .line 174
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 175
    .line 176
    const-string v1, "moment_user_state"

    .line 177
    .line 178
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    if-eqz v0, :cond_7

    .line 183
    .line 184
    goto :goto_0

    .line 185
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 186
    .line 187
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 188
    .line 189
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 190
    .line 191
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 192
    .line 193
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-static {v0}, Ll/br5;->f(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    if-eqz v0, :cond_8

    .line 202
    .line 203
    goto :goto_0

    .line 204
    :cond_8
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->K4:I

    .line 209
    .line 210
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    new-instance v1, Ll/x8q;

    .line 215
    .line 216
    invoke-direct {v1, p0}, Ll/x8q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V

    .line 217
    .line 218
    .line 219
    sget p0, Ll/ibc0;->u1:I

    .line 220
    .line 221
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    const/4 v2, 0x0

    .line 226
    invoke-static {v0, v1, p0, v2}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 231
    .line 232
    .line 233
    :cond_9
    :goto_0
    return-void
.end method

.method public final M(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->X()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_0

    .line 12
    .line 13
    :cond_0
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->B0()Ll/u1z;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ll/d3z;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/d3z;->u0()Ll/azy;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_1

    .line 34
    .line 35
    invoke-virtual {v1}, Ll/azy;->d0()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    invoke-virtual {v0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_2

    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    const/16 v1, 0x8

    .line 57
    .line 58
    if-ne v0, v1, :cond_2

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    sget v0, Ll/ibc0;->v1:I

    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 64
    .line 65
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_4

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->X()Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_4

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 78
    .line 79
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 80
    .line 81
    const-string v2, "group"

    .line 82
    .line 83
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-eqz v1, :cond_4

    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 90
    .line 91
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isLocal()Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-nez v1, :cond_4

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 98
    .line 99
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 100
    .line 101
    const-string v2, "text"

    .line 102
    .line 103
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-nez v1, :cond_3

    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 110
    .line 111
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 112
    .line 113
    const-string v2, "sticker"

    .line 114
    .line 115
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-eqz v1, :cond_4

    .line 120
    .line 121
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    check-cast v1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 126
    .line 127
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 128
    .line 129
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->T2:I

    .line 134
    .line 135
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    new-instance v3, Ll/b9q;

    .line 140
    .line 141
    invoke-direct {v3, p0, v1}, Ll/b9q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/clz;)V

    .line 142
    .line 143
    .line 144
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    const/4 v0, 0x0

    .line 149
    invoke-static {v2, v3, p0, v0}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    :cond_4
    :goto_0
    return-void
.end method

.method public final N(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 7
    .line 8
    instance-of v1, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 9
    .line 10
    if-nez v1, :cond_1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->D:Lcom/p1/mobile/putong/core/ui/messages/view/AiTranslateView;

    .line 14
    .line 15
    if-nez v1, :cond_2

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_2
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/AiTranslateView;->Y(Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_3

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 30
    .line 31
    if-eqz v0, :cond_4

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_4

    .line 50
    .line 51
    :goto_0
    return-void

    .line 52
    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->U3:I

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/f9q;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/f9q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V

    .line 65
    .line 66
    .line 67
    sget p0, Ll/ibc0;->y1:I

    .line 68
    .line 69
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    const/4 v2, 0x0

    .line 74
    invoke-static {v0, v1, p0, v2}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const/4 v0, 0x0

    .line 79
    invoke-interface {p1, v0, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public O()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/clz;->V2()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public final P(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 6
    .line 7
    filled-new-array {p1}, [Lcom/p1/mobile/putong/core/data/Message;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/api/g;->Rf(Ljava/lang/String;Ljava/util/List;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance p1, Ll/u8q;

    .line 20
    .line 21
    invoke-direct {p1}, Ll/u8q;-><init>()V

    .line 22
    .line 23
    .line 24
    new-instance v0, Ll/v8q;

    .line 25
    .line 26
    invoke-direct {v0}, Ll/v8q;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {p1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final Q(Landroid/view/View;I)Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->X()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0}, Ll/mzl;->B0()Ll/u1z;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Ll/d3z;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const/high16 v0, 0x41f00000    # 30.0f

    .line 35
    .line 36
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    const/high16 v2, 0x42200000    # 40.0f

    .line 41
    .line 42
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    mul-int/2addr v3, p2

    .line 47
    add-int/2addr v0, v3

    .line 48
    const/4 p2, 0x2

    .line 49
    new-array v3, p2, [I

    .line 50
    .line 51
    invoke-virtual {p0, v3}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 52
    .line 53
    .line 54
    new-array p0, p2, [I

    .line 55
    .line 56
    invoke-virtual {p1, p0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 57
    .line 58
    .line 59
    const/4 p2, 0x1

    .line 60
    aget v3, v3, p2

    .line 61
    .line 62
    aget v4, p0, p2

    .line 63
    .line 64
    sub-int/2addr v3, v4

    .line 65
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    sub-int/2addr v3, p1

    .line 70
    aget p0, p0, p2

    .line 71
    .line 72
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    sub-int/2addr p0, p1

    .line 77
    if-le p0, v3, :cond_0

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_0
    move p2, v1

    .line 81
    :goto_0
    if-eqz p2, :cond_1

    .line 82
    .line 83
    if-ge p0, v0, :cond_1

    .line 84
    .line 85
    return v1

    .line 86
    :cond_1
    return p2

    .line 87
    :cond_2
    return v1
.end method

.method public final S(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p2, :cond_4

    .line 3
    .line 4
    if-nez p3, :cond_0

    .line 5
    .line 6
    goto :goto_2

    .line 7
    :cond_0
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    const/4 v0, 0x1

    .line 14
    if-nez p3, :cond_1

    .line 15
    .line 16
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-interface {p3, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p3

    .line 30
    if-eqz p3, :cond_1

    .line 31
    .line 32
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {p3, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p3

    .line 38
    if-nez p3, :cond_1

    .line 39
    .line 40
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    move p1, v0

    .line 49
    goto :goto_0

    .line 50
    :cond_1
    move p1, p0

    .line 51
    :goto_0
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    invoke-interface {p3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p3

    .line 61
    invoke-static {p2, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    if-nez p1, :cond_3

    .line 66
    .line 67
    if-eqz p2, :cond_2

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_2
    return p0

    .line 71
    :cond_3
    :goto_1
    return v0

    .line 72
    :cond_4
    :goto_2
    return p0
.end method

.method public final T(Lcom/p1/mobile/putong/core/data/Message;Z)Z
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p2, :cond_0

    .line 3
    .line 4
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 7
    .line 8
    iget-object p2, p2, Ll/dkb;->S3:Ll/jxd0;

    .line 9
    .line 10
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    check-cast p2, Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-nez p2, :cond_0

    .line 21
    .line 22
    return v0

    .line 23
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->getRecallConfig()Lcom/p1/mobile/putong/core/data/RecallConfig;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    if-eqz p2, :cond_1

    .line 32
    .line 33
    iget p2, p0, Lcom/p1/mobile/putong/core/data/RecallConfig;->minutes:I

    .line 34
    .line 35
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/RecallConfig;->enable:Z

    .line 36
    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    if-lez p2, :cond_1

    .line 40
    .line 41
    iget-wide p0, p1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 42
    .line 43
    mul-int/lit16 p2, p2, 0x3e8

    .line 44
    .line 45
    int-to-long v1, p2

    .line 46
    const-wide/16 v3, 0x3c

    .line 47
    .line 48
    mul-long/2addr v1, v3

    .line 49
    long-to-double v1, v1

    .line 50
    add-double/2addr p0, v1

    .line 51
    invoke-static {}, Ll/pzi0;->o()J

    .line 52
    .line 53
    .line 54
    move-result-wide v1

    .line 55
    long-to-double v1, v1

    .line 56
    cmpg-double p0, p0, v1

    .line 57
    .line 58
    if-gez p0, :cond_1

    .line 59
    .line 60
    const/4 p0, 0x1

    .line 61
    return p0

    .line 62
    :cond_1
    return v0
.end method

.method public U(ILandroid/view/View;IZ)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {p2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->w:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p2, p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->g:Landroid/view/View;

    .line 17
    .line 18
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->w:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 19
    .line 20
    invoke-virtual {p2, p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->g:Landroid/view/View;

    .line 24
    .line 25
    sget p2, Ll/edc0;->Z:I

    .line 26
    .line 27
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 34
    .line 35
    if-nez p4, :cond_0

    .line 36
    .line 37
    instance-of p2, p1, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;

    .line 38
    .line 39
    if-eqz p2, :cond_0

    .line 40
    .line 41
    move-object p2, p1

    .line 42
    check-cast p2, Landroid/view/View;

    .line 43
    .line 44
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->g:Landroid/view/View;

    .line 45
    .line 46
    :cond_0
    invoke-interface {p1, p3, p4, p0}, Lcom/p1/mobile/putong/core/ui/messages/a;->m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->g:Landroid/view/View;

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->E:Landroid/graphics/drawable/Drawable;

    .line 56
    .line 57
    return-void
.end method

.method public V()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v0, v1}, Ll/r97;->t4(Lcom/p1/mobile/android/app/Act;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-interface {v0, p0}, Ll/r97;->B2(Lcom/p1/mobile/android/app/Act;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_0
    const/4 p0, 0x0

    .line 37
    return p0
.end method

.method public W(Lcom/p1/mobile/putong/data/BubbleInfo;)Z
    .locals 5

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->createdTime:D

    .line 17
    .line 18
    const-wide v3, 0x4194997000000000L    # 8.64E7

    .line 19
    .line 20
    .line 21
    .line 22
    .line 23
    add-double/2addr v1, v3

    .line 24
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 25
    .line 26
    .line 27
    move-result-wide v3

    .line 28
    long-to-double v3, v3

    .line 29
    cmpl-double p0, v1, v3

    .line 30
    .line 31
    if-lez p0, :cond_0

    .line 32
    .line 33
    iget-object p0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-nez p0, :cond_0

    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_0
    return v0
.end method

.method public X()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    return p0
.end method

.method public final synthetic Z(Ll/clz;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ll/clz;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    new-array v2, v1, [Ll/sfj0$a;

    .line 7
    .line 8
    const-string v3, "e_chat_message_convert_to_text_hold_press_button"

    .line 9
    .line 10
    invoke-static {v3, v0, v2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 14
    .line 15
    invoke-virtual {p1, p0, v1}, Ll/clz;->p7(Lcom/p1/mobile/putong/core/data/Message;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public a()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->performLongClick()Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic a0(Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 2

    .line 1
    const-string v0, "groupchat_id"

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "user_id"

    .line 14
    .line 15
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v0, 0x2

    .line 20
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "is_confirm"

    .line 25
    .line 26
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    filled-new-array {p1, p0, v0}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string p1, "e_group_chat_prohibit"

    .line 35
    .line 36
    const-string v0, "p_group_chat_confirm_prohibit"

    .line 37
    .line 38
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic b0(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Z)V
    .locals 2

    .line 1
    const-string v0, "groupchat_id"

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "user_id"

    .line 14
    .line 15
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v0, 0x1

    .line 20
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "is_confirm"

    .line 25
    .line 26
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    filled-new-array {p1, p0, v0}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string p1, "e_group_chat_prohibit"

    .line 35
    .line 36
    const-string v0, "p_group_chat_confirm_prohibit"

    .line 37
    .line 38
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 39
    .line 40
    .line 41
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 44
    .line 45
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 46
    .line 47
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/api/e;->n6(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final synthetic c0(Ll/clz;ZLcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/clz;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const-string v0, "prohibit"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, "unmute"

    .line 11
    .line 12
    :goto_0
    const-string v1, "function"

    .line 13
    .line 14
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    filled-new-array {v0}, [Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "e_group_chat_message_click"

    .line 23
    .line 24
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 25
    .line 26
    .line 27
    if-nez p2, :cond_1

    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 32
    .line 33
    iget-object p1, p3, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 34
    .line 35
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p0, p1, p3, p2}, Lcom/p1/mobile/putong/core/api/e;->n6(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance v0, Ll/g9q;

    .line 46
    .line 47
    invoke-direct {v0, p0, p5}, Ll/g9q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    .line 48
    .line 49
    .line 50
    new-instance v1, Ll/h9q;

    .line 51
    .line 52
    invoke-direct {v1, p0, p5, p3, p2}, Ll/h9q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Z)V

    .line 53
    .line 54
    .line 55
    invoke-static {p1, p2, p4, v0, v1}, Ll/tcz;->K(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic d0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->P(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic e0(Ll/clz;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/clz;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "function"

    .line 6
    .line 7
    const-string v1, "delete"

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    filled-new-array {v0}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "e_group_chat_message_click"

    .line 18
    .line 19
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v0, Ll/o8q;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ll/o8q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V

    .line 29
    .line 30
    .line 31
    invoke-static {p1, v0}, Ll/tcz;->z(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic f0(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->B0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 7

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->g(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 2
    .line 3
    .line 4
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 5
    .line 6
    instance-of v0, p4, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartConfession;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    check-cast p4, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartConfession;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->h:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    invoke-virtual {p4, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemHeartConfession;->setLetterUser(Lcom/p1/mobile/putong/data/User;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 18
    .line 19
    invoke-virtual {p4}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 20
    .line 21
    .line 22
    move-result-object p4

    .line 23
    invoke-interface {p4}, Ll/r97;->g1()Z

    .line 24
    .line 25
    .line 26
    move-result p4

    .line 27
    const/4 v0, 0x0

    .line 28
    if-eqz p4, :cond_1

    .line 29
    .line 30
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 31
    .line 32
    instance-of v1, p4, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    check-cast p4, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->C:Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;

    .line 39
    .line 40
    invoke-virtual {p4, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->setAudioTranslationView(Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->C:Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;

    .line 45
    .line 46
    invoke-static {p4, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    :goto_0
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->D:Lcom/p1/mobile/putong/core/ui/messages/view/AiTranslateView;

    .line 50
    .line 51
    if-eqz p4, :cond_3

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    .line 56
    move-result-object p4

    .line 57
    instance-of p4, p4, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 58
    .line 59
    if-eqz p4, :cond_2

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    .line 64
    move-result-object p4

    .line 65
    check-cast p4, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 66
    .line 67
    iget-object p4, p4, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 68
    .line 69
    invoke-virtual {p4}, Ll/clz;->r3()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p4

    .line 73
    :goto_1
    move-object v3, p4

    .line 74
    goto :goto_2

    .line 75
    :cond_2
    const-string p4, ""

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :goto_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->D:Lcom/p1/mobile/putong/core/ui/messages/view/AiTranslateView;

    .line 79
    .line 80
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->g:Landroid/view/View;

    .line 81
    .line 82
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->w:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 83
    .line 84
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->E:Landroid/graphics/drawable/Drawable;

    .line 85
    .line 86
    move-object v2, p2

    .line 87
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/messages/view/AiTranslateView;->X(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Landroid/view/View;Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 88
    .line 89
    .line 90
    goto :goto_3

    .line 91
    :cond_3
    move-object v2, p2

    .line 92
    :goto_3
    instance-of p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;

    .line 93
    .line 94
    if-eqz p2, :cond_4

    .line 95
    .line 96
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 97
    .line 98
    instance-of p4, p4, Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 99
    .line 100
    if-nez p4, :cond_5

    .line 101
    .line 102
    :cond_4
    instance-of p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageRight;

    .line 103
    .line 104
    if-eqz p4, :cond_7

    .line 105
    .line 106
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 107
    .line 108
    instance-of v1, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 109
    .line 110
    if-eqz v1, :cond_7

    .line 111
    .line 112
    :cond_5
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-eqz p1, :cond_6

    .line 125
    .line 126
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 127
    .line 128
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 129
    .line 130
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 131
    .line 132
    .line 133
    move-result-object p2

    .line 134
    sget p4, Ll/g9c0;->j:I

    .line 135
    .line 136
    invoke-virtual {p2, p4}, Landroid/content/res/Resources;->getColor(I)I

    .line 137
    .line 138
    .line 139
    move-result p2

    .line 140
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setLinkTextColor(I)V

    .line 141
    .line 142
    .line 143
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 144
    .line 145
    invoke-interface {p1, v2, p0}, Lcom/p1/mobile/putong/core/ui/messages/a;->y(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/a$a;)V

    .line 146
    .line 147
    .line 148
    goto/16 :goto_6

    .line 149
    .line 150
    :cond_7
    if-eqz p2, :cond_8

    .line 151
    .line 152
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 153
    .line 154
    instance-of v1, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;

    .line 155
    .line 156
    if-nez v1, :cond_f

    .line 157
    .line 158
    :cond_8
    if-eqz p4, :cond_9

    .line 159
    .line 160
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 161
    .line 162
    instance-of v1, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;

    .line 163
    .line 164
    if-nez v1, :cond_f

    .line 165
    .line 166
    :cond_9
    if-eqz p2, :cond_a

    .line 167
    .line 168
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 169
    .line 170
    instance-of v1, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;

    .line 171
    .line 172
    if-nez v1, :cond_f

    .line 173
    .line 174
    :cond_a
    if-eqz p4, :cond_b

    .line 175
    .line 176
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 177
    .line 178
    instance-of v1, v1, Lcom/p1/mobile/putong/core/ui/messages/view/ItemLoveLetterMessage;

    .line 179
    .line 180
    if-nez v1, :cond_f

    .line 181
    .line 182
    :cond_b
    if-eqz p4, :cond_c

    .line 183
    .line 184
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 185
    .line 186
    instance-of v1, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;

    .line 187
    .line 188
    if-nez v1, :cond_f

    .line 189
    .line 190
    :cond_c
    if-eqz p2, :cond_d

    .line 191
    .line 192
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 193
    .line 194
    instance-of v1, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;

    .line 195
    .line 196
    if-nez v1, :cond_f

    .line 197
    .line 198
    :cond_d
    if-eqz p2, :cond_e

    .line 199
    .line 200
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 201
    .line 202
    instance-of p2, p2, Lcom/p1/mobile/putong/core/ui/messages/view/ItemLoveLetterMessage;

    .line 203
    .line 204
    if-nez p2, :cond_f

    .line 205
    .line 206
    :cond_e
    if-eqz p4, :cond_11

    .line 207
    .line 208
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 209
    .line 210
    instance-of p2, p2, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;

    .line 211
    .line 212
    if-eqz p2, :cond_11

    .line 213
    .line 214
    :cond_f
    move p2, v0

    .line 215
    :goto_4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 216
    .line 217
    .line 218
    move-result p4

    .line 219
    if-ge p2, p4, :cond_10

    .line 220
    .line 221
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 222
    .line 223
    .line 224
    move-result-object p4

    .line 225
    const/4 v1, 0x0

    .line 226
    invoke-virtual {p4, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 227
    .line 228
    .line 229
    add-int/lit8 p2, p2, 0x1

    .line 230
    .line 231
    goto :goto_4

    .line 232
    :cond_10
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 233
    .line 234
    invoke-interface {p2, p1, v2, p0}, Lcom/p1/mobile/putong/core/ui/messages/a;->U(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/a$a;)V

    .line 235
    .line 236
    .line 237
    goto :goto_6

    .line 238
    :cond_11
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 239
    .line 240
    instance-of p4, p2, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;

    .line 241
    .line 242
    if-nez p4, :cond_13

    .line 243
    .line 244
    instance-of p4, p2, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;

    .line 245
    .line 246
    if-nez p4, :cond_13

    .line 247
    .line 248
    instance-of p4, p2, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageFakeLockItem;

    .line 249
    .line 250
    if-nez p4, :cond_13

    .line 251
    .line 252
    instance-of p4, p2, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageDynamicComments;

    .line 253
    .line 254
    if-nez p4, :cond_13

    .line 255
    .line 256
    instance-of p4, p2, Lcom/p1/mobile/putong/core/ui/messages/ItemPrologueRight;

    .line 257
    .line 258
    if-nez p4, :cond_13

    .line 259
    .line 260
    instance-of p4, p2, Lcom/p1/mobile/putong/core/ui/messages/ItemPrologueLeft;

    .line 261
    .line 262
    if-nez p4, :cond_13

    .line 263
    .line 264
    instance-of p4, p2, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPermissionLayout;

    .line 265
    .line 266
    if-nez p4, :cond_13

    .line 267
    .line 268
    instance-of p4, p2, Lcom/p1/mobile/putong/core/ui/messages/ItemAiPictureLeft;

    .line 269
    .line 270
    if-eqz p4, :cond_12

    .line 271
    .line 272
    goto :goto_5

    .line 273
    :cond_12
    invoke-interface {p2, v2}, Lcom/p1/mobile/putong/core/ui/messages/a;->A(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 274
    .line 275
    .line 276
    goto :goto_6

    .line 277
    :cond_13
    :goto_5
    invoke-interface {p2, p1, v2, p0}, Lcom/p1/mobile/putong/core/ui/messages/a;->U(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/a$a;)V

    .line 278
    .line 279
    .line 280
    :goto_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->B:Landroid/widget/TextView;

    .line 281
    .line 282
    iget-object p2, v2, Lcom/p1/mobile/putong/core/data/Message;->sentFrom:Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 283
    .line 284
    const-string p4, "apple_watch"

    .line 285
    .line 286
    invoke-static {p2, p4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 287
    .line 288
    .line 289
    move-result p2

    .line 290
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 291
    .line 292
    .line 293
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->B:Landroid/widget/TextView;

    .line 294
    .line 295
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 296
    .line 297
    .line 298
    move-result p1

    .line 299
    const/16 p2, 0x8

    .line 300
    .line 301
    if-eq p1, p2, :cond_14

    .line 302
    .line 303
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->B:Landroid/widget/TextView;

    .line 304
    .line 305
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 306
    .line 307
    .line 308
    move-result-object p1

    .line 309
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 310
    .line 311
    .line 312
    move-result p1

    .line 313
    if-nez p1, :cond_14

    .line 314
    .line 315
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->B:Landroid/widget/TextView;

    .line 316
    .line 317
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 318
    .line 319
    .line 320
    move-result-object p4

    .line 321
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->X5:I

    .line 322
    .line 323
    invoke-virtual {p4, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    move-result-object p4

    .line 327
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 328
    .line 329
    .line 330
    move-result-object v1

    .line 331
    sget v3, Ll/ibc0;->I7:I

    .line 332
    .line 333
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 334
    .line 335
    .line 336
    move-result-object v1

    .line 337
    const/16 v3, 0x40

    .line 338
    .line 339
    invoke-static {p4, v3, v1}, Ll/q8g0;->a0(Ljava/lang/String;CLandroid/graphics/drawable/Drawable;)Landroid/text/SpannableStringBuilder;

    .line 340
    .line 341
    .line 342
    move-result-object p4

    .line 343
    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 344
    .line 345
    .line 346
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->z:Ljava/lang/String;

    .line 347
    .line 348
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 349
    .line 350
    .line 351
    move-result p1

    .line 352
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->x:Lv/VText;

    .line 353
    .line 354
    if-nez p1, :cond_15

    .line 355
    .line 356
    invoke-virtual {p4, v0}, Landroid/view/View;->setVisibility(I)V

    .line 357
    .line 358
    .line 359
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->x:Lv/VText;

    .line 360
    .line 361
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->z:Ljava/lang/String;

    .line 362
    .line 363
    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 364
    .line 365
    .line 366
    goto :goto_7

    .line 367
    :cond_15
    invoke-virtual {p4, p2}, Landroid/view/View;->setVisibility(I)V

    .line 368
    .line 369
    .line 370
    :goto_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->A:Ljava/lang/String;

    .line 371
    .line 372
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 373
    .line 374
    .line 375
    move-result p1

    .line 376
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->y:Lv/VText;

    .line 377
    .line 378
    if-nez p1, :cond_16

    .line 379
    .line 380
    invoke-virtual {p4, v0}, Landroid/view/View;->setVisibility(I)V

    .line 381
    .line 382
    .line 383
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->y:Lv/VText;

    .line 384
    .line 385
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->A:Ljava/lang/String;

    .line 386
    .line 387
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 388
    .line 389
    .line 390
    goto :goto_8

    .line 391
    :cond_16
    invoke-virtual {p4, p2}, Landroid/view/View;->setVisibility(I)V

    .line 392
    .line 393
    .line 394
    :goto_8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 395
    .line 396
    .line 397
    move-result-object p1

    .line 398
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 399
    .line 400
    if-eqz p1, :cond_17

    .line 401
    .line 402
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 403
    .line 404
    .line 405
    move-result-object p1

    .line 406
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 407
    .line 408
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->E2()Z

    .line 409
    .line 410
    .line 411
    move-result p1

    .line 412
    if-eqz p1, :cond_17

    .line 413
    .line 414
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->I:Lv/VRelative;

    .line 415
    .line 416
    const/4 p2, 0x1

    .line 417
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 418
    .line 419
    .line 420
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 421
    .line 422
    .line 423
    move-result-object p1

    .line 424
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 425
    .line 426
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->F()Ll/ruy;

    .line 427
    .line 428
    .line 429
    move-result-object p1

    .line 430
    if-eqz p1, :cond_18

    .line 431
    .line 432
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 433
    .line 434
    .line 435
    move-result-object p1

    .line 436
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 437
    .line 438
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->F()Ll/ruy;

    .line 439
    .line 440
    .line 441
    move-result-object p1

    .line 442
    invoke-virtual {p1}, Ll/ruy;->m0()Ljava/util/List;

    .line 443
    .line 444
    .line 445
    move-result-object p2

    .line 446
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H:Lv/VCheckBox;

    .line 447
    .line 448
    iget-object v0, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 449
    .line 450
    invoke-interface {p2, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 451
    .line 452
    .line 453
    move-result p2

    .line 454
    invoke-virtual {p4, p2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 455
    .line 456
    .line 457
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->I:Lv/VRelative;

    .line 458
    .line 459
    new-instance p4, Ll/p8q;

    .line 460
    .line 461
    invoke-direct {p4, p0, p1, v2}, Ll/p8q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/ruy;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 462
    .line 463
    .line 464
    invoke-virtual {p2, p4}, Lv/VRelative;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 465
    .line 466
    .line 467
    goto :goto_9

    .line 468
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->I:Lv/VRelative;

    .line 469
    .line 470
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 471
    .line 472
    .line 473
    :cond_18
    :goto_9
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->J:Lcom/p1/mobile/putong/core/data/Message;

    .line 474
    .line 475
    return-void
.end method

.method public final synthetic g0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->E()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 18
    .line 19
    const-string v0, "group"

    .line 20
    .line 21
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 32
    .line 33
    iget-boolean p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->hasHandle:Z

    .line 34
    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    const/4 p0, 0x1

    .line 39
    iput-boolean p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->hasHandle:Z

    .line 40
    .line 41
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->u4:I

    .line 42
    .line 43
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public getContentLayoutInfo()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->getContentLayoutInfo()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final synthetic h0([Ll/w30;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    const/4 p3, 0x0

    .line 4
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->T(Lcom/p1/mobile/putong/core/data/Message;Z)Z

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->B0()V

    .line 11
    .line 12
    .line 13
    aget-object p0, p1, p3

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 22
    .line 23
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 24
    .line 25
    invoke-virtual {p2, p4}, Lcom/p1/mobile/putong/core/api/g;->In(Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    new-instance p4, Ll/z8q;

    .line 30
    .line 31
    invoke-direct {p4, p0}, Ll/z8q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V

    .line 32
    .line 33
    .line 34
    new-instance v0, Ll/a9q;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/a9q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p4, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    aget-object p0, p1, p3

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic i0()V
    .locals 5

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->K4:I

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    new-array v1, v1, [Ll/w30;

    .line 21
    .line 22
    new-instance v2, Ll/w30$b;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-direct {v2, v3}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->t4:I

    .line 36
    .line 37
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v2, v3}, Ll/w30$b;->L(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->a:I

    .line 50
    .line 51
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {v2, v3}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    new-instance v3, Ll/s8q;

    .line 60
    .line 61
    invoke-direct {v3, v1}, Ll/s8q;-><init>([Ll/w30;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2, v3}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v2, v0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v2, Ll/t8q;

    .line 73
    .line 74
    invoke-direct {v2, p0, v1}, Ll/t8q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;[Ll/w30;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v2}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0}, Ll/w30$b;->F()Ll/w30;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 86
    .line 87
    .line 88
    const/4 v0, 0x0

    .line 89
    aput-object p0, v1, v0

    .line 90
    .line 91
    return-void
.end method

.method public final synthetic j0(Ll/clz;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/clz;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "function"

    .line 6
    .line 7
    const-string v2, "reply"

    .line 8
    .line 9
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    filled-new-array {v1}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "e_group_chat_message_click"

    .line 18
    .line 19
    invoke-static {v2, v0, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/sb8;

    .line 35
    .line 36
    invoke-direct {v1}, Ll/sb8;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/i9q;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/i9q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/hh7;

    .line 53
    .line 54
    invoke-direct {v1}, Ll/hh7;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const/4 v1, 0x1

    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v1, Ll/n8q;

    .line 67
    .line 68
    invoke-direct {v1, p0, p1}, Ll/n8q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/clz;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final synthetic k0(Lcom/p1/mobile/putong/core/data/Conversation;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/putong/core/api/e;->T6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic l0(Ll/clz;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ll/clz;->c7(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupMemberName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p1}, Ll/mzl;->B0()Ll/u1z;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Ll/j3z;->g0()Ll/iam;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Ll/d3z;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p1, p2, p0}, Ll/d3z;->b2(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic m0()V
    .locals 2

    .line 1
    const-string v0, "e_intl_ai_translate"

    .line 2
    .line 3
    const-string v1, "p_chat_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->D:Lcom/p1/mobile/putong/core/ui/messages/view/AiTranslateView;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 13
    .line 14
    check-cast v1, Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/messages/view/AiTranslateView;->i0(ILcom/p1/mobile/android/app/Act;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final synthetic n0(Ll/clz;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const-string v0, "e_quickchat_prevent_harassment"

    .line 10
    .line 11
    invoke-static {v0, p2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    const-string v1, "harassment_choose"

    .line 23
    .line 24
    const-string v2, "unmatch"

    .line 25
    .line 26
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    filled-new-array {v1}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v0, p2, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->X()Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-eqz p2, :cond_0

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p1}, Ll/clz;->r3()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const-string v0, ""

    .line 60
    .line 61
    invoke-interface {p2, p0, p1, v0}, Ll/r97;->Y5(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_0
    return-void
.end method

.method public final synthetic o0(Ll/clz;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const-string v0, "e_quickchat_prevent_harassment"

    .line 10
    .line 11
    invoke-static {v0, p2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    const-string v1, "harassment_choose"

    .line 23
    .line 24
    const-string v2, "staymatch"

    .line 25
    .line 26
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    filled-new-array {v1}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v0, p2, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p1}, Ll/clz;->r3()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-interface {p2, p1}, Ll/r97;->L(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    const/4 p1, 0x0

    .line 53
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->u0(Z)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->U0:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->w:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 13
    .line 14
    sget v0, Ll/edc0;->e4:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/widget/TextView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->B:Landroid/widget/TextView;

    .line 23
    .line 24
    sget v0, Ll/edc0;->g1:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/VText;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->x:Lv/VText;

    .line 33
    .line 34
    sget v0, Ll/edc0;->T0:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lv/VText;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->y:Lv/VText;

    .line 43
    .line 44
    sget v0, Ll/edc0;->n:I

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->C:Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;

    .line 53
    .line 54
    sget v0, Ll/edc0;->d:I

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/view/AiTranslateView;

    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->D:Lcom/p1/mobile/putong/core/ui/messages/view/AiTranslateView;

    .line 63
    .line 64
    sget v0, Ll/edc0;->B3:I

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Landroid/view/ViewStub;

    .line 71
    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->F:Landroid/view/ViewStub;

    .line 73
    .line 74
    sget v0, Ll/edc0;->i3:I

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Lv/VCheckBox;

    .line 81
    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H:Lv/VCheckBox;

    .line 83
    .line 84
    sget v0, Ll/edc0;->J:I

    .line 85
    .line 86
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Lv/VRelative;

    .line 91
    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->I:Lv/VRelative;

    .line 93
    .line 94
    invoke-virtual {p0, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 13
    .line 14
    const-string v2, "icebreak_qa"

    .line 15
    .line 16
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    return v1

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 24
    .line 25
    iget v0, v0, Lcom/p1/mobile/putong/core/data/Message;->localFailType:I

    .line 26
    .line 27
    const/4 v2, 0x3

    .line 28
    if-eq v0, v2, :cond_b

    .line 29
    .line 30
    const/4 v2, 0x4

    .line 31
    if-ne v0, v2, :cond_1

    .line 32
    .line 33
    goto/16 :goto_0

    .line 34
    .line 35
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-interface {v0, v2}, Ll/r97;->t4(Lcom/p1/mobile/android/app/Act;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    return v1

    .line 52
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->Y(Landroid/content/Context;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    return v1

    .line 63
    :cond_3
    invoke-static {}, Ll/rum0;->c()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    const-string v2, "voice_call_invitation"

    .line 68
    .line 69
    if-eqz v0, :cond_4

    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 72
    .line 73
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_4

    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 80
    .line 81
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 82
    .line 83
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_4

    .line 88
    .line 89
    return v1

    .line 90
    :cond_4
    invoke-static {}, Ll/rum0;->c()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-nez v0, :cond_6

    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 97
    .line 98
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_6

    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 105
    .line 106
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 107
    .line 108
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-nez v0, :cond_5

    .line 113
    .line 114
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 115
    .line 116
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 117
    .line 118
    const-string v2, "voice_call"

    .line 119
    .line 120
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-eqz v0, :cond_6

    .line 125
    .line 126
    :cond_5
    return v1

    .line 127
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 128
    .line 129
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-eqz v0, :cond_8

    .line 134
    .line 135
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 136
    .line 137
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 138
    .line 139
    const-string v2, "chat_gift"

    .line 140
    .line 141
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-nez v0, :cond_7

    .line 146
    .line 147
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 148
    .line 149
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 150
    .line 151
    const-string v2, "moment_gift"

    .line 152
    .line 153
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-nez v0, :cond_7

    .line 158
    .line 159
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 160
    .line 161
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 162
    .line 163
    const-string v2, "marriage_prologue"

    .line 164
    .line 165
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-eqz v0, :cond_8

    .line 170
    .line 171
    :cond_7
    return v1

    .line 172
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 173
    .line 174
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/ui/messages/a;->J()Ljava/util/List;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    if-nez v0, :cond_9

    .line 179
    .line 180
    new-instance v0, Ljava/util/ArrayList;

    .line 181
    .line 182
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 183
    .line 184
    .line 185
    :cond_9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->N(Ljava/util/List;)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->I(Ljava/util/List;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->L(Ljava/util/List;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->M(Ljava/util/List;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->K(Ljava/util/List;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->J(Ljava/util/List;)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->w0(Ljava/util/List;)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->z0(Landroid/view/View;Ljava/util/List;)V

    .line 207
    .line 208
    .line 209
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 210
    .line 211
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    invoke-interface {p1}, Ll/r97;->E()Z

    .line 216
    .line 217
    .line 218
    move-result p1

    .line 219
    if-eqz p1, :cond_a

    .line 220
    .line 221
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 226
    .line 227
    if-eqz p1, :cond_a

    .line 228
    .line 229
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 234
    .line 235
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 236
    .line 237
    invoke-virtual {p1}, Ll/clz;->e4()Z

    .line 238
    .line 239
    .line 240
    move-result p1

    .line 241
    if-eqz p1, :cond_a

    .line 242
    .line 243
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 244
    .line 245
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 246
    .line 247
    .line 248
    move-result p1

    .line 249
    if-eqz p1, :cond_a

    .line 250
    .line 251
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 252
    .line 253
    .line 254
    move-result-object p1

    .line 255
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 256
    .line 257
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 258
    .line 259
    invoke-virtual {p1}, Ll/clz;->pageId()Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 264
    .line 265
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 266
    .line 267
    const-string v1, "message_id"

    .line 268
    .line 269
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 274
    .line 275
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 276
    .line 277
    const-string v1, "user_id"

    .line 278
    .line 279
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    filled-new-array {v0, p0}, [Ll/pf60;

    .line 284
    .line 285
    .line 286
    move-result-object p0

    .line 287
    const-string v0, "e_group_chat_message"

    .line 288
    .line 289
    invoke-static {v0, p1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 290
    .line 291
    .line 292
    :cond_a
    const/4 p0, 0x1

    .line 293
    return p0

    .line 294
    :cond_b
    :goto_0
    return v1
.end method

.method public onMeasure(II)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/dox;->d(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x42d00000    # 104.0f

    .line 6
    .line 7
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    sub-int/2addr v0, v1

    .line 12
    sput v0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->K:I

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->w:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;

    .line 22
    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/gift/message/NewItemGiftMessageBase;

    .line 26
    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/gift/message/ItemGiftMessageBase;

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    :cond_0
    invoke-static {p1}, Ll/dox;->d(I)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    sput v0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->K:I

    .line 38
    .line 39
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->w:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 40
    .line 41
    sget v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->K:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;->setMaxWidth(I)V

    .line 44
    .line 45
    .line 46
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 47
    .line 48
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-interface {v0}, Ll/r97;->g1()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->C:Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;

    .line 59
    .line 60
    sget v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->K:I

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lv/VLinear_MaxWidth;->setMaxWidth(I)V

    .line 63
    .line 64
    .line 65
    :cond_2
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final synthetic p0(Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 2

    .line 1
    const-string v0, "groupchat_id"

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x2

    .line 10
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "is_confirm"

    .line 15
    .line 16
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 23
    .line 24
    const-string v1, "user_id"

    .line 25
    .line 26
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    filled-new-array {p1, v0, p0}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string p1, "e_group_chat_remove"

    .line 35
    .line 36
    const-string v0, "p_group_chat_remove"

    .line 37
    .line 38
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic q0(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V
    .locals 2

    .line 1
    const-string v0, "groupchat_id"

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "is_confirm"

    .line 15
    .line 16
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 23
    .line 24
    const-string v1, "user_id"

    .line 25
    .line 26
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    filled-new-array {p1, v0, p0}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string p1, "e_group_chat_remove"

    .line 35
    .line 36
    const-string v0, "p_group_chat_remove"

    .line 37
    .line 38
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 39
    .line 40
    .line 41
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 44
    .line 45
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 46
    .line 47
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/e;->b9(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final synthetic r0(Ll/clz;Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/clz;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "function"

    .line 6
    .line 7
    const-string v1, "remove"

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    filled-new-array {v0}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "e_group_chat_message_click"

    .line 18
    .line 19
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    new-instance p1, Ll/l4g0;

    .line 23
    .line 24
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "p_group_chat_remove"

    .line 31
    .line 32
    invoke-direct {p1, v1, v0}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 36
    .line 37
    const-string v1, "anonymous"

    .line 38
    .line 39
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    const-string v0, "1"

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    const-string v0, "0"

    .line 49
    .line 50
    :goto_0
    const-string v1, "is_anonymou_group"

    .line 51
    .line 52
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    filled-new-array {v0}, [Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p1, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 61
    .line 62
    .line 63
    invoke-static {p1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/q8q;

    .line 71
    .line 72
    invoke-direct {v1, p0, p2}, Ll/q8q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    .line 73
    .line 74
    .line 75
    new-instance v2, Ll/r8q;

    .line 76
    .line 77
    invoke-direct {v2, p0, p2, p4}, Ll/r8q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v0, p3, v1, v2, p1}, Ll/tcz;->C(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;Ll/l4g0;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final synthetic s0(Ll/ruy;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H:Lv/VCheckBox;

    .line 2
    .line 3
    invoke-virtual {p3}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    iget-object p3, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-wide v0, p2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 12
    .line 13
    const/4 p2, 0x0

    .line 14
    invoke-virtual {p1, p3, v0, v1, p2}, Ll/ruy;->t0(Ljava/lang/String;DZ)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H:Lv/VCheckBox;

    .line 21
    .line 22
    invoke-virtual {p0, p2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object p3, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 27
    .line 28
    iget-wide v0, p2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 29
    .line 30
    const/4 p2, 0x1

    .line 31
    invoke-virtual {p1, p3, v0, v1, p2}, Ll/ruy;->t0(Ljava/lang/String;DZ)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H:Lv/VCheckBox;

    .line 38
    .line 39
    invoke-virtual {p0, p2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method public setFooterTip(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->A:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setHeaderTip(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->z:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final t0(I)I
    .locals 0

    .line 1
    const/4 p0, -0x2

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/high16 p0, 0x40000000    # 2.0f

    .line 7
    .line 8
    :goto_0
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-static {p1, p0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public final u0(Z)V
    .locals 1

    .line 1
    sget v0, Ll/edc0;->L:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    sget v0, Ll/edc0;->F3:I

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    xor-int/lit8 p1, p1, 0x1

    .line 17
    .line 18
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public v0(Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 10

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->v()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_3

    .line 15
    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 17
    .line 18
    const-string v2, "voice_call"

    .line 19
    .line 20
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_3

    .line 25
    .line 26
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->status:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/VoiceCallStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/VoiceCallStatus;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v2, "finished"

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/data/VoiceCallStatus;->equals(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_3

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->X()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_3

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    iget-object v3, v0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 75
    .line 76
    invoke-interface {v2, v3}, Ll/r97;->j5(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-eqz v2, :cond_3

    .line 81
    .line 82
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    invoke-interface {v2, v3}, Ll/r97;->T5(Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-eqz v2, :cond_3

    .line 99
    .line 100
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 101
    .line 102
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->duration:Ljava/lang/String;

    .line 103
    .line 104
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->y0(Ljava/lang/String;)J

    .line 105
    .line 106
    .line 107
    move-result-wide v2

    .line 108
    const-wide/16 v4, 0x1e

    .line 109
    .line 110
    cmp-long p1, v2, v4

    .line 111
    .line 112
    if-gtz p1, :cond_3

    .line 113
    .line 114
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->F:Landroid/view/ViewStub;

    .line 115
    .line 116
    const/4 v2, 0x1

    .line 117
    if-eqz p1, :cond_2

    .line 118
    .line 119
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 120
    .line 121
    .line 122
    sget p1, Ll/edc0;->Q4:I

    .line 123
    .line 124
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    check-cast p1, Landroid/widget/TextView;

    .line 129
    .line 130
    const/4 v3, 0x3

    .line 131
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    invoke-virtual {p1, v3, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 136
    .line 137
    .line 138
    sget v3, Ll/edc0;->P2:I

    .line 139
    .line 140
    invoke-virtual {p0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    check-cast v3, Landroid/widget/ImageView;

    .line 145
    .line 146
    sget v4, Ll/edc0;->I4:I

    .line 147
    .line 148
    invoke-virtual {p0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 149
    .line 150
    .line 151
    move-result-object v4

    .line 152
    check-cast v4, Landroid/widget/TextView;

    .line 153
    .line 154
    sget v5, Ll/edc0;->F3:I

    .line 155
    .line 156
    invoke-virtual {p0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 157
    .line 158
    .line 159
    move-result-object v5

    .line 160
    check-cast v5, Landroid/widget/TextView;

    .line 161
    .line 162
    sget v6, Ll/edc0;->o5:I

    .line 163
    .line 164
    invoke-virtual {p0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 165
    .line 166
    .line 167
    move-result-object v6

    .line 168
    check-cast v6, Landroid/widget/TextView;

    .line 169
    .line 170
    sget v7, Ll/edc0;->d2:I

    .line 171
    .line 172
    invoke-virtual {p0, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 173
    .line 174
    .line 175
    move-result-object v7

    .line 176
    check-cast v7, Landroid/widget/TextView;

    .line 177
    .line 178
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 179
    .line 180
    .line 181
    move-result-object v8

    .line 182
    invoke-virtual {v8}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 183
    .line 184
    .line 185
    move-result-object v8

    .line 186
    invoke-interface {v8}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 187
    .line 188
    .line 189
    move-result v8

    .line 190
    if-eqz v8, :cond_0

    .line 191
    .line 192
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 193
    .line 194
    .line 195
    move-result-object v8

    .line 196
    sget v9, Ll/g9c0;->g:I

    .line 197
    .line 198
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getColor(I)I

    .line 199
    .line 200
    .line 201
    move-result v8

    .line 202
    invoke-virtual {p1, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    sget v8, Ll/g9c0;->i:I

    .line 210
    .line 211
    invoke-virtual {p1, v8}, Landroid/content/res/Resources;->getColor(I)I

    .line 212
    .line 213
    .line 214
    move-result p1

    .line 215
    invoke-virtual {v4, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    sget v4, Ll/g9c0;->i:I

    .line 223
    .line 224
    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 225
    .line 226
    .line 227
    move-result p1

    .line 228
    invoke-virtual {v5, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    sget v4, Ll/g9c0;->g:I

    .line 236
    .line 237
    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 238
    .line 239
    .line 240
    move-result p1

    .line 241
    invoke-virtual {v6, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 242
    .line 243
    .line 244
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 245
    .line 246
    .line 247
    move-result-object p1

    .line 248
    sget v4, Ll/g9c0;->g:I

    .line 249
    .line 250
    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 251
    .line 252
    .line 253
    move-result p1

    .line 254
    invoke-virtual {v7, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 255
    .line 256
    .line 257
    const/4 p1, 0x0

    .line 258
    invoke-virtual {v3, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 259
    .line 260
    .line 261
    sget p1, Ll/ibc0;->X5:I

    .line 262
    .line 263
    invoke-static {v3, p1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 264
    .line 265
    .line 266
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 267
    .line 268
    .line 269
    move-result-object p1

    .line 270
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 271
    .line 272
    .line 273
    move-result-object p1

    .line 274
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v3

    .line 278
    invoke-interface {p1, v3}, Ll/r97;->p3(Ljava/lang/String;)Z

    .line 279
    .line 280
    .line 281
    move-result p1

    .line 282
    if-eqz p1, :cond_1

    .line 283
    .line 284
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->u0(Z)V

    .line 285
    .line 286
    .line 287
    goto :goto_0

    .line 288
    :cond_1
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->u0(Z)V

    .line 289
    .line 290
    .line 291
    sget p1, Ll/edc0;->o5:I

    .line 292
    .line 293
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 294
    .line 295
    .line 296
    move-result-object p1

    .line 297
    new-instance v1, Ll/w8q;

    .line 298
    .line 299
    invoke-direct {v1, p0, v0}, Ll/w8q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/clz;)V

    .line 300
    .line 301
    .line 302
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 303
    .line 304
    .line 305
    sget p1, Ll/edc0;->d2:I

    .line 306
    .line 307
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 308
    .line 309
    .line 310
    move-result-object p1

    .line 311
    new-instance v1, Ll/y8q;

    .line 312
    .line 313
    invoke-direct {v1, p0, v0}, Ll/y8q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/clz;)V

    .line 314
    .line 315
    .line 316
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 317
    .line 318
    .line 319
    :cond_2
    :goto_0
    return v2

    .line 320
    :cond_3
    return v1
.end method

.method public final w0(Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ll/r97;->E()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->X()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 30
    .line 31
    const-string v1, "group"

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Message;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v1, "normal"

    .line 54
    .line 55
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_1

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 66
    .line 67
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 68
    .line 69
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 70
    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 72
    .line 73
    invoke-virtual {v3}, Ll/clz;->r3()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/e;->s6(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 82
    .line 83
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 84
    .line 85
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 86
    .line 87
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 88
    .line 89
    invoke-virtual {v3}, Ll/clz;->r3()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {v1, v2, v0}, Lcom/p1/mobile/putong/core/api/e;->W8(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 94
    .line 95
    .line 96
    move-result-object v6

    .line 97
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-eqz v1, :cond_1

    .line 102
    .line 103
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-eqz v1, :cond_1

    .line 108
    .line 109
    iget-object v1, v6, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 110
    .line 111
    const-string v2, "default"

    .line 112
    .line 113
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    if-eqz v1, :cond_1

    .line 118
    .line 119
    invoke-virtual {p0, v0, v4, v6}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->S(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-eqz v0, :cond_1

    .line 124
    .line 125
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupMemberName()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-nez v0, :cond_0

    .line 134
    .line 135
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupMemberName()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-static {v0}, Ll/jek;->o(Ljava/lang/String;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    :goto_0
    move-object v5, v0

    .line 144
    goto :goto_1

    .line 145
    :cond_0
    const-string v0, ""

    .line 146
    .line 147
    goto :goto_0

    .line 148
    :goto_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 149
    .line 150
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->I0:I

    .line 151
    .line 152
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    new-instance v1, Ll/e9q;

    .line 157
    .line 158
    move-object v2, p0

    .line 159
    invoke-direct/range {v1 .. v6}, Ll/e9q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/clz;Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V

    .line 160
    .line 161
    .line 162
    sget p0, Ll/ibc0;->w1:I

    .line 163
    .line 164
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    const/4 v2, 0x0

    .line 169
    invoke-static {v0, v1, p0, v2}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    :cond_1
    return-void
.end method

.method public x0(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v0(Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->F:Landroid/view/ViewStub;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final z0(Landroid/view/View;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-interface {v0}, Ll/r97;->G1()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->X()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_2

    .line 28
    .line 29
    :goto_0
    return-void

    .line 30
    :cond_2
    const/4 v0, 0x2

    .line 31
    new-array v0, v0, [I

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 34
    .line 35
    .line 36
    instance-of v0, p1, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    .line 37
    .line 38
    if-eqz v0, :cond_7

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 41
    .line 42
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_4

    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 51
    .line 52
    const-string v1, "state_like"

    .line 53
    .line 54
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_3

    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 63
    .line 64
    const-string v1, "state_comment"

    .line 65
    .line 66
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_4

    .line 71
    .line 72
    :cond_3
    move-object v0, p1

    .line 73
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 76
    .line 77
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;

    .line 78
    .line 79
    if-eqz v1, :cond_4

    .line 80
    .line 81
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;

    .line 82
    .line 83
    iget-object p1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->i:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 87
    .line 88
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_5

    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 95
    .line 96
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 97
    .line 98
    const-string v1, "literature"

    .line 99
    .line 100
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_5

    .line 105
    .line 106
    move-object v0, p1

    .line 107
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    .line 108
    .line 109
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 110
    .line 111
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;

    .line 112
    .line 113
    if-eqz v1, :cond_5

    .line 114
    .line 115
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;

    .line 116
    .line 117
    iget-object p1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemRecentlySee;->f:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 121
    .line 122
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-eqz v0, :cond_6

    .line 127
    .line 128
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 129
    .line 130
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 131
    .line 132
    const-string v1, "profile_like"

    .line 133
    .line 134
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    if-eqz v0, :cond_6

    .line 139
    .line 140
    move-object v0, p1

    .line 141
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    .line 142
    .line 143
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->v:Lcom/p1/mobile/putong/core/ui/messages/a;

    .line 144
    .line 145
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;

    .line 146
    .line 147
    if-eqz v1, :cond_6

    .line 148
    .line 149
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;

    .line 150
    .line 151
    iget-object p1, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->g:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 152
    .line 153
    goto :goto_1

    .line 154
    :cond_6
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    .line 155
    .line 156
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->w:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 157
    .line 158
    :cond_7
    :goto_1
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->Q(Landroid/view/View;I)Z

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->A0(Landroid/view/View;Ljava/util/List;Z)V

    .line 167
    .line 168
    .line 169
    return-void
.end method
