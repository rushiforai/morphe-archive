.class public Ll/aso0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/aso0;->b:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/aso0;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ll/ugd0;)Lrx/c;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ugd0;",
            ")",
            "Lrx/c<",
            "Ll/kfn0;",
            ">;"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p0, Ljava/lang/NullPointerException;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/NullPointerException;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Lrx/c;->error(Ljava/lang/Throwable;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    iget-object v0, p0, Ll/aso0;->b:Ljava/lang/String;

    .line 14
    .line 15
    const-string v1, "room-topic"

    .line 16
    .line 17
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Ll/aso0;->b:Ljava/lang/String;

    .line 24
    .line 25
    const-string v1, "topic"

    .line 26
    .line 27
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    :cond_1
    iget-object p1, p1, Ll/mr2;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 34
    .line 35
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topics:Ljava/util/List;

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;->id:Ljava/lang/String;

    .line 47
    .line 48
    iput-object p1, p0, Ll/aso0;->c:Ljava/lang/String;

    .line 49
    .line 50
    :cond_2
    iget-object v1, p0, Ll/aso0;->b:Ljava/lang/String;

    .line 51
    .line 52
    sget v3, Ll/itv;->a:I

    .line 53
    .line 54
    iget-object p1, p0, Ll/aso0;->c:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_3

    .line 61
    .line 62
    const/4 p0, 0x0

    .line 63
    :goto_0
    move-object v6, p0

    .line 64
    goto :goto_1

    .line 65
    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    const-string v0, "topicId="

    .line 68
    .line 69
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Ll/aso0;->c:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    goto :goto_0

    .line 82
    :goto_1
    const-string v0, "suggested"

    .line 83
    .line 84
    const-string v2, "swipe-in-room"

    .line 85
    .line 86
    const/4 v4, 0x0

    .line 87
    const/4 v5, 0x0

    .line 88
    invoke-static/range {v0 .. v6}, Ll/itv;->z(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ZLjava/lang/String;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    new-instance p1, Ll/s2v;

    .line 93
    .line 94
    invoke-direct {p1}, Ll/s2v;-><init>()V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    return-object p0
.end method

.method public b(Ll/kfn0;)Lrx/c;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/kfn0;",
            ")",
            "Lrx/c<",
            "Ll/kfn0;",
            ">;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/kfn0;->j()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_2

    .line 10
    :cond_0
    iget-object v2, p0, Ll/aso0;->b:Ljava/lang/String;

    .line 11
    .line 12
    sget v4, Ll/itv;->a:I

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/kfn0;->i()Lcom/p1/mobile/putong/data/Pagination;

    .line 15
    .line 16
    .line 17
    move-result-object v5

    .line 18
    iget-object p1, p0, Ll/aso0;->c:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    :goto_0
    move-object v6, p0

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v0, "topicId="

    .line 32
    .line 33
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/aso0;->c:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    goto :goto_0

    .line 46
    :goto_1
    const-string v1, "suggested"

    .line 47
    .line 48
    const-string v3, "swipe-in-room"

    .line 49
    .line 50
    invoke-static/range {v1 .. v6}, Ll/itv;->A(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/p1/mobile/putong/data/Pagination;Ljava/lang/String;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    new-instance p1, Ll/s2v;

    .line 55
    .line 56
    invoke-direct {p1}, Ll/s2v;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0

    .line 64
    :cond_2
    :goto_2
    new-instance p0, Ll/ek20;

    .line 65
    .line 66
    invoke-direct {p0}, Ll/ek20;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0
.end method
