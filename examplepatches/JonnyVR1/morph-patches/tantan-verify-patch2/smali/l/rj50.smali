.class public Ll/rj50;
.super Ll/xi5;
.source "SourceFile"


# instance fields
.field public a:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Lcom/p1/mobile/putong/data/OMSDialogInfo;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ll/byd0;

.field public c:Ll/vxd0;

.field public d:Ll/jxd0;

.field public e:Ll/lxd0;

.field public f:Ll/lxd0;

.field public g:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/OMSDialogInfo;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/y1f;",
            ">;"
        }
    .end annotation
.end field

.field public j:Z

.field public k:I


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/xi5;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/rj50;->a:Lrx/subjects/b;

    .line 9
    .line 10
    new-instance v0, Ll/byd0;

    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "limitDialogLastShowTime"

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object v2, Ll/uqb0;->c0:Ll/bn5;

    .line 20
    .line 21
    invoke-interface {v2}, Ll/bn5;->userId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-wide/16 v2, 0x0

    .line 33
    .line 34
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Ll/rj50;->b:Ll/byd0;

    .line 42
    .line 43
    new-instance v0, Ll/vxd0;

    .line 44
    .line 45
    new-instance v1, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    const-string v2, "limitDialogShowCountByDay"

    .line 48
    .line 49
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    sget-object v2, Ll/uqb0;->c0:Ll/bn5;

    .line 53
    .line 54
    invoke-interface {v2}, Ll/bn5;->userId()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    const/4 v2, 0x0

    .line 66
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 67
    .line 68
    .line 69
    iput-object v0, p0, Ll/rj50;->c:Ll/vxd0;

    .line 70
    .line 71
    new-instance v0, Ll/jxd0;

    .line 72
    .line 73
    new-instance v1, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    const-string v2, "isFirstToMerge"

    .line 76
    .line 77
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    sget-object v2, Ll/uqb0;->c0:Ll/bn5;

    .line 81
    .line 82
    invoke-interface {v2}, Ll/bn5;->userId()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 94
    .line 95
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 96
    .line 97
    .line 98
    iput-object v0, p0, Ll/rj50;->d:Ll/jxd0;

    .line 99
    .line 100
    new-instance v0, Ll/lxd0;

    .line 101
    .line 102
    const-string v1, "dialog_show_info_device"

    .line 103
    .line 104
    const/4 v2, 0x1

    .line 105
    invoke-direct {v0, v1, v2}, Ll/lxd0;-><init>(Ljava/lang/String;Z)V

    .line 106
    .line 107
    .line 108
    iput-object v0, p0, Ll/rj50;->e:Ll/lxd0;

    .line 109
    .line 110
    new-instance v0, Ll/lxd0;

    .line 111
    .line 112
    new-instance v1, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    const-string v3, "dialog_show_info_v1"

    .line 115
    .line 116
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    sget-object v3, Ll/uqb0;->c0:Ll/bn5;

    .line 120
    .line 121
    invoke-interface {v3}, Ll/bn5;->userId()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-direct {v0, v1, v2}, Ll/lxd0;-><init>(Ljava/lang/String;Z)V

    .line 133
    .line 134
    .line 135
    iput-object v0, p0, Ll/rj50;->f:Ll/lxd0;

    .line 136
    .line 137
    new-instance v0, Ljava/util/HashMap;

    .line 138
    .line 139
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 140
    .line 141
    .line 142
    iput-object v0, p0, Ll/rj50;->g:Ljava/util/HashMap;

    .line 143
    .line 144
    new-instance v0, Ljava/util/ArrayList;

    .line 145
    .line 146
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 147
    .line 148
    .line 149
    iput-object v0, p0, Ll/rj50;->h:Ljava/util/ArrayList;

    .line 150
    .line 151
    new-instance v0, Ljava/util/HashMap;

    .line 152
    .line 153
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 154
    .line 155
    .line 156
    iput-object v0, p0, Ll/rj50;->i:Ljava/util/HashMap;

    .line 157
    .line 158
    invoke-virtual {p0}, Ll/rj50;->c0()V

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method public static synthetic A(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic B(Ljava/lang/String;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/fj50;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/fj50;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/OMSConfigEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/gj50;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/gj50;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static synthetic C(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/OMSDialogInfo;ZLl/y20;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 1

    .line 1
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p4, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 16
    .line 17
    iget-object p4, p4, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p0, p1, p4, p2}, Ll/el50;->h(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/data/OMSDialogInfo;Ljava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 29
    .line 30
    invoke-interface {p3, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public static synthetic D(Ljava/lang/String;Lcom/p1/mobile/putong/data/OMSAdCardInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->identifier:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public static synthetic E(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic F(Ll/rj50;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rj50;->m0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic G(Ll/rj50;Lcom/p1/mobile/android/app/Act;ZLl/y20;Lcom/p1/mobile/putong/data/OMSDialogInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/rj50;->n0(Lcom/p1/mobile/android/app/Act;ZLl/y20;Lcom/p1/mobile/putong/data/OMSDialogInfo;)V

    return-void
.end method

.method public static synthetic H(Ljava/lang/String;Lcom/p1/mobile/putong/data/OMSDialogInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public static synthetic I(Ljava/lang/String;)Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Ll/xi5;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {p0, v1}, Ll/el50;->f(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static synthetic J(Ljava/lang/String;Lcom/p1/mobile/putong/data/OMSDialogInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public static synthetic x(Lcom/p1/mobile/putong/data/OMSData;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSData;->dialogs:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic y(Ljava/lang/String;Lcom/p1/mobile/putong/data/OMSDialogInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public static synthetic z(Ljava/lang/String;Lcom/p1/mobile/putong/data/OMSConfigEnvelope;)Lcom/p1/mobile/putong/data/OMSDialogInfo;
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSConfigEnvelope;->data:Lcom/p1/mobile/putong/data/OMSData;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSData;->dialogs:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/pk50;->d()Lcom/p1/mobile/putong/data/OMSData;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSData;->dialogs:Ljava/util/List;

    .line 20
    .line 21
    new-instance v2, Ll/hj50;

    .line 22
    .line 23
    invoke-direct {v2, p0}, Ll/hj50;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSData;->dialogs:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v1, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object p0, v0, Lcom/p1/mobile/putong/data/OMSData;->dialogs:Ljava/util/List;

    .line 44
    .line 45
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSConfigEnvelope;->data:Lcom/p1/mobile/putong/data/OMSData;

    .line 46
    .line 47
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSData;->dialogs:Ljava/util/List;

    .line 48
    .line 49
    const/4 v2, 0x0

    .line 50
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 55
    .line 56
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0, v0}, Ll/pk50;->u(Lcom/p1/mobile/putong/data/OMSData;)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSConfigEnvelope;->data:Lcom/p1/mobile/putong/data/OMSData;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSData;->dialogs:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    check-cast p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 75
    .line 76
    return-object p0

    .line 77
    :cond_1
    const/4 p0, 0x0

    .line 78
    return-object p0
.end method


# virtual methods
.method public K(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rj50;->S(Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->blockCard:Z

    .line 12
    .line 13
    if-eqz p0, :cond_0

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

.method public L(Lcom/p1/mobile/android/app/Act;ZLl/y20;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Z",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/rj50;->h:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/rj50;->h:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_2

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 27
    .line 28
    iget-object v2, v1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 29
    .line 30
    const-string v3, "e_swipe_after"

    .line 31
    .line 32
    const-string v4, "p_suggest_users_home_view"

    .line 33
    .line 34
    invoke-virtual {p0, v2, v3, v4}, Ll/rj50;->Y(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/y1f;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    sget-object v3, Ll/uqb0;->i0:Ll/z1f;

    .line 39
    .line 40
    invoke-virtual {v3, v2}, Ll/z1f;->a(Ll/y1f;)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_1

    .line 45
    .line 46
    iget-object v2, v1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 47
    .line 48
    iget-object v3, v1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 49
    .line 50
    iget-boolean v3, v3, Lcom/p1/mobile/putong/data/OMSDisplayRule;->userDimension:Z

    .line 51
    .line 52
    xor-int/lit8 v3, v3, 0x1

    .line 53
    .line 54
    invoke-virtual {p0, v2, v3}, Ll/rj50;->M(Ljava/lang/String;Z)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v2, :cond_1

    .line 59
    .line 60
    invoke-virtual {p0, p1, v1, p2, p3}, Ll/rj50;->u0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/OMSDialogInfo;ZLl/y20;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    :goto_0
    return-void
.end method

.method public M(Ljava/lang/String;Z)Z
    .locals 3

    const-string v0, "p_welcomeback_popup"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    const-string v0, "p_fake_alert_popup_view"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    const-string v0, "p_alert_dislike_who_liked_me_popup"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    return v0

    :cond_2
    const-string v0, "p_no_match_svip"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x0

    return v0

    :cond_3
    const-string v0, "p_profile_picture_popup"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x0

    return v0

    :cond_4
    const-string v0, "p_avatarVerification_guide"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 v0, 0x0

    return v0

    :cond_5
    const-string v0, "p_alert_cheat_prevention__tips_popup"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const/4 v0, 0x0

    return v0

    :cond_6
    const-string v0, "p_alert_cheat_prevention__risk_alarm_popup"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    const/4 v0, 0x0

    return v0

    :cond_7
    const-string v0, "p_verification_merge_popup"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    return v0

    :cond_8
    const-string v0, "p_purchase_guide_page"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    const/4 v0, 0x0

    return v0

    :cond_9
    const-string v0, "p_intl_5star_dialog_view"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x0

    return v0

    :cond_a
    const-string v0, "p_appstore_rating_filter_popup"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    const/4 v0, 0x0

    return v0

    :cond_b
    const-string v0, "p_appstore_rating_filter_popup_store"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x0

    return v0

    :cond_c
    const-string v0, "p_prompt_notification_auth_popup_view"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    const/4 v0, 0x0

    return v0

    :cond_d
    const-string v0, "p_purchase_expire_page"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x0

    return v0

    :cond_e
    const-string v0, "p_purchase_page"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    const/4 v0, 0x0

    return v0

    :cond_f
    const-string v0, "p_vip_upgrade_popup"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x0

    return v0

    :cond_10
    const-string v0, "p_forbidden_good_to_fake_popup_view"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    const/4 v0, 0x0

    return v0

    :cond_11
    const-string v0, "p_new_users_see_purchase_guide_see_view"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x0

    return v0

    :cond_12
    const-string v0, "p_no_match_see_purchase_guide_view"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    const/4 v0, 0x0

    return v0

    :cond_13
    const-string v0, "p_quickchat_intropopup"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    const/4 v0, 0x0

    return v0

    :cond_14
    const-string v0, "p_vip_expired"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    const/4 v0, 0x0

    return v0

    :cond_15
    const-string v0, "p_intl_vip_expired"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    const/4 v0, 0x0

    return v0

    :cond_16
    const-string v0, "p_pu_gift_package"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    const/4 v0, 0x0

    return v0

    :cond_17
    const-string v0, "p_pu_gift_vip"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    const/4 v0, 0x0

    return v0

    :cond_18
    const-string v0, "p_get_svip_freetrial"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    const/4 v0, 0x0

    return v0

    :cond_19
    const-string v0, "p_user_passive_show_chat"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    const/4 v0, 0x0

    return v0

    :cond_1a
    const-string v0, "p_chat_guide_popup"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1b

    const/4 v0, 0x0

    return v0

    :cond_1b
    const-string v0, "p_avatarVerification_popup"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    const/4 v0, 0x0

    return v0

    :cond_1c
    const-string v0, "p_identityVerification_popup"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1d

    const/4 v0, 0x0

    return v0

    :cond_1d
    const-string v0, "p_phoneVerification_popup"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    const/4 v0, 0x0

    return v0

    :cond_1e
    const-string v0, "p_second_prompt_phone_auth_popup_view"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1f

    const/4 v0, 0x0

    return v0

    :cond_1f
    const-string v0, "p_sys_phone_auth_popup_view"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_20

    const/4 v0, 0x0

    return v0

    :cond_20
    const-string v0, "p_prompt_phone_auth_popup_view"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    const/4 v0, 0x0

    return v0

    .line 1
    :cond_21
    if-eqz p2, :cond_22

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rj50;->Q(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DialogShowInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    goto :goto_0

    .line 8
    :cond_22
    invoke-virtual {p0, p1}, Ll/rj50;->P(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DialogShowInfo;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    :goto_0
    invoke-virtual {p0, p1}, Ll/rj50;->S(Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x0

    .line 17
    if-nez v0, :cond_23

    .line 18
    .line 19
    return v1

    .line 20
    :cond_23
    iget-boolean v2, p2, Lcom/p1/mobile/putong/data/DialogShowInfo;->noRemind:Z

    .line 21
    .line 22
    if-nez v2, :cond_27

    .line 23
    .line 24
    iget-object v2, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 25
    .line 26
    iget v2, v2, Lcom/p1/mobile/putong/data/OMSDisplayRule;->count:I

    .line 27
    .line 28
    invoke-virtual {p0, v2, p2}, Ll/rj50;->l0(ILcom/p1/mobile/putong/data/DialogShowInfo;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-nez v2, :cond_27

    .line 33
    .line 34
    iget-object v2, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 35
    .line 36
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OMSDisplayRule;->frequency:Ljava/util/List;

    .line 37
    .line 38
    invoke-virtual {p0, v2, p2}, Ll/rj50;->f0(Ljava/util/List;Lcom/p1/mobile/putong/data/DialogShowInfo;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-nez v2, :cond_27

    .line 43
    .line 44
    iget-object v2, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 45
    .line 46
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OMSDisplayRule;->timeRange:Ljava/util/List;

    .line 47
    .line 48
    invoke-virtual {p0, v2}, Ll/rj50;->k0(Ljava/util/List;)Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-nez v2, :cond_27

    .line 53
    .line 54
    iget-object v2, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 55
    .line 56
    iget v2, v2, Lcom/p1/mobile/putong/data/OMSDisplayRule;->timePerDay:I

    .line 57
    .line 58
    invoke-virtual {p0, v2, p2, v1}, Ll/rj50;->i0(ILcom/p1/mobile/putong/data/DialogShowInfo;I)Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-nez v2, :cond_27

    .line 63
    .line 64
    iget-object v2, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 65
    .line 66
    iget v2, v2, Lcom/p1/mobile/putong/data/OMSDisplayRule;->timePerWeek:I

    .line 67
    .line 68
    invoke-virtual {p0, v2, p2}, Ll/rj50;->j0(ILcom/p1/mobile/putong/data/DialogShowInfo;)Z

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    if-nez p2, :cond_27

    .line 73
    .line 74
    iget-object p2, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 75
    .line 76
    iget p2, p2, Lcom/p1/mobile/putong/data/OMSDisplayRule;->sessionCount:I

    .line 77
    .line 78
    invoke-virtual {p0, p2, p1}, Ll/rj50;->h0(ILjava/lang/String;)Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-eqz p1, :cond_24

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_24
    iget-boolean p1, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->independent:Z

    .line 86
    .line 87
    if-nez p1, :cond_26

    .line 88
    .line 89
    invoke-virtual {p0}, Ll/rj50;->q0()Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-eqz p0, :cond_25

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_25
    return v1

    .line 97
    :cond_26
    :goto_1
    const/4 p0, 0x1

    .line 98
    return p0

    .line 99
    :cond_27
    :goto_2
    return v1
.end method

.method public N(Ljava/lang/String;Z)Z
    .locals 3

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rj50;->Q(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DialogShowInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0, p1}, Ll/rj50;->P(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DialogShowInfo;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    :goto_0
    invoke-virtual {p0, p1}, Ll/rj50;->R(Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    return v1

    .line 20
    :cond_1
    iget-boolean v2, p2, Lcom/p1/mobile/putong/data/DialogShowInfo;->noRemind:Z

    .line 21
    .line 22
    if-nez v2, :cond_3

    .line 23
    .line 24
    iget-object v2, v0, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 25
    .line 26
    iget v2, v2, Lcom/p1/mobile/putong/data/OMSDisplayRule;->count:I

    .line 27
    .line 28
    invoke-virtual {p0, v2, p2}, Ll/rj50;->l0(ILcom/p1/mobile/putong/data/DialogShowInfo;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-nez v2, :cond_3

    .line 33
    .line 34
    iget-object v2, v0, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 35
    .line 36
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OMSDisplayRule;->frequency:Ljava/util/List;

    .line 37
    .line 38
    invoke-virtual {p0, v2, p2}, Ll/rj50;->f0(Ljava/util/List;Lcom/p1/mobile/putong/data/DialogShowInfo;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-nez v2, :cond_3

    .line 43
    .line 44
    iget-object v2, v0, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 45
    .line 46
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OMSDisplayRule;->timeRange:Ljava/util/List;

    .line 47
    .line 48
    invoke-virtual {p0, v2}, Ll/rj50;->k0(Ljava/util/List;)Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-nez v2, :cond_3

    .line 53
    .line 54
    iget-object v2, v0, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 55
    .line 56
    iget v2, v2, Lcom/p1/mobile/putong/data/OMSDisplayRule;->timePerDay:I

    .line 57
    .line 58
    invoke-virtual {p0, v2, p2, v1}, Ll/rj50;->i0(ILcom/p1/mobile/putong/data/DialogShowInfo;I)Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-nez v2, :cond_3

    .line 63
    .line 64
    iget-object v2, v0, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 65
    .line 66
    iget v2, v2, Lcom/p1/mobile/putong/data/OMSDisplayRule;->timePerWeek:I

    .line 67
    .line 68
    invoke-virtual {p0, v2, p2}, Ll/rj50;->j0(ILcom/p1/mobile/putong/data/DialogShowInfo;)Z

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    if-nez p2, :cond_3

    .line 73
    .line 74
    iget-object p2, v0, Lcom/p1/mobile/putong/data/OMSAdCardInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 75
    .line 76
    iget p2, p2, Lcom/p1/mobile/putong/data/OMSDisplayRule;->sessionCount:I

    .line 77
    .line 78
    invoke-virtual {p0, p2, p1}, Ll/rj50;->h0(ILjava/lang/String;)Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-eqz p0, :cond_2

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_2
    const/4 p0, 0x1

    .line 86
    return p0

    .line 87
    :cond_3
    :goto_1
    return v1
.end method

.method public final O(Ljava/lang/String;)I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rj50;->g:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/rj50;->g:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public P(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DialogShowInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rj50;->f:Ll/lxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;->showInfos:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/data/DialogShowInfo;

    .line 16
    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/data/DialogShowInfo;->new_()Lcom/p1/mobile/putong/data/DialogShowInfo;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/data/DialogShowInfo;->resourceId:Ljava/lang/String;

    .line 24
    .line 25
    :cond_0
    return-object p0
.end method

.method public Q(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DialogShowInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rj50;->e:Ll/lxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;->showInfos:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/data/DialogShowInfo;

    .line 16
    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/data/DialogShowInfo;->new_()Lcom/p1/mobile/putong/data/DialogShowInfo;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/data/DialogShowInfo;->resourceId:Ljava/lang/String;

    .line 24
    .line 25
    :cond_0
    return-object p0
.end method

.method public R(Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSAdCardInfo;
    .locals 1

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/pk50;->h()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0

    .line 17
    :cond_0
    new-instance v0, Ll/kj50;

    .line 18
    .line 19
    invoke-direct {v0, p1}, Ll/kj50;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Lcom/p1/mobile/putong/data/OMSAdCardInfo;

    .line 27
    .line 28
    return-object p0
.end method

.method public S(Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSDialogInfo;
    .locals 1

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/pk50;->i()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0

    .line 17
    :cond_0
    new-instance v0, Ll/jj50;

    .line 18
    .line 19
    invoke-direct {v0, p1}, Ll/jj50;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 27
    .line 28
    return-object p0
.end method

.method public T(Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/rj50;->S(Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OmsMerCuryData;->server:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    new-instance p1, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ljava/util/Map$Entry;

    .line 41
    .line 42
    new-instance v1, Ll/pf60;

    .line 43
    .line 44
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Ljava/lang/String;

    .line 49
    .line 50
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Ljava/lang/String;

    .line 55
    .line 56
    invoke-direct {v1, v2, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    return-object p1

    .line 64
    :cond_1
    new-instance p0, Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 67
    .line 68
    .line 69
    return-object p0
.end method

.method public U(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 1

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
    goto :goto_1

    .line 8
    :cond_0
    invoke-virtual {p0, p1}, Ll/rj50;->S(Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OmsMerCuryData;->server:Ljava/util/Map;

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    :try_start_0
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Ljava/util/Map$Entry;

    .line 43
    .line 44
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Ljava/lang/String;

    .line 49
    .line 50
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p2, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :catch_0
    :cond_1
    :goto_1
    return-object p2
.end method

.method public varargs V(Ljava/lang/String;[Ll/pf60;)[Ll/pf60;
    .locals 3

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
    goto :goto_2

    .line 8
    :cond_0
    invoke-virtual {p0, p1}, Ll/rj50;->S(Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_3

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OmsMerCuryData;->server:Ljava/util/Map;

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-nez p1, :cond_3

    .line 23
    .line 24
    new-instance p1, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Ljava/util/Map$Entry;

    .line 48
    .line 49
    new-instance v1, Ll/pf60;

    .line 50
    .line 51
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    check-cast v2, Ljava/lang/String;

    .line 56
    .line 57
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Ljava/lang/String;

    .line 62
    .line 63
    invoke-direct {v1, v2, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    if-eqz p2, :cond_2

    .line 71
    .line 72
    array-length p0, p2

    .line 73
    if-lez p0, :cond_2

    .line 74
    .line 75
    array-length p0, p2

    .line 76
    const/4 v0, 0x0

    .line 77
    :goto_1
    if-ge v0, p0, :cond_2

    .line 78
    .line 79
    aget-object v1, p2, v0

    .line 80
    .line 81
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    add-int/lit8 v0, v0, 0x1

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    new-array p0, p0, [Ll/pf60;

    .line 92
    .line 93
    invoke-interface {p1, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    return-object p0

    .line 97
    :cond_3
    :goto_2
    return-object p2
.end method

.method public W(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/OMSDialogInfo;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_5

    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    goto :goto_1

    .line 7
    :cond_0
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/pk50;->i()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_5

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 37
    .line 38
    iget-object v2, v1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->events:Ljava/util/List;

    .line 39
    .line 40
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-nez v2, :cond_2

    .line 45
    .line 46
    iget-object v2, v1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->events:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    :cond_3
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-eqz v3, :cond_2

    .line 57
    .line 58
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    check-cast v3, Lcom/p1/mobile/putong/data/TriggerEvent;

    .line 63
    .line 64
    iget-object v4, v3, Lcom/p1/mobile/putong/data/TriggerEvent;->eventID:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {p1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    if-eqz v4, :cond_3

    .line 71
    .line 72
    iget-object v3, v3, Lcom/p1/mobile/putong/data/TriggerEvent;->properties:Lcom/p1/mobile/putong/data/TriggerProperty;

    .line 73
    .line 74
    iget-object v3, v3, Lcom/p1/mobile/putong/data/TriggerProperty;->pageID:Ljava/lang/String;

    .line 75
    .line 76
    invoke-static {p2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    if-eqz v3, :cond_3

    .line 81
    .line 82
    if-nez p0, :cond_4

    .line 83
    .line 84
    new-instance p0, Ljava/util/ArrayList;

    .line 85
    .line 86
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 87
    .line 88
    .line 89
    :cond_4
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_5
    :goto_1
    return-object p0
.end method

.method public X(Ljava/lang/String;)I
    .locals 2

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/pk50;->i()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    new-instance v0, Ll/qj50;

    .line 18
    .line 19
    invoke-direct {v0, p1}, Ll/qj50;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 27
    .line 28
    if-nez p0, :cond_1

    .line 29
    .line 30
    return v1

    .line 31
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 32
    .line 33
    iget p0, p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->priority:I

    .line 34
    .line 35
    return p0
.end method

.method public Y(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/y1f;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rj50;->i:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/rj50;->o0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/y1f;

    .line 12
    .line 13
    return-object p0
.end method

.method public Z(Ljava/lang/String;IZ)Z
    .locals 6

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Ll/rj50;->g:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/rj50;->O(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/4 v3, 0x1

    .line 16
    add-int/2addr v2, v3

    .line 17
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v0, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    if-eqz p3, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ll/rj50;->Q(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DialogShowInfo;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    invoke-virtual {p0, p1}, Ll/rj50;->P(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DialogShowInfo;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    :goto_0
    if-lez p2, :cond_2

    .line 36
    .line 37
    iget-wide v4, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->lastShowTime:J

    .line 38
    .line 39
    invoke-static {v4, v5, p2}, Ll/pzi0;->E(JI)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    goto :goto_1

    .line 44
    :cond_2
    iget-wide v4, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->lastShowTime:J

    .line 45
    .line 46
    invoke-static {v4, v5}, Ll/pzi0;->D(J)Z

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    :goto_1
    if-eqz p2, :cond_3

    .line 51
    .line 52
    iget p2, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->countByDay:I

    .line 53
    .line 54
    add-int/2addr p2, v3

    .line 55
    iput p2, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->countByDay:I

    .line 56
    .line 57
    goto :goto_2

    .line 58
    :cond_3
    iput v3, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->countByDay:I

    .line 59
    .line 60
    :goto_2
    iget-wide v4, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->lastShowTime:J

    .line 61
    .line 62
    invoke-static {v4, v5}, Ll/pzi0;->v(J)Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    if-eqz p2, :cond_4

    .line 67
    .line 68
    iget p2, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->countByWeek:I

    .line 69
    .line 70
    add-int/2addr p2, v3

    .line 71
    iput p2, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->countByWeek:I

    .line 72
    .line 73
    goto :goto_3

    .line 74
    :cond_4
    iput v3, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->countByWeek:I

    .line 75
    .line 76
    :goto_3
    invoke-static {}, Ll/pzi0;->o()J

    .line 77
    .line 78
    .line 79
    move-result-wide v4

    .line 80
    iput-wide v4, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->lastShowTime:J

    .line 81
    .line 82
    iget p2, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->totalShownCount:I

    .line 83
    .line 84
    add-int/2addr p2, v3

    .line 85
    iput p2, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->totalShownCount:I

    .line 86
    .line 87
    if-eqz p3, :cond_5

    .line 88
    .line 89
    iget-object p0, p0, Ll/rj50;->e:Ll/lxd0;

    .line 90
    .line 91
    invoke-virtual {p0, p1}, Ll/lxd0;->h(Lcom/p1/mobile/putong/data/DialogShowInfo;)V

    .line 92
    .line 93
    .line 94
    goto :goto_4

    .line 95
    :cond_5
    iget-object p0, p0, Ll/rj50;->f:Ll/lxd0;

    .line 96
    .line 97
    invoke-virtual {p0, p1}, Ll/lxd0;->h(Lcom/p1/mobile/putong/data/DialogShowInfo;)V

    .line 98
    .line 99
    .line 100
    :goto_4
    if-nez p3, :cond_6

    .line 101
    .line 102
    invoke-static {}, Lcom/p1/mobile/putong/data/OmsCounter;->new_()Lcom/p1/mobile/putong/data/OmsCounter;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    iget-object p2, p0, Lcom/p1/mobile/putong/data/OmsCounter;->counters:Ljava/util/List;

    .line 107
    .line 108
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 109
    .line 110
    .line 111
    move-result-object p3

    .line 112
    invoke-virtual {p3}, Ll/pk50;->c()Ll/dj50;

    .line 113
    .line 114
    .line 115
    move-result-object p3

    .line 116
    invoke-virtual {p3, p1}, Ll/dj50;->F(Lcom/p1/mobile/putong/data/DialogShowInfo;)Lcom/p1/mobile/putong/data/OMSCounterInfo;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    invoke-virtual {p1}, Ll/pk50;->c()Ll/dj50;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-virtual {p1, p0, v1}, Ll/dj50;->O(Lcom/p1/mobile/putong/data/OmsCounter;Z)V

    .line 132
    .line 133
    .line 134
    :cond_6
    return v3
.end method

.method public a0(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/rj50;->P(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DialogShowInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->noRemind:Z

    .line 7
    .line 8
    iget-object p0, p0, Ll/rj50;->f:Ll/lxd0;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/lxd0;->h(Lcom/p1/mobile/putong/data/DialogShowInfo;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public b0(Ljava/lang/String;IZ)Z
    .locals 6

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p0, p1}, Ll/rj50;->d0(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/rj50;->g:Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/rj50;->O(Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    const/4 v3, 0x1

    .line 19
    add-int/2addr v2, v3

    .line 20
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v0, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    if-eqz p3, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/rj50;->Q(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DialogShowInfo;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-virtual {p0, p1}, Ll/rj50;->P(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DialogShowInfo;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    :goto_0
    if-lez p2, :cond_2

    .line 39
    .line 40
    iget-wide v4, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->lastShowTime:J

    .line 41
    .line 42
    invoke-static {v4, v5, p2}, Ll/pzi0;->E(JI)Z

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    goto :goto_1

    .line 47
    :cond_2
    iget-wide v4, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->lastShowTime:J

    .line 48
    .line 49
    invoke-static {v4, v5}, Ll/pzi0;->D(J)Z

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    :goto_1
    if-eqz p2, :cond_3

    .line 54
    .line 55
    iget p2, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->countByDay:I

    .line 56
    .line 57
    add-int/2addr p2, v3

    .line 58
    iput p2, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->countByDay:I

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_3
    iput v3, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->countByDay:I

    .line 62
    .line 63
    :goto_2
    iget-wide v4, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->lastShowTime:J

    .line 64
    .line 65
    invoke-static {v4, v5}, Ll/pzi0;->v(J)Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    if-eqz p2, :cond_4

    .line 70
    .line 71
    iget p2, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->countByWeek:I

    .line 72
    .line 73
    add-int/2addr p2, v3

    .line 74
    iput p2, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->countByWeek:I

    .line 75
    .line 76
    goto :goto_3

    .line 77
    :cond_4
    iput v3, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->countByWeek:I

    .line 78
    .line 79
    :goto_3
    invoke-static {}, Ll/pzi0;->o()J

    .line 80
    .line 81
    .line 82
    move-result-wide v4

    .line 83
    iput-wide v4, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->lastShowTime:J

    .line 84
    .line 85
    iget p2, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->totalShownCount:I

    .line 86
    .line 87
    add-int/2addr p2, v3

    .line 88
    iput p2, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->totalShownCount:I

    .line 89
    .line 90
    if-eqz p3, :cond_5

    .line 91
    .line 92
    iget-object p0, p0, Ll/rj50;->e:Ll/lxd0;

    .line 93
    .line 94
    invoke-virtual {p0, p1}, Ll/lxd0;->h(Lcom/p1/mobile/putong/data/DialogShowInfo;)V

    .line 95
    .line 96
    .line 97
    goto :goto_4

    .line 98
    :cond_5
    iget-object p0, p0, Ll/rj50;->f:Ll/lxd0;

    .line 99
    .line 100
    invoke-virtual {p0, p1}, Ll/lxd0;->h(Lcom/p1/mobile/putong/data/DialogShowInfo;)V

    .line 101
    .line 102
    .line 103
    :goto_4
    if-nez p3, :cond_6

    .line 104
    .line 105
    invoke-static {}, Lcom/p1/mobile/putong/data/OmsCounter;->new_()Lcom/p1/mobile/putong/data/OmsCounter;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    iget-object p2, p0, Lcom/p1/mobile/putong/data/OmsCounter;->counters:Ljava/util/List;

    .line 110
    .line 111
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 112
    .line 113
    .line 114
    move-result-object p3

    .line 115
    invoke-virtual {p3}, Ll/pk50;->c()Ll/dj50;

    .line 116
    .line 117
    .line 118
    move-result-object p3

    .line 119
    invoke-virtual {p3, p1}, Ll/dj50;->F(Lcom/p1/mobile/putong/data/DialogShowInfo;)Lcom/p1/mobile/putong/data/OMSCounterInfo;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-virtual {p1}, Ll/pk50;->c()Ll/dj50;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-virtual {p1, p0, v1}, Ll/dj50;->O(Lcom/p1/mobile/putong/data/OmsCounter;Z)V

    .line 135
    .line 136
    .line 137
    :cond_6
    return v3
.end method

.method public final c0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/pk50;->s()Lrx/subjects/a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/ej50;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/ej50;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/ij50;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/ij50;-><init>(Ll/rj50;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final d0(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/rj50;->S(Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->independent:Z

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p1, p0, Ll/rj50;->b:Ll/byd0;

    .line 17
    .line 18
    invoke-static {}, Ll/pzi0;->o()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p1, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/rj50;->c:Ll/vxd0;

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ljava/lang/Integer;

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/lit8 v0, v0, 0x1

    .line 42
    .line 43
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p1, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    iget p1, p0, Ll/rj50;->k:I

    .line 51
    .line 52
    add-int/lit8 p1, p1, 0x1

    .line 53
    .line 54
    iput p1, p0, Ll/rj50;->k:I

    .line 55
    .line 56
    return-void
.end method

.method public e0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rj50;->d:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final f0(Ljava/util/List;Lcom/p1/mobile/putong/data/DialogShowInfo;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/p1/mobile/putong/data/DialogShowInfo;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    iget p0, p2, Lcom/p1/mobile/putong/data/DialogShowInfo;->totalShownCount:I

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x1

    .line 16
    if-lt p0, v1, :cond_1

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    sub-int/2addr p0, v2

    .line 23
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ljava/lang/Integer;

    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    iget p0, p2, Lcom/p1/mobile/putong/data/DialogShowInfo;->totalShownCount:I

    .line 35
    .line 36
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Ljava/lang/Integer;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    :goto_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 47
    .line 48
    .line 49
    move-result-wide v3

    .line 50
    iget-wide p1, p2, Lcom/p1/mobile/putong/data/DialogShowInfo;->lastShowTime:J

    .line 51
    .line 52
    sub-long/2addr v3, p1

    .line 53
    int-to-long p0, p0

    .line 54
    const-wide/16 v5, 0x3e8

    .line 55
    .line 56
    mul-long/2addr p0, v5

    .line 57
    cmp-long p0, v3, p0

    .line 58
    .line 59
    if-gez p0, :cond_2

    .line 60
    .line 61
    return v2

    .line 62
    :cond_2
    return v0
.end method

.method public g0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/rj50;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public final h0(ILjava/lang/String;)Z
    .locals 2

    .line 1
    const/4 v0, -0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return v1

    .line 6
    :cond_0
    invoke-virtual {p0, p2}, Ll/rj50;->O(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-lt p0, p1, :cond_1

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_1
    return v1
.end method

.method public final i0(ILcom/p1/mobile/putong/data/DialogShowInfo;I)Z
    .locals 3

    .line 1
    const/4 p0, -0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    return v0

    .line 6
    :cond_0
    const/4 p0, 0x1

    .line 7
    if-lez p3, :cond_2

    .line 8
    .line 9
    iget-wide v1, p2, Lcom/p1/mobile/putong/data/DialogShowInfo;->lastShowTime:J

    .line 10
    .line 11
    invoke-static {v1, v2, p3}, Ll/pzi0;->E(JI)Z

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    if-eqz p3, :cond_1

    .line 16
    .line 17
    iget p2, p2, Lcom/p1/mobile/putong/data/DialogShowInfo;->countByDay:I

    .line 18
    .line 19
    if-lt p2, p1, :cond_1

    .line 20
    .line 21
    return p0

    .line 22
    :cond_1
    return v0

    .line 23
    :cond_2
    iget-wide v1, p2, Lcom/p1/mobile/putong/data/DialogShowInfo;->lastShowTime:J

    .line 24
    .line 25
    invoke-static {v1, v2}, Ll/pzi0;->D(J)Z

    .line 26
    .line 27
    .line 28
    move-result p3

    .line 29
    if-eqz p3, :cond_3

    .line 30
    .line 31
    iget p2, p2, Lcom/p1/mobile/putong/data/DialogShowInfo;->countByDay:I

    .line 32
    .line 33
    if-lt p2, p1, :cond_3

    .line 34
    .line 35
    return p0

    .line 36
    :cond_3
    return v0
.end method

.method public final j0(ILcom/p1/mobile/putong/data/DialogShowInfo;)Z
    .locals 3

    .line 1
    const/4 p0, -0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    return v0

    .line 6
    :cond_0
    iget-wide v1, p2, Lcom/p1/mobile/putong/data/DialogShowInfo;->lastShowTime:J

    .line 7
    .line 8
    invoke-static {v1, v2}, Ll/pzi0;->v(J)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    iget p0, p2, Lcom/p1/mobile/putong/data/DialogShowInfo;->countByWeek:I

    .line 15
    .line 16
    if-lt p0, p1, :cond_1

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_1
    return v0
.end method

.method public final k0(Ljava/util/List;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_3

    .line 7
    .line 8
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    const/4 v1, 0x2

    .line 13
    if-ge p0, v1, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 17
    .line 18
    .line 19
    move-result-wide v1

    .line 20
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Ljava/lang/Long;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 27
    .line 28
    .line 29
    move-result-wide v3

    .line 30
    const-wide/16 v5, 0x3e8

    .line 31
    .line 32
    mul-long/2addr v3, v5

    .line 33
    cmp-long p0, v1, v3

    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    if-ltz p0, :cond_2

    .line 37
    .line 38
    invoke-static {}, Ll/pzi0;->o()J

    .line 39
    .line 40
    .line 41
    move-result-wide v2

    .line 42
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Ljava/lang/Long;

    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 49
    .line 50
    .line 51
    move-result-wide p0

    .line 52
    mul-long/2addr p0, v5

    .line 53
    cmp-long p0, v2, p0

    .line 54
    .line 55
    if-lez p0, :cond_1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    return v0

    .line 59
    :cond_2
    :goto_0
    return v1

    .line 60
    :cond_3
    :goto_1
    return v0
.end method

.method public final l0(ILcom/p1/mobile/putong/data/DialogShowInfo;)Z
    .locals 1

    .line 1
    const/4 p0, -0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    return v0

    .line 6
    :cond_0
    iget p0, p2, Lcom/p1/mobile/putong/data/DialogShowInfo;->totalShownCount:I

    .line 7
    .line 8
    if-lt p0, p1, :cond_1

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_1
    return v0
.end method

.method public final synthetic m0(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rj50;->x0(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic n0(Lcom/p1/mobile/android/app/Act;ZLl/y20;Lcom/p1/mobile/putong/data/OMSDialogInfo;)V
    .locals 7

    .line 1
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p4, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p4, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 10
    .line 11
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->userDimension:Z

    .line 12
    .line 13
    xor-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1}, Ll/rj50;->M(Ljava/lang/String;Z)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const/4 v5, 0x0

    .line 22
    move-object v1, p0

    .line 23
    move-object v2, p1

    .line 24
    move v4, p2

    .line 25
    move-object v6, p3

    .line 26
    move-object v3, p4

    .line 27
    invoke-virtual/range {v1 .. v6}, Ll/rj50;->t0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/OMSDialogInfo;ZZLl/y20;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final o0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p1, "-"

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public p0(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/OMSDialogInfo;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "oms_dialog_refresh_"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/pj50;

    .line 16
    .line 17
    invoke-direct {v1, p1}, Ll/pj50;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, v0, p1, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public q0()Z
    .locals 5

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/pk50;->d()Lcom/p1/mobile/putong/data/OMSData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSData;->globalConstraints:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSData;->globalConstraints:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;

    .line 27
    .line 28
    :goto_0
    const/4 v1, 0x1

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    return v1

    .line 32
    :cond_1
    iget-object v3, p0, Ll/rj50;->b:Ll/byd0;

    .line 33
    .line 34
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    check-cast v3, Ljava/lang/Long;

    .line 39
    .line 40
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 41
    .line 42
    .line 43
    move-result-wide v3

    .line 44
    invoke-static {v3, v4}, Ll/pzi0;->D(J)Z

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    if-nez v3, :cond_2

    .line 49
    .line 50
    iget-object v3, p0, Ll/rj50;->c:Ll/vxd0;

    .line 51
    .line 52
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    invoke-virtual {v3, v4}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    :cond_2
    iget-object v3, p0, Ll/rj50;->c:Ll/vxd0;

    .line 60
    .line 61
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    check-cast v3, Ljava/lang/Integer;

    .line 66
    .line 67
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    iget v4, v0, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->count:I

    .line 72
    .line 73
    if-lt v3, v4, :cond_3

    .line 74
    .line 75
    if-gez v4, :cond_4

    .line 76
    .line 77
    :cond_3
    iget p0, p0, Ll/rj50;->k:I

    .line 78
    .line 79
    iget v0, v0, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->sessionCount:I

    .line 80
    .line 81
    if-lt p0, v0, :cond_5

    .line 82
    .line 83
    if-gez v0, :cond_4

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_4
    return v2

    .line 87
    :cond_5
    :goto_1
    return v1
.end method

.method public r0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/rj50;->j:Z

    .line 2
    .line 3
    return-void
.end method

.method public s0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p0, p2}, Ll/rj50;->S(Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    invoke-static {}, Ll/uk50;->f()Ll/uk50;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p2, p1, p0}, Ll/uk50;->n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/OMSDialogInfo;)Z

    .line 14
    .line 15
    .line 16
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    return p0

    .line 18
    :catch_0
    move-exception p0

    .line 19
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    return v0
.end method

.method public t0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/OMSDialogInfo;ZZLl/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/OMSDialogInfo;",
            "ZZ",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/rj50;->j:Z

    .line 3
    .line 4
    if-eqz p4, :cond_0

    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 7
    .line 8
    .line 9
    move-result-object p4

    .line 10
    if-nez p4, :cond_0

    .line 11
    .line 12
    goto/16 :goto_0

    .line 13
    .line 14
    :cond_0
    if-nez p2, :cond_1

    .line 15
    .line 16
    goto/16 :goto_0

    .line 17
    .line 18
    :cond_1
    :try_start_0
    iget-object p4, p2, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 19
    .line 20
    const-string v1, "morph"

    .line 21
    .line 22
    invoke-static {p4, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p4

    .line 26
    if-eqz p4, :cond_3

    .line 27
    .line 28
    invoke-static {}, Ll/uk50;->f()Ll/uk50;

    .line 29
    .line 30
    .line 31
    move-result-object p4

    .line 32
    invoke-virtual {p4, p1, p2}, Ll/uk50;->n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/OMSDialogInfo;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_6

    .line 37
    .line 38
    if-eqz p3, :cond_2

    .line 39
    .line 40
    iget-object p1, p2, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 41
    .line 42
    iget-object p3, p2, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 43
    .line 44
    iget-boolean p3, p3, Lcom/p1/mobile/putong/data/OMSDisplayRule;->userDimension:Z

    .line 45
    .line 46
    xor-int/lit8 p3, p3, 0x1

    .line 47
    .line 48
    invoke-virtual {p0, p1, v0, p3}, Ll/rj50;->b0(Ljava/lang/String;IZ)Z

    .line 49
    .line 50
    .line 51
    :cond_2
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_6

    .line 56
    .line 57
    iget-object p0, p2, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 58
    .line 59
    invoke-interface {p5, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_3
    iget-object p4, p2, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 64
    .line 65
    const-string v1, "webPage"

    .line 66
    .line 67
    invoke-static {p4, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result p4

    .line 71
    if-eqz p4, :cond_5

    .line 72
    .line 73
    iget-object p4, p2, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 74
    .line 75
    iget-object p4, p4, Lcom/p1/mobile/putong/data/OMSDialogContent;->web:Lcom/p1/mobile/putong/data/OMSWebDialogResource;

    .line 76
    .line 77
    iget-object p4, p4, Lcom/p1/mobile/putong/data/OMSWebDialogResource;->url:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result p4

    .line 83
    if-nez p4, :cond_6

    .line 84
    .line 85
    const-string p4, ""

    .line 86
    .line 87
    iget-object v1, p2, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 88
    .line 89
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSDialogContent;->web:Lcom/p1/mobile/putong/data/OMSWebDialogResource;

    .line 90
    .line 91
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSWebDialogResource;->url:Ljava/lang/String;

    .line 92
    .line 93
    invoke-static {p1, p4, v1}, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 94
    .line 95
    .line 96
    move-result-object p4

    .line 97
    invoke-virtual {p1, p4}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 98
    .line 99
    .line 100
    if-eqz p3, :cond_4

    .line 101
    .line 102
    iget-object p1, p2, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 103
    .line 104
    iget-object p3, p2, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 105
    .line 106
    iget-boolean p3, p3, Lcom/p1/mobile/putong/data/OMSDisplayRule;->userDimension:Z

    .line 107
    .line 108
    xor-int/lit8 p3, p3, 0x1

    .line 109
    .line 110
    invoke-virtual {p0, p1, v0, p3}, Ll/rj50;->b0(Ljava/lang/String;IZ)Z

    .line 111
    .line 112
    .line 113
    :cond_4
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    if-eqz p0, :cond_6

    .line 118
    .line 119
    iget-object p0, p2, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 120
    .line 121
    invoke-interface {p5, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_5
    iget-object p0, p2, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 126
    .line 127
    const-string p4, "webDialog"

    .line 128
    .line 129
    invoke-static {p0, p4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    if-eqz p0, :cond_6

    .line 134
    .line 135
    instance-of p0, p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 136
    .line 137
    if-eqz p0, :cond_6

    .line 138
    .line 139
    iget-object p0, p2, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 140
    .line 141
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSDialogContent;->web:Lcom/p1/mobile/putong/data/OMSWebDialogResource;

    .line 142
    .line 143
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSWebDialogResource;->url:Ljava/lang/String;

    .line 144
    .line 145
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 146
    .line 147
    .line 148
    move-result p0

    .line 149
    if-nez p0, :cond_6

    .line 150
    .line 151
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 152
    .line 153
    invoke-interface {p0}, Ll/bn5;->accessOutterToken()Lrx/c;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    invoke-interface {p1, p0}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    new-instance p4, Ll/nj50;

    .line 162
    .line 163
    invoke-direct {p4, p1, p2, p3, p5}, Ll/nj50;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/OMSDialogInfo;ZLl/y20;)V

    .line 164
    .line 165
    .line 166
    new-instance p1, Ll/oj50;

    .line 167
    .line 168
    invoke-direct {p1}, Ll/oj50;-><init>()V

    .line 169
    .line 170
    .line 171
    invoke-static {p4, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 176
    .line 177
    .line 178
    :cond_6
    :goto_0
    return-void

    .line 179
    :catch_0
    move-exception p0

    .line 180
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 181
    .line 182
    .line 183
    return-void
.end method

.method public u0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/OMSDialogInfo;ZLl/y20;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/OMSDialogInfo;",
            "Z",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p2, Lcom/p1/mobile/putong/data/OMSDialogInfo;->remote:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p2, p2, Lcom/p1/mobile/putong/data/OMSDialogInfo;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Ll/rj50;->p0(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p2, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    new-instance v0, Ll/lj50;

    .line 20
    .line 21
    invoke-direct {v0, p0, p1, p3, p4}, Ll/lj50;-><init>(Ll/rj50;Lcom/p1/mobile/android/app/Act;ZLl/y20;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/mj50;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/mj50;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    const/4 v4, 0x0

    .line 38
    move-object v0, p0

    .line 39
    move-object v1, p1

    .line 40
    move-object v2, p2

    .line 41
    move v3, p3

    .line 42
    move-object v5, p4

    .line 43
    invoke-virtual/range {v0 .. v5}, Ll/rj50;->t0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/OMSDialogInfo;ZZLl/y20;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public v0(Ljava/lang/String;J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rj50;->Q(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DialogShowInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-wide p2, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->lastShowTime:J

    .line 6
    .line 7
    iget-object p0, p0, Ll/rj50;->e:Ll/lxd0;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/lxd0;->h(Lcom/p1/mobile/putong/data/DialogShowInfo;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public w0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rj50;->d:Ll/jxd0;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final x0(Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/OMSDialogInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/rj50;->h:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto/16 :goto_2

    .line 13
    .line 14
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_4

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 29
    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_2
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->events:Ljava/util/List;

    .line 34
    .line 35
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_1

    .line 40
    .line 41
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->events:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    :cond_3
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-eqz v2, :cond_1

    .line 52
    .line 53
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    check-cast v2, Lcom/p1/mobile/putong/data/TriggerEvent;

    .line 58
    .line 59
    iget-object v3, v2, Lcom/p1/mobile/putong/data/TriggerEvent;->dsl:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-nez v3, :cond_3

    .line 66
    .line 67
    sget-object v3, Ll/uqb0;->i0:Ll/z1f;

    .line 68
    .line 69
    iget-object v4, v2, Lcom/p1/mobile/putong/data/TriggerEvent;->dsl:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v3, v4}, Ll/z1f;->c(Ljava/lang/String;)Ll/y1f;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    iget-object v4, p0, Ll/rj50;->i:Ljava/util/HashMap;

    .line 76
    .line 77
    iget-object v5, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 78
    .line 79
    iget-object v6, v2, Lcom/p1/mobile/putong/data/TriggerEvent;->eventID:Ljava/lang/String;

    .line 80
    .line 81
    iget-object v7, v2, Lcom/p1/mobile/putong/data/TriggerEvent;->properties:Lcom/p1/mobile/putong/data/TriggerProperty;

    .line 82
    .line 83
    iget-object v7, v7, Lcom/p1/mobile/putong/data/TriggerProperty;->pageID:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {p0, v5, v6, v7}, Ll/rj50;->o0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    invoke-virtual {v4, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    const-string v3, "e_swipe_after"

    .line 93
    .line 94
    iget-object v2, v2, Lcom/p1/mobile/putong/data/TriggerEvent;->eventID:Ljava/lang/String;

    .line 95
    .line 96
    invoke-static {v3, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    if-eqz v2, :cond_3

    .line 101
    .line 102
    iget-object v2, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 103
    .line 104
    const-string v3, "local"

    .line 105
    .line 106
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    if-nez v2, :cond_3

    .line 111
    .line 112
    iget-object v2, p0, Ll/rj50;->h:Ljava/util/ArrayList;

    .line 113
    .line 114
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_4
    iget-object p1, p0, Ll/rj50;->h:Ljava/util/ArrayList;

    .line 119
    .line 120
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-nez p1, :cond_5

    .line 125
    .line 126
    iget-object p1, p0, Ll/rj50;->h:Ljava/util/ArrayList;

    .line 127
    .line 128
    new-instance v0, Ll/rj50$a;

    .line 129
    .line 130
    invoke-direct {v0, p0}, Ll/rj50$a;-><init>(Ll/rj50;)V

    .line 131
    .line 132
    .line 133
    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 134
    .line 135
    .line 136
    :cond_5
    :goto_2
    return-void
.end method
