.class public Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# static fields
.field public static j:I


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;

.field public b:Landroid/widget/FrameLayout;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

.field public e:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

.field public f:Lv/VDraweeView;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lcom/p1/mobile/putong/core/ui/messages/ItemText;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->onFinishInflate()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 9
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/BubbleInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->j(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/BubbleInfo;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->l(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/BubbleInfo;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->i()V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->k(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Landroid/view/View;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/messages/a$a;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/ui/messages/a$a;->a()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return p0
.end method

.method public static synthetic g(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic k(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->q(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 2
    .line 3
    .line 4
    const-string p0, "\u72b6\u6001\u5df2\u7ed3\u675f"

    .line 5
    .line 6
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->c:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/y4q;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/y4q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;)V

    .line 14
    .line 15
    .line 16
    sget p0, Ll/ibc0;->x1:I

    .line 17
    .line 18
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-static {v0, v1, p0, v2}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    filled-new-array {p0}, [Ll/ovb0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public U(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/a$a;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->i:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 2
    .line 3
    invoke-virtual {v0, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemText;->y(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/a$a;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->i:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 7
    .line 8
    new-instance v1, Ll/z4q;

    .line 9
    .line 10
    invoke-direct {v1, p3}, Ll/z4q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/a$a;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 14
    .line 15
    .line 16
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->b:Landroid/widget/FrameLayout;

    .line 17
    .line 18
    new-instance v0, Ll/a5q;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/a5q;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p3, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->n(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final h(Lcom/p1/mobile/putong/data/BubbleInfo;)Z
    .locals 3

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
    iget-wide p0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->createdTime:D

    .line 17
    .line 18
    const-wide v1, 0x4194997000000000L    # 8.64E7

    .line 19
    .line 20
    .line 21
    .line 22
    .line 23
    add-double/2addr p0, v1

    .line 24
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 25
    .line 26
    .line 27
    move-result-wide v1

    .line 28
    long-to-double v1, v1

    .line 29
    cmpl-double p0, p0, v1

    .line 30
    .line 31
    if-lez p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    return v0
.end method

.method public final synthetic i()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->i:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/l51;->q(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic j(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/BubbleInfo;Landroid/view/View;)V
    .locals 6

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->q(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    move-object v1, p0

    .line 29
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    iget-object v2, p2, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 32
    .line 33
    iget-object p0, p2, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 34
    .line 35
    iget-object v3, p0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 36
    .line 37
    const/4 v4, 0x1

    .line 38
    const-string v5, "p_messages_view"

    .line 39
    .line 40
    invoke-interface/range {v0 .. v5}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Sg(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void

    .line 44
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    invoke-interface {p3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    iget-object p3, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 63
    .line 64
    iget-object p2, p2, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 65
    .line 66
    const-string v0, "p_messages_view"

    .line 67
    .line 68
    invoke-interface {p1, p0, p3, p2, v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Dk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 2

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->h(Lcom/p1/mobile/putong/data/BubbleInfo;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->r(Z)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->p(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->o(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->d:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 24
    .line 25
    new-instance v1, Ll/d5q;

    .line 26
    .line 27
    invoke-direct {v1, p0, p1, p2}, Ll/d5q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    const/4 p2, 0x1

    .line 35
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->r(Z)V

    .line 36
    .line 37
    .line 38
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->e:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 39
    .line 40
    new-instance v0, Ll/e5q;

    .line 41
    .line 42
    invoke-direct {v0, p0, p1}, Ll/e5q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public n(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 4

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 2
    .line 3
    const-string v1, "state_like"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "\u8d5e\u4e86\u4f60\u7684\u72b6\u6001"

    .line 12
    .line 13
    iput-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->i:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 16
    .line 17
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemText;->A(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->q1:Lcom/p1/mobile/putong/core/api/i;

    .line 29
    .line 30
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 42
    .line 43
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 48
    .line 49
    :goto_0
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/core/api/i;->v3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const/4 v2, 0x1

    .line 56
    invoke-virtual {v1, v2}, Lrx/c;->take(I)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-interface {p1, v0, v1}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    new-instance v0, Ll/b5q;

    .line 65
    .line 66
    invoke-direct {v0, p0, p2}, Ll/b5q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 67
    .line 68
    .line 69
    new-instance p0, Ll/c5q;

    .line 70
    .line 71
    invoke-direct {p0}, Ll/c5q;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public final o(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/data/BubbleInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->h:Lv/VText;

    .line 8
    .line 9
    const/4 v1, 0x2

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->f:Lv/VDraweeView;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    sget v0, Ll/qa00;->x:I

    .line 23
    .line 24
    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 25
    .line 26
    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->f:Lv/VDraweeView;

    .line 29
    .line 30
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->g:Lv/VText;

    .line 34
    .line 35
    const/high16 v0, 0x41800000    # 16.0f

    .line 36
    .line 37
    invoke-virtual {p1, v1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->g:Lv/VText;

    .line 41
    .line 42
    const-string p1, "#000000"

    .line 43
    .line 44
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    const/4 p1, 0x1

    .line 53
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->f:Lv/VDraweeView;

    .line 57
    .line 58
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    sget v0, Ll/qa00;->A:I

    .line 63
    .line 64
    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 65
    .line 66
    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->f:Lv/VDraweeView;

    .line 69
    .line 70
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->g:Lv/VText;

    .line 74
    .line 75
    const/high16 v0, 0x41500000    # 13.0f

    .line 76
    .line 77
    invoke-virtual {p1, v1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->g:Lv/VText;

    .line 81
    .line 82
    const-string p1, "#4c000000"

    .line 83
    .line 84
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->Z:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;

    .line 13
    .line 14
    sget v0, Ll/edc0;->h4:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/widget/FrameLayout;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->b:Landroid/widget/FrameLayout;

    .line 23
    .line 24
    sget v0, Ll/edc0;->O0:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Landroid/widget/FrameLayout;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->c:Landroid/widget/FrameLayout;

    .line 33
    .line 34
    sget v0, Ll/edc0;->i4:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->d:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 43
    .line 44
    sget v0, Ll/edc0;->j4:I

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->e:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 53
    .line 54
    sget v0, Ll/edc0;->G0:I

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lv/VDraweeView;

    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->f:Lv/VDraweeView;

    .line 63
    .line 64
    sget v0, Ll/edc0;->M0:I

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Lv/VText;

    .line 71
    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->g:Lv/VText;

    .line 73
    .line 74
    sget v0, Ll/edc0;->r0:I

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Lv/VText;

    .line 81
    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->h:Lv/VText;

    .line 83
    .line 84
    sget v0, Ll/edc0;->A4:I

    .line 85
    .line 86
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 91
    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->i:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 93
    .line 94
    return-void
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
    sput v0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->j:I

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->d:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;->setMaxWidth(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->e:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 13
    .line 14
    sget v1, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->j:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;->setMaxWidth(I)V

    .line 17
    .line 18
    .line 19
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 4
    .param p1    # Lcom/p1/mobile/putong/data/BubbleInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->f:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 6
    .line 7
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    invoke-virtual {v0, v1, v2, v3}, Ll/fsb0;->N0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->g:Lv/VText;

    .line 14
    .line 15
    iget-object v1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->h:Lv/VText;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p0, p1}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final q(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 2

    .line 1
    new-instance p0, Ll/pf60;

    .line 2
    .line 3
    const-string v0, "state_id"

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/pf60;

    .line 11
    .line 12
    const-string v1, "owner_id"

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 15
    .line 16
    invoke-direct {v0, v1, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    filled-new-array {p0, v0}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p1, "e_other_state"

    .line 24
    .line 25
    const-string v0, "p_chat_view"

    .line 26
    .line 27
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final r(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->b:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/16 v2, 0x8

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->c:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->c:Landroid/widget/FrameLayout;

    .line 21
    .line 22
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
