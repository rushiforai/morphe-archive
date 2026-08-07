.class public Ll/cn7;
.super Ll/dy6;
.source "SourceFile"


# instance fields
.field public R:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;",
            ">;"
        }
    .end annotation
.end field

.field public S:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Lcom/p1/mobile/putong/core/data/ChatHeatActionData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/cn7;->R:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/cn7;->S:Lrx/subjects/b;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic a3(Ll/cn7;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;[Ll/pf60;Ll/y20;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/cn7;->x3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;[Ll/pf60;Ll/y20;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic b3(Ljava/lang/String;)Ll/x1d0;
    .locals 4

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "action"

    .line 7
    .line 8
    const-string v2, "setLevelUp"

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v1, "isLevelUp"

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    :catch_0
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    new-instance v2, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v3, "/chat-heat/"

    .line 28
    .line 29
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/a;->J0(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v1, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 48
    .line 49
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {v1, v0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, v0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method

.method public static synthetic c3(Ljava/lang/String;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/ym7;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ym7;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/zm7;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/zm7;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->T2()Lrx/c$d;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public static synthetic d3(Ljava/lang/String;)Ll/x1d0;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "/chat-heat/"

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string p0, "/permissions"

    .line 18
    .line 19
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/a;->J0(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public static synthetic e3(Ll/cn7;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;[Ll/pf60;Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/cn7;->y3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;[Ll/pf60;Ll/y20;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f3(Lcom/p1/mobile/putong/core/data/ChatHeat;)Lcom/p1/mobile/putong/core/data/CoreBoxData;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/CoreBoxData;->box(Ljava/lang/Object;)Lcom/p1/mobile/putong/core/data/CoreBoxData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic g3(Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/bn7;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/bn7;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ll/sm7;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/sm7;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic h3(Ll/cn7;Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;[Ll/pf60;Ljava/lang/String;Ll/y20;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/cn7;->z3(Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;[Ll/pf60;Ljava/lang/String;Ll/y20;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeatPermissions:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/p1/mobile/putong/core/data/PermissionsItem;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/PermissionsItem;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Lcom/p1/mobile/putong/core/data/PermissionsItem;

    .line 40
    .line 41
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/PermissionsItem;->enable:Z

    .line 42
    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    const/4 v0, 0x1

    .line 46
    :cond_1
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method public static synthetic j3(Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;[Ll/pf60;Ljava/lang/String;)Ll/x1d0;
    .locals 5

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "action"

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->getAction()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 13
    .line 14
    .line 15
    invoke-static {p1}, Ll/jyb;->K([Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    array-length v1, p1

    .line 22
    const/4 v2, 0x0

    .line 23
    :goto_0
    if-ge v2, v1, :cond_0

    .line 24
    .line 25
    aget-object v3, p1, v2

    .line 26
    .line 27
    iget-object v4, v3, Ll/pf60;->a:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast v4, Ljava/lang/String;

    .line 30
    .line 31
    iget-object v3, v3, Ll/pf60;->b:Ljava/lang/Object;

    .line 32
    .line 33
    invoke-virtual {v0, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    add-int/lit8 v2, v2, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catch_0
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->CHECK:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 40
    .line 41
    if-eq p0, p1, :cond_2

    .line 42
    .line 43
    sget-object p1, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->ENTER_CHECK:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 44
    .line 45
    if-eq p0, p1, :cond_2

    .line 46
    .line 47
    sget-object p1, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->INVITE:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 48
    .line 49
    if-eq p0, p1, :cond_2

    .line 50
    .line 51
    sget-object p1, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->ACCEPT:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 52
    .line 53
    if-eq p0, p1, :cond_2

    .line 54
    .line 55
    sget-object p1, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->CANCEL:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 56
    .line 57
    if-ne p0, p1, :cond_1

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    const-string p1, "/chat-heat/"

    .line 63
    .line 64
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/a;->J0(Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    goto :goto_2

    .line 79
    :cond_2
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    const-string p1, "/exclusive-chat/"

    .line 82
    .line 83
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/a;->J0(Ljava/lang/String;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    :goto_2
    sget-object p1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 98
    .line 99
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p1, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    sget-object p1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 108
    .line 109
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    invoke-static {p1, p2}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-virtual {p0, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    return-object p0
.end method

.method public static synthetic k3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public A3(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->s2:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 20
    .line 21
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v1, "chat-heat"

    .line 29
    .line 30
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/an7;

    .line 41
    .line 42
    invoke-direct {v1, p1}, Ll/an7;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    const/4 p1, -0x1

    .line 46
    invoke-virtual {p0, v0, p1, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method public B3(Ljava/lang/String;Z)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->SPECIAL_REMIND:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 2
    .line 3
    const-string v1, "specialRemind"

    .line 4
    .line 5
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-static {v1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    filled-new-array {p2}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p0, v0, p1, p2}, Ll/cn7;->q3(Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;Ljava/lang/String;[Ll/pf60;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public C3(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Cn()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v0, p0, Ll/cn7;->R:Ljava/util/HashMap;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Ll/cn7;->R:Ljava/util/HashMap;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;->reset()V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const/4 v0, 0x0

    .line 43
    :cond_2
    :goto_0
    if-nez v0, :cond_3

    .line 44
    .line 45
    new-instance v0, Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;

    .line 46
    .line 47
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;-><init>()V

    .line 48
    .line 49
    .line 50
    :cond_3
    iget-object p0, p0, Ll/cn7;->R:Ljava/util/HashMap;

    .line 51
    .line 52
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public D3(Ljava/lang/String;I)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->INVITE:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 2
    .line 3
    const-string v1, "exclusiveChatDuration"

    .line 4
    .line 5
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-static {v1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    filled-new-array {p2}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p0, v0, p1, p2}, Ll/cn7;->q3(Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;Ljava/lang/String;[Ll/pf60;)Lrx/c;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public l3(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->ACCEPT:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 2
    .line 3
    const-string v1, "msgId"

    .line 4
    .line 5
    invoke-static {v1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    filled-new-array {p2}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p0, v0, p1, p2}, Ll/cn7;->q3(Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;Ljava/lang/String;[Ll/pf60;)Lrx/c;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public m3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatHeat;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 10
    .line 11
    iget-object p0, p0, Ll/il8;->s:Ll/tv4;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/wzh0;->queryCache(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 18
    .line 19
    return-object p0
.end method

.method public n3(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->CANCEL:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    new-array v1, v1, [Ll/pf60;

    .line 5
    .line 6
    invoke-virtual {p0, v0, p1, v1}, Ll/cn7;->q3(Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;Ljava/lang/String;[Ll/pf60;)Lrx/c;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public o3(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cn7;->R:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final varargs p3(Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;Ljava/lang/String;Ll/y20;[Ll/pf60;)Lrx/c;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/ChatHeatActionData;",
            ">;[",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "exclusive_action_"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->getAction()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, ""

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/um7;

    .line 39
    .line 40
    move-object v2, p0

    .line 41
    move-object v3, p1

    .line 42
    move-object v5, p2

    .line 43
    move-object v6, p3

    .line 44
    move-object v4, p4

    .line 45
    invoke-direct/range {v1 .. v6}, Ll/um7;-><init>(Ll/cn7;Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;[Ll/pf60;Ljava/lang/String;Ll/y20;)V

    .line 46
    .line 47
    .line 48
    const/4 p0, 0x0

    .line 49
    const/4 p1, -0x1

    .line 50
    invoke-virtual {v2, v0, p1, v1, p0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;Z)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method

.method public final varargs q3(Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;Ljava/lang/String;[Ll/pf60;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;",
            "Ljava/lang/String;",
            "[",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0, p3}, Ll/cn7;->p3(Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;Ljava/lang/String;Ll/y20;[Ll/pf60;)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public r3(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->ENTER_CHECK:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    new-array v1, v1, [Ll/pf60;

    .line 5
    .line 6
    invoke-virtual {p0, v0, p1, v1}, Ll/cn7;->q3(Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;Ljava/lang/String;[Ll/pf60;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public s3(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/ChatHeat;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    iget-object v0, v0, Ll/dkb;->s2:Ll/jxd0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatHeat;->new_()Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 38
    .line 39
    iget-object v0, v0, Ll/dkb;->t2:Ll/mxd0;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Ljava/lang/Double;

    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 48
    .line 49
    .line 50
    move-result-wide v0

    .line 51
    iput-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->degree:D

    .line 52
    .line 53
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 56
    .line 57
    iget-object p0, p0, Ll/dkb;->u2:Ll/jxd0;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    check-cast p0, Ljava/lang/Boolean;

    .line 64
    .line 65
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->levelUp:Z

    .line 70
    .line 71
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0

    .line 76
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 77
    .line 78
    iget-object p0, p0, Ll/il8;->s:Ll/tv4;

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Ll/wzh0;->uiGet(Ljava/lang/String;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    return-object p0
.end method

.method public t3(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/CoreBoxData<",
            "Lcom/p1/mobile/putong/core/data/ChatHeat;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object p0, p0, Ll/il8;->s:Ll/tv4;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/wzh0;->uiGet(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p1, Ll/rm7;

    .line 10
    .line 11
    invoke-direct {p1}, Ll/rm7;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public u3()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/ChatHeatActionData;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cn7;->S:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public v3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cn7;->R:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/SpecialNotifyFlag;

    .line 8
    .line 9
    return-object p0
.end method

.method public w3(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->s2:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 33
    .line 34
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v1, "hasPermissions"

    .line 44
    .line 45
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/tm7;

    .line 56
    .line 57
    invoke-direct {v1, p1}, Ll/tm7;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    const/4 p1, 0x0

    .line 61
    invoke-virtual {p0, v0, p1, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method

.method public final synthetic x3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;[Ll/pf60;Ll/y20;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    const/4 v4, 0x0

    .line 4
    const/4 v5, 0x1

    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    move-object v1, p5

    .line 8
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/c;->y3(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;ZZZ)V

    .line 9
    .line 10
    .line 11
    new-instance p5, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-direct {p5, p1, p2, v0, p3}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;Z[Ll/pf60;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-interface {p4, p5}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Ll/cn7;->S:Lrx/subjects/b;

    .line 27
    .line 28
    invoke-virtual {p0, p5}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic y3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;[Ll/pf60;Ll/y20;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p1, p2, v1, p3}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;Z[Ll/pf60;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {v0, p5}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->setThrowable(Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-interface {p4, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Ll/cn7;->S:Lrx/subjects/b;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic z3(Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;[Ll/pf60;Ljava/lang/String;Ll/y20;)Lrx/c;
    .locals 8

    .line 1
    new-instance v0, Ll/vm7;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3}, Ll/vm7;-><init>(Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;[Ll/pf60;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/wm7;

    .line 11
    .line 12
    move-object v2, p0

    .line 13
    move-object v4, p1

    .line 14
    move-object v5, p2

    .line 15
    move-object v3, p3

    .line 16
    move-object v6, p4

    .line 17
    invoke-direct/range {v1 .. v6}, Ll/wm7;-><init>(Ll/cn7;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;[Ll/pf60;Ll/y20;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    move-object v7, v6

    .line 25
    move-object v6, v5

    .line 26
    move-object v5, v4

    .line 27
    move-object v4, v3

    .line 28
    move-object v3, v2

    .line 29
    new-instance v2, Ll/xm7;

    .line 30
    .line 31
    invoke-direct/range {v2 .. v7}, Ll/xm7;-><init>(Ll/cn7;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;[Ll/pf60;Ll/y20;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v2}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method
