.class public Ll/y2h0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile c:Ll/y2h0;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/ActionData;

.field public b:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/b;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic b(Ll/y2h0;Lcom/p1/mobile/putong/core/data/ActionData;Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/y2h0;->i(Lcom/p1/mobile/putong/core/data/ActionData;Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/llb0;->i(Ll/fqe0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static f()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    const-string v0, "swipe"

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 17
    .line 18
    if-ne v0, v1, :cond_1

    .line 19
    .line 20
    const-string v0, "live"

    .line 21
    .line 22
    return-object v0

    .line 23
    :cond_1
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 28
    .line 29
    if-ne v0, v1, :cond_2

    .line 30
    .line 31
    const-string v0, "find"

    .line 32
    .line 33
    return-object v0

    .line 34
    :cond_2
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 39
    .line 40
    if-ne v0, v1, :cond_3

    .line 41
    .line 42
    const-string v0, "message"

    .line 43
    .line 44
    return-object v0

    .line 45
    :cond_3
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 50
    .line 51
    if-ne v0, v1, :cond_4

    .line 52
    .line 53
    const-string v0, "my"

    .line 54
    .line 55
    return-object v0

    .line 56
    :cond_4
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    if-nez v0, :cond_5

    .line 61
    .line 62
    const-string v0, "other"

    .line 63
    .line 64
    return-object v0

    .line 65
    :cond_5
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    return-object v0
.end method

.method public static g()Ll/y2h0;
    .locals 2

    .line 1
    sget-object v0, Ll/y2h0;->c:Ll/y2h0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/y2h0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/y2h0;->c:Ll/y2h0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/y2h0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/y2h0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/y2h0;->c:Ll/y2h0;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/y2h0;->c:Ll/y2h0;

    .line 27
    .line 28
    return-object v0
.end method

.method public static h(Ljava/util/List;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const-string v0, "swipe"

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 14
    .line 15
    if-eq v0, v1, :cond_4

    .line 16
    .line 17
    :cond_0
    const-string v0, "live"

    .line 18
    .line 19
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 30
    .line 31
    if-eq v0, v1, :cond_4

    .line 32
    .line 33
    :cond_1
    const-string v0, "find"

    .line 34
    .line 35
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 46
    .line 47
    if-eq v0, v1, :cond_4

    .line 48
    .line 49
    :cond_2
    const-string v0, "message"

    .line 50
    .line 51
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_3

    .line 56
    .line 57
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 62
    .line 63
    if-eq v0, v1, :cond_4

    .line 64
    .line 65
    :cond_3
    const-string v0, "my"

    .line 66
    .line 67
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_5

    .line 72
    .line 73
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 78
    .line 79
    if-ne p0, v0, :cond_5

    .line 80
    .line 81
    :cond_4
    const/4 p0, 0x1

    .line 82
    return p0

    .line 83
    :cond_5
    const/4 p0, 0x0

    .line 84
    return p0
.end method

.method public static m(Ljava/lang/String;)Ll/pf60;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {v0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string v1, "["

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    const-string v1, "]"

    .line 19
    .line 20
    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    const/16 v0, 0x5b

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const/16 v1, 0x5d

    .line 33
    .line 34
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    add-int/lit8 v2, v2, 0x1

    .line 39
    .line 40
    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    add-int/lit8 v1, v1, 0x1

    .line 49
    .line 50
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :cond_1
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0
.end method


# virtual methods
.method public d(Ljava/lang/String;ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/ActionData;)V
    .locals 10
    .param p4    # Lcom/p1/mobile/putong/core/data/ActionData;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "feed back "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " , "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object v2, p4, Lcom/p1/mobile/putong/core/data/ActionData;->traceId:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-boolean v1, p0, Ll/y2h0;->b:Z

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v1, "[See_Toast]"

    .line 40
    .line 41
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-boolean v0, p0, Ll/y2h0;->b:Z

    .line 45
    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    if-eqz p2, :cond_1

    .line 50
    .line 51
    const/4 v0, 0x1

    .line 52
    iput-boolean v0, p0, Ll/y2h0;->b:Z

    .line 53
    .line 54
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 63
    .line 64
    iget-object v1, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 65
    .line 66
    if-nez p0, :cond_2

    .line 67
    .line 68
    const-string p0, "-1"

    .line 69
    .line 70
    :goto_0
    move-object v2, p0

    .line 71
    goto :goto_1

    .line 72
    :cond_2
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :goto_1
    invoke-static {}, Ll/y2h0;->f()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v6

    .line 79
    iget-object p0, p4, Lcom/p1/mobile/putong/core/data/ActionData;->toastStyle:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 80
    .line 81
    iget-object v7, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->business:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v8, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->localReportId:Ljava/lang/String;

    .line 84
    .line 85
    iget-object v9, p4, Lcom/p1/mobile/putong/core/data/ActionData;->traceId:Ljava/lang/String;

    .line 86
    .line 87
    move-object v3, p1

    .line 88
    move v4, p2

    .line 89
    move-object v5, p3

    .line 90
    invoke-virtual/range {v1 .. v9}, Ll/dkb;->f7(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public e()Lcom/p1/mobile/putong/core/data/ActionData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y2h0;->a:Lcom/p1/mobile/putong/core/data/ActionData;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/core/data/ActionData;Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "start show in after post"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/gra;->x()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, " , "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/ActionData;->traceId:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v2, "[See_Toast]"

    .line 30
    .line 31
    invoke-static {v2, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ll/hlh0;->e()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    const/4 v3, 0x0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    invoke-static {}, Ll/gra;->x()Z

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    if-eqz p2, :cond_0

    .line 50
    .line 51
    iput-object p1, p0, Ll/y2h0;->a:Lcom/p1/mobile/putong/core/data/ActionData;

    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/core/data/SuggesterReason;->BOTTOM_WINDOW:Lcom/p1/mobile/putong/core/data/SuggesterReason;

    .line 55
    .line 56
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/SuggesterReason;->getReason()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    const/4 v0, 0x0

    .line 61
    invoke-virtual {p0, v0, v3, p2, p1}, Ll/y2h0;->d(Ljava/lang/String;ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/ActionData;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_1
    iput-boolean v3, p0, Ll/y2h0;->b:Z

    .line 66
    .line 67
    new-instance p0, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    const-string v0, "start show in manager"

    .line 70
    .line 71
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ActionData;->traceId:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-static {v2, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p0, p2}, Ll/llb0;->i(Ll/fqe0;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y2h0;->a:Lcom/p1/mobile/putong/core/data/ActionData;

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Ll/y2h0;->k(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/data/ActionData;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/data/ActionData;)V
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v4, p2

    .line 4
    .line 5
    const-string v7, "[See_Toast]"

    .line 6
    .line 7
    if-eqz v4, :cond_d

    .line 8
    .line 9
    if-eqz p1, :cond_d

    .line 10
    .line 11
    invoke-virtual/range {p1 .. p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_d

    .line 16
    .line 17
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/ActionData;->toastStyle:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 18
    .line 19
    if-eqz v0, :cond_d

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->title:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    goto/16 :goto_4

    .line 30
    .line 31
    :cond_0
    iget-object v2, v4, Lcom/p1/mobile/putong/core/data/ActionData;->toastStyle:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 32
    .line 33
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->styleId:Ljava/lang/String;

    .line 34
    .line 35
    const-string v3, "1"

    .line 36
    .line 37
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    const-string v0, "start show toast return by style"

    .line 44
    .line 45
    invoke-static {v7, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->scenes:Ljava/util/List;

    .line 50
    .line 51
    invoke-static {}, Ll/w20;->d()Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    new-instance v5, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    const-string v6, "start show toast current id: "

    .line 58
    .line 59
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object v6, v4, Lcom/p1/mobile/putong/core/data/ActionData;->traceId:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v6, " act: "

    .line 68
    .line 69
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    if-nez v3, :cond_2

    .line 73
    .line 74
    const-string v6, "null"

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_2
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Act;->getPopLifeName()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    :goto_0
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    invoke-static {v7, v5}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    const/4 v6, 0x0

    .line 96
    const/4 v8, 0x0

    .line 97
    if-eqz v5, :cond_4

    .line 98
    .line 99
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 100
    .line 101
    .line 102
    move-result-object v5

    .line 103
    invoke-interface {v5, v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->isMainPage(Lcom/p1/mobile/android/app/Act;)Z

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    if-nez v3, :cond_4

    .line 108
    .line 109
    invoke-static {}, Ll/gra;->x()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_3

    .line 114
    .line 115
    iput-object v4, v1, Ll/y2h0;->a:Lcom/p1/mobile/putong/core/data/ActionData;

    .line 116
    .line 117
    return-void

    .line 118
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/SuggesterReason;->NO_HOME:Lcom/p1/mobile/putong/core/data/SuggesterReason;

    .line 119
    .line 120
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/SuggesterReason;->getReason()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {v1, v6, v8, v0, v4}, Ll/y2h0;->d(Ljava/lang/String;ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/ActionData;)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :cond_4
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    if-nez v3, :cond_b

    .line 133
    .line 134
    invoke-static {v0}, Ll/y2h0;->h(Ljava/util/List;)Z

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    if-nez v0, :cond_5

    .line 139
    .line 140
    goto/16 :goto_3

    .line 141
    .line 142
    :cond_5
    iput-object v6, v1, Ll/y2h0;->a:Lcom/p1/mobile/putong/core/data/ActionData;

    .line 143
    .line 144
    invoke-virtual/range {p1 .. p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    sget v3, Ll/kec0;->lc:I

    .line 153
    .line 154
    invoke-virtual {v0, v3, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 155
    .line 156
    .line 157
    move-result-object v6

    .line 158
    sget v0, Ll/adc0;->O:I

    .line 159
    .line 160
    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    move-object v9, v0

    .line 165
    check-cast v9, Lv/VDraweeView;

    .line 166
    .line 167
    sget v0, Ll/adc0;->b9:I

    .line 168
    .line 169
    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    move-object v10, v0

    .line 174
    check-cast v10, Lv/VImage;

    .line 175
    .line 176
    sget v0, Ll/adc0;->je:I

    .line 177
    .line 178
    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    move-object v11, v0

    .line 183
    check-cast v11, Lv/VText;

    .line 184
    .line 185
    sget v0, Ll/adc0;->bd:I

    .line 186
    .line 187
    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    move-object v12, v0

    .line 192
    check-cast v12, Lv/VText;

    .line 193
    .line 194
    sget v0, Ll/adc0;->L0:I

    .line 195
    .line 196
    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    move-object v13, v0

    .line 201
    check-cast v13, Lv/VLinear;

    .line 202
    .line 203
    sget v0, Ll/adc0;->s3:I

    .line 204
    .line 205
    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    move-object v14, v0

    .line 210
    check-cast v14, Lv/VText;

    .line 211
    .line 212
    sget v0, Ll/adc0;->Sd:I

    .line 213
    .line 214
    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    move-object v15, v0

    .line 219
    check-cast v15, Lv/VText;

    .line 220
    .line 221
    sget v0, Ll/adc0;->A1:I

    .line 222
    .line 223
    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    check-cast v0, Lv/VImage;

    .line 228
    .line 229
    new-instance v3, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 230
    .line 231
    invoke-virtual/range {p1 .. p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 232
    .line 233
    .line 234
    move-result-object v5

    .line 235
    invoke-direct {v3, v5, v6}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;-><init>(Landroid/app/Activity;Landroid/view/View;)V

    .line 236
    .line 237
    .line 238
    const/4 v5, 0x2

    .line 239
    invoke-virtual {v3, v5}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->B(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 240
    .line 241
    .line 242
    move-result-object v3

    .line 243
    invoke-static {}, Ll/gra;->x()Z

    .line 244
    .line 245
    .line 246
    move-result v16

    .line 247
    if-eqz v16, :cond_6

    .line 248
    .line 249
    const/4 v5, 0x3

    .line 250
    :cond_6
    invoke-virtual {v3, v5}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->A(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 251
    .line 252
    .line 253
    move-result-object v3

    .line 254
    new-instance v5, Landroid/widget/RelativeLayout$LayoutParams;

    .line 255
    .line 256
    const/high16 v16, 0x42900000    # 72.0f

    .line 257
    .line 258
    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    .line 259
    .line 260
    .line 261
    move-result v8

    .line 262
    move-object/from16 v16, v0

    .line 263
    .line 264
    const/4 v0, -0x1

    .line 265
    invoke-direct {v5, v0, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 266
    .line 267
    .line 268
    invoke-virtual {v3, v5}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->y(Landroid/view/ViewGroup$LayoutParams;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    iget v3, v2, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->showTime:I

    .line 273
    .line 274
    invoke-virtual {v0, v3}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->w(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    sget-object v3, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->SEE_TOAST:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 279
    .line 280
    invoke-virtual {v0, v3}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->z(Ll/c3m;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    new-instance v3, Ll/y2h0$a;

    .line 285
    .line 286
    invoke-direct {v3, v1, v2, v4}, Ll/y2h0$a;-><init>(Ll/y2h0;Lcom/p1/mobile/putong/core/data/ActionToastStyle;Lcom/p1/mobile/putong/core/data/ActionData;)V

    .line 287
    .line 288
    .line 289
    invoke-virtual {v0, v3}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->F(Ll/x20;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    invoke-virtual {v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->s()Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 294
    .line 295
    .line 296
    move-result-object v5

    .line 297
    new-instance v0, Ll/y2h0$b;

    .line 298
    .line 299
    invoke-direct {v0, v1, v2}, Ll/y2h0$b;-><init>(Ll/y2h0;Lcom/p1/mobile/putong/core/data/ActionToastStyle;)V

    .line 300
    .line 301
    .line 302
    invoke-virtual {v5, v0}, Ll/jlb0;->s(Ll/x20;)V

    .line 303
    .line 304
    .line 305
    new-instance v0, Ll/y2h0$c;

    .line 306
    .line 307
    invoke-direct {v0, v1, v4}, Ll/y2h0$c;-><init>(Ll/y2h0;Lcom/p1/mobile/putong/core/data/ActionData;)V

    .line 308
    .line 309
    .line 310
    invoke-virtual {v5, v0}, Ll/jlb0;->q(Ll/x20;)V

    .line 311
    .line 312
    .line 313
    new-instance v0, Ll/y2h0$d;

    .line 314
    .line 315
    move-object/from16 v3, p1

    .line 316
    .line 317
    move-object/from16 v8, v16

    .line 318
    .line 319
    invoke-direct/range {v0 .. v5}, Ll/y2h0$d;-><init>(Ll/y2h0;Lcom/p1/mobile/putong/core/data/ActionToastStyle;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/data/ActionData;Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;)V

    .line 320
    .line 321
    .line 322
    invoke-static {v6, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 323
    .line 324
    .line 325
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->mainImg:Ljava/lang/String;

    .line 326
    .line 327
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 328
    .line 329
    .line 330
    move-result v0

    .line 331
    if-nez v0, :cond_7

    .line 332
    .line 333
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 334
    .line 335
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->mainImg:Ljava/lang/String;

    .line 336
    .line 337
    const/4 v3, 0x0

    .line 338
    invoke-virtual {v0, v9, v1, v3}, Ll/fsb0;->N0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Z)V

    .line 339
    .line 340
    .line 341
    :cond_7
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->icons:Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;

    .line 342
    .line 343
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;->miniIcon:Ljava/lang/String;

    .line 344
    .line 345
    const-string v1, "online"

    .line 346
    .line 347
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 348
    .line 349
    .line 350
    move-result v0

    .line 351
    invoke-static {v10, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 352
    .line 353
    .line 354
    const/4 v9, 0x1

    .line 355
    invoke-static {v9}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 356
    .line 357
    .line 358
    move-result-object v0

    .line 359
    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 360
    .line 361
    .line 362
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->title:Ljava/lang/String;

    .line 363
    .line 364
    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 365
    .line 366
    .line 367
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->message:Ljava/lang/String;

    .line 368
    .line 369
    invoke-virtual {v12, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 370
    .line 371
    .line 372
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->buttons:Ljava/util/List;

    .line 373
    .line 374
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 375
    .line 376
    .line 377
    move-result v1

    .line 378
    if-nez v1, :cond_a

    .line 379
    .line 380
    const/4 v3, 0x0

    .line 381
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 382
    .line 383
    .line 384
    move-result-object v0

    .line 385
    move-object v3, v0

    .line 386
    check-cast v3, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;

    .line 387
    .line 388
    iget-boolean v0, v3, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->showButton:Z

    .line 389
    .line 390
    invoke-static {v13, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 391
    .line 392
    .line 393
    new-instance v0, Ll/y2h0$e;

    .line 394
    .line 395
    move-object/from16 v1, p0

    .line 396
    .line 397
    move-object v4, v2

    .line 398
    move-object v6, v5

    .line 399
    move-object/from16 v2, p1

    .line 400
    .line 401
    move-object/from16 v5, p2

    .line 402
    .line 403
    invoke-direct/range {v0 .. v6}, Ll/y2h0$e;-><init>(Ll/y2h0;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;Lcom/p1/mobile/putong/core/data/ActionToastStyle;Lcom/p1/mobile/putong/core/data/ActionData;Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;)V

    .line 404
    .line 405
    .line 406
    move-object v2, v4

    .line 407
    move-object v4, v5

    .line 408
    move-object v5, v6

    .line 409
    invoke-static {v13, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 410
    .line 411
    .line 412
    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->buttonMessage:Ljava/lang/String;

    .line 413
    .line 414
    invoke-static {v0}, Ll/y2h0;->m(Ljava/lang/String;)Ll/pf60;

    .line 415
    .line 416
    .line 417
    move-result-object v0

    .line 418
    iget-object v6, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 419
    .line 420
    check-cast v6, Ljava/lang/String;

    .line 421
    .line 422
    iget-object v10, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 423
    .line 424
    check-cast v10, Ljava/lang/String;

    .line 425
    .line 426
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 427
    .line 428
    .line 429
    move-result v6

    .line 430
    if-nez v6, :cond_8

    .line 431
    .line 432
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 433
    .line 434
    check-cast v0, Ljava/lang/CharSequence;

    .line 435
    .line 436
    invoke-virtual {v14, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 437
    .line 438
    .line 439
    invoke-static {v14, v9}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 440
    .line 441
    .line 442
    goto :goto_1

    .line 443
    :cond_8
    const/4 v0, 0x0

    .line 444
    invoke-static {v14, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 445
    .line 446
    .line 447
    :goto_1
    invoke-virtual {v15, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 448
    .line 449
    .line 450
    invoke-static {v9}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 451
    .line 452
    .line 453
    move-result-object v0

    .line 454
    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 455
    .line 456
    .line 457
    iget-object v0, v3, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->buttonBackground:Ljava/lang/String;

    .line 458
    .line 459
    const-string v3, "orange"

    .line 460
    .line 461
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 462
    .line 463
    .line 464
    move-result v0

    .line 465
    if-eqz v0, :cond_9

    .line 466
    .line 467
    invoke-virtual/range {p1 .. p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 468
    .line 469
    .line 470
    move-result-object v0

    .line 471
    sget v3, Ll/dbc0;->fo:I

    .line 472
    .line 473
    invoke-virtual {v0, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 474
    .line 475
    .line 476
    move-result-object v0

    .line 477
    invoke-virtual {v13, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 478
    .line 479
    .line 480
    const-string v0, "#FFFFFF"

    .line 481
    .line 482
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 483
    .line 484
    .line 485
    move-result v0

    .line 486
    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 487
    .line 488
    .line 489
    goto :goto_2

    .line 490
    :cond_9
    invoke-virtual/range {p1 .. p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 491
    .line 492
    .line 493
    move-result-object v0

    .line 494
    sget v3, Ll/dbc0;->go:I

    .line 495
    .line 496
    invoke-virtual {v0, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 497
    .line 498
    .line 499
    move-result-object v0

    .line 500
    invoke-virtual {v13, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 501
    .line 502
    .line 503
    const-string v0, "#4D000000"

    .line 504
    .line 505
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 506
    .line 507
    .line 508
    move-result v0

    .line 509
    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 510
    .line 511
    .line 512
    goto :goto_2

    .line 513
    :cond_a
    const/4 v3, 0x0

    .line 514
    move-object/from16 v1, p0

    .line 515
    .line 516
    move-object/from16 v4, p2

    .line 517
    .line 518
    invoke-static {v13, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 519
    .line 520
    .line 521
    :goto_2
    iget-boolean v0, v2, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->showClose:Z

    .line 522
    .line 523
    invoke-static {v8, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 524
    .line 525
    .line 526
    new-instance v0, Ll/y2h0$f;

    .line 527
    .line 528
    invoke-direct {v0, v1, v4, v5}, Ll/y2h0$f;-><init>(Ll/y2h0;Lcom/p1/mobile/putong/core/data/ActionData;Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;)V

    .line 529
    .line 530
    .line 531
    invoke-static {v8, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 532
    .line 533
    .line 534
    new-instance v0, Ljava/lang/StringBuilder;

    .line 535
    .line 536
    const-string v2, "start show by post"

    .line 537
    .line 538
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 539
    .line 540
    .line 541
    iget-object v2, v4, Lcom/p1/mobile/putong/core/data/ActionData;->traceId:Ljava/lang/String;

    .line 542
    .line 543
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 544
    .line 545
    .line 546
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 547
    .line 548
    .line 549
    move-result-object v0

    .line 550
    invoke-static {v7, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 551
    .line 552
    .line 553
    invoke-virtual/range {p1 .. p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 554
    .line 555
    .line 556
    move-result-object v0

    .line 557
    new-instance v2, Ll/x2h0;

    .line 558
    .line 559
    invoke-direct {v2, v1, v4, v5}, Ll/x2h0;-><init>(Ll/y2h0;Lcom/p1/mobile/putong/core/data/ActionData;Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;)V

    .line 560
    .line 561
    .line 562
    invoke-static {v0, v2}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 563
    .line 564
    .line 565
    return-void

    .line 566
    :cond_b
    :goto_3
    invoke-static {}, Ll/gra;->x()Z

    .line 567
    .line 568
    .line 569
    move-result v0

    .line 570
    if-eqz v0, :cond_c

    .line 571
    .line 572
    iput-object v4, v1, Ll/y2h0;->a:Lcom/p1/mobile/putong/core/data/ActionData;

    .line 573
    .line 574
    return-void

    .line 575
    :cond_c
    sget-object v0, Lcom/p1/mobile/putong/core/data/SuggesterReason;->SENCE:Lcom/p1/mobile/putong/core/data/SuggesterReason;

    .line 576
    .line 577
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/SuggesterReason;->getReason()Ljava/lang/String;

    .line 578
    .line 579
    .line 580
    move-result-object v0

    .line 581
    const/4 v3, 0x0

    .line 582
    invoke-virtual {v1, v6, v3, v0, v4}, Ll/y2h0;->d(Ljava/lang/String;ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/ActionData;)V

    .line 583
    .line 584
    .line 585
    return-void

    .line 586
    :cond_d
    :goto_4
    const-string v0, "start show toast return by null : "

    .line 587
    .line 588
    invoke-static {v7, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 589
    .line 590
    .line 591
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/data/ActionToast;)V
    .locals 5

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/ActionToast;->message:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_2

    .line 12
    .line 13
    :cond_0
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/ActionToast;->message:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/ActionToast;->mainImg:Ljava/lang/String;

    .line 16
    .line 17
    iget-boolean v1, p2, Lcom/p1/mobile/putong/core/data/ActionToast;->loveImg:Z

    .line 18
    .line 19
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ActionToast;->option:Lcom/p1/mobile/putong/core/data/CardOption;

    .line 20
    .line 21
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CardOption;->link:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-static {v2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    sget v3, Ll/kec0;->kc:I

    .line 32
    .line 33
    const/4 v4, 0x0

    .line 34
    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-nez v3, :cond_1

    .line 43
    .line 44
    new-instance v3, Ll/v2h0;

    .line 45
    .line 46
    invoke-direct {v3, p1, p2}, Ll/v2h0;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    sget p2, Ll/adc0;->je:I

    .line 53
    .line 54
    invoke-virtual {v2, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    check-cast p2, Landroid/widget/TextView;

    .line 59
    .line 60
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    sget p0, Ll/adc0;->i6:I

    .line 64
    .line 65
    invoke-virtual {v2, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    const/4 v3, 0x0

    .line 74
    if-eqz p2, :cond_3

    .line 75
    .line 76
    if-eqz v1, :cond_2

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_3
    :goto_0
    const/4 p2, 0x1

    .line 84
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result p2

    .line 91
    if-eqz p2, :cond_4

    .line 92
    .line 93
    sget p2, Ll/adc0;->pc:I

    .line 94
    .line 95
    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    check-cast p0, Lv/VDraweeView;

    .line 100
    .line 101
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_4
    sget p2, Ll/adc0;->O:I

    .line 106
    .line 107
    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    check-cast p0, Lv/VDraweeView;

    .line 112
    .line 113
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 114
    .line 115
    invoke-virtual {p2, p0, v0, v3}, Ll/fsb0;->N0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Z)V

    .line 116
    .line 117
    .line 118
    :goto_1
    new-instance p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 119
    .line 120
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 121
    .line 122
    .line 123
    move-result-object p2

    .line 124
    invoke-direct {p0, p2, v2}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;-><init>(Landroid/app/Activity;Landroid/view/View;)V

    .line 125
    .line 126
    .line 127
    const/16 p2, 0x1388

    .line 128
    .line 129
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->w(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->s()Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    sget-object p2, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->SUGGEST_SHOW_PUSH:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 138
    .line 139
    invoke-virtual {p0, p2}, Ll/fqe0;->x(Ll/c3m;)Ll/fqe0;

    .line 140
    .line 141
    .line 142
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    new-instance p2, Ll/w2h0;

    .line 147
    .line 148
    invoke-direct {p2, p0}, Ll/w2h0;-><init>(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;)V

    .line 149
    .line 150
    .line 151
    const-wide/16 v0, 0x190

    .line 152
    .line 153
    invoke-static {p1, p2, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 154
    .line 155
    .line 156
    :cond_5
    :goto_2
    return-void
.end method
