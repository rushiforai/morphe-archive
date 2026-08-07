.class public Lcom/p1/mobile/putong/core/util/DebugUtil$i1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/util/DebugUtil;->jk(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/newui/home/b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/b;


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i1;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->V1:Ll/p4a;

    .line 4
    .line 5
    new-instance v1, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v1, v0, Ll/p4a;->S:Ljava/util/List;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    :goto_0
    const/16 v1, 0x9

    .line 14
    .line 15
    if-ge v0, v1, :cond_0

    .line 16
    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v2, v1, Lcom/p1/mobile/putong/core/api/c;->V1:Ll/p4a;

    .line 20
    .line 21
    iget-object v2, v2, Ll/p4a;->S:Ljava/util/List;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    add-int/lit8 v0, v0, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    invoke-static {}, Ll/ln40;->f()Ll/ln40;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->V1:Ll/p4a;

    .line 46
    .line 47
    iget-object v1, v1, Ll/p4a;->S:Ljava/util/List;

    .line 48
    .line 49
    invoke-virtual {v0, p0, v1}, Ll/ln40;->j(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->V1:Ll/p4a;

    .line 4
    .line 5
    new-instance v1, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v1, v0, Ll/p4a;->R:Ljava/util/List;

    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 17
    .line 18
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/core/data/UserIdType;->new_()Lcom/p1/mobile/putong/core/data/UserIdType;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const/4 v2, 0x0

    .line 31
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/UserIdType;->userId:Ljava/lang/String;

    .line 40
    .line 41
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->V1:Ll/p4a;

    .line 44
    .line 45
    iget-object v0, v0, Ll/p4a;->R:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-interface {v0}, Ll/f1g0;->d()Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    instance-of v0, v0, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 59
    .line 60
    if-eqz v0, :cond_0

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-interface {p0}, Ll/f1g0;->d()Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 71
    .line 72
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->M2:Z

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->H3()V

    .line 75
    .line 76
    .line 77
    :cond_0
    return-void
.end method

.method public static synthetic c()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->V1:Ll/p4a;

    .line 4
    .line 5
    iget-object v0, v0, Ll/p4a;->V:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    xor-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic d()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->V1:Ll/p4a;

    .line 4
    .line 5
    iget-object v0, v0, Ll/p4a;->U:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    xor-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic e()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->V1:Ll/p4a;

    .line 4
    .line 5
    iget-object v0, v0, Ll/p4a;->W:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/byd0;->clear()Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic f()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->V1:Ll/p4a;

    .line 4
    .line 5
    new-instance v1, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v1, v0, Ll/p4a;->S:Ljava/util/List;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    :goto_0
    const/16 v1, 0x9

    .line 14
    .line 15
    if-ge v0, v1, :cond_0

    .line 16
    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v2, v1, Lcom/p1/mobile/putong/core/api/c;->V1:Ll/p4a;

    .line 20
    .line 21
    iget-object v2, v2, Ll/p4a;->S:Ljava/util/List;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    add-int/lit8 v0, v0, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->t1:Lrx/subjects/a;

    .line 36
    .line 37
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Landroid/content/Intent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-class v2, Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;

    .line 12
    .line 13
    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public call()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i1;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i1;->a:Ljava/util/ArrayList;

    .line 7
    .line 8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v2, "\u5b9e\u9a8c1\u5f00\u5173: "

    .line 11
    .line 12
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->V1:Ll/p4a;

    .line 18
    .line 19
    iget-object v2, v2, Ll/p4a;->U:Ll/jxd0;

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    new-instance v2, Ll/xed;

    .line 33
    .line 34
    invoke-direct {v2}, Ll/xed;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i1;->a:Ljava/util/ArrayList;

    .line 45
    .line 46
    new-instance v1, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v2, "\u5b9e\u9a8c2\u5f00\u5173: "

    .line 49
    .line 50
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->V1:Ll/p4a;

    .line 56
    .line 57
    iget-object v2, v2, Ll/p4a;->V:Ll/jxd0;

    .line 58
    .line 59
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    new-instance v2, Ll/yed;

    .line 71
    .line 72
    invoke-direct {v2}, Ll/yed;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i1;->a:Ljava/util/ArrayList;

    .line 83
    .line 84
    new-instance v1, Ll/zed;

    .line 85
    .line 86
    invoke-direct {v1}, Ll/zed;-><init>()V

    .line 87
    .line 88
    .line 89
    const-string v2, "\u6a21\u62df\u65b0\u7528\u6237"

    .line 90
    .line 91
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i1;->a:Ljava/util/ArrayList;

    .line 99
    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 101
    .line 102
    new-instance v2, Ll/afd;

    .line 103
    .line 104
    invoke-direct {v2, v1}, Ll/afd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 105
    .line 106
    .line 107
    const-string v1, "\u5212\u5361\u8fce\u65b0bubble"

    .line 108
    .line 109
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i1;->a:Ljava/util/ArrayList;

    .line 117
    .line 118
    new-instance v1, Ll/bfd;

    .line 119
    .line 120
    invoke-direct {v1}, Ll/bfd;-><init>()V

    .line 121
    .line 122
    .line 123
    const-string v2, "\u6e05\u9664\u8fce\u65b0\u76f8\u5173\u672c\u5730\u6570\u636e"

    .line 124
    .line 125
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i1;->a:Ljava/util/ArrayList;

    .line 133
    .line 134
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 135
    .line 136
    new-instance v2, Ll/cfd;

    .line 137
    .line 138
    invoke-direct {v2, v1}, Ll/cfd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 139
    .line 140
    .line 141
    const-string v1, "\u5212\u5361\u8fce\u65b0tip"

    .line 142
    .line 143
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i1;->a:Ljava/util/ArrayList;

    .line 151
    .line 152
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 153
    .line 154
    new-instance v2, Ll/dfd;

    .line 155
    .line 156
    invoke-direct {v2, v1}, Ll/dfd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 157
    .line 158
    .line 159
    const-string v1, "\u6253\u5f00\u6b22\u8fce\u9875"

    .line 160
    .line 161
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 169
    .line 170
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i1;->a:Ljava/util/ArrayList;

    .line 175
    .line 176
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    .line 177
    .line 178
    .line 179
    return-void
.end method
