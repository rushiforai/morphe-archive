.class public Lcom/p1/mobile/putong/live/external/direction/core/LiveGoDummyAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static X1(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/live/external/direction/core/LiveGoDummyAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method


# virtual methods
.method public onResumeLifecycle()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onResumeLifecycle()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/itd0;->b:Ll/itd0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Ll/fk3;

    .line 11
    .line 12
    invoke-virtual {v1}, Ll/fk3;->m()Ll/fk3$a;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ll/fk3;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/fk3;->g()V

    .line 23
    .line 24
    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget v0, v1, Ll/fk3$a;->a:I

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    if-ne v0, v2, :cond_1

    .line 35
    .line 36
    iget-object v0, v1, Ll/fk3$a;->e:Lcom/p1/mobile/putong/data/PushMessage;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 39
    .line 40
    const-string v2, "slient"

    .line 41
    .line 42
    iput-object v2, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->type:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    iget-object v0, v1, Ll/fk3$a;->e:Lcom/p1/mobile/putong/data/PushMessage;

    .line 49
    .line 50
    iget-object v1, v1, Ll/fk3$a;->f:Lcom/p1/mobile/putong/api/push/PushTrackData;

    .line 51
    .line 52
    invoke-static {p0, v0, v1}, Ll/fss;->p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)Z

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    const/4 v2, 0x2

    .line 57
    if-ne v0, v2, :cond_2

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    iget-object v0, v1, Ll/fk3$a;->b:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iget-object v2, v1, Ll/fk3$a;->c:Ll/abe0;

    .line 68
    .line 69
    iget-object v1, v1, Ll/fk3$a;->d:Ll/z20;

    .line 70
    .line 71
    invoke-static {p0, v0, v2, v1}, Ll/fss;->q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/abe0;Ll/z20;)Z

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 76
    .line 77
    .line 78
    return-void
.end method
