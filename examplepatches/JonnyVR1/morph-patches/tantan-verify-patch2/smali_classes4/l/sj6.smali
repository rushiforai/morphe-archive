.class public Ll/sj6;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final Q:I

.field public static final R:I

.field public static final S:I

.field public static final T:I

.field public static final U:Lcom/p1/mobile/putong/core/data/Message;


# instance fields
.field public A:I

.field public B:Lcom/p1/mobile/putong/core/data/ChatGroup;

.field public C:[Ll/kcg0;

.field public D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

.field public E:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/orl;",
            ">;"
        }
    .end annotation
.end field

.field public F:Ljava/util/concurrent/atomic/AtomicInteger;

.field public G:D

.field public H:I

.field public I:Lcom/p1/mobile/putong/core/data/Message;

.field public J:Ll/x20;

.field public K:Ljava/lang/String;

.field public L:Ljava/lang/String;

.field public M:Ljava/lang/String;

.field public N:I

.field public O:Lcom/p1/mobile/putong/core/data/Conversation;

.field public P:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public a:Lcom/p1/mobile/putong/core/data/Conversation;

.field public b:Lcom/p1/mobile/putong/data/User;

.field public c:Lcom/p1/mobile/putong/data/User;

.field public d:Ll/pol;

.field public e:Z

.field public f:Z

.field public g:I

.field public h:I

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;

.field public k:Ll/n100;

.field public l:Ljava/lang/String;

.field public m:I

.field public n:Z

.field public o:Z

.field public p:Ljava/lang/String;

.field public q:Ljava/lang/String;

.field public r:Ljava/lang/String;

.field public s:D

.field public t:Ljava/lang/String;

.field public u:Z

.field public v:Z

.field public w:Lcom/p1/mobile/putong/data/User;

.field public x:Lcom/p1/mobile/android/app/Act;

.field public y:Ljava/lang/String;

.field public z:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/qa00;->G:I

    .line 2
    .line 3
    sput v0, Ll/sj6;->Q:I

    .line 4
    .line 5
    sget v0, Ll/qa00;->K:I

    .line 6
    .line 7
    sput v0, Ll/sj6;->R:I

    .line 8
    .line 9
    const-string v0, "#66000000"

    .line 10
    .line 11
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sput v0, Ll/sj6;->S:I

    .line 16
    .line 17
    const-string v0, "#4d4d4d"

    .line 18
    .line 19
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    sput v0, Ll/sj6;->T:I

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Ll/sj6;->U:Lcom/p1/mobile/putong/core/data/Message;

    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;Ll/pol;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/sj6;->i:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, "default"

    .line 9
    .line 10
    iput-object v1, p0, Ll/sj6;->j:Ljava/lang/String;

    .line 11
    .line 12
    new-instance v1, Ll/n100;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/n100;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Ll/sj6;->k:Ll/n100;

    .line 18
    .line 19
    iput-object v0, p0, Ll/sj6;->l:Ljava/lang/String;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    iput-boolean v1, p0, Ll/sj6;->n:Z

    .line 23
    .line 24
    iput-boolean v1, p0, Ll/sj6;->o:Z

    .line 25
    .line 26
    iput-object v0, p0, Ll/sj6;->p:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v0, p0, Ll/sj6;->q:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v0, p0, Ll/sj6;->r:Ljava/lang/String;

    .line 31
    .line 32
    const-wide/16 v2, 0x0

    .line 33
    .line 34
    iput-wide v2, p0, Ll/sj6;->s:D

    .line 35
    .line 36
    iput-object v0, p0, Ll/sj6;->t:Ljava/lang/String;

    .line 37
    .line 38
    iput-boolean v1, p0, Ll/sj6;->u:Z

    .line 39
    .line 40
    iput-boolean v1, p0, Ll/sj6;->v:Z

    .line 41
    .line 42
    iput-object v0, p0, Ll/sj6;->K:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v0, p0, Ll/sj6;->L:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v0, p0, Ll/sj6;->M:Ljava/lang/String;

    .line 47
    .line 48
    iput v1, p0, Ll/sj6;->N:I

    .line 49
    .line 50
    iput-object p2, p0, Ll/sj6;->d:Ll/pol;

    .line 51
    .line 52
    iput-object p1, p0, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 53
    .line 54
    iput-object p3, p0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 55
    .line 56
    iget-object p2, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->l:Ljava/util/List;

    .line 57
    .line 58
    iput-object p2, p0, Ll/sj6;->E:Ljava/util/List;

    .line 59
    .line 60
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 65
    .line 66
    iput-object p1, p0, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 67
    .line 68
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/core/data/Message;
    .locals 2

    .line 1
    sget-object v0, Ll/sj6;->U:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    iget-object v1, p0, Ll/sj6;->z:Lcom/p1/mobile/putong/core/data/Message;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Message;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    iget-object p0, p0, Ll/sj6;->z:Lcom/p1/mobile/putong/core/data/Message;

    .line 14
    .line 15
    return-object p0
.end method

.method public b(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sj6;->z:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    return-void
.end method
