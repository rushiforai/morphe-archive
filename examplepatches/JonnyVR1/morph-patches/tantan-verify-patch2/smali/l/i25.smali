.class public Ll/i25;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/data/ChatPartnerScene;Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ll/dkb;->S6(Lcom/p1/mobile/putong/core/data/ChatPartnerScene;)V

    .line 6
    .line 7
    .line 8
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 11
    .line 12
    iget-object p1, p1, Ll/dkb;->t4:Ll/byd0;

    .line 13
    .line 14
    invoke-static {}, Ll/pzi0;->o()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p1, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    sget-object p1, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;->MESSAGE_PAGE_PASSIVE:Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    if-ne p0, p1, :cond_0

    .line 29
    .line 30
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 33
    .line 34
    iget-object p0, p0, Ll/dkb;->u4:Ll/vxd0;

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ll/vxd0;->a(I)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;->ONLINE_SQUARE_PASSIVE:Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    .line 41
    .line 42
    if-ne p0, p1, :cond_1

    .line 43
    .line 44
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 47
    .line 48
    iget-object p0, p0, Ll/dkb;->v4:Ll/vxd0;

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Ll/vxd0;->a(I)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public static synthetic c(Ljava/lang/String;Lcom/p1/mobile/putong/data/Emotion;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/data/ChatPartnerScene;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Envelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 2
    .line 3
    iget v0, v0, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 4
    .line 5
    const/16 v1, 0xc8

    .line 6
    .line 7
    if-ne v0, v1, :cond_2

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;->MESSAGE_PAGE_PASSIVE:Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/cl80;->e()Ll/cl80;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/cl80;->k()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isDialogShowing()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_2

    .line 28
    .line 29
    instance-of v0, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    move-object v0, p1

    .line 34
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 35
    .line 36
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->j6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    :cond_0
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 45
    .line 46
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 47
    .line 48
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    check-cast p2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 53
    .line 54
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartners:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 61
    .line 62
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_2

    .line 67
    .line 68
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartners:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 69
    .line 70
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatPartners;->texts:Ljava/util/List;

    .line 71
    .line 72
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_2

    .line 77
    .line 78
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartners:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 79
    .line 80
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatPartners;->users:Ljava/util/List;

    .line 81
    .line 82
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-nez v0, :cond_2

    .line 87
    .line 88
    new-instance v0, Ll/t05;

    .line 89
    .line 90
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartners:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 91
    .line 92
    invoke-direct {v0, p1, p2}, Ll/t05;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/ChatPartners;)V

    .line 93
    .line 94
    .line 95
    new-instance p2, Ll/g25;

    .line 96
    .line 97
    invoke-direct {p2, p0}, Ll/g25;-><init>(Lcom/p1/mobile/putong/core/data/ChatPartnerScene;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, p2}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 101
    .line 102
    .line 103
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/poplevel/a;->I()Z

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    if-eqz p0, :cond_1

    .line 112
    .line 113
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    sget-object p2, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->CHAT_PARTNER:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 118
    .line 119
    const/16 v1, 0x4e20

    .line 120
    .line 121
    invoke-virtual {p0, p2, p1, v0, v1}, Lcom/p1/mobile/android/ui/poplevel/a;->C(Ll/c3m;Ll/e3m;Ll/d3m;I)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_1
    invoke-static {}, Ll/cl80;->e()Ll/cl80;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-static {v0}, Ll/al80;->a(Ll/f3m;)Ll/al80;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-virtual {p0, p1}, Ll/cl80;->q(Ll/al80;)V

    .line 134
    .line 135
    .line 136
    :cond_2
    return-void
.end method

.method public static e(JJ)I
    .locals 4

    .line 1
    new-instance v0, Ljava/util/Date;

    .line 2
    .line 3
    invoke-direct {v0, p2, p3}, Ljava/util/Date;-><init>(J)V

    .line 4
    .line 5
    .line 6
    new-instance p2, Ljava/util/Date;

    .line 7
    .line 8
    invoke-direct {p2, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, v0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 16
    .line 17
    .line 18
    const/16 p1, 0xb

    .line 19
    .line 20
    const/4 p3, 0x0

    .line 21
    invoke-virtual {p0, p1, p3}, Ljava/util/Calendar;->set(II)V

    .line 22
    .line 23
    .line 24
    const/16 v0, 0xc

    .line 25
    .line 26
    invoke-virtual {p0, v0, p3}, Ljava/util/Calendar;->set(II)V

    .line 27
    .line 28
    .line 29
    const/16 v1, 0xd

    .line 30
    .line 31
    invoke-virtual {p0, v1, p3}, Ljava/util/Calendar;->set(II)V

    .line 32
    .line 33
    .line 34
    const/16 v2, 0xe

    .line 35
    .line 36
    invoke-virtual {p0, v2, p3}, Ljava/util/Calendar;->set(II)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v3, p2}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v3, p1, p3}, Ljava/util/Calendar;->set(II)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v3, v0, p3}, Ljava/util/Calendar;->set(II)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v3, v1, p3}, Ljava/util/Calendar;->set(II)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3, v2, p3}, Ljava/util/Calendar;->set(II)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    .line 63
    .line 64
    .line 65
    move-result-wide p1

    .line 66
    invoke-virtual {p0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    .line 71
    .line 72
    .line 73
    move-result-wide v0

    .line 74
    sub-long/2addr p1, v0

    .line 75
    const-wide/32 v0, 0x5265c00

    .line 76
    .line 77
    .line 78
    div-long/2addr p1, v0

    .line 79
    long-to-int p0, p1

    .line 80
    return p0
.end method

.method public static f(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Emotion;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->yq()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    sget-object v1, Lcom/p1/mobile/putong/data/StateEmotion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 16
    .line 17
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/dbcenter/parse/JsonParseHelper;->parseList(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Lcom/p1/mobile/putong/data/StateEmotion;

    .line 36
    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/data/StateEmotion;->emotions:Ljava/util/List;

    .line 38
    .line 39
    new-instance v2, Ll/h25;

    .line 40
    .line 41
    invoke-direct {v2, p0}, Ll/h25;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Lcom/p1/mobile/putong/data/Emotion;

    .line 49
    .line 50
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-eqz v2, :cond_0

    .line 55
    .line 56
    return-object v1

    .line 57
    :cond_1
    const/4 p0, 0x0

    .line 58
    return-object p0
.end method

.method public static g(Lcom/p1/mobile/putong/core/data/ChatPartnerScene;)Z
    .locals 9

    const/4 v0, 0x0

    return v0

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->t4:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    invoke-static {}, Ll/gra;->M()Lcom/p1/mobile/putong/core/data/ChatPartnerConfig;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    const/4 v3, 0x1

    .line 22
    if-nez v2, :cond_0

    .line 23
    .line 24
    move v4, v3

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget v4, v2, Lcom/p1/mobile/putong/core/data/ChatPartnerConfig;->messageLimit:I

    .line 27
    .line 28
    :goto_0
    if-nez v2, :cond_1

    .line 29
    .line 30
    const/4 v5, 0x2

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    iget v5, v2, Lcom/p1/mobile/putong/core/data/ChatPartnerConfig;->squareLimit:I

    .line 33
    .line 34
    :goto_1
    const/4 v6, 0x0

    .line 35
    if-nez v2, :cond_2

    .line 36
    .line 37
    move v2, v6

    .line 38
    goto :goto_2

    .line 39
    :cond_2
    iget v2, v2, Lcom/p1/mobile/putong/core/data/ChatPartnerConfig;->perday:I

    .line 40
    .line 41
    :goto_2
    invoke-static {}, Ll/pzi0;->o()J

    .line 42
    .line 43
    .line 44
    move-result-wide v7

    .line 45
    invoke-static {v0, v1, v7, v8}, Ll/pzi0;->C(JJ)Z

    .line 46
    .line 47
    .line 48
    move-result v7

    .line 49
    if-nez v7, :cond_3

    .line 50
    .line 51
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 54
    .line 55
    iget-object v7, v7, Ll/dkb;->u4:Ll/vxd0;

    .line 56
    .line 57
    invoke-virtual {v7}, Ll/vxd0;->clear()Z

    .line 58
    .line 59
    .line 60
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 61
    .line 62
    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 63
    .line 64
    iget-object v7, v7, Ll/dkb;->v4:Ll/vxd0;

    .line 65
    .line 66
    invoke-virtual {v7}, Ll/vxd0;->clear()Z

    .line 67
    .line 68
    .line 69
    :cond_3
    invoke-static {}, Ll/pzi0;->o()J

    .line 70
    .line 71
    .line 72
    move-result-wide v7

    .line 73
    invoke-static {v7, v8, v0, v1}, Ll/i25;->e(JJ)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-lez v0, :cond_4

    .line 78
    .line 79
    if-gt v0, v2, :cond_4

    .line 80
    .line 81
    return v6

    .line 82
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;->MESSAGE_PAGE_PASSIVE:Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    .line 83
    .line 84
    if-ne p0, v0, :cond_5

    .line 85
    .line 86
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 87
    .line 88
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 89
    .line 90
    iget-object v0, v0, Ll/dkb;->u4:Ll/vxd0;

    .line 91
    .line 92
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    check-cast v0, Ljava/lang/Integer;

    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-lt v0, v4, :cond_5

    .line 103
    .line 104
    return v6

    .line 105
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;->ONLINE_SQUARE_PASSIVE:Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    .line 106
    .line 107
    if-ne p0, v0, :cond_6

    .line 108
    .line 109
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 110
    .line 111
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 112
    .line 113
    iget-object p0, p0, Ll/dkb;->v4:Ll/vxd0;

    .line 114
    .line 115
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    check-cast p0, Ljava/lang/Integer;

    .line 120
    .line 121
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    if-lt p0, v5, :cond_6

    .line 126
    .line 127
    return v6

    .line 128
    :cond_6
    invoke-static {}, Ll/pzi0;->o()J

    .line 129
    .line 130
    .line 131
    move-result-wide v0

    .line 132
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 133
    .line 134
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 135
    .line 136
    iget-object p0, p0, Ll/dkb;->s4:Ll/byd0;

    .line 137
    .line 138
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    check-cast p0, Ljava/lang/Long;

    .line 143
    .line 144
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 145
    .line 146
    .line 147
    move-result-wide v4

    .line 148
    sub-long/2addr v0, v4

    .line 149
    const-wide/32 v4, 0x36ee80

    .line 150
    .line 151
    .line 152
    cmp-long p0, v0, v4

    .line 153
    .line 154
    if-gez p0, :cond_7

    .line 155
    .line 156
    return v6

    .line 157
    :cond_7
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-virtual {p0}, Ll/hlh0;->e()Z

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    if-eqz p0, :cond_8

    .line 166
    .line 167
    return v6

    .line 168
    :cond_8
    return v3
.end method

.method public static h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/ChatPartnerScene;)V
    .locals 3

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 9
    .line 10
    iget-object v0, v0, Ll/dkb;->s4:Ll/byd0;

    .line 11
    .line 12
    invoke-static {}, Ll/pzi0;->o()J

    .line 13
    .line 14
    .line 15
    move-result-wide v1

    .line 16
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ll/dkb;->l7(Lcom/p1/mobile/putong/core/data/ChatPartnerScene;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const/4 v1, 0x1

    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/e25;

    .line 41
    .line 42
    invoke-direct {v1, p1, p0}, Ll/e25;-><init>(Lcom/p1/mobile/putong/core/data/ChatPartnerScene;Lcom/p1/mobile/android/app/Act;)V

    .line 43
    .line 44
    .line 45
    new-instance p0, Ll/f25;

    .line 46
    .line 47
    invoke-direct {p0}, Ll/f25;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    :cond_1
    :goto_0
    return-void
.end method
