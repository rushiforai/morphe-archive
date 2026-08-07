.class public Ll/i500;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Ll/i4m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/g500;",
        ">;",
        "Ll/i4m;"
    }
.end annotation


# instance fields
.field public a:Ll/g500;

.field public b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

.field public c:Z

.field public d:Z

.field public e:Z

.field public f:J

.field public g:I

.field public h:Ljava/lang/Runnable;

.field public i:Ljava/lang/Runnable;

.field public j:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/i500;->c:Z

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput-boolean v1, p0, Ll/i500;->d:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Ll/i500;->e:Z

    .line 11
    .line 12
    const-wide/16 v2, 0x0

    .line 13
    .line 14
    iput-wide v2, p0, Ll/i500;->f:J

    .line 15
    .line 16
    iput v1, p0, Ll/i500;->g:I

    .line 17
    .line 18
    new-instance v0, Ll/i500$b;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/i500$b;-><init>(Ll/i500;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/i500;->h:Ljava/lang/Runnable;

    .line 24
    .line 25
    new-instance v0, Ll/i500$c;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/i500$c;-><init>(Ll/i500;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/i500;->i:Ljava/lang/Runnable;

    .line 31
    .line 32
    new-instance v0, Ll/h500;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Ll/h500;-><init>(Ll/i500;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/i500;->j:Ljava/lang/Runnable;

    .line 38
    .line 39
    iput-object p1, p0, Ll/i500;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 40
    .line 41
    return-void
.end method

.method public static synthetic c(Ll/i500;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/i500;->s()V

    return-void
.end method

.method public static bridge synthetic d(Ll/i500;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/i500;->f:J

    return-wide v0
.end method

.method public static bridge synthetic e(Ll/i500;)Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i500;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/i500;)Ll/g500;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i500;->a:Ll/g500;

    return-object p0
.end method

.method public static bridge synthetic i(Ll/i500;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/i500;->c:Z

    return-void
.end method

.method public static bridge synthetic j(Ll/i500;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/i500;->e:Z

    return-void
.end method

.method private synthetic s()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i500;->a:Ll/g500;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/g500;->b1()Ll/tnw;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget p0, p0, Ll/i500;->g:I

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ll/tnw;->C(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/i500;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public a()V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/i500;->f:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-lez v0, :cond_2

    .line 8
    .line 9
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iget-wide v2, p0, Ll/i500;->f:J

    .line 14
    .line 15
    sub-long/2addr v0, v2

    .line 16
    const-wide/16 v2, 0xfa

    .line 17
    .line 18
    cmp-long v0, v0, v2

    .line 19
    .line 20
    if-lez v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/i500;->p()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/i500;->q()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v1, p0, Ll/i500;->a:Ll/g500;

    .line 30
    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    invoke-virtual {v1}, Ll/g500;->f1()V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    invoke-virtual {v1}, Ll/g500;->b1()Ll/tnw;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ll/tnw;->D()V

    .line 42
    .line 43
    .line 44
    :goto_0
    iget-object p0, p0, Ll/i500;->a:Ll/g500;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Ll/clz;->a3()V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    iget-object p0, p0, Ll/i500;->a:Ll/g500;

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/g500;->d1()V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_2
    iget-object p0, p0, Ll/i500;->a:Ll/g500;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/g500;->d1()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/i500;->l()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i500;->a:Ll/g500;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/g500;->d1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/g500;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/i500;->m(Ll/g500;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/i500;->k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance p2, Ll/i500$a;

    .line 6
    .line 7
    invoke-direct {p2, p0}, Ll/i500$a;-><init>(Ll/i500;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 11
    .line 12
    .line 13
    return-object p1
.end method

.method public k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/j500;->b(Ll/i500;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/i500;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Ll/g500;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i500;->a:Ll/g500;

    .line 2
    .line 3
    return-void
.end method

.method public n()I
    .locals 0

    .line 1
    iget p0, p0, Ll/i500;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public p()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/i500;->a:Ll/g500;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ll/mzl;->B0()Ll/u1z;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/i500;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 12
    .line 13
    iget-object v2, p0, Ll/i500;->j:Ljava/lang/Runnable;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/i500;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 19
    .line 20
    iget-object v2, p0, Ll/i500;->h:Ljava/lang/Runnable;

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ll/i500;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 26
    .line 27
    iget-object v2, p0, Ll/i500;->i:Ljava/lang/Runnable;

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Ll/d3z;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const/4 v2, 0x1

    .line 47
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setFocusableInTouchMode(Z)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setFocusable(Z)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/i500;->a:Ll/g500;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-interface {p0}, Ll/mzl;->d0()Ll/vez;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Ll/vez;->D0()Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_0

    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-static {p0}, Ll/bnl0;->A(Landroid/view/View;)V

    .line 78
    .line 79
    .line 80
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getRecordLayout()Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->m()V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public q()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/i500;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public u()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/i500;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    iget-object v1, p0, Ll/i500;->h:Ljava/lang/Runnable;

    .line 4
    .line 5
    const-wide/32 v2, 0xc224

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/i500;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 12
    .line 13
    iget-object v1, p0, Ll/i500;->i:Ljava/lang/Runnable;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->post(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    iput-wide v0, p0, Ll/i500;->f:J

    .line 23
    .line 24
    iget-object v0, p0, Ll/i500;->a:Ll/g500;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {v0}, Ll/mzl;->B0()Ll/u1z;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Ll/d3z;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getRecordLayout()Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-wide v1, p0, Ll/i500;->f:J

    .line 49
    .line 50
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->setRecordStartTime(J)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public v()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/i500;->e:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Ll/i500;->c:Z

    .line 5
    .line 6
    const-wide/16 v0, -0x1

    .line 7
    .line 8
    iput-wide v0, p0, Ll/i500;->f:J

    .line 9
    .line 10
    iget-object v0, p0, Ll/i500;->a:Ll/g500;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/g500;->h1()V

    .line 13
    .line 14
    .line 15
    iget v0, p0, Ll/i500;->g:I

    .line 16
    .line 17
    add-int/lit8 v0, v0, 0x1

    .line 18
    .line 19
    iput v0, p0, Ll/i500;->g:I

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/i500;->l()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Ll/i500;->j:Ljava/lang/Runnable;

    .line 26
    .line 27
    const-wide/16 v2, 0x3c

    .line 28
    .line 29
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/i500;->a:Ll/g500;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/g500;->i1()V

    .line 35
    .line 36
    .line 37
    return-void
.end method
