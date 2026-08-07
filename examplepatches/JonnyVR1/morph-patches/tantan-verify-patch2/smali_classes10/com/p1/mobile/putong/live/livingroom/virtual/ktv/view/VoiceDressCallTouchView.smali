.class public Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;
.super Lv/VLinear;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView$b;
    }
.end annotation


# static fields
.field public static p:Ljava/lang/String; = "VoiceDressCallTouchView"

.field public static q:Ljava/lang/String; = "idle"

.field public static r:Ljava/lang/String; = "sending"


# instance fields
.field public c:J

.field public final d:I

.field public final e:I

.field public final f:I

.field public final g:I

.field public final h:I

.field public volatile i:I

.field public volatile j:I

.field public k:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView$b;

.field public l:Landroid/os/HandlerThread;

.field public m:Landroid/os/Handler;

.field public n:Ljava/lang/String;

.field public o:Landroid/os/Parcelable;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 25
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, -0x1

    .line 24
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->d:I

    .line 6
    .line 7
    const/4 p1, 0x2

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->e:I

    .line 9
    .line 10
    const/4 p1, 0x3

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->f:I

    .line 12
    .line 13
    const/4 p1, 0x4

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->g:I

    .line 15
    .line 16
    const/4 p1, 0x5

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->h:I

    .line 18
    .line 19
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->q:Ljava/lang/String;

    .line 20
    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->n:Ljava/lang/String;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->Y(I)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->Z(I)V

    return-void
.end method

.method public static bridge synthetic R(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->j:I

    return p0
.end method

.method public static bridge synthetic S(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->i:I

    return p0
.end method

.method public static bridge synthetic T(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;Landroid/os/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->W(Landroid/os/Message;)V

    return-void
.end method

.method public static bridge synthetic V()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->p:Ljava/lang/String;

    return-object v0
.end method

.method private c0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->i:I

    .line 3
    .line 4
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->j:I

    .line 5
    .line 6
    return-void
.end method

.method private setState(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final W(Landroid/os/Message;)V
    .locals 4
    .param p1    # Landroid/os/Message;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget p1, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x3

    .line 5
    const/4 v2, 0x1

    .line 6
    if-eq p1, v2, :cond_4

    .line 7
    .line 8
    const/4 v3, 0x2

    .line 9
    if-eq p1, v3, :cond_3

    .line 10
    .line 11
    if-eq p1, v1, :cond_2

    .line 12
    .line 13
    const/4 v1, 0x4

    .line 14
    if-eq p1, v1, :cond_1

    .line 15
    .line 16
    const/4 v0, 0x5

    .line 17
    if-eq p1, v0, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->c0()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->m:Landroid/os/Handler;

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->i:I

    .line 30
    .line 31
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->j:I

    .line 32
    .line 33
    add-int/2addr p1, v0

    .line 34
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->e0(I)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->m:Landroid/os/Handler;

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->i:I

    .line 44
    .line 45
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->j:I

    .line 46
    .line 47
    add-int/2addr p1, v0

    .line 48
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->e0(I)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->m:Landroid/os/Handler;

    .line 53
    .line 54
    invoke-virtual {p1, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->m:Landroid/os/Handler;

    .line 58
    .line 59
    invoke-virtual {p1, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 60
    .line 61
    .line 62
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->j:I

    .line 63
    .line 64
    add-int/2addr p1, v2

    .line 65
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->j:I

    .line 66
    .line 67
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->i:I

    .line 68
    .line 69
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->j:I

    .line 70
    .line 71
    add-int/2addr p1, v0

    .line 72
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->a0(I)V

    .line 73
    .line 74
    .line 75
    const/16 p1, 0x64

    .line 76
    .line 77
    invoke-virtual {p0, v3, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->f0(II)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->g0(Landroid/content/Context;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->m:Landroid/os/Handler;

    .line 89
    .line 90
    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->i:I

    .line 94
    .line 95
    add-int/2addr p1, v2

    .line 96
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->i:I

    .line 97
    .line 98
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->i:I

    .line 99
    .line 100
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->j:I

    .line 101
    .line 102
    add-int/2addr p1, v0

    .line 103
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->a0(I)V

    .line 104
    .line 105
    .line 106
    const/16 p1, 0x3e8

    .line 107
    .line 108
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->f0(II)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public X()V
    .locals 2

    .line 1
    new-instance v0, Landroid/os/HandlerThread;

    .line 2
    .line 3
    const-string v1, "VoiceDressCallTouchView"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->l:Landroid/os/HandlerThread;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 11
    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView$a;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->l:Landroid/os/HandlerThread;

    .line 16
    .line 17
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;Landroid/os/Looper;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->m:Landroid/os/Handler;

    .line 25
    .line 26
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->q:Ljava/lang/String;

    .line 27
    .line 28
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->setState(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const/4 v0, 0x5

    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->f0(II)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic Y(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->k:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView$b;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView$b;->b(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic Z(I)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->r:Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->setState(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x5

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->f0(II)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->k:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView$b;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView$b;->a(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final a0(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->k:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView$b;

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
    if-lez p1, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/vcn0;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1}, Ll/vcn0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public b0()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->i:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->i:I

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->j:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->e0(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->l:Landroid/os/HandlerThread;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->l:Landroid/os/HandlerThread;

    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->m:Landroid/os/Handler;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->m:Landroid/os/Handler;

    .line 31
    .line 32
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->q:Ljava/lang/String;

    .line 33
    .line 34
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->setState(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public d0()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->q:Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->setState(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final e0(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->k:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView$b;

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
    if-lez p1, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/ucn0;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1}, Ll/ucn0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final f0(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->m:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput p1, v0, Landroid/os/Message;->what:I

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->m:Landroid/os/Handler;

    .line 12
    .line 13
    int-to-long p1, p2

    .line 14
    invoke-virtual {p0, v0, p1, p2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public g0(Landroid/content/Context;)V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    const-string v0, "vibrator"

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Landroid/os/Vibrator;

    .line 11
    .line 12
    if-eqz p1, :cond_3

    .line 13
    .line 14
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 15
    .line 16
    const/16 v1, 0x1a

    .line 17
    .line 18
    const-wide/16 v2, 0x1e

    .line 19
    .line 20
    if-lt v0, v1, :cond_2

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->o:Landroid/os/Parcelable;

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    const/16 v0, 0x96

    .line 27
    .line 28
    invoke-static {v2, v3, v0}, Ll/cm3;->a(JI)Landroid/os/VibrationEffect;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->o:Landroid/os/Parcelable;

    .line 33
    .line 34
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->o:Landroid/os/Parcelable;

    .line 35
    .line 36
    invoke-static {v0}, Ll/qa6;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->o:Landroid/os/Parcelable;

    .line 43
    .line 44
    invoke-static {p0}, Ll/ra6;->a(Ljava/lang/Object;)Landroid/os/VibrationEffect;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {p1, p0}, Ll/dm3;->a(Landroid/os/Vibrator;Landroid/os/VibrationEffect;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    invoke-virtual {p1, v2, v3}, Landroid/os/Vibrator;->vibrate(J)V

    .line 53
    .line 54
    .line 55
    :cond_3
    :goto_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iput v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->j:I

    .line 10
    .line 11
    invoke-static {}, Ll/pzi0;->o()J

    .line 12
    .line 13
    .line 14
    move-result-wide v3

    .line 15
    iput-wide v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->c:J

    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->r:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->n:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    return v2

    .line 28
    :cond_0
    const/4 p1, 0x2

    .line 29
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->f0(II)V

    .line 34
    .line 35
    .line 36
    return v1

    .line 37
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eq v0, v1, :cond_2

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    const/4 v3, 0x3

    .line 48
    if-ne v0, v3, :cond_4

    .line 49
    .line 50
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->q:Ljava/lang/String;

    .line 51
    .line 52
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->n:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_4

    .line 59
    .line 60
    invoke-static {}, Ll/pzi0;->o()J

    .line 61
    .line 62
    .line 63
    move-result-wide v3

    .line 64
    iget-wide v5, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->c:J

    .line 65
    .line 66
    sub-long/2addr v3, v5

    .line 67
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    int-to-long v5, p1

    .line 72
    cmp-long p1, v3, v5

    .line 73
    .line 74
    if-ltz p1, :cond_3

    .line 75
    .line 76
    const/4 p1, 0x4

    .line 77
    invoke-virtual {p0, p1, v2}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->f0(II)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_3
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->f0(II)V

    .line 82
    .line 83
    .line 84
    :goto_0
    return v1

    .line 85
    :cond_4
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    return p0
.end method

.method public setOnSendListener(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->k:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView$b;

    .line 2
    .line 3
    return-void
.end method
