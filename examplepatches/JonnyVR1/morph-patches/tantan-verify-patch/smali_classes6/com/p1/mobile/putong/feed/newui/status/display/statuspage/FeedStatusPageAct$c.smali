.class public Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$c;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$c;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$c;->f(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$c;Ljava/util/List;Lcom/p1/mobile/putong/data/ConversationStatus;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$c;->d(Ljava/util/List;Lcom/p1/mobile/putong/data/ConversationStatus;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$c;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$c;->e(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method


# virtual methods
.method public final synthetic d(Ljava/util/List;Lcom/p1/mobile/putong/data/ConversationStatus;)V
    .locals 2

    .line 1
    invoke-static {p2}, Ll/ksg;->U(Lcom/p1/mobile/putong/data/ConversationStatus;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$c;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 6
    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->i2(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;)Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 p2, 0x0

    .line 14
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Meet;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Meet;->type:Ljava/lang/String;

    .line 21
    .line 22
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Meet;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Meet;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Meet;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Meet;->userId:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;->s6(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    invoke-virtual {v0}, Landroidx/activity/ComponentActivity;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Landroidx/lifecycle/Lifecycle;->b()Landroidx/lifecycle/Lifecycle$State;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    sget-object p2, Landroidx/lifecycle/Lifecycle$State;->RESUMED:Landroidx/lifecycle/Lifecycle$State;

    .line 51
    .line 52
    if-ne p1, p2, :cond_1

    .line 53
    .line 54
    const-string p1, "\u6682\u65f6\u6ca1\u6709\u9047\u5230\u6709\u8da3\u7684\u7075\u9b42"

    .line 55
    .line 56
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$c;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->v2()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$c;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->g:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 4
    .line 5
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 13
    .line 14
    const-class v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->meets:Ljava/util/List;

    .line 23
    .line 24
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const-string v1, "\u6682\u65f6\u6ca1\u6709\u9047\u5230\u6709\u8da3\u7684\u7075\u9b42"

    .line 29
    .line 30
    if-nez v0, :cond_3

    .line 31
    .line 32
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 v0, 0x0

    .line 40
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    check-cast v2, Lcom/p1/mobile/putong/feed/data/Meet;

    .line 45
    .line 46
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Meet;->userId:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-nez v2, :cond_2

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$c;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 55
    .line 56
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Meet;

    .line 65
    .line 66
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Meet;->userId:Ljava/lang/String;

    .line 67
    .line 68
    invoke-interface {v2, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->ab(Ljava/lang/String;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/q4i;

    .line 77
    .line 78
    invoke-direct {v1, p0, p1}, Ll/q4i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$c;Ljava/util/List;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_2
    invoke-static {v1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$c;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->v2()V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_3
    :goto_0
    invoke-static {v1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$c;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 102
    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->v2()V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public final synthetic f(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$c;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->g:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 4
    .line 5
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    move-object v1, p1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 18
    .line 19
    iget v1, v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 20
    .line 21
    const v2, 0x9d9e

    .line 22
    .line 23
    .line 24
    if-ne v1, v2, :cond_1

    .line 25
    .line 26
    const-string p1, "\u4eca\u5929\u7684\u5076\u9047\u673a\u4f1a\u5df2\u7528\u5c3d\uff0c\u660e\u5929\u518d\u6765\u9082\u9005"

    .line 27
    .line 28
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$c;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->v2()V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    if-eqz v0, :cond_2

    .line 38
    .line 39
    move-object v1, p1

    .line 40
    check-cast v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 41
    .line 42
    iget v1, v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 43
    .line 44
    const v2, 0x9d9f

    .line 45
    .line 46
    .line 47
    if-eq v1, v2, :cond_3

    .line 48
    .line 49
    :cond_2
    if-eqz v0, :cond_4

    .line 50
    .line 51
    move-object v0, p1

    .line 52
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 53
    .line 54
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 55
    .line 56
    const v1, 0x9da0

    .line 57
    .line 58
    .line 59
    if-ne v0, v1, :cond_4

    .line 60
    .line 61
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$c;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 62
    .line 63
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->i2(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;)Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 68
    .line 69
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 70
    .line 71
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;->t6(I)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_4
    const-string p1, "\u6682\u65f6\u6ca1\u6709\u9047\u5230\u6709\u8da3\u7684\u7075\u9b42"

    .line 76
    .line 77
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$c;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->v2()V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$c;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/jka;->v7()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/o4i;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/o4i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$c;)V

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll/p4i;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Ll/p4i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$c;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method
