.class public abstract Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/p1/mobile/putong/core/api/c0$c;
.implements Ll/orl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$c;
    }
.end annotation


# static fields
.field public static v:Z


# instance fields
.field public a:Ll/orl;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public b:Ll/orl;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:Ll/orl;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:Ll/orl;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:Ll/orl;

.field public f:Ll/orl;

.field public g:Ll/orl;

.field public h:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public final i:[Ll/kcg0;

.field public j:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public k:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/orl;",
            ">;"
        }
    .end annotation
.end field

.field public m:Ll/sj6;

.field public n:Ll/w30;

.field public o:Ll/w30;

.field public final p:Ljava/lang/Runnable;

.field public final q:Ljava/lang/Runnable;

.field public r:Landroid/view/View$OnClickListener;

.field public s:Landroid/view/View$OnLongClickListener;

.field public t:Ll/x20;

.field public u:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 5
    .line 6
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->h:Lrx/subjects/a;

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    new-array p1, p1, [Ll/kcg0;

    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->i:[Ll/kcg0;

    .line 16
    .line 17
    sget-object p1, Ll/sj6;->U:Lcom/p1/mobile/putong/core/data/Message;

    .line 18
    .line 19
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->j:Lrx/subjects/a;

    .line 24
    .line 25
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->k:Lrx/subjects/a;

    .line 30
    .line 31
    new-instance p1, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 37
    .line 38
    new-instance p1, Ll/uc6;

    .line 39
    .line 40
    invoke-direct {p1, p0}, Ll/uc6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->p:Ljava/lang/Runnable;

    .line 44
    .line 45
    new-instance p1, Ll/fd6;

    .line 46
    .line 47
    invoke-direct {p1, p0}, Ll/fd6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    .line 48
    .line 49
    .line 50
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->q:Ljava/lang/Runnable;

    .line 51
    .line 52
    new-instance p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$a;

    .line 53
    .line 54
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    .line 55
    .line 56
    .line 57
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->t:Ll/x20;

    .line 58
    .line 59
    new-instance p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$b;

    .line 60
    .line 61
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$b;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    .line 62
    .line 63
    .line 64
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->u:Ll/pcj;

    .line 65
    .line 66
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 67
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 68
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->h:Lrx/subjects/a;

    const/4 p1, 0x1

    .line 69
    new-array p1, p1, [Ll/kcg0;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->i:[Ll/kcg0;

    .line 70
    sget-object p1, Ll/sj6;->U:Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p2

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->j:Lrx/subjects/a;

    .line 71
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->k:Lrx/subjects/a;

    .line 72
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 73
    new-instance p1, Ll/uc6;

    invoke-direct {p1, p0}, Ll/uc6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->p:Ljava/lang/Runnable;

    .line 74
    new-instance p1, Ll/fd6;

    invoke-direct {p1, p0}, Ll/fd6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->q:Ljava/lang/Runnable;

    .line 75
    new-instance p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->t:Ll/x20;

    .line 76
    new-instance p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$b;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$b;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->u:Ll/pcj;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 77
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 78
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->h:Lrx/subjects/a;

    const/4 p1, 0x1

    .line 79
    new-array p1, p1, [Ll/kcg0;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->i:[Ll/kcg0;

    .line 80
    sget-object p1, Ll/sj6;->U:Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p2

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->j:Lrx/subjects/a;

    .line 81
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->k:Lrx/subjects/a;

    .line 82
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 83
    new-instance p1, Ll/uc6;

    invoke-direct {p1, p0}, Ll/uc6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->p:Ljava/lang/Runnable;

    .line 84
    new-instance p1, Ll/fd6;

    invoke-direct {p1, p0}, Ll/fd6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->q:Ljava/lang/Runnable;

    .line 85
    new-instance p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->t:Ll/x20;

    .line 86
    new-instance p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$b;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$b;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->u:Ll/pcj;

    return-void
.end method

.method public static synthetic A1(Ll/sj6;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Message;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {p1, p0}, Ll/ue6;->t(Ljava/util/List;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/Message;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic B1(Ll/sj6;Ll/orl;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Ll/orl;->J(Ll/sj6;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic C1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ljava/util/ArrayList;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->h2(Ljava/util/ArrayList;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic D1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->e2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic E1()V
    .locals 2

    .line 1
    invoke-static {}, Ll/r8n;->f()Ll/r8n;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/r8n;->f:Ll/wyd0;

    .line 6
    .line 7
    const-string v1, ""

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic F1(Ll/sj6;Ljava/lang/Boolean;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-boolean v0, p0, Ll/sj6;->n:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const-string v0, "p_messages_view"

    .line 13
    .line 14
    new-array v2, v1, [Ll/sfj0$a;

    .line 15
    .line 16
    const-string v3, "e_message_limited_time_match"

    .line 17
    .line 18
    invoke-static {v3, v0, v2}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    iput-boolean v0, p0, Ll/sj6;->n:Z

    .line 23
    .line 24
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    iput-boolean v1, p0, Ll/sj6;->n:Z

    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public static synthetic G1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->k2()V

    return-void
.end method

.method public static synthetic H1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->s2(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V

    return-void
.end method

.method public static synthetic I1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->b2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic J1(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->d0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic K1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->Y1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic L1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->q2(Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/Object;)V

    return-void
.end method

.method public static bridge synthetic M1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)Landroid/view/View$OnClickListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->r:Landroid/view/View$OnClickListener;

    return-object p0
.end method

.method public static bridge synthetic N1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)Landroid/view/View$OnLongClickListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->s:Landroid/view/View$OnLongClickListener;

    return-object p0
.end method

.method public static R1(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public static synthetic b1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ll/sj6;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->X1(Ll/sj6;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Lcom/p1/mobile/putong/core/api/c0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l2(Lcom/p1/mobile/putong/core/api/c0$b;)V

    return-void
.end method

.method public static synthetic d1(Ll/sj6;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic e1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->f2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ljava/text/SimpleDateFormat;JLcom/p1/mobile/putong/core/api/c0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->Z1(Ljava/text/SimpleDateFormat;JLcom/p1/mobile/putong/core/api/c0$b;)V

    return-void
.end method

.method public static synthetic g1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->c2(Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method private getMCShowPositionStr()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sj6;->d:Ll/pol;

    .line 4
    .line 5
    instance-of v1, v0, Ll/u46;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    const-string p0, ""

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    check-cast v0, Ll/u46;

    .line 13
    .line 14
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-interface {v0}, Ll/u46;->h()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-interface {v0}, Ll/u46;->k()Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    sub-int/2addr v2, v3

    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 33
    .line 34
    if-lez v2, :cond_1

    .line 35
    .line 36
    iget p0, p0, Ll/sj6;->g:I

    .line 37
    .line 38
    add-int/lit8 p0, p0, 0x1

    .line 39
    .line 40
    sub-int/2addr p0, v2

    .line 41
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    iget p0, p0, Ll/sj6;->g:I

    .line 46
    .line 47
    add-int/lit8 p0, p0, 0x1

    .line 48
    .line 49
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    :goto_0
    const-string p0, "/"

    .line 53
    .line 54
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-interface {v0}, Ll/u46;->k()Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-nez p0, :cond_2

    .line 66
    .line 67
    invoke-interface {v0}, Ll/u46;->k()Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    invoke-interface {v0}, Ll/u46;->h()I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    :goto_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    return-object p0
.end method

.method public static synthetic h1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->U1(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method public static synthetic i1(Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    if-eq p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic j1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ll/sj6;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->a2(Ll/sj6;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ll/sj6;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->W1(Ll/sj6;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ll/sj6;Ljava/util/LinkedHashMap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->p2(Ll/sj6;Ljava/util/LinkedHashMap;)V

    return-void
.end method

.method public static synthetic m1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->j2()V

    return-void
.end method

.method public static synthetic n1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->n2()V

    return-void
.end method

.method public static synthetic p1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Lcom/p1/mobile/putong/core/api/c0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->V1(Lcom/p1/mobile/putong/core/api/c0$b;)V

    return-void
.end method

.method public static synthetic q1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->d2(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic r1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic s1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->i2(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic t1(Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    if-eq p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic u1(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;->d0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->g2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Landroid/content/Intent;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->T1(Landroid/content/Intent;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic x1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m2(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method

.method public static synthetic y1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->r2(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V

    return-void
.end method

.method public static synthetic z1(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->o2()V

    return-void
.end method


# virtual methods
.method public A(Ll/sj6;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$c;

    .line 7
    .line 8
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 9
    .line 10
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    invoke-direct {v0, p0, v2, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView$c;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p1, Ll/sj6;->d:Ll/pol;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 29
    .line 30
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/g;->Pp()Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-interface {v0, v1, v2}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/ld6;

    .line 39
    .line 40
    invoke-direct {v1, p1}, Ll/ld6;-><init>(Ll/sj6;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    new-instance v0, Ll/md6;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Ll/md6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    .line 50
    .line 51
    .line 52
    new-instance v1, Ll/nd6;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/nd6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public F0(Ll/sj6;)V
    .locals 7

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 4
    .line 5
    const-string v1, "HH:mm:ss"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-string v1, "GMT"

    .line 11
    .line 12
    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 17
    .line 18
    .line 19
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/g;->I0:Ll/byd0;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ljava/lang/Long;

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 32
    .line 33
    .line 34
    move-result-wide v1

    .line 35
    const-wide/16 v3, 0x3e8

    .line 36
    .line 37
    div-long/2addr v1, v3

    .line 38
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 41
    .line 42
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/g;->H0:Ll/byd0;

    .line 43
    .line 44
    invoke-virtual {v5}, Ll/azd0;->get()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    check-cast v5, Ljava/lang/Long;

    .line 49
    .line 50
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 51
    .line 52
    .line 53
    move-result-wide v5

    .line 54
    div-long/2addr v5, v3

    .line 55
    sub-long/2addr v1, v5

    .line 56
    iget-object v3, p1, Ll/sj6;->d:Ll/pol;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 63
    .line 64
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 65
    .line 66
    const-string v6, "countdown_conv_list_key"

    .line 67
    .line 68
    invoke-virtual {v5, v6}, Lcom/p1/mobile/putong/core/api/c0;->n(Ljava/lang/String;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    invoke-interface {v3, v4, v5}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    new-instance v4, Ll/zc6;

    .line 77
    .line 78
    invoke-direct {v4, p0, v0, v1, v2}, Ll/zc6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ljava/text/SimpleDateFormat;J)V

    .line 79
    .line 80
    .line 81
    invoke-static {v4}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v3, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    new-instance v0, Ll/ad6;

    .line 89
    .line 90
    invoke-direct {v0, p0, p1}, Ll/ad6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ll/sj6;)V

    .line 91
    .line 92
    .line 93
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 94
    .line 95
    .line 96
    new-instance v0, Ll/bd6;

    .line 97
    .line 98
    invoke-direct {v0, p0}, Ll/bd6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 102
    .line 103
    .line 104
    iget-object p0, p1, Ll/sj6;->d:Ll/pol;

    .line 105
    .line 106
    check-cast p0, Ll/u46;

    .line 107
    .line 108
    invoke-interface {p0}, Ll/u46;->v()Lrx/c;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    new-instance v0, Ll/cd6;

    .line 113
    .line 114
    invoke-direct {v0, p1}, Ll/cd6;-><init>(Ll/sj6;)V

    .line 115
    .line 116
    .line 117
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public O1()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public P1(Ll/sj6;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    new-instance v0, Ll/vc6;

    .line 4
    .line 5
    invoke-direct {v0, p0, p1}, Ll/vc6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ll/sj6;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public Q1(Ll/sj6;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    new-instance p1, Ll/pd6;

    .line 4
    .line 5
    invoke-direct {p1, p0}, Ll/pd6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final S1(Ljava/lang/String;)V
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "countdown_item_limited_trial_see"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 9
    .line 10
    iget-object v1, v1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {}, Ll/pzi0;->o()J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    const-string v3, "trialing"

    .line 26
    .line 27
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    const/4 v4, 0x1

    .line 32
    if-eqz v3, :cond_0

    .line 33
    .line 34
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->B2:Ll/sk9;

    .line 37
    .line 38
    invoke-virtual {v3}, Ll/sk9;->m3()J

    .line 39
    .line 40
    .line 41
    move-result-wide v5

    .line 42
    cmp-long v3, v1, v5

    .line 43
    .line 44
    if-gez v3, :cond_0

    .line 45
    .line 46
    new-instance p1, Lcom/p1/mobile/putong/core/api/c0$a;

    .line 47
    .line 48
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/api/c0$a;-><init>()V

    .line 49
    .line 50
    .line 51
    const-wide/16 v1, 0x1

    .line 52
    .line 53
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/putong/core/api/c0$a;->h(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1, v4}, Lcom/p1/mobile/putong/core/api/c0$a;->a(Z)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/c0$a;->g(Ljava/lang/String;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->B2:Ll/sk9;

    .line 68
    .line 69
    invoke-virtual {v1}, Ll/sk9;->m3()J

    .line 70
    .line 71
    .line 72
    move-result-wide v1

    .line 73
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/putong/core/api/c0$a;->f(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/c0$a;->d(Lcom/p1/mobile/putong/core/api/c0$c;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    goto :goto_0

    .line 82
    :cond_0
    const-string v3, "waiting"

    .line 83
    .line 84
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_1

    .line 89
    .line 90
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 91
    .line 92
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->B2:Ll/sk9;

    .line 93
    .line 94
    invoke-virtual {p1}, Ll/sk9;->m3()J

    .line 95
    .line 96
    .line 97
    move-result-wide v5

    .line 98
    cmp-long p1, v1, v5

    .line 99
    .line 100
    if-gez p1, :cond_1

    .line 101
    .line 102
    new-instance p1, Lcom/p1/mobile/putong/core/api/c0$a;

    .line 103
    .line 104
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/api/c0$a;-><init>()V

    .line 105
    .line 106
    .line 107
    const-wide/16 v1, 0x3c

    .line 108
    .line 109
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/putong/core/api/c0$a;->h(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-virtual {p1, v4}, Lcom/p1/mobile/putong/core/api/c0$a;->a(Z)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/c0$a;->g(Ljava/lang/String;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 122
    .line 123
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->B2:Ll/sk9;

    .line 124
    .line 125
    invoke-virtual {v1}, Ll/sk9;->m3()J

    .line 126
    .line 127
    .line 128
    move-result-wide v1

    .line 129
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/putong/core/api/c0$a;->f(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/c0$a;->d(Lcom/p1/mobile/putong/core/api/c0$c;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    goto :goto_0

    .line 138
    :cond_1
    const/4 p1, 0x0

    .line 139
    :goto_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-eqz v1, :cond_2

    .line 144
    .line 145
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 146
    .line 147
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 148
    .line 149
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/api/c0;->r(Lcom/p1/mobile/putong/core/api/c0$a;)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 153
    .line 154
    iget-object p1, p1, Ll/sj6;->d:Ll/pol;

    .line 155
    .line 156
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 161
    .line 162
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 163
    .line 164
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/api/c0;->n(Ljava/lang/String;)Lrx/c;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-interface {p1, v1, v0}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    new-instance v0, Ll/rd6;

    .line 173
    .line 174
    invoke-direct {v0, p0}, Ll/rd6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    .line 175
    .line 176
    .line 177
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 182
    .line 183
    .line 184
    return-void

    .line 185
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 186
    .line 187
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 188
    .line 189
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/c0;->u(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    return-void
.end method

.method public final synthetic T1(Landroid/content/Intent;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic U1(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->j:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic V1(Lcom/p1/mobile/putong/core/api/c0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->v2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic W1(Ll/sj6;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    iget p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 4
    .line 5
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const-string v0, "cityc_red_dot_number"

    .line 10
    .line 11
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 18
    .line 19
    const-string v0, "city_c_cell_uid"

    .line 20
    .line 21
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    filled-new-array {p2, p1}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string p2, "e_city_cover_received_greet"

    .line 30
    .line 31
    const-string v0, "p_messages_view"

    .line 32
    .line 33
    invoke-static {p2, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;->Z1(Landroid/content/Context;)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic X1(Ll/sj6;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/fcp;->i()Ll/fcp;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Ll/fcp;->f()V

    .line 6
    .line 7
    .line 8
    const-string p2, "e_letter_receive_entrance"

    .line 9
    .line 10
    const-string v0, "p_messages_view"

    .line 11
    .line 12
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-object p1, p1, Ll/sj6;->F:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/SeeLetterListAct;->Z1(Landroid/content/Context;I)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic Y1(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "p_messages,seetrial_recover_group"

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 8
    .line 9
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->x0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic Z1(Ljava/text/SimpleDateFormat;JLcom/p1/mobile/putong/core/api/c0$b;)V
    .locals 9

    .line 1
    iget-object v0, p4, Lcom/p1/mobile/putong/core/api/c0$b;->b:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "countdown_conv_list_key"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-wide v3, p4, Lcom/p1/mobile/putong/core/api/c0$b;->f:J

    .line 12
    .line 13
    iget-wide v5, p4, Lcom/p1/mobile/putong/core/api/c0$b;->d:J

    .line 14
    .line 15
    move-object v1, p0

    .line 16
    move-object v2, p1

    .line 17
    move-wide v7, p2

    .line 18
    invoke-interface/range {v1 .. v8}, Ll/nrl;->r(Ljava/text/SimpleDateFormat;JJJ)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final synthetic a2(Ll/sj6;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p2, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-interface {p0, p2}, Ll/ue6;->k(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    const/16 v0, 0x1d

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-static {p0, p1, v1, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l2(Landroid/content/Context;Ljava/lang/String;ZZI)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 26
    .line 27
    .line 28
    const-string p0, "p_messages_view"

    .line 29
    .line 30
    new-array p1, v1, [Ll/sfj0$a;

    .line 31
    .line 32
    const-string p2, "e_message_limited_time_match"

    .line 33
    .line 34
    invoke-static {p2, p0, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic b2(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->o:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic c2(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/g;->sp()V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0}, Ll/ue6;->h()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->o:Ll/w30;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic d2(Landroid/view/View;)Z
    .locals 4

    .line 1
    new-instance v0, Ll/w30$b;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {v0, p1}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    sget v1, Lcom/p1/mobile/putong/core/R$string;->j:I

    .line 15
    .line 16
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const/4 v1, 0x1

    .line 21
    new-array v1, v1, [Ljava/lang/CharSequence;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    aput-object p1, v1, v2

    .line 25
    .line 26
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    sget v3, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 35
    .line 36
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/vd6;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/vd6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0, p1}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    new-instance v0, Ll/wd6;

    .line 58
    .line 59
    invoke-direct {v0, p0}, Ll/wd6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, v0}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p1}, Ll/w30$b;->F()Ll/w30;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->o:Ll/w30;

    .line 71
    .line 72
    invoke-virtual {p1}, Ll/w30;->f()V

    .line 73
    .line 74
    .line 75
    return v2
.end method

.method public final synthetic e2(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 18
    .line 19
    if-ne p0, v0, :cond_0

    .line 20
    .line 21
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 28
    .line 29
    const-string v0, "deleted"

    .line 30
    .line 31
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_0

    .line 36
    .line 37
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 38
    .line 39
    const-string v0, "removed"

    .line 40
    .line 41
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-nez p0, :cond_0

    .line 46
    .line 47
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 48
    .line 49
    const-string p1, "invisible"

    .line 50
    .line 51
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-nez p0, :cond_0

    .line 56
    .line 57
    sget p0, Lcom/p1/mobile/putong/core/R$string;->hm:I

    .line 58
    .line 59
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 60
    .line 61
    .line 62
    :cond_0
    return-void
.end method

.method public final synthetic f2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object p1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-ne p0, p1, :cond_0

    .line 12
    .line 13
    sget p0, Lcom/p1/mobile/putong/core/R$string;->gm:I

    .line 14
    .line 15
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final synthetic g2(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->o:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic getUserLiveLabelHashMap()Ljava/util/HashMap;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ue6;->getUserLiveLabelHashMap()Ljava/util/HashMap;

    move-result-object p0

    return-object p0
.end method

.method public h0(Ll/sj6;)V
    .locals 2

    .line 1
    const-string v0, "e_letter_receive_entrance"

    .line 2
    .line 3
    const-string v1, "p_messages_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/od6;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1}, Ll/od6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ll/sj6;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic h2(Ljava/util/ArrayList;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->o:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-ge p4, p1, :cond_1

    .line 11
    .line 12
    if-gez p4, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->o:Ll/w30;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 18
    .line 19
    .line 20
    iget-object p0, p3, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 21
    .line 22
    const-string p1, "\u5220\u9664\u804a\u5929"

    .line 23
    .line 24
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 33
    .line 34
    iget-object p0, p0, Ll/dkb;->Q1:Ll/byd0;

    .line 35
    .line 36
    const-wide/16 p1, -0x1

    .line 37
    .line 38
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->A2()V

    .line 46
    .line 47
    .line 48
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic i2(Landroid/view/View;)Z
    .locals 3

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/g;->X0:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    new-instance p1, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v0, "\u5220\u9664\u804a\u5929"

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    new-instance v0, Ll/w30$b;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-direct {v0, v1}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    sget v2, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/xd6;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/xd6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0, p1}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v1, Ll/yd6;

    .line 70
    .line 71
    invoke-direct {v1, p0, p1}, Ll/yd6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ljava/util/ArrayList;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p1}, Ll/w30$b;->F()Ll/w30;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->o:Ll/w30;

    .line 83
    .line 84
    invoke-virtual {p1}, Ll/w30;->f()V

    .line 85
    .line 86
    .line 87
    const/4 p0, 0x1

    .line 88
    return p0

    .line 89
    :cond_0
    const/4 p0, 0x0

    .line 90
    return p0
.end method

.method public final synthetic j2()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->m:Ll/mm6;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 6
    .line 7
    iget-object p0, p0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ll/wzh0;->delete(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic k2()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/fe6;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/fe6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic l2(Lcom/p1/mobile/putong/core/api/c0$b;)V
    .locals 1

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
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/api/c0$b;->a:Z

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->B2:Ll/sk9;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/sk9;->y3()V

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->v2()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public m(Ll/sj6;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;-><init>(Ll/sj6;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isTop()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    iget-object v1, p1, Ll/sj6;->y:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    sget v1, Ll/dbc0;->Zu:I

    .line 29
    .line 30
    invoke-virtual {p0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    sget v1, Ll/dbc0;->Yu:I

    .line 35
    .line 36
    invoke-virtual {p0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 37
    .line 38
    .line 39
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    instance-of v1, v1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 44
    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    iget-object p1, p1, Ll/sj6;->d:Ll/pol;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o7()Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-interface {p1, v1, p0}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    new-instance p1, Ll/wc6;

    .line 68
    .line 69
    invoke-direct {p1}, Ll/wc6;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    new-instance p1, Ll/xc6;

    .line 77
    .line 78
    invoke-direct {p1, v0}, Ll/xc6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;)V

    .line 79
    .line 80
    .line 81
    invoke-static {p1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    :cond_1
    return-void
.end method

.method public m0(Ll/sj6;)V
    .locals 0

    .line 1
    sget-object p1, Ll/for;->INSTANCE:Ll/for;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/for;->e()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->S1(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    new-instance p1, Ll/yc6;

    .line 11
    .line 12
    invoke-direct {p1, p0}, Ll/yc6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic m2(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/r8n;->f()Ll/r8n;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/r8n;->k:Ll/wyd0;

    .line 6
    .line 7
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/r8n;->f()Ll/r8n;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/r8n;->p(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 24
    .line 25
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 28
    .line 29
    .line 30
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 31
    .line 32
    const-string v0, "matched"

    .line 33
    .line 34
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-eqz p2, :cond_0

    .line 39
    .line 40
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 43
    .line 44
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->C7(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    invoke-static {}, Ll/r8n;->f()Ll/r8n;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 54
    .line 55
    const/4 v1, 0x1

    .line 56
    invoke-virtual {p2, v0, v1}, Ll/r8n;->r(Ljava/lang/String;Z)V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->g()Z

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    if-eqz p2, :cond_1

    .line 64
    .line 65
    invoke-static {}, Ll/o3z;->g()Ll/o3z;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {p2, p1}, Ll/o3z;->k(Ljava/lang/String;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-static {}, Ll/psd0;->B()Ll/gcg0;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 83
    .line 84
    iget-object p0, p0, Ll/sj6;->d:Ll/pol;

    .line 85
    .line 86
    instance-of p1, p0, Ll/u46;

    .line 87
    .line 88
    if-eqz p1, :cond_2

    .line 89
    .line 90
    check-cast p0, Ll/u46;

    .line 91
    .line 92
    invoke-interface {p0}, Ll/u46;->q()V

    .line 93
    .line 94
    .line 95
    :cond_2
    return-void
.end method

.method public final synthetic n2()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 16
    .line 17
    iget-object p0, p0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->yp(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final synthetic o2()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 16
    .line 17
    iget-object p0, p0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->xp(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 41

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->f:Ll/orl;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/nrl;->K0()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_16

    .line 12
    .line 13
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 14
    .line 15
    iget-object v2, v1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 16
    .line 17
    iget-object v1, v1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    invoke-static {v2}, Ll/ue6;->o(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_1

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 38
    .line 39
    new-instance v5, Ll/qd6;

    .line 40
    .line 41
    invoke-direct {v5, v0, v2}, Ll/qd6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 42
    .line 43
    .line 44
    const-string v0, "p_message,blur_cell"

    .line 45
    .line 46
    invoke-interface {v1, v3, v0, v4, v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 51
    .line 52
    invoke-interface {v0, v3}, Ll/ue6;->w(Ll/sj6;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v2}, Ll/br5;->f(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    const/4 v4, 0x1

    .line 60
    const-string v5, "p_messages_view"

    .line 61
    .line 62
    if-eqz v3, :cond_2

    .line 63
    .line 64
    const-string v3, "e_message_tab_compliment_cell_click"

    .line 65
    .line 66
    invoke-static {v3, v5}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    sget-boolean v6, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->v:Z

    .line 70
    .line 71
    if-nez v6, :cond_2

    .line 72
    .line 73
    invoke-static {v3, v5}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    sput-boolean v4, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->v:Z

    .line 77
    .line 78
    :cond_2
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    const/4 v6, 0x0

    .line 83
    if-eqz v3, :cond_5

    .line 84
    .line 85
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 86
    .line 87
    iget-object v3, v3, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 88
    .line 89
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    if-eqz v3, :cond_5

    .line 94
    .line 95
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 96
    .line 97
    iget-object v3, v3, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 98
    .line 99
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 100
    .line 101
    const-string v7, "intlSeeChatRequest"

    .line 102
    .line 103
    invoke-static {v3, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    if-eqz v3, :cond_5

    .line 108
    .line 109
    invoke-static {}, Ll/rbb0;->q()Z

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    if-nez v2, :cond_3

    .line 114
    .line 115
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->t2()V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_3
    invoke-static {}, Ll/r8n;->f()Ll/r8n;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    iget-object v2, v2, Ll/r8n;->f:Ll/wyd0;

    .line 124
    .line 125
    iget-object v3, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {v2, v3}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    invoke-static {}, Ll/r8n;->f()Ll/r8n;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    iget-object v3, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 135
    .line 136
    invoke-virtual {v2, v3, v6, v4}, Ll/r8n;->s(Ljava/lang/String;ZZ)V

    .line 137
    .line 138
    .line 139
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 140
    .line 141
    iget-boolean v2, v2, Ll/sj6;->e:Z

    .line 142
    .line 143
    if-eqz v2, :cond_4

    .line 144
    .line 145
    const-string v2, "matchList"

    .line 146
    .line 147
    goto :goto_0

    .line 148
    :cond_4
    const-string v2, "chatList"

    .line 149
    .line 150
    :goto_0
    const-string v3, "show_where"

    .line 151
    .line 152
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 157
    .line 158
    iget-object v3, v3, Ll/sj6;->i:Ljava/lang/String;

    .line 159
    .line 160
    const-string v7, "request_show_type"

    .line 161
    .line 162
    invoke-static {v7, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    const-string v7, "show_position"

    .line 167
    .line 168
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->getMCShowPositionStr()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v8

    .line 172
    invoke-static {v7, v8}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 173
    .line 174
    .line 175
    move-result-object v7

    .line 176
    const-string v8, "chat_request_operate"

    .line 177
    .line 178
    const-string v9, "click"

    .line 179
    .line 180
    invoke-static {v8, v9}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 181
    .line 182
    .line 183
    move-result-object v8

    .line 184
    filled-new-array {v2, v3, v7, v8}, [Ll/pf60;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    const-string v3, "e_chat_request_operate"

    .line 189
    .line 190
    invoke-static {v3, v5, v2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 191
    .line 192
    .line 193
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 198
    .line 199
    .line 200
    move-result-object v7

    .line 201
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 202
    .line 203
    .line 204
    move-result-object v8

    .line 205
    sget-object v10, Lcom/p1/mobile/putong/core/data/Privilege;->see_chat_request_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 206
    .line 207
    new-instance v11, Ll/zd6;

    .line 208
    .line 209
    invoke-direct {v11}, Ll/zd6;-><init>()V

    .line 210
    .line 211
    .line 212
    iget-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 213
    .line 214
    const/4 v3, 0x2

    .line 215
    new-array v3, v3, [Ljava/lang/CharSequence;

    .line 216
    .line 217
    const-string v5, "chat_request_"

    .line 218
    .line 219
    aput-object v5, v3, v6

    .line 220
    .line 221
    aput-object v2, v3, v4

    .line 222
    .line 223
    invoke-static {v3}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 224
    .line 225
    .line 226
    move-result-object v2

    .line 227
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v12

    .line 231
    const-string v9, "p_messages_view,e_chat_request,click"

    .line 232
    .line 233
    invoke-interface/range {v7 .. v12}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Sl(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ljava/lang/Object;)V

    .line 234
    .line 235
    .line 236
    invoke-static {}, Ll/fp60;->E()Lrx/c;

    .line 237
    .line 238
    .line 239
    move-result-object v2

    .line 240
    new-instance v3, Ll/ae6;

    .line 241
    .line 242
    invoke-direct {v3, v0, v1}, Ll/ae6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Lcom/p1/mobile/putong/data/User;)V

    .line 243
    .line 244
    .line 245
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    invoke-virtual {v2, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 250
    .line 251
    .line 252
    return-void

    .line 253
    :cond_5
    invoke-static {}, Ll/r8n;->f()Ll/r8n;

    .line 254
    .line 255
    .line 256
    move-result-object v3

    .line 257
    iget-object v3, v3, Ll/r8n;->b:Lrx/subjects/a;

    .line 258
    .line 259
    invoke-virtual {v3}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 260
    .line 261
    .line 262
    move-result-object v3

    .line 263
    if-eqz v3, :cond_6

    .line 264
    .line 265
    invoke-static {}, Ll/r8n;->f()Ll/r8n;

    .line 266
    .line 267
    .line 268
    move-result-object v3

    .line 269
    iget-object v3, v3, Ll/r8n;->b:Lrx/subjects/a;

    .line 270
    .line 271
    invoke-virtual {v3}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 272
    .line 273
    .line 274
    move-result-object v3

    .line 275
    check-cast v3, Lcom/p1/mobile/putong/core/data/InsertConversationsList;

    .line 276
    .line 277
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->users:Ljava/util/List;

    .line 278
    .line 279
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 280
    .line 281
    .line 282
    move-result v3

    .line 283
    if-nez v3, :cond_6

    .line 284
    .line 285
    invoke-static {}, Ll/fp60;->E()Lrx/c;

    .line 286
    .line 287
    .line 288
    move-result-object v3

    .line 289
    new-instance v7, Ll/be6;

    .line 290
    .line 291
    invoke-direct {v7, v0}, Ll/be6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    .line 292
    .line 293
    .line 294
    invoke-static {v7}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 295
    .line 296
    .line 297
    move-result-object v7

    .line 298
    invoke-virtual {v3, v7}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 299
    .line 300
    .line 301
    :cond_6
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->a:Ll/orl;

    .line 302
    .line 303
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 304
    .line 305
    .line 306
    move-result v3

    .line 307
    const-string v7, "e_red_dot_message_chat"

    .line 308
    .line 309
    if-eqz v3, :cond_7

    .line 310
    .line 311
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->a:Ll/orl;

    .line 312
    .line 313
    invoke-interface {v3}, Ll/nrl;->O()Z

    .line 314
    .line 315
    .line 316
    move-result v3

    .line 317
    if-eqz v3, :cond_7

    .line 318
    .line 319
    const-string v3, "message_list_page"

    .line 320
    .line 321
    const-string v8, "tips"

    .line 322
    .line 323
    const-string v9, "red_dot"

    .line 324
    .line 325
    const-string v10, "red_dot_normal"

    .line 326
    .line 327
    const-string v11, "chat_bar"

    .line 328
    .line 329
    invoke-static {v9, v10, v11, v3, v8}, Ll/i6e;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;

    .line 330
    .line 331
    .line 332
    move-result-object v3

    .line 333
    invoke-static {v7, v5, v3}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 334
    .line 335
    .line 336
    goto :goto_1

    .line 337
    :cond_7
    invoke-static {}, Ll/i6e;->d()Ljava/util/Map;

    .line 338
    .line 339
    .line 340
    move-result-object v3

    .line 341
    invoke-static {v7, v5, v3}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 342
    .line 343
    .line 344
    :goto_1
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 345
    .line 346
    iget-object v3, v3, Ll/sj6;->J:Ll/x20;

    .line 347
    .line 348
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 349
    .line 350
    .line 351
    move-result v3

    .line 352
    if-eqz v3, :cond_8

    .line 353
    .line 354
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 355
    .line 356
    iget-object v3, v3, Ll/sj6;->J:Ll/x20;

    .line 357
    .line 358
    invoke-interface {v3}, Ll/x20;->call()V

    .line 359
    .line 360
    .line 361
    :cond_8
    invoke-static {}, Ll/gra;->V1()Z

    .line 362
    .line 363
    .line 364
    move-result v3

    .line 365
    if-eqz v3, :cond_a

    .line 366
    .line 367
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 368
    .line 369
    .line 370
    move-result v3

    .line 371
    if-eqz v3, :cond_a

    .line 372
    .line 373
    invoke-static {v2}, Ll/pm6;->a(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 374
    .line 375
    .line 376
    move-result v3

    .line 377
    if-eqz v3, :cond_a

    .line 378
    .line 379
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 380
    .line 381
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 382
    .line 383
    iget-object v7, v2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 384
    .line 385
    invoke-virtual {v3, v7}, Lcom/p1/mobile/putong/core/api/e;->h7(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 386
    .line 387
    .line 388
    move-result-object v3

    .line 389
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 390
    .line 391
    .line 392
    move-result v7

    .line 393
    iget-object v8, v2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 394
    .line 395
    const-string v9, "is_anonymou_group"

    .line 396
    .line 397
    const-string v10, "groupchat_id"

    .line 398
    .line 399
    const-string v11, "e_group_item"

    .line 400
    .line 401
    if-eqz v7, :cond_9

    .line 402
    .line 403
    invoke-static {v10, v8}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 404
    .line 405
    .line 406
    move-result-object v7

    .line 407
    invoke-static {v3}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 408
    .line 409
    .line 410
    move-result v3

    .line 411
    invoke-static {v9, v3}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 412
    .line 413
    .line 414
    move-result-object v3

    .line 415
    filled-new-array {v7, v3}, [Ll/sfj0$a;

    .line 416
    .line 417
    .line 418
    move-result-object v3

    .line 419
    invoke-static {v11, v5, v3}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 420
    .line 421
    .line 422
    goto :goto_2

    .line 423
    :cond_9
    invoke-static {v10, v8}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 424
    .line 425
    .line 426
    move-result-object v3

    .line 427
    invoke-static {v9, v6}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 428
    .line 429
    .line 430
    move-result-object v7

    .line 431
    filled-new-array {v3, v7}, [Ll/sfj0$a;

    .line 432
    .line 433
    .line 434
    move-result-object v3

    .line 435
    invoke-static {v11, v5, v3}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 436
    .line 437
    .line 438
    :cond_a
    :goto_2
    invoke-static {}, Ll/l600;->a()V

    .line 439
    .line 440
    .line 441
    invoke-static {}, Ll/d79;->U()Z

    .line 442
    .line 443
    .line 444
    move-result v3

    .line 445
    const-string v7, "is_red_dot"

    .line 446
    .line 447
    const-string v8, "0"

    .line 448
    .line 449
    const-string v9, "1"

    .line 450
    .line 451
    const-string v10, ""

    .line 452
    .line 453
    if-nez v3, :cond_b

    .line 454
    .line 455
    invoke-static {}, Ll/gra;->I2()Z

    .line 456
    .line 457
    .line 458
    move-result v3

    .line 459
    if-eqz v3, :cond_c

    .line 460
    .line 461
    :cond_b
    iget-object v3, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 462
    .line 463
    const-string v11, "fake_conversation_greeting"

    .line 464
    .line 465
    invoke-static {v3, v11}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 466
    .line 467
    .line 468
    move-result v3

    .line 469
    const-string v11, "fake_conversation_anonymous_greeting"

    .line 470
    .line 471
    if-nez v3, :cond_21

    .line 472
    .line 473
    iget-object v3, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 474
    .line 475
    invoke-static {v3, v11}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 476
    .line 477
    .line 478
    move-result v3

    .line 479
    if-eqz v3, :cond_c

    .line 480
    .line 481
    goto/16 :goto_13

    .line 482
    .line 483
    :cond_c
    invoke-static {}, Ll/spl0;->X()Z

    .line 484
    .line 485
    .line 486
    move-result v3

    .line 487
    if-eqz v3, :cond_10

    .line 488
    .line 489
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 490
    .line 491
    .line 492
    move-result-object v3

    .line 493
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 494
    .line 495
    .line 496
    move-result-object v3

    .line 497
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/data/Conversation;->isLimitedTrialSee(Ljava/lang/String;)Z

    .line 498
    .line 499
    .line 500
    move-result v3

    .line 501
    if-eqz v3, :cond_10

    .line 502
    .line 503
    invoke-static {}, Ll/joa;->M3()Z

    .line 504
    .line 505
    .line 506
    move-result v3

    .line 507
    if-nez v3, :cond_10

    .line 508
    .line 509
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 510
    .line 511
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 512
    .line 513
    invoke-virtual {v3}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 514
    .line 515
    .line 516
    move-result-object v3

    .line 517
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 518
    .line 519
    .line 520
    move-result v3

    .line 521
    if-nez v3, :cond_10

    .line 522
    .line 523
    sget-object v3, Ll/for;->INSTANCE:Ll/for;

    .line 524
    .line 525
    invoke-virtual {v3}, Ll/for;->e()Ljava/lang/String;

    .line 526
    .line 527
    .line 528
    move-result-object v3

    .line 529
    const-string v11, "trialEnd"

    .line 530
    .line 531
    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 532
    .line 533
    .line 534
    move-result v11

    .line 535
    if-nez v11, :cond_f

    .line 536
    .line 537
    const-string v11, "waiting"

    .line 538
    .line 539
    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 540
    .line 541
    .line 542
    move-result v11

    .line 543
    if-nez v11, :cond_f

    .line 544
    .line 545
    const-string v11, "expired"

    .line 546
    .line 547
    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 548
    .line 549
    .line 550
    move-result v3

    .line 551
    if-eqz v3, :cond_d

    .line 552
    .line 553
    goto :goto_5

    .line 554
    :cond_d
    invoke-interface {v0, v1}, Ll/ue6;->k(Lcom/p1/mobile/putong/data/User;)V

    .line 555
    .line 556
    .line 557
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 558
    .line 559
    .line 560
    move-result-object v3

    .line 561
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 562
    .line 563
    .line 564
    move-result-object v11

    .line 565
    iget-object v12, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 566
    .line 567
    iget-object v13, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 568
    .line 569
    iget-object v13, v13, Ll/sj6;->p:Ljava/lang/String;

    .line 570
    .line 571
    if-eqz v1, :cond_e

    .line 572
    .line 573
    iget-object v14, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 574
    .line 575
    invoke-static {v14}, Lcom/p1/mobile/putong/data/User;->isAiStory(Ljava/lang/String;)Z

    .line 576
    .line 577
    .line 578
    move-result v14

    .line 579
    if-eqz v14, :cond_e

    .line 580
    .line 581
    move/from16 v17, v4

    .line 582
    .line 583
    :goto_3
    move-object/from16 v16, v13

    .line 584
    .line 585
    goto :goto_4

    .line 586
    :cond_e
    move/from16 v17, v6

    .line 587
    .line 588
    goto :goto_3

    .line 589
    :goto_4
    const/4 v13, 0x0

    .line 590
    const/4 v14, 0x0

    .line 591
    const/16 v15, 0x1d

    .line 592
    .line 593
    invoke-static/range {v11 .. v17}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->N2(Landroid/content/Context;Ljava/lang/String;ZZILjava/lang/String;Z)Landroid/content/Intent;

    .line 594
    .line 595
    .line 596
    move-result-object v11

    .line 597
    invoke-virtual {v3, v11}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 598
    .line 599
    .line 600
    goto :goto_8

    .line 601
    :cond_f
    :goto_5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 602
    .line 603
    .line 604
    move-result-object v3

    .line 605
    const-string v11, "p_messages,seetrial_recover_one"

    .line 606
    .line 607
    sget-object v12, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 608
    .line 609
    invoke-static {v3, v11, v12}, Lcom/p1/mobile/putong/core/ui/purchase/c;->x0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 610
    .line 611
    .line 612
    goto :goto_8

    .line 613
    :cond_10
    invoke-interface {v0, v1}, Ll/ue6;->k(Lcom/p1/mobile/putong/data/User;)V

    .line 614
    .line 615
    .line 616
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 617
    .line 618
    .line 619
    move-result-object v3

    .line 620
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 621
    .line 622
    .line 623
    move-result-object v11

    .line 624
    iget-object v12, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 625
    .line 626
    iget-object v13, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 627
    .line 628
    iget-object v13, v13, Ll/sj6;->p:Ljava/lang/String;

    .line 629
    .line 630
    if-eqz v1, :cond_11

    .line 631
    .line 632
    iget-object v14, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 633
    .line 634
    invoke-static {v14}, Lcom/p1/mobile/putong/data/User;->isAiStory(Ljava/lang/String;)Z

    .line 635
    .line 636
    .line 637
    move-result v14

    .line 638
    if-eqz v14, :cond_11

    .line 639
    .line 640
    move/from16 v17, v4

    .line 641
    .line 642
    :goto_6
    move-object/from16 v16, v13

    .line 643
    .line 644
    goto :goto_7

    .line 645
    :cond_11
    move/from16 v17, v6

    .line 646
    .line 647
    goto :goto_6

    .line 648
    :goto_7
    const/4 v13, 0x0

    .line 649
    const/4 v14, 0x0

    .line 650
    const/16 v15, 0x1d

    .line 651
    .line 652
    invoke-static/range {v11 .. v17}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->N2(Landroid/content/Context;Ljava/lang/String;ZZILjava/lang/String;Z)Landroid/content/Intent;

    .line 653
    .line 654
    .line 655
    move-result-object v11

    .line 656
    invoke-virtual {v3, v11}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 657
    .line 658
    .line 659
    :goto_8
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 660
    .line 661
    .line 662
    move-result v3

    .line 663
    if-eqz v3, :cond_12

    .line 664
    .line 665
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 666
    .line 667
    invoke-static {}, Ll/syu;->h()Ljava/lang/String;

    .line 668
    .line 669
    .line 670
    move-result-object v11

    .line 671
    invoke-static {v3, v11}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 672
    .line 673
    .line 674
    move-result v3

    .line 675
    if-eqz v3, :cond_12

    .line 676
    .line 677
    const-string v3, "e_live_vip_customer_service"

    .line 678
    .line 679
    new-array v11, v6, [Ll/sfj0$a;

    .line 680
    .line 681
    invoke-static {v3, v5, v11}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 682
    .line 683
    .line 684
    :cond_12
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 685
    .line 686
    .line 687
    move-result v3

    .line 688
    if-eqz v3, :cond_13

    .line 689
    .line 690
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 691
    .line 692
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 693
    .line 694
    .line 695
    move-result v3

    .line 696
    if-eqz v3, :cond_13

    .line 697
    .line 698
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 699
    .line 700
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 701
    .line 702
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 703
    .line 704
    .line 705
    move-result v3

    .line 706
    if-eqz v3, :cond_13

    .line 707
    .line 708
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 709
    .line 710
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 711
    .line 712
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;->type:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTagType;

    .line 713
    .line 714
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 715
    .line 716
    .line 717
    move-result v3

    .line 718
    if-eqz v3, :cond_13

    .line 719
    .line 720
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 721
    .line 722
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 723
    .line 724
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;->type:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTagType;

    .line 725
    .line 726
    const-string v11, "unknown_"

    .line 727
    .line 728
    invoke-static {v3, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 729
    .line 730
    .line 731
    move-result v3

    .line 732
    if-nez v3, :cond_13

    .line 733
    .line 734
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 735
    .line 736
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 737
    .line 738
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;->type:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTagType;

    .line 739
    .line 740
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 741
    .line 742
    .line 743
    move-result-object v3

    .line 744
    goto :goto_9

    .line 745
    :cond_13
    move-object v3, v10

    .line 746
    :goto_9
    iget-object v11, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 747
    .line 748
    iget-object v11, v11, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 749
    .line 750
    invoke-interface {v0, v11}, Ll/ue6;->Z0(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 751
    .line 752
    .line 753
    move-result v11

    .line 754
    if-eqz v11, :cond_14

    .line 755
    .line 756
    iget-object v11, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 757
    .line 758
    iget-object v11, v11, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 759
    .line 760
    invoke-virtual {v11}, Lcom/p1/mobile/putong/core/data/Conversation;->hasRemoveLabel()Z

    .line 761
    .line 762
    .line 763
    move-result v11

    .line 764
    if-nez v11, :cond_14

    .line 765
    .line 766
    iget-object v11, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 767
    .line 768
    iget-object v11, v11, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 769
    .line 770
    iget v11, v11, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 771
    .line 772
    if-nez v11, :cond_14

    .line 773
    .line 774
    new-instance v11, Ljava/lang/StringBuilder;

    .line 775
    .line 776
    const-string v12, "1,"

    .line 777
    .line 778
    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 779
    .line 780
    .line 781
    invoke-static {}, Ll/n46;->g()Ll/n46;

    .line 782
    .line 783
    .line 784
    move-result-object v12

    .line 785
    iget-object v13, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 786
    .line 787
    invoke-virtual {v12, v13, v4}, Ll/n46;->j(Ljava/lang/String;Z)Ljava/lang/String;

    .line 788
    .line 789
    .line 790
    move-result-object v12

    .line 791
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 792
    .line 793
    .line 794
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 795
    .line 796
    .line 797
    move-result-object v11

    .line 798
    goto :goto_a

    .line 799
    :cond_14
    move-object v11, v10

    .line 800
    :goto_a
    iget-object v12, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 801
    .line 802
    invoke-interface {v0, v12}, Ll/ue6;->q(Ll/sj6;)Z

    .line 803
    .line 804
    .line 805
    move-result v12

    .line 806
    if-eqz v12, :cond_15

    .line 807
    .line 808
    const-string v12, "gotoreply"

    .line 809
    .line 810
    goto :goto_b

    .line 811
    :cond_15
    iget-object v12, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 812
    .line 813
    iget-object v12, v12, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 814
    .line 815
    iget v13, v12, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 816
    .line 817
    if-gtz v13, :cond_17

    .line 818
    .line 819
    invoke-interface {v0, v12}, Ll/ue6;->p0(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 820
    .line 821
    .line 822
    move-result v12

    .line 823
    if-eqz v12, :cond_17

    .line 824
    .line 825
    iget-object v12, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 826
    .line 827
    iget-object v12, v12, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 828
    .line 829
    iget-object v12, v12, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 830
    .line 831
    iget-object v12, v12, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 832
    .line 833
    iget-object v12, v12, Lcom/p1/mobile/putong/core/data/ConversationTag;->suggestExpireTime:Ljava/lang/String;

    .line 834
    .line 835
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 836
    .line 837
    .line 838
    move-result v12

    .line 839
    if-nez v12, :cond_17

    .line 840
    .line 841
    invoke-static {}, Ll/pzi0;->o()J

    .line 842
    .line 843
    .line 844
    move-result-wide v12

    .line 845
    iget-object v14, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 846
    .line 847
    iget-object v14, v14, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 848
    .line 849
    iget-object v14, v14, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 850
    .line 851
    iget-object v14, v14, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 852
    .line 853
    iget-object v14, v14, Lcom/p1/mobile/putong/core/data/ConversationTag;->suggestExpireTime:Ljava/lang/String;

    .line 854
    .line 855
    invoke-static {v14}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 856
    .line 857
    .line 858
    move-result-wide v14

    .line 859
    const-wide/16 v16, 0x3e8

    .line 860
    .line 861
    mul-long v14, v14, v16

    .line 862
    .line 863
    cmp-long v12, v12, v14

    .line 864
    .line 865
    if-gez v12, :cond_17

    .line 866
    .line 867
    iget-object v12, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 868
    .line 869
    iget-object v12, v12, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 870
    .line 871
    iget-object v12, v12, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 872
    .line 873
    iget-object v12, v12, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 874
    .line 875
    iget-object v12, v12, Lcom/p1/mobile/putong/core/data/ConversationTag;->emoji:Ljava/lang/String;

    .line 876
    .line 877
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 878
    .line 879
    .line 880
    move-result v12

    .line 881
    if-nez v12, :cond_16

    .line 882
    .line 883
    const-string v12, "emoji"

    .line 884
    .line 885
    goto :goto_b

    .line 886
    :cond_16
    iget-object v12, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 887
    .line 888
    iget-object v12, v12, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 889
    .line 890
    iget-object v12, v12, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 891
    .line 892
    iget-object v12, v12, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 893
    .line 894
    iget-object v12, v12, Lcom/p1/mobile/putong/core/data/ConversationTag;->suggestText:Ljava/lang/String;

    .line 895
    .line 896
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 897
    .line 898
    .line 899
    move-result v12

    .line 900
    if-nez v12, :cond_17

    .line 901
    .line 902
    const-string v12, "startchat"

    .line 903
    .line 904
    goto :goto_b

    .line 905
    :cond_17
    move-object v12, v10

    .line 906
    :goto_b
    sget-object v13, Ll/c17;->h:Ljava/text/DecimalFormat;

    .line 907
    .line 908
    iget-wide v14, v2, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 909
    .line 910
    invoke-virtual {v13, v14, v15}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 911
    .line 912
    .line 913
    move-result-object v13

    .line 914
    const-string v14, "create_time"

    .line 915
    .line 916
    invoke-static {v14, v13}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 917
    .line 918
    .line 919
    move-result-object v15

    .line 920
    sget-object v13, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 921
    .line 922
    iget-object v13, v13, Lcom/p1/mobile/putong/core/api/c;->N0:Lcom/p1/mobile/putong/core/api/f;

    .line 923
    .line 924
    invoke-virtual {v13, v1}, Lcom/p1/mobile/putong/core/api/f;->j3(Lcom/p1/mobile/putong/data/User;)Z

    .line 925
    .line 926
    .line 927
    move-result v1

    .line 928
    if-eqz v1, :cond_18

    .line 929
    .line 930
    move-object v1, v9

    .line 931
    goto :goto_c

    .line 932
    :cond_18
    move-object v1, v8

    .line 933
    :goto_c
    const-string v13, "is_online"

    .line 934
    .line 935
    invoke-static {v13, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 936
    .line 937
    .line 938
    move-result-object v16

    .line 939
    new-instance v1, Ljava/lang/StringBuilder;

    .line 940
    .line 941
    invoke-direct {v1, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 942
    .line 943
    .line 944
    iget-object v13, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 945
    .line 946
    iget v14, v13, Ll/sj6;->m:I

    .line 947
    .line 948
    iget v13, v13, Ll/sj6;->h:I

    .line 949
    .line 950
    sub-int/2addr v14, v13

    .line 951
    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 952
    .line 953
    .line 954
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 955
    .line 956
    .line 957
    move-result-object v1

    .line 958
    const-string v13, "new_match_rank"

    .line 959
    .line 960
    invoke-static {v13, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 961
    .line 962
    .line 963
    move-result-object v17

    .line 964
    const-string v1, "moments_user_id"

    .line 965
    .line 966
    iget-object v13, v2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 967
    .line 968
    invoke-static {v1, v13}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 969
    .line 970
    .line 971
    move-result-object v18

    .line 972
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 973
    .line 974
    iget-object v1, v1, Ll/sj6;->l:Ljava/lang/String;

    .line 975
    .line 976
    const-string v13, "operation_id"

    .line 977
    .line 978
    invoke-static {v13, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 979
    .line 980
    .line 981
    move-result-object v19

    .line 982
    const-string v1, "is_new_moment"

    .line 983
    .line 984
    invoke-static {v1, v8}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 985
    .line 986
    .line 987
    move-result-object v20

    .line 988
    invoke-interface {v0, v2}, Ll/ue6;->S(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 989
    .line 990
    .line 991
    move-result v1

    .line 992
    if-nez v1, :cond_1a

    .line 993
    .line 994
    invoke-interface {v0, v2}, Ll/ue6;->l(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 995
    .line 996
    .line 997
    move-result v1

    .line 998
    if-eqz v1, :cond_19

    .line 999
    .line 1000
    goto :goto_d

    .line 1001
    :cond_19
    move-object v1, v9

    .line 1002
    goto :goto_e

    .line 1003
    :cond_1a
    :goto_d
    move-object v1, v8

    .line 1004
    :goto_e
    const-string v13, "new_msg_page_module"

    .line 1005
    .line 1006
    invoke-static {v13, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 1007
    .line 1008
    .line 1009
    move-result-object v21

    .line 1010
    const-string v1, "chat_guide"

    .line 1011
    .line 1012
    invoke-static {v1, v11}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 1013
    .line 1014
    .line 1015
    move-result-object v22

    .line 1016
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Conversation;->isFakeHeartbeatConv()Z

    .line 1017
    .line 1018
    .line 1019
    move-result v1

    .line 1020
    if-nez v1, :cond_1c

    .line 1021
    .line 1022
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Conversation;->isFakeQuickChatConv()Z

    .line 1023
    .line 1024
    .line 1025
    move-result v1

    .line 1026
    if-eqz v1, :cond_1b

    .line 1027
    .line 1028
    goto :goto_f

    .line 1029
    :cond_1b
    move v4, v6

    .line 1030
    :cond_1c
    :goto_f
    const-string v1, "is_fake"

    .line 1031
    .line 1032
    invoke-static {v1, v4}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 1033
    .line 1034
    .line 1035
    move-result-object v23

    .line 1036
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 1037
    .line 1038
    iget-object v1, v1, Ll/sj6;->K:Ljava/lang/String;

    .line 1039
    .line 1040
    const-string v4, "is_onlive_anchor"

    .line 1041
    .line 1042
    invoke-static {v4, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 1043
    .line 1044
    .line 1045
    move-result-object v24

    .line 1046
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 1047
    .line 1048
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 1049
    .line 1050
    .line 1051
    move-result v1

    .line 1052
    if-eqz v1, :cond_1d

    .line 1053
    .line 1054
    goto :goto_10

    .line 1055
    :cond_1d
    move-object v8, v9

    .line 1056
    :goto_10
    invoke-static {v7, v8}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 1057
    .line 1058
    .line 1059
    move-result-object v25

    .line 1060
    const-string v1, "other_uid"

    .line 1061
    .line 1062
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 1063
    .line 1064
    invoke-static {v1, v4}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 1065
    .line 1066
    .line 1067
    move-result-object v26

    .line 1068
    const-string v1, "red_dot_num"

    .line 1069
    .line 1070
    iget v4, v2, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 1071
    .line 1072
    invoke-static {v1, v4}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 1073
    .line 1074
    .line 1075
    move-result-object v27

    .line 1076
    const-string v1, "chat_game_show"

    .line 1077
    .line 1078
    invoke-static {v1, v6}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 1079
    .line 1080
    .line 1081
    move-result-object v28

    .line 1082
    const-string v1, "love_letter"

    .line 1083
    .line 1084
    invoke-static {v1, v10}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 1085
    .line 1086
    .line 1087
    move-result-object v29

    .line 1088
    invoke-static {}, Ll/n46;->g()Ll/n46;

    .line 1089
    .line 1090
    .line 1091
    move-result-object v1

    .line 1092
    iget-object v4, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 1093
    .line 1094
    invoke-virtual {v1, v4}, Ll/n46;->o(Ljava/lang/String;)Z

    .line 1095
    .line 1096
    .line 1097
    move-result v1

    .line 1098
    if-eqz v1, :cond_1e

    .line 1099
    .line 1100
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Conversation;->hasRemoveLabel()Z

    .line 1101
    .line 1102
    .line 1103
    move-result v1

    .line 1104
    if-nez v1, :cond_1e

    .line 1105
    .line 1106
    const-string v3, "longtimenosee"

    .line 1107
    .line 1108
    :cond_1e
    const-string v1, "user_tag"

    .line 1109
    .line 1110
    invoke-static {v1, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 1111
    .line 1112
    .line 1113
    move-result-object v30

    .line 1114
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 1115
    .line 1116
    iget-object v1, v1, Ll/sj6;->M:Ljava/lang/String;

    .line 1117
    .line 1118
    const-string v3, "day_number"

    .line 1119
    .line 1120
    invoke-static {v3, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 1121
    .line 1122
    .line 1123
    move-result-object v31

    .line 1124
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Conversation;->hasReSwipeConvIceBreak()Z

    .line 1125
    .line 1126
    .line 1127
    move-result v1

    .line 1128
    if-eqz v1, :cond_1f

    .line 1129
    .line 1130
    const-string v1, "break_ice"

    .line 1131
    .line 1132
    goto :goto_11

    .line 1133
    :cond_1f
    const-string v1, "unbreak_ice"

    .line 1134
    .line 1135
    :goto_11
    const-string v3, "pairing_type"

    .line 1136
    .line 1137
    invoke-static {v3, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 1138
    .line 1139
    .line 1140
    move-result-object v32

    .line 1141
    const-string v1, "messagec_cell_type"

    .line 1142
    .line 1143
    invoke-static {v2}, Ll/om6;->a(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/String;

    .line 1144
    .line 1145
    .line 1146
    move-result-object v3

    .line 1147
    invoke-static {v1, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 1148
    .line 1149
    .line 1150
    move-result-object v33

    .line 1151
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 1152
    .line 1153
    .line 1154
    move-result-object v1

    .line 1155
    invoke-virtual {v1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 1156
    .line 1157
    .line 1158
    move-result-object v1

    .line 1159
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->b8()Z

    .line 1160
    .line 1161
    .line 1162
    move-result v1

    .line 1163
    if-eqz v1, :cond_20

    .line 1164
    .line 1165
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Conversation;->isPlatinumTop()Z

    .line 1166
    .line 1167
    .line 1168
    move-result v1

    .line 1169
    if-eqz v1, :cond_20

    .line 1170
    .line 1171
    const-string v1, "yes"

    .line 1172
    .line 1173
    goto :goto_12

    .line 1174
    :cond_20
    const-string v1, "no"

    .line 1175
    .line 1176
    :goto_12
    const-string v3, "is_platinum_top_chat"

    .line 1177
    .line 1178
    invoke-static {v3, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 1179
    .line 1180
    .line 1181
    move-result-object v34

    .line 1182
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 1183
    .line 1184
    iget-object v1, v1, Ll/sj6;->d:Ll/pol;

    .line 1185
    .line 1186
    invoke-interface {v0, v1}, Ll/ue6;->g(Ll/pol;)Ljava/lang/String;

    .line 1187
    .line 1188
    .line 1189
    move-result-object v1

    .line 1190
    const-string v3, "message_tab"

    .line 1191
    .line 1192
    invoke-static {v3, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 1193
    .line 1194
    .line 1195
    move-result-object v35

    .line 1196
    const-string v1, "guide_type"

    .line 1197
    .line 1198
    invoke-static {v1, v12}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 1199
    .line 1200
    .line 1201
    move-result-object v36

    .line 1202
    const-string v1, "spark_level"

    .line 1203
    .line 1204
    invoke-static {v2}, Ll/om6;->e(Lcom/p1/mobile/putong/core/data/Conversation;)I

    .line 1205
    .line 1206
    .line 1207
    move-result v3

    .line 1208
    invoke-static {v1, v3}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 1209
    .line 1210
    .line 1211
    move-result-object v37

    .line 1212
    const-string v1, "message_pairs"

    .line 1213
    .line 1214
    invoke-static {v2}, Ll/om6;->d(Lcom/p1/mobile/putong/core/data/Conversation;)I

    .line 1215
    .line 1216
    .line 1217
    move-result v3

    .line 1218
    invoke-static {v1, v3}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 1219
    .line 1220
    .line 1221
    move-result-object v38

    .line 1222
    const-string v1, "is_close_friend"

    .line 1223
    .line 1224
    invoke-static {v2}, Ll/om6;->b(Lcom/p1/mobile/putong/core/data/Conversation;)I

    .line 1225
    .line 1226
    .line 1227
    move-result v3

    .line 1228
    invoke-static {v1, v3}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 1229
    .line 1230
    .line 1231
    move-result-object v39

    .line 1232
    const-string v1, "is_top_recommend"

    .line 1233
    .line 1234
    invoke-static {v2}, Ll/om6;->c(Lcom/p1/mobile/putong/core/data/Conversation;)I

    .line 1235
    .line 1236
    .line 1237
    move-result v2

    .line 1238
    invoke-static {v1, v2}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 1239
    .line 1240
    .line 1241
    move-result-object v40

    .line 1242
    filled-new-array/range {v15 .. v40}, [Ll/sfj0$a;

    .line 1243
    .line 1244
    .line 1245
    move-result-object v1

    .line 1246
    const-string v2, "e_messages_view_match"

    .line 1247
    .line 1248
    invoke-static {v2, v5, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 1249
    .line 1250
    .line 1251
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 1252
    .line 1253
    invoke-interface {v0, v1}, Ll/ue6;->x0(Ll/sj6;)V

    .line 1254
    .line 1255
    .line 1256
    return-void

    .line 1257
    :cond_21
    :goto_13
    invoke-static {}, Ll/d79;->U()Z

    .line 1258
    .line 1259
    .line 1260
    move-result v1

    .line 1261
    const/4 v3, 0x0

    .line 1262
    if-eqz v1, :cond_22

    .line 1263
    .line 1264
    const-string v1, "e_intl_message_im_hi_enter"

    .line 1265
    .line 1266
    invoke-static {v1, v5}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 1267
    .line 1268
    .line 1269
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 1270
    .line 1271
    .line 1272
    move-result-object v1

    .line 1273
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 1274
    .line 1275
    .line 1276
    move-result-object v0

    .line 1277
    invoke-static {v0, v3, v10}, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Greeting;Ljava/lang/String;)Landroid/content/Intent;

    .line 1278
    .line 1279
    .line 1280
    move-result-object v0

    .line 1281
    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 1282
    .line 1283
    .line 1284
    return-void

    .line 1285
    :cond_22
    invoke-static {}, Ll/mn40;->b()Z

    .line 1286
    .line 1287
    .line 1288
    move-result v1

    .line 1289
    const-string v4, "is_greeting_new"

    .line 1290
    .line 1291
    const-string v12, "e_kankan_stranger_message"

    .line 1292
    .line 1293
    if-eqz v1, :cond_23

    .line 1294
    .line 1295
    invoke-static {v7, v9}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 1296
    .line 1297
    .line 1298
    move-result-object v1

    .line 1299
    invoke-static {v4, v9}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 1300
    .line 1301
    .line 1302
    move-result-object v4

    .line 1303
    filled-new-array {v1, v4}, [Ll/sfj0$a;

    .line 1304
    .line 1305
    .line 1306
    move-result-object v1

    .line 1307
    invoke-static {v12, v5, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 1308
    .line 1309
    .line 1310
    goto :goto_15

    .line 1311
    :cond_23
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1312
    .line 1313
    .line 1314
    move-result v1

    .line 1315
    if-eqz v1, :cond_24

    .line 1316
    .line 1317
    iget-object v1, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 1318
    .line 1319
    invoke-static {v1, v11}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 1320
    .line 1321
    .line 1322
    move-result v1

    .line 1323
    if-eqz v1, :cond_24

    .line 1324
    .line 1325
    const-string v1, "e_anonymous_cell"

    .line 1326
    .line 1327
    new-array v4, v6, [Ll/sfj0$a;

    .line 1328
    .line 1329
    invoke-static {v1, v5, v4}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 1330
    .line 1331
    .line 1332
    goto :goto_15

    .line 1333
    :cond_24
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1334
    .line 1335
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 1336
    .line 1337
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 1338
    .line 1339
    iget v1, v1, Lcom/p1/mobile/putong/core/data/GreetingSummary;->unseen:I

    .line 1340
    .line 1341
    if-lez v1, :cond_25

    .line 1342
    .line 1343
    goto :goto_14

    .line 1344
    :cond_25
    move-object v9, v8

    .line 1345
    :goto_14
    invoke-static {v7, v9}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 1346
    .line 1347
    .line 1348
    move-result-object v1

    .line 1349
    invoke-static {v4, v8}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 1350
    .line 1351
    .line 1352
    move-result-object v4

    .line 1353
    filled-new-array {v1, v4}, [Ll/sfj0$a;

    .line 1354
    .line 1355
    .line 1356
    move-result-object v1

    .line 1357
    invoke-static {v12, v5, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 1358
    .line 1359
    .line 1360
    :goto_15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 1361
    .line 1362
    .line 1363
    move-result-object v1

    .line 1364
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 1365
    .line 1366
    .line 1367
    move-result-object v0

    .line 1368
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1369
    .line 1370
    .line 1371
    move-result v4

    .line 1372
    if-eqz v4, :cond_26

    .line 1373
    .line 1374
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 1375
    .line 1376
    invoke-static {v2, v11}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 1377
    .line 1378
    .line 1379
    move-result v2

    .line 1380
    if-eqz v2, :cond_26

    .line 1381
    .line 1382
    const-string v10, "from_anonymous_greeting"

    .line 1383
    .line 1384
    :cond_26
    invoke-static {v0, v3, v10}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Greeting;Ljava/lang/String;)Landroid/content/Intent;

    .line 1385
    .line 1386
    .line 1387
    move-result-object v0

    .line 1388
    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 1389
    .line 1390
    .line 1391
    invoke-static {}, Ll/mn40;->b()Z

    .line 1392
    .line 1393
    .line 1394
    move-result v0

    .line 1395
    if-eqz v0, :cond_27

    .line 1396
    .line 1397
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1398
    .line 1399
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 1400
    .line 1401
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/j;->m5()V

    .line 1402
    .line 1403
    .line 1404
    :cond_27
    :goto_16
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->q:Ljava/lang/Runnable;

    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/c0;->t(Lcom/p1/mobile/putong/core/api/c0$c;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/gra;->z()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    sget v0, Ll/sj6;->R:I

    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iput-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->e:Ll/orl;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    sget v0, Ll/adc0;->b5:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Ll/orl;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->f:Ll/orl;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    sget v0, Ll/adc0;->je:I

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Ll/orl;

    .line 44
    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->g:Ll/orl;

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    sget v0, Ll/adc0;->bd:I

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Ll/orl;

    .line 59
    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->a:Ll/orl;

    .line 61
    .line 62
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_1

    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->a:Ll/orl;

    .line 71
    .line 72
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    :cond_1
    sget v0, Ll/adc0;->W4:I

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Ll/orl;

    .line 82
    .line 83
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->b:Ll/orl;

    .line 84
    .line 85
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_2

    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 92
    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->b:Ll/orl;

    .line 94
    .line 95
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    :cond_2
    sget v0, Ll/adc0;->R4:I

    .line 99
    .line 100
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    check-cast v0, Ll/orl;

    .line 105
    .line 106
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->c:Ll/orl;

    .line 107
    .line 108
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_3

    .line 113
    .line 114
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 115
    .line 116
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->c:Ll/orl;

    .line 117
    .line 118
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    :cond_3
    sget v0, Ll/adc0;->Ab:I

    .line 122
    .line 123
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    check-cast v0, Ll/orl;

    .line 128
    .line 129
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->d:Ll/orl;

    .line 130
    .line 131
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eqz v0, :cond_4

    .line 136
    .line 137
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->d:Ll/orl;

    .line 140
    .line 141
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    :cond_4
    return-void
.end method

.method public final synthetic p2(Ll/sj6;Ljava/util/LinkedHashMap;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p2, Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    const/4 p2, 0x1

    .line 12
    iput-boolean p2, p1, Ll/sj6;->f:Z

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->v2()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-boolean p2, p1, Ll/sj6;->f:Z

    .line 19
    .line 20
    if-eqz p2, :cond_1

    .line 21
    .line 22
    const/4 p2, 0x0

    .line 23
    iput-boolean p2, p1, Ll/sj6;->f:Z

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->v2()V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public performClick()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->r:Landroid/view/View$OnClickListener;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->r:Landroid/view/View$OnClickListener;

    .line 10
    .line 11
    invoke-interface {v0, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    invoke-super {p0}, Landroid/view/View;->performClick()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method public final synthetic q2(Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->v2()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->lowPayOneSideConv()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->performClick()Z

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final synthetic r2(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 3

    .line 1
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->tag:Ljava/lang/Object;

    .line 2
    .line 3
    instance-of v0, p2, Ljava/lang/String;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p2, Ljava/lang/String;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    new-array v0, v0, [Ljava/lang/CharSequence;

    .line 13
    .line 14
    const-string v1, "chat_request_"

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    aput-object v1, v0, v2

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    aput-object p1, v0, v1

    .line 21
    .line 22
    invoke-static {v0}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-static {p2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_0

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->t2()V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public final synthetic s2(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    iget-object p0, p0, Ll/sj6;->d:Ll/pol;

    .line 4
    .line 5
    instance-of p1, p0, Ll/u46;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    check-cast p0, Ll/u46;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/u46;->q()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 1
    .param p1    # Landroid/view/View$OnClickListener;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Ll/zg6;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 16
    .line 17
    iget-boolean v0, v0, Ll/sj6;->o:Z

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    instance-of v0, v0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookUnMatchAct;

    .line 26
    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->r:Landroid/view/View$OnClickListener;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 1
    .param p1    # Landroid/view/View$OnLongClickListener;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Ll/zg6;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    instance-of v0, v0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookUnMatchAct;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->s:Landroid/view/View$OnLongClickListener;

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setPicPercent(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->f:Ll/orl;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/nrl;->setPicPercent(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t0(Ll/sj6;)V
    .locals 13

    .line 1
    iget-boolean v0, p1, Ll/sj6;->v:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object p1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    const-string p1, "unknown_"

    .line 22
    .line 23
    invoke-static {p1}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 24
    .line 25
    .line 26
    move-result-object v7

    .line 27
    const/4 v11, 0x0

    .line 28
    const/4 v12, 0x0

    .line 29
    const-string v3, "from_conversation_search_view"

    .line 30
    .line 31
    const/4 v4, 0x0

    .line 32
    const/4 v5, 0x0

    .line 33
    const/4 v6, 0x0

    .line 34
    const/16 v8, 0x111

    .line 35
    .line 36
    const/4 v9, 0x0

    .line 37
    const/4 v10, 0x1

    .line 38
    invoke-static/range {v1 .. v12}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->w2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/RelationshipStatus;IZZZZ)Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    new-instance v0, Ll/dd6;

    .line 43
    .line 44
    invoke-direct {v0, p0, p1}, Ll/dd6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Landroid/content/Intent;)V

    .line 45
    .line 46
    .line 47
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    .line 53
    .line 54
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;

    .line 55
    .line 56
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;-><init>(Ll/sj6;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isMarriageConv()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-eqz v1, :cond_1

    .line 69
    .line 70
    sget v1, Ll/dbc0;->Yu:I

    .line 71
    .line 72
    invoke-virtual {p0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->b8()Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-eqz v1, :cond_2

    .line 89
    .line 90
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 91
    .line 92
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isPlatinumTop()Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-eqz v1, :cond_2

    .line 97
    .line 98
    iget-object v1, p1, Ll/sj6;->d:Ll/pol;

    .line 99
    .line 100
    invoke-interface {p0, v1}, Ll/ue6;->W(Ll/pol;)Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-nez v1, :cond_2

    .line 105
    .line 106
    sget v1, Ll/dbc0;->tf:I

    .line 107
    .line 108
    invoke-virtual {p0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_2
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 113
    .line 114
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isTop()Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-eqz v1, :cond_3

    .line 119
    .line 120
    iget-object v1, p1, Ll/sj6;->y:Ljava/lang/String;

    .line 121
    .line 122
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    if-eqz v1, :cond_3

    .line 127
    .line 128
    iget-object v1, p1, Ll/sj6;->d:Ll/pol;

    .line 129
    .line 130
    invoke-interface {p0, v1}, Ll/ue6;->W(Ll/pol;)Z

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    if-nez v1, :cond_3

    .line 135
    .line 136
    sget v1, Ll/dbc0;->Zu:I

    .line 137
    .line 138
    invoke-virtual {p0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 139
    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_3
    sget v1, Ll/dbc0;->Yu:I

    .line 143
    .line 144
    invoke-virtual {p0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 145
    .line 146
    .line 147
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    instance-of v1, v1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 152
    .line 153
    if-eqz v1, :cond_4

    .line 154
    .line 155
    iget-object v1, p1, Ll/sj6;->d:Ll/pol;

    .line 156
    .line 157
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    if-eqz v1, :cond_4

    .line 162
    .line 163
    iget-object v1, p1, Ll/sj6;->d:Ll/pol;

    .line 164
    .line 165
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 170
    .line 171
    .line 172
    move-result-object v3

    .line 173
    check-cast v3, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 174
    .line 175
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o7()Lrx/c;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    new-instance v4, Ll/ed6;

    .line 180
    .line 181
    invoke-direct {v4}, Ll/ed6;-><init>()V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v3, v4}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 185
    .line 186
    .line 187
    move-result-object v3

    .line 188
    invoke-interface {v1, v2, v3}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    new-instance v2, Ll/gd6;

    .line 193
    .line 194
    invoke-direct {v2, v0}, Ll/gd6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationLongClick;)V

    .line 195
    .line 196
    .line 197
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    invoke-virtual {v1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 202
    .line 203
    .line 204
    :cond_4
    invoke-static {}, Ll/gra;->a2()Z

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    if-nez v0, :cond_5

    .line 209
    .line 210
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->u2(Ll/sj6;)V

    .line 211
    .line 212
    .line 213
    :cond_5
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 214
    .line 215
    invoke-static {v0}, Ll/ue6;->C0(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 216
    .line 217
    .line 218
    move-result v0

    .line 219
    if-eqz v0, :cond_6

    .line 220
    .line 221
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 222
    .line 223
    new-instance v1, Ll/hd6;

    .line 224
    .line 225
    invoke-direct {v1, p1}, Ll/hd6;-><init>(Ll/sj6;)V

    .line 226
    .line 227
    .line 228
    invoke-interface {p0, v0, v1}, Ll/ue6;->b(Ljava/util/List;Ll/y20;)V

    .line 229
    .line 230
    .line 231
    return-void

    .line 232
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->j:Lrx/subjects/a;

    .line 233
    .line 234
    sget-object v1, Ll/sj6;->U:Lcom/p1/mobile/putong/core/data/Message;

    .line 235
    .line 236
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 237
    .line 238
    .line 239
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 240
    .line 241
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result v0

    .line 245
    if-eqz v0, :cond_7

    .line 246
    .line 247
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 248
    .line 249
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->clearedTime:D

    .line 250
    .line 251
    iget-object v2, p1, Ll/sj6;->d:Ll/pol;

    .line 252
    .line 253
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 254
    .line 255
    .line 256
    move-result-object v3

    .line 257
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 258
    .line 259
    iget-object v4, v4, Ll/il8;->c:Ll/t600;

    .line 260
    .line 261
    iget-object v5, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 262
    .line 263
    iget-object v5, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 264
    .line 265
    const/4 v6, 0x0

    .line 266
    invoke-virtual {v4, v5, v0, v1, v6}, Ll/t600;->Z(Ljava/lang/String;DZ)Ll/wzh0$a;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    invoke-virtual {v0}, Ll/wzh0$a;->m()Lrx/c;

    .line 271
    .line 272
    .line 273
    move-result-object v0

    .line 274
    new-instance v1, Ll/id6;

    .line 275
    .line 276
    invoke-direct {v1, p1}, Ll/id6;-><init>(Ll/sj6;)V

    .line 277
    .line 278
    .line 279
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    invoke-interface {v2, v3, v0}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    new-instance v1, Ll/jd6;

    .line 288
    .line 289
    invoke-direct {v1, p0}, Ll/jd6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    .line 290
    .line 291
    .line 292
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 293
    .line 294
    .line 295
    move-result-object v1

    .line 296
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 297
    .line 298
    .line 299
    :cond_7
    invoke-static {}, Ll/d79;->e0()Z

    .line 300
    .line 301
    .line 302
    move-result v0

    .line 303
    if-eqz v0, :cond_9

    .line 304
    .line 305
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 306
    .line 307
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 308
    .line 309
    .line 310
    move-result v0

    .line 311
    if-eqz v0, :cond_9

    .line 312
    .line 313
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 314
    .line 315
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 316
    .line 317
    const-string v1, "lovebuzz"

    .line 318
    .line 319
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 320
    .line 321
    .line 322
    move-result v0

    .line 323
    if-eqz v0, :cond_9

    .line 324
    .line 325
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 326
    .line 327
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 332
    .line 333
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Pj(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 334
    .line 335
    .line 336
    move-result v0

    .line 337
    const-string v1, "countdown_item_love_buzz_key"

    .line 338
    .line 339
    if-eqz v0, :cond_8

    .line 340
    .line 341
    new-instance v0, Lcom/p1/mobile/putong/core/api/c0$a;

    .line 342
    .line 343
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/c0$a;-><init>()V

    .line 344
    .line 345
    .line 346
    new-instance v2, Ljava/lang/StringBuilder;

    .line 347
    .line 348
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 349
    .line 350
    .line 351
    iget-object v3, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 352
    .line 353
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 354
    .line 355
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 356
    .line 357
    .line 358
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v2

    .line 362
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/api/c0$a;->g(Ljava/lang/String;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 363
    .line 364
    .line 365
    move-result-object v2

    .line 366
    iget-object v3, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 367
    .line 368
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 369
    .line 370
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_love_buzz:Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;

    .line 371
    .line 372
    iget-wide v3, v3, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->expire:J

    .line 373
    .line 374
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/putong/core/api/c0$a;->f(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 375
    .line 376
    .line 377
    move-result-object v2

    .line 378
    const-wide/16 v3, 0x3c

    .line 379
    .line 380
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/putong/core/api/c0$a;->h(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 381
    .line 382
    .line 383
    move-result-object v2

    .line 384
    const/4 v3, 0x1

    .line 385
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/api/c0$a;->a(Z)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 386
    .line 387
    .line 388
    move-result-object v2

    .line 389
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/core/api/c0$a;->d(Lcom/p1/mobile/putong/core/api/c0$c;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 390
    .line 391
    .line 392
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 393
    .line 394
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 395
    .line 396
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/api/c0;->r(Lcom/p1/mobile/putong/core/api/c0$a;)Ljava/lang/String;

    .line 397
    .line 398
    .line 399
    iget-object v0, p1, Ll/sj6;->d:Ll/pol;

    .line 400
    .line 401
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 402
    .line 403
    .line 404
    move-result-object v2

    .line 405
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 406
    .line 407
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 408
    .line 409
    new-instance v4, Ljava/lang/StringBuilder;

    .line 410
    .line 411
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 412
    .line 413
    .line 414
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 415
    .line 416
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 417
    .line 418
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 419
    .line 420
    .line 421
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 422
    .line 423
    .line 424
    move-result-object v1

    .line 425
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/api/c0;->n(Ljava/lang/String;)Lrx/c;

    .line 426
    .line 427
    .line 428
    move-result-object v1

    .line 429
    invoke-interface {v0, v2, v1}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 430
    .line 431
    .line 432
    move-result-object v0

    .line 433
    new-instance v1, Ll/kd6;

    .line 434
    .line 435
    invoke-direct {v1, p0}, Ll/kd6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    .line 436
    .line 437
    .line 438
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 439
    .line 440
    .line 441
    move-result-object v1

    .line 442
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 443
    .line 444
    .line 445
    goto :goto_1

    .line 446
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 447
    .line 448
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 449
    .line 450
    new-instance v2, Ljava/lang/StringBuilder;

    .line 451
    .line 452
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 453
    .line 454
    .line 455
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 456
    .line 457
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 458
    .line 459
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 460
    .line 461
    .line 462
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 463
    .line 464
    .line 465
    move-result-object v1

    .line 466
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/c0;->u(Ljava/lang/String;)V

    .line 467
    .line 468
    .line 469
    :cond_9
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 470
    .line 471
    .line 472
    move-result-object v0

    .line 473
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 474
    .line 475
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 476
    .line 477
    iget-object v2, p1, Ll/sj6;->d:Ll/pol;

    .line 478
    .line 479
    check-cast v2, Ll/u46;

    .line 480
    .line 481
    invoke-interface {p0, v0, v1, v2, p0}, Ll/ue6;->F(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/u46;Lcom/p1/mobile/putong/core/api/c0$c;)V

    .line 482
    .line 483
    .line 484
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->w2()V

    .line 485
    .line 486
    .line 487
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->p:Ljava/lang/Runnable;

    .line 488
    .line 489
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 490
    .line 491
    .line 492
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 493
    .line 494
    iget v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    .line 495
    .line 496
    const/16 v2, 0x37

    .line 497
    .line 498
    if-ne v1, v2, :cond_b

    .line 499
    .line 500
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 501
    .line 502
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 503
    .line 504
    .line 505
    move-result v0

    .line 506
    if-eqz v0, :cond_a

    .line 507
    .line 508
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 509
    .line 510
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 511
    .line 512
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 513
    .line 514
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 515
    .line 516
    .line 517
    move-result v0

    .line 518
    if-eqz v0, :cond_a

    .line 519
    .line 520
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 521
    .line 522
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 523
    .line 524
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 525
    .line 526
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;->expireTime:J

    .line 527
    .line 528
    const-wide/16 v2, 0x3e8

    .line 529
    .line 530
    mul-long/2addr v0, v2

    .line 531
    invoke-static {}, Ll/pzi0;->o()J

    .line 532
    .line 533
    .line 534
    move-result-wide v4

    .line 535
    cmp-long v0, v0, v4

    .line 536
    .line 537
    if-lez v0, :cond_a

    .line 538
    .line 539
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 540
    .line 541
    .line 542
    move-result-object v0

    .line 543
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->p:Ljava/lang/Runnable;

    .line 544
    .line 545
    iget-object v4, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 546
    .line 547
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 548
    .line 549
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 550
    .line 551
    iget-wide v4, v4, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;->expireTime:J

    .line 552
    .line 553
    mul-long/2addr v4, v2

    .line 554
    invoke-static {}, Ll/pzi0;->o()J

    .line 555
    .line 556
    .line 557
    move-result-wide v2

    .line 558
    sub-long/2addr v4, v2

    .line 559
    invoke-static {v0, v1, v4, v5}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 560
    .line 561
    .line 562
    goto/16 :goto_2

    .line 563
    .line 564
    :cond_a
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 565
    .line 566
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 567
    .line 568
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 569
    .line 570
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 571
    .line 572
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->yp(Ljava/lang/String;)V

    .line 573
    .line 574
    .line 575
    goto/16 :goto_2

    .line 576
    .line 577
    :cond_b
    const/16 v0, 0x5a

    .line 578
    .line 579
    if-ne v1, v0, :cond_d

    .line 580
    .line 581
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 582
    .line 583
    .line 584
    move-result-object v0

    .line 585
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 586
    .line 587
    .line 588
    move-result-object v0

    .line 589
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->b8()Z

    .line 590
    .line 591
    .line 592
    move-result v0

    .line 593
    if-eqz v0, :cond_d

    .line 594
    .line 595
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->q:Ljava/lang/Runnable;

    .line 596
    .line 597
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 598
    .line 599
    .line 600
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 601
    .line 602
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 603
    .line 604
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 605
    .line 606
    .line 607
    move-result v0

    .line 608
    if-eqz v0, :cond_c

    .line 609
    .line 610
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 611
    .line 612
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 613
    .line 614
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    .line 615
    .line 616
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 617
    .line 618
    .line 619
    move-result v0

    .line 620
    if-eqz v0, :cond_c

    .line 621
    .line 622
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 623
    .line 624
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 625
    .line 626
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    .line 627
    .line 628
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/PlatinumPinChat;->expireTime:D

    .line 629
    .line 630
    invoke-static {}, Ll/pzi0;->o()J

    .line 631
    .line 632
    .line 633
    move-result-wide v2

    .line 634
    long-to-double v2, v2

    .line 635
    cmpl-double v0, v0, v2

    .line 636
    .line 637
    if-lez v0, :cond_c

    .line 638
    .line 639
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->x2()V

    .line 640
    .line 641
    .line 642
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 643
    .line 644
    .line 645
    move-result-object v0

    .line 646
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->q:Ljava/lang/Runnable;

    .line 647
    .line 648
    iget-object v2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 649
    .line 650
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 651
    .line 652
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    .line 653
    .line 654
    iget-wide v2, v2, Lcom/p1/mobile/putong/core/data/PlatinumPinChat;->expireTime:D

    .line 655
    .line 656
    invoke-static {}, Ll/pzi0;->o()J

    .line 657
    .line 658
    .line 659
    move-result-wide v4

    .line 660
    long-to-double v4, v4

    .line 661
    sub-double/2addr v2, v4

    .line 662
    double-to-long v2, v2

    .line 663
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 664
    .line 665
    .line 666
    goto :goto_2

    .line 667
    :cond_c
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 668
    .line 669
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 670
    .line 671
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 672
    .line 673
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 674
    .line 675
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->xp(Ljava/lang/String;)V

    .line 676
    .line 677
    .line 678
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 679
    .line 680
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 681
    .line 682
    new-instance v1, Ljava/lang/StringBuilder;

    .line 683
    .line 684
    const-string v2, "countdown_item_platinum_pin"

    .line 685
    .line 686
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 687
    .line 688
    .line 689
    iget-object v2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 690
    .line 691
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 692
    .line 693
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 694
    .line 695
    .line 696
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 697
    .line 698
    .line 699
    move-result-object v1

    .line 700
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/c0;->u(Ljava/lang/String;)V

    .line 701
    .line 702
    .line 703
    :cond_d
    :goto_2
    invoke-static {}, Ll/spl0;->X()Z

    .line 704
    .line 705
    .line 706
    move-result v0

    .line 707
    if-eqz v0, :cond_e

    .line 708
    .line 709
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 710
    .line 711
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 712
    .line 713
    .line 714
    move-result-object v0

    .line 715
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 716
    .line 717
    .line 718
    move-result-object v0

    .line 719
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isLimitedTrialSee(Ljava/lang/String;)Z

    .line 720
    .line 721
    .line 722
    move-result p1

    .line 723
    if-eqz p1, :cond_e

    .line 724
    .line 725
    invoke-static {}, Ll/joa;->M3()Z

    .line 726
    .line 727
    .line 728
    move-result p1

    .line 729
    if-nez p1, :cond_e

    .line 730
    .line 731
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 732
    .line 733
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 734
    .line 735
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 736
    .line 737
    .line 738
    move-result-object p1

    .line 739
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 740
    .line 741
    .line 742
    move-result p1

    .line 743
    if-nez p1, :cond_e

    .line 744
    .line 745
    sget-object p1, Ll/for;->INSTANCE:Ll/for;

    .line 746
    .line 747
    invoke-virtual {p1}, Ll/for;->e()Ljava/lang/String;

    .line 748
    .line 749
    .line 750
    move-result-object p1

    .line 751
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->S1(Ljava/lang/String;)V

    .line 752
    .line 753
    .line 754
    :cond_e
    return-void
.end method

.method public final t2()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    iget-object v5, v0, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    const/4 v6, 0x0

    .line 15
    const/4 v2, 0x1

    .line 16
    const/4 v3, 0x0

    .line 17
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->V7(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/de6;

    .line 26
    .line 27
    invoke-direct {v1, p0, v5}, Ll/de6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Lcom/p1/mobile/putong/data/User;)V

    .line 28
    .line 29
    .line 30
    new-instance v2, Ll/ee6;

    .line 31
    .line 32
    invoke-direct {v2}, Ll/ee6;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->n6()Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public u(Ljava/lang/String;JJJJ)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_2

    .line 8
    .line 9
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 10
    .line 11
    iget-object p2, p2, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_2

    .line 18
    .line 19
    new-instance p2, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string p3, "exclusive_tag_"

    .line 22
    .line 23
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 27
    .line 28
    iget-object p3, p3, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 29
    .line 30
    iget-object p3, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-nez p2, :cond_1

    .line 44
    .line 45
    new-instance p2, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    const-string p3, "love_script_tag_"

    .line 48
    .line 49
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 53
    .line 54
    iget-object p3, p3, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 55
    .line 56
    iget-object p3, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    if-nez p2, :cond_1

    .line 70
    .line 71
    new-instance p2, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string p3, "countdown_item_platinum_pin"

    .line 74
    .line 75
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 79
    .line 80
    iget-object p3, p3, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 81
    .line 82
    iget-object p3, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    invoke-static {p2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    if-eqz p2, :cond_0

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    const-string p3, "heartbeat_conv_item_"

    .line 101
    .line 102
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 106
    .line 107
    iget-object p3, p3, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 108
    .line 109
    iget-object p3, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p2

    .line 118
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    if-eqz p1, :cond_2

    .line 123
    .line 124
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 125
    .line 126
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 127
    .line 128
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartbeatConv()Z

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    if-eqz p1, :cond_2

    .line 133
    .line 134
    invoke-static {}, Ll/pzi0;->o()J

    .line 135
    .line 136
    .line 137
    move-result-wide p1

    .line 138
    long-to-double p1, p1

    .line 139
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 140
    .line 141
    iget-object p3, p3, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 142
    .line 143
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 144
    .line 145
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 146
    .line 147
    iget-wide p3, p3, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->expireTime:D

    .line 148
    .line 149
    cmpl-double p1, p1, p3

    .line 150
    .line 151
    if-ltz p1, :cond_2

    .line 152
    .line 153
    new-instance p1, Ll/ce6;

    .line 154
    .line 155
    invoke-direct {p1, p0}, Ll/ce6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;)V

    .line 156
    .line 157
    .line 158
    invoke-static {p1}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 159
    .line 160
    .line 161
    return-void

    .line 162
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->v2()V

    .line 163
    .line 164
    .line 165
    :cond_2
    return-void
.end method

.method public final u2(Ll/sj6;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/vq8;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->B2:Lrx/subjects/a;

    .line 15
    .line 16
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ljava/util/LinkedHashMap;

    .line 21
    .line 22
    iget-object v1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iput-boolean v0, p1, Ll/sj6;->f:Z

    .line 29
    .line 30
    iget-object v0, p1, Ll/sj6;->d:Ll/pol;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->O1()Lcom/p1/mobile/putong/app/PutongAct;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 39
    .line 40
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/g;->Fq()Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-interface {v0, v1, v2}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/td6;

    .line 49
    .line 50
    invoke-direct {v1, p0, p1}, Ll/td6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ll/sj6;)V

    .line 51
    .line 52
    .line 53
    new-instance p0, Ll/ud6;

    .line 54
    .line 55
    invoke-direct {p0}, Ll/ud6;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    :cond_1
    :goto_0
    return-void
.end method

.method public v2()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->h:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final w2()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 10
    .line 11
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 20
    .line 21
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 32
    .line 33
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->loveScript:Lcom/p1/mobile/putong/core/data/LoveScript;

    .line 38
    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 46
    .line 47
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 50
    .line 51
    const-string v1, "lovescript"

    .line 52
    .line 53
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 60
    .line 61
    iget-object v0, v0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->loveScript:Lcom/p1/mobile/putong/core/data/LoveScript;

    .line 66
    .line 67
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/LoveScript;->expireTime:J

    .line 68
    .line 69
    const-wide/16 v2, 0x0

    .line 70
    .line 71
    cmp-long v2, v0, v2

    .line 72
    .line 73
    if-eqz v2, :cond_0

    .line 74
    .line 75
    invoke-static {}, Ll/pzi0;->o()J

    .line 76
    .line 77
    .line 78
    move-result-wide v2

    .line 79
    cmp-long v0, v0, v2

    .line 80
    .line 81
    if-lez v0, :cond_0

    .line 82
    .line 83
    new-instance v0, Lcom/p1/mobile/putong/core/api/c0$a;

    .line 84
    .line 85
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/c0$a;-><init>()V

    .line 86
    .line 87
    .line 88
    new-instance v1, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    const-string v2, "love_script_tag_"

    .line 91
    .line 92
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 96
    .line 97
    iget-object v2, v2, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 98
    .line 99
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/c0$a;->g(Ljava/lang/String;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 113
    .line 114
    iget-object v2, v2, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 115
    .line 116
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 117
    .line 118
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationProperty;->loveScript:Lcom/p1/mobile/putong/core/data/LoveScript;

    .line 119
    .line 120
    iget-wide v2, v2, Lcom/p1/mobile/putong/core/data/LoveScript;->expireTime:J

    .line 121
    .line 122
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/core/api/c0$a;->f(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    const-wide/16 v2, 0x1

    .line 127
    .line 128
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/core/api/c0$a;->h(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    const/4 v2, 0x1

    .line 133
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/c0$a;->a(Z)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/core/api/c0$a;->d(Lcom/p1/mobile/putong/core/api/c0$c;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 138
    .line 139
    .line 140
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 141
    .line 142
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 143
    .line 144
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/api/c0;->r(Lcom/p1/mobile/putong/core/api/c0$a;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 148
    .line 149
    iget-object v0, v0, Ll/sj6;->k:Ll/n100;

    .line 150
    .line 151
    const-string v1, "e_story_mtached_cell_click"

    .line 152
    .line 153
    invoke-virtual {v0, v1}, Ll/n100;->a(Ljava/lang/String;)Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-nez v0, :cond_0

    .line 158
    .line 159
    const/4 v0, 0x0

    .line 160
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    const-string v2, "cell_numbers"

    .line 165
    .line 166
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    filled-new-array {v0}, [Ll/pf60;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    const-string v2, "p_messages_view"

    .line 175
    .line 176
    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 177
    .line 178
    .line 179
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 180
    .line 181
    iget-object p0, p0, Ll/sj6;->k:Ll/n100;

    .line 182
    .line 183
    invoke-virtual {p0, v1}, Ll/n100;->b(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    :cond_0
    return-void
.end method

.method public final x2()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/api/c0$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/c0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "countdown_item_platinum_pin"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 14
    .line 15
    iget-object v2, v2, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 16
    .line 17
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/c0$a;->g(Ljava/lang/String;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 31
    .line 32
    iget-object v2, v2, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 33
    .line 34
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 35
    .line 36
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    .line 37
    .line 38
    iget-wide v2, v2, Lcom/p1/mobile/putong/core/data/PlatinumPinChat;->expireTime:D

    .line 39
    .line 40
    double-to-long v2, v2

    .line 41
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/core/api/c0$a;->f(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-wide/16 v2, 0x1

    .line 46
    .line 47
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/core/api/c0$a;->h(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    const/4 v2, 0x1

    .line 52
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/c0$a;->a(Z)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/core/api/c0$a;->d(Lcom/p1/mobile/putong/core/api/c0$c;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 57
    .line 58
    .line 59
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 62
    .line 63
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/c0;->r(Lcom/p1/mobile/putong/core/api/c0$a;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public z0(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;Ll/sj6;)V
    .locals 0

    .line 1
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->m:Ll/sj6;

    .line 2
    .line 3
    iput-object p1, p3, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p3, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ll/ue6;->h()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 22
    .line 23
    new-instance p2, Ll/sd6;

    .line 24
    .line 25
    invoke-direct {p2}, Ll/sd6;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-interface {p0, p1, p2}, Ll/ue6;->b(Ljava/util/List;Ll/y20;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
