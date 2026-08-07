.class public Ll/hrk0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/hrk0$a;,
        Ll/hrk0$b;
    }
.end annotation


# instance fields
.field public a:Ll/ado0;

.field public b:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/hrk0$a;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/hrk0$b;

.field public final d:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            ">;"
        }
    .end annotation
.end field

.field public e:I

.field public f:Z

.field public final g:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/hrk0;->d:Ljava/util/HashMap;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/hrk0;->f:Z

    .line 13
    .line 14
    const-string v0, "position index illegal"

    .line 15
    .line 16
    iput-object v0, p0, Ll/hrk0;->g:Ljava/lang/String;

    .line 17
    .line 18
    new-instance v0, Ll/ado0;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/ado0;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/hrk0;->a:Ll/ado0;

    .line 24
    .line 25
    return-void
.end method

.method public static bridge synthetic a(Ll/hrk0;Ll/ezm0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hrk0;->d(Ll/ezm0;)V

    return-void
.end method

.method public static bridge synthetic b(Ll/hrk0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hrk0;->w(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic c(Ll/hrk0;Ll/ado0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hrk0;->A(Ll/ado0;)V

    return-void
.end method


# virtual methods
.method public final A(Ll/ado0;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/hrk0;->G(Ll/ado0;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput-object p1, p0, Ll/hrk0;->a:Ll/ado0;

    .line 9
    .line 10
    iget-object p0, p0, Ll/hrk0;->b:Lrx/subjects/a;

    .line 11
    .line 12
    new-instance p1, Ll/hrk0$a;

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-direct {p1, v0}, Ll/hrk0$a;-><init>(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public B(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hrk0;->a:Ll/ado0;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/ado0;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-boolean v1, p0, Ll/hrk0;->f:Z

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1, v0}, Ll/hrk0;->D(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0, p1, v0}, Ll/hrk0;->E(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public C(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hrk0;->a:Ll/ado0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/ado0;->V(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/hrk0;->b:Lrx/subjects/a;

    .line 7
    .line 8
    new-instance v0, Ll/hrk0$a;

    .line 9
    .line 10
    const/4 v1, 0x2

    .line 11
    invoke-direct {v0, v1, p1}, Ll/hrk0$a;-><init>(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final D(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 4

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/hrk0;->u(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p2, "position index illegal"

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Ll/hrk0;->y(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    if-nez p2, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userRecvRewardPoint:J

    .line 19
    .line 20
    iget-wide v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userRecvRewardPoint:J

    .line 21
    .line 22
    cmp-long v0, v0, v2

    .line 23
    .line 24
    if-gez v0, :cond_2

    .line 25
    .line 26
    iput-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userRecvRewardPoint:J

    .line 27
    .line 28
    :cond_2
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->popularity:J

    .line 29
    .line 30
    iget-wide v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->popularity:J

    .line 31
    .line 32
    cmp-long v0, v0, v2

    .line 33
    .line 34
    if-gez v0, :cond_3

    .line 35
    .line 36
    iput-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->popularity:J

    .line 37
    .line 38
    :cond_3
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->contribution:J

    .line 39
    .line 40
    iget-wide v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->contribution:J

    .line 41
    .line 42
    cmp-long v0, v0, v2

    .line 43
    .line 44
    if-gez v0, :cond_4

    .line 45
    .line 46
    iput-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->contribution:J

    .line 47
    .line 48
    :cond_4
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_5

    .line 53
    .line 54
    :goto_0
    return-void

    .line 55
    :cond_5
    invoke-virtual {p0, p1, p2}, Ll/hrk0;->t(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 56
    .line 57
    .line 58
    const/4 p1, 0x0

    .line 59
    invoke-virtual {p0, p2, p1}, Ll/hrk0;->F(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Ll/hrk0;->b:Lrx/subjects/a;

    .line 63
    .line 64
    new-instance p1, Ll/hrk0$a;

    .line 65
    .line 66
    const/4 v0, 0x2

    .line 67
    invoke-direct {p1, v0, p2}, Ll/hrk0$a;-><init>(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final E(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    if-nez p2, :cond_1

    .line 2
    .line 3
    iget-object p2, p0, Ll/hrk0;->a:Ll/ado0;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p2, v0}, Ll/ado0;->D(Ljava/lang/String;)Ll/nsv;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/hrk0;->a:Ll/ado0;

    .line 15
    .line 16
    invoke-virtual {v0, p1, p2}, Ll/ado0;->x(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/hrk0;->b:Lrx/subjects/a;

    .line 20
    .line 21
    new-instance p2, Ll/hrk0$a;

    .line 22
    .line 23
    const/4 v0, 0x4

    .line 24
    invoke-direct {p2, v0, p1}, Ll/hrk0$a;-><init>(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    :goto_0
    return-void

    .line 38
    :cond_2
    invoke-virtual {p0, p1, p2}, Ll/hrk0;->t(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/hrk0;->a:Ll/ado0;

    .line 42
    .line 43
    invoke-virtual {v0, p1}, Ll/ado0;->V(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/hrk0;->b:Lrx/subjects/a;

    .line 47
    .line 48
    new-instance p1, Ll/hrk0$a;

    .line 49
    .line 50
    const/4 v0, 0x2

    .line 51
    invoke-direct {p1, v0, p2}, Ll/hrk0$a;-><init>(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final F(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Ll/nsv<",
            "Ll/h64;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/hrk0;->d:Ljava/util/HashMap;

    .line 2
    .line 3
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/hrk0;->a:Ll/ado0;

    .line 13
    .line 14
    if-nez p2, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/ado0;->V(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/ado0;->x(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final G(Ll/ado0;)Z
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/hrk0;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/hrk0;->d:Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ll/ado0;->E()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 29
    .line 30
    iget v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Ll/hrk0;->u(I)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    const-string p1, "position index illegal"

    .line 39
    .line 40
    invoke-virtual {p0, v0, p1}, Ll/hrk0;->y(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x0

    .line 44
    return p0

    .line 45
    :cond_0
    iget-object v2, p0, Ll/hrk0;->d:Ljava/util/HashMap;

    .line 46
    .line 47
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v2, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    const/4 p0, 0x1

    .line 56
    return p0
.end method

.method public final d(Ll/ezm0;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/ezm0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    iget-object p1, p1, Ll/ezm0;->b:Ll/nsv;

    .line 4
    .line 5
    if-eqz p1, :cond_3

    .line 6
    .line 7
    iget-object v1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v1, Ll/h64;

    .line 10
    .line 11
    iget-object v1, v1, Ll/h64;->a:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_3

    .line 18
    .line 19
    iget-object v1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v1, Ll/h64;

    .line 22
    .line 23
    iget-object v1, v1, Ll/h64;->b:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-boolean v1, p0, Ll/hrk0;->f:Z

    .line 33
    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    iget v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 37
    .line 38
    invoke-virtual {p0, v1}, Ll/hrk0;->u(I)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    const-string p1, "position index illegal"

    .line 45
    .line 46
    invoke-virtual {p0, v0, p1}, Ll/hrk0;->y(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    invoke-virtual {p0, v0, p1}, Ll/hrk0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    invoke-virtual {p0, v0, p1}, Ll/hrk0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V

    .line 55
    .line 56
    .line 57
    :cond_3
    :goto_0
    return-void
.end method

.method public final e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Ll/nsv<",
            "Ll/h64;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/hrk0;->a:Ll/ado0;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/ado0;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p0, p1, v0}, Ll/hrk0;->t(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0, p2}, Ll/hrk0;->F(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/hrk0;->b:Lrx/subjects/a;

    .line 25
    .line 26
    new-instance p1, Ll/hrk0$a;

    .line 27
    .line 28
    const/4 p2, 0x2

    .line 29
    invoke-direct {p1, p2, v0}, Ll/hrk0$a;-><init>(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    invoke-virtual {p0, p1, p2}, Ll/hrk0;->F(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/hrk0;->b:Lrx/subjects/a;

    .line 40
    .line 41
    new-instance p2, Ll/hrk0$a;

    .line 42
    .line 43
    const/4 v0, 0x4

    .line 44
    invoke-direct {p2, v0, p1}, Ll/hrk0$a;-><init>(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, p2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Ll/nsv<",
            "Ll/h64;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/hrk0;->a:Ll/ado0;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/ado0;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p0, p1, v0}, Ll/hrk0;->t(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/hrk0;->a:Ll/ado0;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ll/ado0;->V(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/hrk0;->b:Lrx/subjects/a;

    .line 27
    .line 28
    new-instance p1, Ll/hrk0$a;

    .line 29
    .line 30
    const/4 p2, 0x2

    .line 31
    invoke-direct {p1, p2, v0}, Ll/hrk0$a;-><init>(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    iget-object v0, p0, Ll/hrk0;->a:Ll/ado0;

    .line 39
    .line 40
    invoke-virtual {v0, p1, p2}, Ll/ado0;->x(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Ll/hrk0;->b:Lrx/subjects/a;

    .line 44
    .line 45
    new-instance p2, Ll/hrk0$a;

    .line 46
    .line 47
    const/4 v0, 0x4

    .line 48
    invoke-direct {p2, v0, p1}, Ll/hrk0$a;-><init>(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, p2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public g(Ll/nsv;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Ll/h64;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/hrk0;->a:Ll/ado0;

    .line 2
    .line 3
    iget-object v1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Ll/h64;

    .line 6
    .line 7
    iget-object v1, v1, Ll/h64;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/ado0;->G(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/hrk0;->a:Ll/ado0;

    .line 16
    .line 17
    invoke-virtual {p0, p1, p2}, Ll/ado0;->y(Ll/nsv;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public h(Ll/hrk0$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hrk0;->c:Ll/hrk0$b;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-static {p1, p0}, Ll/hrk0$b;->a(Ll/hrk0$b;Ll/hrk0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/hrk0;->a:Ll/ado0;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/ado0;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Ll/hrk0;->u(I)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    const-string v0, "position index illegal"

    .line 18
    .line 19
    invoke-virtual {p0, p1, v0}, Ll/hrk0;->y(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    if-nez v0, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userRecvRewardPoint:J

    .line 27
    .line 28
    iget-wide v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userRecvRewardPoint:J

    .line 29
    .line 30
    cmp-long v1, v1, v3

    .line 31
    .line 32
    if-gez v1, :cond_2

    .line 33
    .line 34
    iput-wide v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userRecvRewardPoint:J

    .line 35
    .line 36
    :cond_2
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->popularity:J

    .line 37
    .line 38
    iget-wide v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->popularity:J

    .line 39
    .line 40
    cmp-long v1, v1, v3

    .line 41
    .line 42
    if-gez v1, :cond_3

    .line 43
    .line 44
    iput-wide v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->popularity:J

    .line 45
    .line 46
    :cond_3
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->contribution:J

    .line 47
    .line 48
    iget-wide v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->contribution:J

    .line 49
    .line 50
    cmp-long v1, v1, v3

    .line 51
    .line 52
    if-gez v1, :cond_4

    .line 53
    .line 54
    iput-wide v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->contribution:J

    .line 55
    .line 56
    :cond_4
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_5

    .line 61
    .line 62
    :goto_0
    return-void

    .line 63
    :cond_5
    iget v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 64
    .line 65
    iput v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->intendPosition:I

    .line 66
    .line 67
    invoke-virtual {p0, p1, v0}, Ll/hrk0;->t(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/hrk0;->d:Ljava/util/HashMap;

    .line 71
    .line 72
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->intendPosition:I

    .line 73
    .line 74
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/hrk0;->d:Ljava/util/HashMap;

    .line 82
    .line 83
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 84
    .line 85
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Ll/hrk0;->a:Ll/ado0;

    .line 93
    .line 94
    invoke-virtual {v0, p1}, Ll/ado0;->V(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Ll/hrk0;->b:Lrx/subjects/a;

    .line 98
    .line 99
    new-instance v0, Ll/hrk0$a;

    .line 100
    .line 101
    const/4 v1, 0x5

    .line 102
    invoke-direct {v0, v1, p1}, Ll/hrk0$a;-><init>(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public j(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hrk0;->a:Ll/ado0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ado0;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public k(I)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hrk0;->d:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 12
    .line 13
    return-object p0
.end method

.method public l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hrk0;->a:Ll/ado0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ado0;->C(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public m(Ljava/lang/String;)Ll/nsv;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/nsv<",
            "Ll/h64;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hrk0;->a:Ll/ado0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ado0;->D(Ljava/lang/String;)Ll/nsv;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n(Ljava/lang/String;)Ll/h64;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p0, Ll/h64;

    .line 12
    .line 13
    return-object p0
.end method

.method public o(Ljava/lang/Integer;)Ll/nsv;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Integer;",
            ")",
            "Ll/nsv<",
            "Ll/h64;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/hrk0;->d:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/hrk0;->a:Ll/ado0;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/ado0;->D(Ljava/lang/String;)Ll/nsv;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public p()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hrk0;->a:Ll/ado0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ado0;->E()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public q()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hrk0;->a:Ll/ado0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ado0;->F()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public r()Ll/ado0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hrk0;->a:Ll/ado0;

    .line 2
    .line 3
    return-object p0
.end method

.method public s()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hrk0;->a:Ll/ado0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ado0;->I()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final t(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->voiceLiveId:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->voiceLiveId:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->state:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->state:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->source:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->source:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchor:Ljava/lang/String;

    .line 22
    .line 23
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchor:Ljava/lang/String;

    .line 24
    .line 25
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userSendRewardPoint:J

    .line 26
    .line 27
    iput-wide v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userSendRewardPoint:J

    .line 28
    .line 29
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userRecvRewardPoint:J

    .line 30
    .line 31
    iput-wide v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userRecvRewardPoint:J

    .line 32
    .line 33
    iget p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->intendPosition:I

    .line 34
    .line 35
    iput p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->intendPosition:I

    .line 36
    .line 37
    iget p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 38
    .line 39
    iput p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 40
    .line 41
    iget-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 42
    .line 43
    iput-boolean p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 44
    .line 45
    iget-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 46
    .line 47
    iput-boolean p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 48
    .line 49
    iget-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isAway:Z

    .line 50
    .line 51
    iput-boolean p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isAway:Z

    .line 52
    .line 53
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->inviteId:Ljava/lang/String;

    .line 54
    .line 55
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->inviteId:Ljava/lang/String;

    .line 56
    .line 57
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userName:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-nez p0, :cond_0

    .line 64
    .line 65
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userName:Ljava/lang/String;

    .line 66
    .line 67
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userName:Ljava/lang/String;

    .line 68
    .line 69
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorUserName:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-nez p0, :cond_1

    .line 76
    .line 77
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorUserName:Ljava/lang/String;

    .line 78
    .line 79
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorUserName:Ljava/lang/String;

    .line 80
    .line 81
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userPicture:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    if-nez p0, :cond_2

    .line 88
    .line 89
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userPicture:Ljava/lang/String;

    .line 90
    .line 91
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userPicture:Ljava/lang/String;

    .line 92
    .line 93
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorPicture:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    if-nez p0, :cond_3

    .line 100
    .line 101
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorPicture:Ljava/lang/String;

    .line 102
    .line 103
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorPicture:Ljava/lang/String;

    .line 104
    .line 105
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->hangupReason:Ljava/lang/String;

    .line 106
    .line 107
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->hangupReason:Ljava/lang/String;

    .line 108
    .line 109
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->role:Ljava/lang/String;

    .line 110
    .line 111
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->role:Ljava/lang/String;

    .line 112
    .line 113
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->awayReason:Ljava/lang/String;

    .line 114
    .line 115
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->awayReason:Ljava/lang/String;

    .line 116
    .line 117
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->popularity:J

    .line 118
    .line 119
    iput-wide v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->popularity:J

    .line 120
    .line 121
    iget-wide p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->contribution:J

    .line 122
    .line 123
    iput-wide p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->contribution:J

    .line 124
    .line 125
    return-object p2
.end method

.method public final u(I)Z
    .locals 0

    .line 1
    if-ltz p1, :cond_1

    .line 2
    .line 3
    iget p0, p0, Ll/hrk0;->e:I

    .line 4
    .line 5
    if-lt p1, p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method public v(I)V
    .locals 1

    .line 1
    iput p1, p0, Ll/hrk0;->e:I

    .line 2
    .line 3
    iget-object p1, p0, Ll/hrk0;->d:Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/util/HashMap;->clear()V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ll/ado0;

    .line 9
    .line 10
    invoke-direct {p1}, Ll/ado0;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/hrk0;->a:Ll/ado0;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p1, v0}, Ll/ado0;->Y(Z)V

    .line 17
    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Ll/hrk0;->f:Z

    .line 21
    .line 22
    return-void
.end method

.method public final w(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hrk0;->a:Ll/ado0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/ado0;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/hrk0;->a:Ll/ado0;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ll/ado0;->S(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/hrk0;->b:Lrx/subjects/a;

    .line 16
    .line 17
    new-instance v1, Ll/hrk0$a;

    .line 18
    .line 19
    const/4 v2, 0x3

    .line 20
    invoke-direct {v1, v2, p1}, Ll/hrk0$a;-><init>(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iget-boolean v0, p0, Ll/hrk0;->f:Z

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Ll/hrk0;->d:Ljava/util/HashMap;

    .line 31
    .line 32
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 33
    .line 34
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    :cond_1
    :goto_0
    return-void
.end method

.method public x(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hrk0;->a:Ll/ado0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ado0;->T(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final y(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/nano/MessageNano;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "position:"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string p1, "count:"

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget p0, p0, Ll/hrk0;->e:I

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 31
    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    const/16 p0, 0x2710

    .line 51
    .line 52
    invoke-static {p1, p0}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public z(Lrx/subjects/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/subjects/a<",
            "Ll/hrk0$a;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/hrk0;->b:Lrx/subjects/a;

    .line 2
    .line 3
    return-void
.end method
