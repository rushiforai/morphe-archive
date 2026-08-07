.class public Lcom/p1/mobile/putong/core/newui/messages/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/messages/a$a;
    }
.end annotation


# static fields
.field public static f:Ll/jxd0;


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/messages/a$a;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

.field public final c:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;

.field public final d:I

.field public e:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    return-void

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    const-string v1, "open_fill_info_debug"

    .line 4
    .line 5
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/p1/mobile/putong/core/newui/messages/a;->f:Ll/jxd0;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/a;->a:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/a;->e:Z

    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/a;->b:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/a;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;

    .line 17
    .line 18
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/messages/a;->d:I

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/a;->n()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic a(ILcom/p1/mobile/putong/core/newui/messages/a$a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/newui/messages/a$a;->a()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic b()I
    .locals 1

    .line 1
    const/16 v0, 0x30

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic c()I
    .locals 1

    .line 1
    const/16 v0, 0x2f

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic d()I
    .locals 1

    .line 1
    const/16 v0, 0xf

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic e()I
    .locals 1

    .line 1
    const/16 v0, 0xf

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic f()I
    .locals 1

    .line 1
    const/16 v0, 0xd

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic g()I
    .locals 1

    .line 1
    const/16 v0, 0x30

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic h()I
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    return v0
.end method

.method public static p(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/a;->q(Ljava/lang/String;Z)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public static q(Ljava/lang/String;Z)Z
    .locals 12

    .line 1
    invoke-static {}, Ll/gra;->b2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->H0:Ll/byd0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ljava/lang/Long;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 22
    .line 23
    .line 24
    move-result-wide v2

    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->I0:Ll/byd0;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ljava/lang/Long;

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 38
    .line 39
    .line 40
    move-result-wide v4

    .line 41
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->J0:Ll/wyd0;

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {}, Ll/pzi0;->o()J

    .line 54
    .line 55
    .line 56
    move-result-wide v6

    .line 57
    sget-object v8, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object v8, v8, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 60
    .line 61
    iget-object v8, v8, Lcom/p1/mobile/putong/core/api/g;->K0:Ll/jxd0;

    .line 62
    .line 63
    invoke-virtual {v8}, Ll/azd0;->get()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v8

    .line 67
    check-cast v8, Ljava/lang/Boolean;

    .line 68
    .line 69
    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    .line 70
    .line 71
    .line 72
    move-result v8

    .line 73
    const/4 v9, 0x1

    .line 74
    if-eqz v8, :cond_1

    .line 75
    .line 76
    if-eqz p1, :cond_1

    .line 77
    .line 78
    move p1, v9

    .line 79
    goto :goto_0

    .line 80
    :cond_1
    move p1, v1

    .line 81
    :goto_0
    const-wide/16 v10, 0x0

    .line 82
    .line 83
    cmp-long v8, v2, v10

    .line 84
    .line 85
    if-lez v8, :cond_2

    .line 86
    .line 87
    if-nez p1, :cond_2

    .line 88
    .line 89
    cmp-long p1, v6, v2

    .line 90
    .line 91
    if-ltz p1, :cond_2

    .line 92
    .line 93
    cmp-long p1, v4, v6

    .line 94
    .line 95
    if-lez p1, :cond_2

    .line 96
    .line 97
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-nez p1, :cond_2

    .line 102
    .line 103
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    if-eqz p1, :cond_2

    .line 108
    .line 109
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 110
    .line 111
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 112
    .line 113
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    if-nez p0, :cond_2

    .line 118
    .line 119
    return v9

    .line 120
    :cond_2
    return v1
.end method


# virtual methods
.method public final i(Ljava/util/Calendar;)V
    .locals 1

    .line 1
    const/16 p0, 0xb

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, p0, v0}, Ljava/util/Calendar;->set(II)V

    .line 5
    .line 6
    .line 7
    const/16 p0, 0xc

    .line 8
    .line 9
    invoke-virtual {p1, p0, v0}, Ljava/util/Calendar;->set(II)V

    .line 10
    .line 11
    .line 12
    const/16 p0, 0xd

    .line 13
    .line 14
    invoke-virtual {p1, p0, v0}, Ljava/util/Calendar;->set(II)V

    .line 15
    .line 16
    .line 17
    const/16 p0, 0xe

    .line 18
    .line 19
    invoke-virtual {p1, p0, v0}, Ljava/util/Calendar;->set(II)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final j(J)Z
    .locals 6

    .line 1
    const-wide/16 v0, 0x3

    cmp-long p0, p1, v0

    const/4 v0, 0x1

    if-gtz p0, :cond_0

    return v0

    :cond_0
    const/4 p0, 0x0

    move v2, p0

    move v1, v0

    :goto_0
    int-to-long v3, v1

    cmp-long v3, v3, p1

    if-gez v3, :cond_1

    add-int/2addr v2, v1

    move v5, v2

    move v2, v1

    move v1, v5

    goto :goto_0

    :cond_1
    if-nez v3, :cond_2

    return v0

    :cond_2
    return p0
.end method

.method public k()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/a;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/a;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public l(I)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/a;->k()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ge p1, v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/a;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/newui/messages/a$a;

    .line 14
    .line 15
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/newui/messages/a$a;->a()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    const-string p0, "not a function item in position "

    .line 21
    .line 22
    invoke-static {p0, p1}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public final m(D)J
    .locals 3

    .line 1
    double-to-long p1, p1

    .line 2
    invoke-static {}, Ll/pzi0;->o()J

    .line 3
    .line 4
    .line 5
    move-result-wide v0

    .line 6
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    invoke-virtual {v2, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/messages/a;->i(Ljava/util/Calendar;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/a;->i(Ljava/util/Calendar;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 27
    .line 28
    .line 29
    move-result-wide p0

    .line 30
    invoke-virtual {v2}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    sub-long/2addr p0, v0

    .line 35
    const-wide/32 v0, 0x5265c00

    .line 36
    .line 37
    .line 38
    div-long/2addr p0, v0

    .line 39
    const-wide/16 v0, 0x1

    .line 40
    .line 41
    add-long/2addr p0, v0

    .line 42
    return-wide p0
.end method

.method public n()V
    .locals 3

    return-void

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/a;->b:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->h1:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_0

    .line 8
    .line 9
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/a;->b:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->H1()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/a;->a:Ljava/util/List;

    .line 24
    .line 25
    if-nez v1, :cond_1

    .line 26
    .line 27
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Ll/d79;->h()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_5

    .line 35
    .line 36
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_5

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_5

    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/a;->b:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 49
    .line 50
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->a1:Z

    .line 51
    .line 52
    if-eqz v0, :cond_5

    .line 53
    .line 54
    const/4 v0, 0x1

    .line 55
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/a;->s(Z)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/a;->a:Ljava/util/List;

    .line 59
    .line 60
    new-instance v0, Ll/a86;

    .line 61
    .line 62
    invoke-direct {v0}, Ll/a86;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/a;->r()V

    .line 73
    .line 74
    .line 75
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 76
    .line 77
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 78
    .line 79
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/g;->J0:Ll/wyd0;

    .line 80
    .line 81
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    check-cast v1, Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/messages/a;->p(Ljava/lang/String;)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_2

    .line 92
    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/a;->a:Ljava/util/List;

    .line 94
    .line 95
    new-instance v2, Ll/b86;

    .line 96
    .line 97
    invoke-direct {v2}, Ll/b86;-><init>()V

    .line 98
    .line 99
    .line 100
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    :cond_2
    invoke-static {}, Ll/d79;->h()Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-eqz v1, :cond_4

    .line 108
    .line 109
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-eqz v1, :cond_4

    .line 114
    .line 115
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-nez v1, :cond_4

    .line 120
    .line 121
    invoke-static {}, Ll/n70;->g()Ll/n70;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {v1}, Ll/n70;->f()Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-eqz v1, :cond_4

    .line 130
    .line 131
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/a;->b:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 132
    .line 133
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->a1:Z

    .line 134
    .line 135
    if-eqz v1, :cond_4

    .line 136
    .line 137
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->m()Z

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    if-nez v1, :cond_3

    .line 142
    .line 143
    iget-wide v0, v0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 144
    .line 145
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/a;->u(D)Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-eqz v0, :cond_4

    .line 150
    .line 151
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/a;->a:Ljava/util/List;

    .line 152
    .line 153
    new-instance v1, Ll/c86;

    .line 154
    .line 155
    invoke-direct {v1}, Ll/c86;-><init>()V

    .line 156
    .line 157
    .line 158
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    :cond_4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    invoke-interface {v0}, Ll/ftn0;->c()Z

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    if-eqz v0, :cond_5

    .line 174
    .line 175
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 176
    .line 177
    iget-object v0, v0, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 178
    .line 179
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->g9()Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-eqz v0, :cond_5

    .line 184
    .line 185
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/a;->a:Ljava/util/List;

    .line 186
    .line 187
    new-instance v0, Ll/d86;

    .line 188
    .line 189
    invoke-direct {v0}, Ll/d86;-><init>()V

    .line 190
    .line 191
    .line 192
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    :cond_5
    :goto_0
    return-void
.end method

.method public o(I)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/a;->a:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/e86;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/e86;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    const/4 p1, -0x1

    .line 13
    if-eq p0, p1, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final r()V
    .locals 2

    return-void

    .line 1
    invoke-static {}, Ll/e8d0;->c0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {}, Ll/rs9;->c()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->n1:Lcom/p1/mobile/putong/core/api/m;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/m;->E3()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/a;->a:Ljava/util/List;

    .line 22
    .line 23
    new-instance v0, Ll/f86;

    .line 24
    .line 25
    invoke-direct {v0}, Ll/f86;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/a;->b:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->H1()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/messages/a;->d:I

    .line 41
    .line 42
    invoke-static {v1}, Ll/nmp;->d(I)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_1

    .line 47
    .line 48
    if-nez v0, :cond_1

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/a;->a:Ljava/util/List;

    .line 51
    .line 52
    new-instance v0, Ll/g86;

    .line 53
    .line 54
    invoke-direct {v0}, Ll/g86;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    invoke-static {}, Ll/rs9;->c()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_2

    .line 66
    .line 67
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->n1:Lcom/p1/mobile/putong/core/api/m;

    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/m;->G3()Lrx/subjects/a;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    if-eqz v0, :cond_2

    .line 80
    .line 81
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 82
    .line 83
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->n1:Lcom/p1/mobile/putong/core/api/m;

    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/m;->G3()Lrx/subjects/a;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    check-cast v0, Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;

    .line 94
    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;->userID:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-nez v0, :cond_2

    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/a;->a:Ljava/util/List;

    .line 104
    .line 105
    new-instance v0, Ll/h86;

    .line 106
    .line 107
    invoke-direct {v0}, Ll/h86;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    :cond_2
    return-void
.end method

.method public s(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/a;->e:Z

    .line 2
    .line 3
    return-void
.end method

.method public t()V
    .locals 1

    return-void

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/a;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/a;->r()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final u(D)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/a;->m(D)J

    .line 2
    .line 3
    .line 4
    move-result-wide p1

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/a;->j(J)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
