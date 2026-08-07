.class public Lcom/tantanapp/beatles/block/MessageHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/beatles/block/MessageHelper$MessageUnit;,
        Lcom/tantanapp/beatles/block/MessageHelper$MessageInfo;,
        Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;,
        Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;
    }
.end annotation


# static fields
.field public static d:I = 0x64

.field public static e:I = 0x14

.field public static f:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static g:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static h:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;",
            ">;"
        }
    .end annotation
.end field

.field public static i:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public a:I

.field public b:I

.field public c:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tantanapp/beatles/block/MessageHelper;->f:Ljava/util/LinkedList;

    .line 7
    .line 8
    new-instance v0, Ljava/util/LinkedList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/tantanapp/beatles/block/MessageHelper;->g:Ljava/util/LinkedList;

    .line 14
    .line 15
    new-instance v0, Ljava/util/LinkedList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/tantanapp/beatles/block/MessageHelper;->h:Ljava/util/LinkedList;

    .line 21
    .line 22
    new-instance v0, Ljava/util/LinkedList;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/tantanapp/beatles/block/MessageHelper;->i:Ljava/util/LinkedList;

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/tantanapp/beatles/block/MessageHelper;->c:I

    .line 6
    .line 7
    iput p1, p0, Lcom/tantanapp/beatles/block/MessageHelper;->a:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(JLjava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/MessageHelper;->k()Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p3}, Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;->access$002(Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    invoke-static {p0, p1, p2}, Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;->access$102(Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;J)J

    .line 9
    .line 10
    .line 11
    sget-object p3, Lcom/tantanapp/beatles/block/MessageHelper;->i:Ljava/util/LinkedList;

    .line 12
    .line 13
    invoke-virtual {p3}, Ljava/util/LinkedList;->peekLast()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    check-cast p3, Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;

    .line 18
    .line 19
    if-eqz p3, :cond_0

    .line 20
    .line 21
    invoke-static {p3}, Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;->access$100(Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;)J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    cmp-long p1, v0, p1

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    sget-object p1, Lcom/tantanapp/beatles/block/MessageHelper;->i:Ljava/util/LinkedList;

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;->reset()V

    .line 38
    .line 39
    .line 40
    sget-object p2, Lcom/tantanapp/beatles/block/MessageHelper;->h:Ljava/util/LinkedList;

    .line 41
    .line 42
    invoke-virtual {p2, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    :cond_0
    sget-object p1, Lcom/tantanapp/beatles/block/MessageHelper;->i:Ljava/util/LinkedList;

    .line 46
    .line 47
    invoke-virtual {p1, p0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    sget-object p0, Lcom/tantanapp/beatles/block/MessageHelper;->i:Ljava/util/LinkedList;

    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/util/LinkedList;->size()I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    sget p1, Lcom/tantanapp/beatles/block/MessageHelper;->e:I

    .line 57
    .line 58
    if-le p0, p1, :cond_1

    .line 59
    .line 60
    sget-object p0, Lcom/tantanapp/beatles/block/MessageHelper;->i:Ljava/util/LinkedList;

    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/util/LinkedList;->pop()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    check-cast p0, Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;->reset()V

    .line 69
    .line 70
    .line 71
    sget-object p1, Lcom/tantanapp/beatles/block/MessageHelper;->h:Ljava/util/LinkedList;

    .line 72
    .line 73
    invoke-virtual {p1, p0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    :cond_1
    return-void
.end method

.method public b(JJJLandroid/os/Message;)V
    .locals 2

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    cmp-long v0, p5, v0

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez v0, :cond_2

    .line 7
    .line 8
    iget p5, p0, Lcom/tantanapp/beatles/block/MessageHelper;->a:I

    .line 9
    .line 10
    int-to-long p6, p5

    .line 11
    cmp-long p6, p3, p6

    .line 12
    .line 13
    if-ltz p6, :cond_1

    .line 14
    .line 15
    iget p3, p0, Lcom/tantanapp/beatles/block/MessageHelper;->c:I

    .line 16
    .line 17
    if-lez p3, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/beatles/block/MessageHelper;->c(J)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/MessageHelper;->j()Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    iget p0, p0, Lcom/tantanapp/beatles/block/MessageHelper;->b:I

    .line 27
    .line 28
    int-to-long p4, p0

    .line 29
    iput-wide p4, p3, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->wallTime:J

    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    iput p0, p3, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->count:I

    .line 33
    .line 34
    iput-boolean v1, p3, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->isIdle:Z

    .line 35
    .line 36
    iput-wide p1, p3, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->startTime:J

    .line 37
    .line 38
    sget-object p0, Lcom/tantanapp/beatles/block/MessageHelper;->f:Ljava/util/LinkedList;

    .line 39
    .line 40
    invoke-virtual {p0, p3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    iget p6, p0, Lcom/tantanapp/beatles/block/MessageHelper;->b:I

    .line 45
    .line 46
    int-to-long p6, p6

    .line 47
    add-long/2addr p6, p3

    .line 48
    long-to-int p3, p6

    .line 49
    iput p3, p0, Lcom/tantanapp/beatles/block/MessageHelper;->b:I

    .line 50
    .line 51
    iget p4, p0, Lcom/tantanapp/beatles/block/MessageHelper;->c:I

    .line 52
    .line 53
    add-int/2addr p4, v1

    .line 54
    iput p4, p0, Lcom/tantanapp/beatles/block/MessageHelper;->c:I

    .line 55
    .line 56
    if-lt p3, p5, :cond_4

    .line 57
    .line 58
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/beatles/block/MessageHelper;->c(J)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    iget v0, p0, Lcom/tantanapp/beatles/block/MessageHelper;->c:I

    .line 63
    .line 64
    if-lez v0, :cond_3

    .line 65
    .line 66
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/beatles/block/MessageHelper;->c(J)V

    .line 67
    .line 68
    .line 69
    :cond_3
    if-eqz p7, :cond_4

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/MessageHelper;->j()Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p0, p7}, Lcom/tantanapp/beatles/block/MessageHelper;->f(Landroid/os/Message;)Lcom/tantanapp/beatles/block/MessageHelper$MessageInfo;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    iput-object p0, v0, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->msgInfo:Lcom/tantanapp/beatles/block/MessageHelper$MessageInfo;

    .line 80
    .line 81
    iput-wide p5, v0, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->cpuTime:J

    .line 82
    .line 83
    iput-wide p3, v0, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->wallTime:J

    .line 84
    .line 85
    iput-wide p1, v0, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->startTime:J

    .line 86
    .line 87
    iput v1, v0, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->count:I

    .line 88
    .line 89
    sget-object p0, Lcom/tantanapp/beatles/block/MessageHelper;->f:Ljava/util/LinkedList;

    .line 90
    .line 91
    invoke-virtual {p0, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    :cond_4
    :goto_0
    sget-object p0, Lcom/tantanapp/beatles/block/MessageHelper;->f:Ljava/util/LinkedList;

    .line 95
    .line 96
    invoke-virtual {p0}, Ljava/util/LinkedList;->size()I

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    sget p1, Lcom/tantanapp/beatles/block/MessageHelper;->d:I

    .line 101
    .line 102
    if-le p0, p1, :cond_5

    .line 103
    .line 104
    sget-object p0, Lcom/tantanapp/beatles/block/MessageHelper;->f:Ljava/util/LinkedList;

    .line 105
    .line 106
    invoke-virtual {p0}, Ljava/util/LinkedList;->pop()Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    check-cast p0, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->reset()V

    .line 113
    .line 114
    .line 115
    sget-object p1, Lcom/tantanapp/beatles/block/MessageHelper;->g:Ljava/util/LinkedList;

    .line 116
    .line 117
    invoke-virtual {p1, p0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    :cond_5
    return-void
.end method

.method public final c(J)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/MessageHelper;->j()Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/tantanapp/beatles/block/MessageHelper;->b:I

    .line 6
    .line 7
    int-to-long v1, v1

    .line 8
    iput-wide v1, v0, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->wallTime:J

    .line 9
    .line 10
    iget v1, p0, Lcom/tantanapp/beatles/block/MessageHelper;->c:I

    .line 11
    .line 12
    iput v1, v0, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->count:I

    .line 13
    .line 14
    iput-wide p1, v0, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->startTime:J

    .line 15
    .line 16
    sget-object p1, Lcom/tantanapp/beatles/block/MessageHelper;->f:Ljava/util/LinkedList;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    iput p1, p0, Lcom/tantanapp/beatles/block/MessageHelper;->b:I

    .line 23
    .line 24
    iput p1, p0, Lcom/tantanapp/beatles/block/MessageHelper;->c:I

    .line 25
    .line 26
    return-void
.end method

.method public final d()Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;
    .locals 2

    .line 1
    invoke-static {}, Ll/wgl;->e()Landroid/os/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/MessageHelper;->j()Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p0, v0}, Lcom/tantanapp/beatles/block/MessageHelper;->f(Landroid/os/Message;)Lcom/tantanapp/beatles/block/MessageHelper$MessageInfo;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iput-object p0, v1, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->msgInfo:Lcom/tantanapp/beatles/block/MessageHelper$MessageInfo;

    .line 16
    .line 17
    return-object v1

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public final e()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/tantanapp/beatles/block/MessageHelper;->f:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p0
.end method

.method public final f(Landroid/os/Message;)Lcom/tantanapp/beatles/block/MessageHelper$MessageInfo;
    .locals 4

    .line 1
    new-instance p0, Lcom/tantanapp/beatles/block/MessageHelper$MessageInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantanapp/beatles/block/MessageHelper$MessageInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v0, p1, Landroid/os/Message;->what:I

    .line 7
    .line 8
    iput v0, p0, Lcom/tantanapp/beatles/block/MessageHelper$MessageInfo;->what:I

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/os/Message;->getWhen()J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v2

    .line 18
    sub-long/2addr v0, v2

    .line 19
    iput-wide v0, p0, Lcom/tantanapp/beatles/block/MessageHelper$MessageInfo;->when:J

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/os/Message;->getTarget()Landroid/os/Handler;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, ""

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/os/Message;->getTarget()Landroid/os/Handler;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Landroid/os/Handler;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    move-object v0, v1

    .line 39
    :goto_0
    iput-object v0, p0, Lcom/tantanapp/beatles/block/MessageHelper$MessageInfo;->target:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/os/Message;->getCallback()Ljava/lang/Runnable;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/os/Message;->getCallback()Ljava/lang/Runnable;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    :cond_1
    iput-object v1, p0, Lcom/tantanapp/beatles/block/MessageHelper$MessageInfo;->callback:Ljava/lang/String;

    .line 56
    .line 57
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 58
    .line 59
    iput v0, p0, Lcom/tantanapp/beatles/block/MessageHelper$MessageInfo;->arg1:I

    .line 60
    .line 61
    iget p1, p1, Landroid/os/Message;->arg2:I

    .line 62
    .line 63
    iput p1, p0, Lcom/tantanapp/beatles/block/MessageHelper$MessageInfo;->arg2:I

    .line 64
    .line 65
    return-object p0
.end method

.method public g(J)Lcom/tantanapp/beatles/block/MessageHelper$MessageUnit;
    .locals 4

    .line 1
    new-instance v0, Lcom/tantanapp/beatles/block/MessageHelper$MessageUnit;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantanapp/beatles/block/MessageHelper$MessageUnit;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/MessageHelper;->e()Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-lez v2, :cond_0

    .line 15
    .line 16
    iget-object v2, v0, Lcom/tantanapp/beatles/block/MessageHelper$MessageUnit;->history_message:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v2, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/MessageHelper;->d()Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    const/4 v2, 0x1

    .line 28
    iput v2, v1, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->count:I

    .line 29
    .line 30
    iput-wide p1, v1, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->startTime:J

    .line 31
    .line 32
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 33
    .line 34
    .line 35
    move-result-wide v2

    .line 36
    sub-long/2addr v2, p1

    .line 37
    iput-wide v2, v1, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;->wallTime:J

    .line 38
    .line 39
    :cond_1
    iput-object v1, v0, Lcom/tantanapp/beatles/block/MessageHelper$MessageUnit;->current_message:Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/MessageHelper;->i()Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    if-eqz p0, :cond_2

    .line 46
    .line 47
    iget-object p1, v0, Lcom/tantanapp/beatles/block/MessageHelper$MessageUnit;->pending_message:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {p1, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 50
    .line 51
    .line 52
    :cond_2
    sget-object p0, Lcom/tantanapp/beatles/block/MessageHelper;->i:Ljava/util/LinkedList;

    .line 53
    .line 54
    if-eqz p0, :cond_3

    .line 55
    .line 56
    iget-object p1, v0, Lcom/tantanapp/beatles/block/MessageHelper$MessageUnit;->stacks:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {p1, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 59
    .line 60
    .line 61
    :cond_3
    return-object v0
.end method

.method public h()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/beatles/block/MessageHelper;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public final i()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/tantanapp/beatles/block/MessageHelper$MessageInfo;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/wgl;->b()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    new-instance v1, Ljava/util/LinkedList;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Landroid/os/Message;

    .line 27
    .line 28
    invoke-virtual {p0, v2}, Lcom/tantanapp/beatles/block/MessageHelper;->f(Landroid/os/Message;)Lcom/tantanapp/beatles/block/MessageHelper$MessageInfo;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    return-object v1

    .line 37
    :cond_1
    const/4 p0, 0x0

    .line 38
    return-object p0
.end method

.method public final j()Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;
    .locals 0

    .line 1
    sget-object p0, Lcom/tantanapp/beatles/block/MessageHelper;->g:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/tantanapp/beatles/block/MessageHelper;->g:Ljava/util/LinkedList;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/LinkedList;->pop()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    new-instance p0, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;

    .line 19
    .line 20
    invoke-direct {p0}, Lcom/tantanapp/beatles/block/MessageHelper$MessagesInfo;-><init>()V

    .line 21
    .line 22
    .line 23
    return-object p0
.end method

.method public final k()Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;
    .locals 0

    .line 1
    sget-object p0, Lcom/tantanapp/beatles/block/MessageHelper;->h:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/tantanapp/beatles/block/MessageHelper;->h:Ljava/util/LinkedList;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/LinkedList;->pop()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    new-instance p0, Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;

    .line 19
    .line 20
    invoke-direct {p0}, Lcom/tantanapp/beatles/block/MessageHelper$MessageStack;-><init>()V

    .line 21
    .line 22
    .line 23
    return-object p0
.end method
