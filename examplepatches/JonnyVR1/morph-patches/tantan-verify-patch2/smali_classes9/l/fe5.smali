.class public Ll/fe5;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fe5$d;,
        Ll/fe5$e;
    }
.end annotation


# instance fields
.field public A:Lcom/p1/mobile/putong/core/data/Privilege;

.field public B:I

.field public final C:Landroid/content/DialogInterface$OnDismissListener;

.field public final D:Landroid/content/DialogInterface$OnCancelListener;

.field public final E:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public F:Ll/lib0;

.field public final G:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public H:Ljava/lang/String;

.field public I:Lorg/json/JSONArray;

.field public a:Landroid/widget/LinearLayout;

.field public b:Landroid/widget/FrameLayout;

.field public c:Landroid/widget/LinearLayout;

.field public d:Landroid/widget/LinearLayout;

.field public e:Ll/pej0;

.field public final f:Lcom/p1/mobile/android/app/Act;

.field public final g:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public h:Ljava/lang/String;

.field public i:Ll/l4g0;

.field public j:Ll/x20;

.field public k:Ll/x20;

.field public l:Z

.field public m:Ll/grl;

.field public n:Ll/frl;

.field public o:Ll/hrl;

.field public p:Ll/a30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public q:I

.field public r:Ll/kcg0;

.field public s:Ll/kcg0;

.field public t:Ll/kcg0;

.field public u:Z

.field public v:Lcom/p1/mobile/putong/data/User;

.field public w:J

.field public x:J

.field public y:J

.field public z:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/fe5;->l:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Ll/fe5;->q:I

    .line 9
    .line 10
    new-instance v0, Ll/fe5$a;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/fe5$a;-><init>(Ll/fe5;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/fe5;->C:Landroid/content/DialogInterface$OnDismissListener;

    .line 16
    .line 17
    new-instance v0, Ll/fe5$b;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/fe5$b;-><init>(Ll/fe5;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/fe5;->D:Landroid/content/DialogInterface$OnCancelListener;

    .line 23
    .line 24
    new-instance v0, Ll/ee5;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/ee5;-><init>(Ll/fe5;)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Ll/fe5;->E:Ll/y20;

    .line 30
    .line 31
    new-instance v0, Ll/td5;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/td5;-><init>(Ll/fe5;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Ll/fe5;->G:Ll/z20;

    .line 37
    .line 38
    iput-object p1, p0, Ll/fe5;->f:Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    iput-object p2, p0, Ll/fe5;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 41
    .line 42
    return-void
.end method

.method public static synthetic a(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic b(Ll/fe5;Lcom/p1/mobile/putong/core/ui/purchase/d;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fe5;->G(Lcom/p1/mobile/putong/core/ui/purchase/d;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic c(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d(Ll/fe5;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fe5;->K(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic e(Ll/fe5;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fe5;->L(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic f(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget v0, Ll/uqb0;->f0:I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-ne v0, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic g(Ll/fe5;ILjava/util/List;Lcom/p1/mobile/putong/core/ui/purchase/d;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/fe5;->H(ILjava/util/List;Lcom/p1/mobile/putong/core/ui/purchase/d;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h(ILcom/p1/mobile/putong/core/ui/purchase/d;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-lt p1, p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 36
    .line 37
    return-object p0
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;)Ljava/lang/Long;
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;->available:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic j(Ll/fe5;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fe5;->J(Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k(Ll/fe5;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fe5;->F(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/data/Coin;)Ljava/lang/Long;
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/Coin;->available:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic m(Ll/fe5;Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fe5;->I(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V

    return-void
.end method

.method public static bridge synthetic n(Ll/fe5;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fe5;->j:Ll/x20;

    return-object p0
.end method

.method public static bridge synthetic o(Ll/fe5;)Landroid/content/DialogInterface$OnCancelListener;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fe5;->D:Landroid/content/DialogInterface$OnCancelListener;

    return-object p0
.end method

.method public static bridge synthetic p(Ll/fe5;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fe5;->k:Ll/x20;

    return-object p0
.end method

.method public static bridge synthetic q(Ll/fe5;)Landroid/content/DialogInterface$OnDismissListener;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fe5;->C:Landroid/content/DialogInterface$OnDismissListener;

    return-object p0
.end method

.method public static bridge synthetic r(Ll/fe5;)Ll/l4g0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fe5;->i:Ll/l4g0;

    return-object p0
.end method

.method public static bridge synthetic s(Ll/fe5;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fe5;->S(I)V

    return-void
.end method

.method public static bridge synthetic t(Ll/fe5;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fe5;->U(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic u(Ll/fe5;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fe5;->e0()V

    return-void
.end method


# virtual methods
.method public final A()V
    .locals 4

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "ttt_vas_diamond_popupab"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string v0, "ttt_vas_coin_popupab"

    .line 15
    .line 16
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Lorg/json/JSONObject;

    .line 25
    .line 26
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const-string v0, "mcclow"

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-nez v2, :cond_1

    .line 40
    .line 41
    const-class v2, Ljava/lang/Integer;

    .line 42
    .line 43
    invoke-static {v0, v2}, Lcom/alibaba/fastjson/JSON;->parseArray(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v2, Ll/ud5;

    .line 48
    .line 49
    invoke-direct {v2}, Ll/ud5;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-static {v0, v2}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    goto :goto_1

    .line 57
    :cond_1
    const/4 v0, 0x0

    .line 58
    :goto_1
    iget v2, p0, Ll/fe5;->q:I

    .line 59
    .line 60
    const/4 v3, 0x1

    .line 61
    if-eq v2, v3, :cond_5

    .line 62
    .line 63
    const/4 v3, 0x2

    .line 64
    if-eq v2, v3, :cond_4

    .line 65
    .line 66
    const/16 v3, 0xc

    .line 67
    .line 68
    if-eq v2, v3, :cond_3

    .line 69
    .line 70
    const/16 v3, 0xe

    .line 71
    .line 72
    if-eq v2, v3, :cond_5

    .line 73
    .line 74
    const/16 v3, 0x16

    .line 75
    .line 76
    if-eq v2, v3, :cond_2

    .line 77
    .line 78
    packed-switch v2, :pswitch_data_0

    .line 79
    .line 80
    .line 81
    const/4 v1, 0x0

    .line 82
    goto :goto_2

    .line 83
    :pswitch_0
    const-string v2, "buzzMemojiMatch"

    .line 84
    .line 85
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    goto :goto_2

    .line 90
    :pswitch_1
    const-string v2, "buzzVideoMatch"

    .line 91
    .line 92
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    goto :goto_2

    .line 97
    :pswitch_2
    const-string v2, "buzzVoiceMatch"

    .line 98
    .line 99
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    goto :goto_2

    .line 104
    :pswitch_3
    const-string v2, "buzzMatch"

    .line 105
    .line 106
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    goto :goto_2

    .line 111
    :cond_2
    const-string v2, "spotlight"

    .line 112
    .line 113
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    goto :goto_2

    .line 118
    :cond_3
    const-string v2, "readreceipts"

    .line 119
    .line 120
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    goto :goto_2

    .line 125
    :cond_4
    const-string v2, "superlike"

    .line 126
    .line 127
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    goto :goto_2

    .line 132
    :cond_5
    const-string v2, "boost"

    .line 133
    .line 134
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    :goto_2
    if-eqz v1, :cond_8

    .line 139
    .line 140
    if-eqz v0, :cond_6

    .line 141
    .line 142
    const-string v2, "selectedidlow"

    .line 143
    .line 144
    goto :goto_3

    .line 145
    :cond_6
    const-string v2, "selectedid"

    .line 146
    .line 147
    :goto_3
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    iput-object v2, p0, Ll/fe5;->H:Ljava/lang/String;

    .line 152
    .line 153
    if-eqz v0, :cond_7

    .line 154
    .line 155
    const-string v0, "skuidarraylow"

    .line 156
    .line 157
    goto :goto_4

    .line 158
    :cond_7
    const-string v0, "skuidarray"

    .line 159
    .line 160
    :goto_4
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    iput-object v0, p0, Ll/fe5;->I:Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 165
    .line 166
    :catch_0
    :cond_8
    return-void

    .line 167
    :pswitch_data_0
    .packed-switch 0x1b
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final B(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/fe5;->I:Lorg/json/JSONArray;

    .line 7
    .line 8
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_3

    .line 13
    .line 14
    new-instance v1, Ljava/util/HashMap;

    .line 15
    .line 16
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 17
    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    :goto_0
    iget-object v3, p0, Ll/fe5;->I:Lorg/json/JSONArray;

    .line 21
    .line 22
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-ge v2, v3, :cond_0

    .line 27
    .line 28
    :try_start_0
    iget-object v3, p0, Ll/fe5;->I:Lorg/json/JSONArray;

    .line 29
    .line 30
    invoke-virtual {v3, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    .line 40
    .line 41
    :catch_0
    add-int/lit8 v2, v2, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    :cond_1
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-eqz v2, :cond_3

    .line 53
    .line 54
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    check-cast v2, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 59
    .line 60
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    if-eqz v3, :cond_2

    .line 65
    .line 66
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    goto :goto_2

    .line 71
    :cond_2
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    :goto_2
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 80
    .line 81
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v1, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    if-eqz v4, :cond_1

    .line 88
    .line 89
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 97
    .line 98
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 99
    .line 100
    iget-object v4, p0, Ll/fe5;->H:Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 107
    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_3
    return-object v0
.end method

.method public C()Ll/pej0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fe5;->e:Ll/pej0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final D()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object p0, p0, Ll/fe5;->f:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/jan;->M3()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance v0, Ll/ce5;

    .line 26
    .line 27
    invoke-direct {v0}, Ll/ce5;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/lqb;->a5()Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    new-instance v0, Ll/de5;

    .line 48
    .line 49
    invoke-direct {v0}, Ll/de5;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method

.method public E()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/bnl0;->w0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 v0, 0x500

    .line 6
    .line 7
    if-gt p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public final synthetic F(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fe5;->e:Ll/pej0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, -0x1

    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/fe5;->e:Ll/pej0;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/app/Dialog;->hide()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/4 v1, 0x2

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-ne v0, v1, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    const/4 v0, 0x1

    .line 41
    if-ne p1, v0, :cond_4

    .line 42
    .line 43
    iget-object p0, p0, Ll/fe5;->e:Ll/pej0;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-ne p1, v1, :cond_3

    .line 54
    .line 55
    const/4 p1, 0x0

    .line 56
    invoke-virtual {p0, p1}, Ll/fe5;->b0(Z)V

    .line 57
    .line 58
    .line 59
    :cond_3
    iget-object p0, p0, Ll/fe5;->e:Ll/pej0;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 62
    .line 63
    .line 64
    :cond_4
    return-void
.end method

.method public final synthetic G(Lcom/p1/mobile/putong/core/ui/purchase/d;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/fe5;->m:Ll/grl;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Ll/fe5;->m:Ll/grl;

    .line 10
    .line 11
    invoke-interface {p2, p1}, Ll/grl;->b(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p2, p0, Ll/fe5;->n:Ll/frl;

    .line 15
    .line 16
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eqz p2, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Ll/fe5;->n:Ll/frl;

    .line 23
    .line 24
    invoke-interface {p0, p1}, Ll/frl;->b(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public final synthetic H(ILjava/util/List;Lcom/p1/mobile/putong/core/ui/purchase/d;)Ljava/lang/Boolean;
    .locals 4

    .line 1
    invoke-virtual {p0, p3}, Ll/fe5;->z(Lcom/p1/mobile/putong/core/ui/purchase/d;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p3}, Ll/fe5;->z(Lcom/p1/mobile/putong/core/ui/purchase/d;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 22
    .line 23
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 24
    .line 25
    int-to-double v2, p1

    .line 26
    cmpl-double p1, v0, v2

    .line 27
    .line 28
    if-ltz p1, :cond_0

    .line 29
    .line 30
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_0
    invoke-virtual {p0, p3}, Ll/fe5;->z(Lcom/p1/mobile/putong/core/ui/purchase/d;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    const/4 p1, 0x1

    .line 48
    sub-int/2addr p0, p1

    .line 49
    invoke-interface {p2, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    if-ne p3, p0, :cond_1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    const/4 p1, 0x0

    .line 57
    :goto_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0
.end method

.method public final synthetic I(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->D3()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/fe5;->E:Ll/y20;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final synthetic J(Ljava/util/List;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/fe5;->f:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-interface {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->g5(Landroid/content/Context;Ljava/util/List;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic K(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fe5;->M(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/fe5;->w()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic L(Ljava/lang/Long;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Ll/fe5;->x:J

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    invoke-interface {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->dp(J)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Ll/fe5;->x(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Ll/fe5;->m:Ll/grl;

    .line 28
    .line 29
    iget-object v2, p0, Ll/fe5;->f:Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    invoke-interface {v1, v2, v0}, Ll/grl;->d(Lcom/p1/mobile/android/app/Act;Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/fe5;->n:Ll/frl;

    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 37
    .line 38
    .line 39
    move-result-wide v0

    .line 40
    invoke-interface {p0, v0, v1}, Ll/frl;->e(J)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final M(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ProductCategory;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/zry;->z(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ll/jzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/fe5;->f:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iget-object v2, p0, Ll/fe5;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    invoke-interface {v0, v1, v2, p1, p2}, Ll/jzl;->a(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget p2, p0, Ll/fe5;->q:I

    .line 14
    .line 15
    const/16 v0, 0x19

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    if-ne p2, v0, :cond_0

    .line 19
    .line 20
    move p2, v1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p2, 0x2

    .line 23
    :goto_0
    iget v0, p0, Ll/fe5;->B:I

    .line 24
    .line 25
    if-lez v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0, p1, v0}, Ll/fe5;->y(Ljava/util/List;I)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-ltz v0, :cond_2

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    iget-wide v2, p0, Ll/fe5;->y:J

    .line 35
    .line 36
    const-wide/16 v4, 0x0

    .line 37
    .line 38
    cmp-long v0, v2, v4

    .line 39
    .line 40
    if-lez v0, :cond_2

    .line 41
    .line 42
    iget-wide v4, p0, Ll/fe5;->x:J

    .line 43
    .line 44
    sub-long/2addr v2, v4

    .line 45
    long-to-float v0, v2

    .line 46
    const/high16 v2, 0x41200000    # 10.0f

    .line 47
    .line 48
    div-float/2addr v0, v2

    .line 49
    float-to-double v2, v0

    .line 50
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    .line 51
    .line 52
    .line 53
    move-result-wide v2

    .line 54
    double-to-int v0, v2

    .line 55
    new-instance v2, Ll/be5;

    .line 56
    .line 57
    invoke-direct {v2, p0, v0, p1}, Ll/be5;-><init>(Ll/fe5;ILjava/util/List;)V

    .line 58
    .line 59
    .line 60
    invoke-static {p1, v2}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-ltz v0, :cond_2

    .line 65
    .line 66
    :goto_1
    move p2, v0

    .line 67
    :cond_2
    iget v0, p0, Ll/fe5;->q:I

    .line 68
    .line 69
    invoke-static {v0}, Ll/rd5;->g(I)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_3

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/fe5;->A()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0, p1}, Ll/fe5;->B(Ljava/util/List;)Ljava/util/List;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {p0, p1}, Ll/fe5;->f0(Ljava/util/List;)V

    .line 83
    .line 84
    .line 85
    iget-object p2, p0, Ll/fe5;->o:Ll/hrl;

    .line 86
    .line 87
    iget-object v0, p0, Ll/fe5;->G:Ll/z20;

    .line 88
    .line 89
    iget-object p0, p0, Ll/fe5;->E:Ll/y20;

    .line 90
    .line 91
    invoke-interface {p2, p1, v0, p0}, Ll/hrl;->b(Ljava/util/List;Ll/z20;Ll/y20;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_3
    const/4 v0, 0x0

    .line 96
    move v2, v0

    .line 97
    :goto_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    if-ge v2, v3, :cond_5

    .line 102
    .line 103
    if-ne v2, p2, :cond_4

    .line 104
    .line 105
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    check-cast v3, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 110
    .line 111
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 112
    .line 113
    .line 114
    goto :goto_3

    .line 115
    :cond_4
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    check-cast v3, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 120
    .line 121
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 122
    .line 123
    .line 124
    :goto_3
    add-int/lit8 v2, v2, 0x1

    .line 125
    .line 126
    goto :goto_2

    .line 127
    :cond_5
    invoke-virtual {p0, p1}, Ll/fe5;->f0(Ljava/util/List;)V

    .line 128
    .line 129
    .line 130
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result p2

    .line 134
    if-eqz p2, :cond_6

    .line 135
    .line 136
    iget-object p2, p0, Ll/fe5;->o:Ll/hrl;

    .line 137
    .line 138
    iget-object v0, p0, Ll/fe5;->G:Ll/z20;

    .line 139
    .line 140
    iget-object p0, p0, Ll/fe5;->E:Ll/y20;

    .line 141
    .line 142
    invoke-interface {p2, p1, v0, p0}, Ll/hrl;->b(Ljava/util/List;Ll/z20;Ll/y20;)V

    .line 143
    .line 144
    .line 145
    :cond_6
    return-void
.end method

.method public final N()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fe5;->P()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/fe5;->R()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/fe5;->O()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final O()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/fe5;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget v1, p0, Ll/fe5;->q:I

    .line 4
    .line 5
    iget-object v2, p0, Ll/fe5;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, Ll/rd5;->b(Lcom/p1/mobile/android/app/Act;ILcom/p1/mobile/putong/core/data/PurchaseType;)Ll/frl;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/fe5;->n:Ll/frl;

    .line 12
    .line 13
    iget-object v1, p0, Ll/fe5;->d:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    iget-boolean v2, p0, Ll/fe5;->u:Z

    .line 16
    .line 17
    invoke-interface {v0, v1, v2}, Ll/frl;->a(Landroid/view/ViewGroup;Z)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_4

    .line 26
    .line 27
    iget-object v1, p0, Ll/fe5;->n:Ll/frl;

    .line 28
    .line 29
    iget-object v2, p0, Ll/fe5;->E:Ll/y20;

    .line 30
    .line 31
    iget-object v3, p0, Ll/fe5;->j:Ll/x20;

    .line 32
    .line 33
    invoke-interface {v1, v2, v3}, Ll/frl;->d(Ll/y20;Ll/x20;)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Ll/fe5;->n:Ll/frl;

    .line 37
    .line 38
    iget-object v2, p0, Ll/fe5;->h:Ljava/lang/String;

    .line 39
    .line 40
    invoke-interface {v1, v2}, Ll/frl;->c(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 44
    .line 45
    const/4 v2, -0x1

    .line 46
    const/4 v3, -0x2

    .line 47
    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 48
    .line 49
    .line 50
    iget-object v2, p0, Ll/fe5;->n:Ll/frl;

    .line 51
    .line 52
    instance-of v3, v2, Ll/nd5;

    .line 53
    .line 54
    if-eqz v3, :cond_0

    .line 55
    .line 56
    check-cast v2, Ll/nd5;

    .line 57
    .line 58
    iget-object v3, p0, Ll/fe5;->p:Ll/a30;

    .line 59
    .line 60
    invoke-virtual {v2, v3}, Ll/nd5;->F(Ll/a30;)V

    .line 61
    .line 62
    .line 63
    iget-object v2, p0, Ll/fe5;->n:Ll/frl;

    .line 64
    .line 65
    check-cast v2, Ll/nd5;

    .line 66
    .line 67
    iget-object v3, p0, Ll/fe5;->F:Ll/lib0;

    .line 68
    .line 69
    invoke-virtual {v2, v3}, Ll/nd5;->G(Ll/lib0;)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_0
    instance-of v3, v2, Ll/doo;

    .line 74
    .line 75
    if-eqz v3, :cond_1

    .line 76
    .line 77
    check-cast v2, Ll/doo;

    .line 78
    .line 79
    iget-object v3, p0, Ll/fe5;->p:Ll/a30;

    .line 80
    .line 81
    invoke-virtual {v2, v3}, Ll/doo;->t(Ll/a30;)V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    instance-of v3, v2, Ll/mgj;

    .line 86
    .line 87
    if-eqz v3, :cond_2

    .line 88
    .line 89
    check-cast v2, Ll/mgj;

    .line 90
    .line 91
    iget-object v3, p0, Ll/fe5;->p:Ll/a30;

    .line 92
    .line 93
    invoke-virtual {v2, v3}, Ll/mgj;->p(Ll/a30;)V

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_2
    instance-of v3, v2, Ll/shn;

    .line 98
    .line 99
    if-eqz v3, :cond_3

    .line 100
    .line 101
    check-cast v2, Ll/shn;

    .line 102
    .line 103
    iget-object v3, p0, Ll/fe5;->p:Ll/a30;

    .line 104
    .line 105
    invoke-virtual {v2, v3}, Ll/shn;->p(Ll/a30;)V

    .line 106
    .line 107
    .line 108
    :cond_3
    :goto_0
    iget-object p0, p0, Ll/fe5;->d:Landroid/widget/LinearLayout;

    .line 109
    .line 110
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 111
    .line 112
    .line 113
    :cond_4
    return-void
.end method

.method public final P()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/fe5;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget v1, p0, Ll/fe5;->q:I

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/rd5;->c(Lcom/p1/mobile/android/app/Act;I)Ll/grl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/fe5;->m:Ll/grl;

    .line 10
    .line 11
    iget-object v1, p0, Ll/fe5;->f:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iget-object v2, p0, Ll/fe5;->b:Landroid/widget/FrameLayout;

    .line 14
    .line 15
    invoke-interface {v0, v1, v2}, Ll/grl;->a(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    iget-object v1, p0, Ll/fe5;->m:Ll/grl;

    .line 26
    .line 27
    instance-of v2, v1, Ll/pd5;

    .line 28
    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    check-cast v1, Ll/pd5;

    .line 32
    .line 33
    iget v2, p0, Ll/fe5;->z:I

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ll/pd5;->h(I)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object v1, p0, Ll/fe5;->m:Ll/grl;

    .line 39
    .line 40
    instance-of v2, v1, Ll/goo;

    .line 41
    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    check-cast v1, Ll/goo;

    .line 45
    .line 46
    iget-object v2, p0, Ll/fe5;->E:Ll/y20;

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Ll/goo;->i(Ll/y20;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Ll/fe5;->m:Ll/grl;

    .line 52
    .line 53
    check-cast v1, Ll/goo;

    .line 54
    .line 55
    iget-object v2, p0, Ll/fe5;->A:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 56
    .line 57
    iput-object v2, v1, Ll/goo;->m:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 58
    .line 59
    :cond_1
    iget-object v1, p0, Ll/fe5;->m:Ll/grl;

    .line 60
    .line 61
    iget-object v2, p0, Ll/fe5;->f:Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    iget-object v3, p0, Ll/fe5;->v:Lcom/p1/mobile/putong/data/User;

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/fe5;->E()Z

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    invoke-interface {v1, v2, v3, v4}, Ll/grl;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V

    .line 70
    .line 71
    .line 72
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 73
    .line 74
    const/4 v2, -0x1

    .line 75
    const/4 v3, -0x2

    .line 76
    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Ll/fe5;->b:Landroid/widget/FrameLayout;

    .line 80
    .line 81
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 82
    .line 83
    .line 84
    :cond_2
    return-void
.end method

.method public final Q()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Vd()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget v0, p0, Ll/fe5;->q:I

    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    if-eq v0, v1, :cond_0

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    if-eq v0, v1, :cond_0

    .line 20
    .line 21
    const/16 v1, 0xe

    .line 22
    .line 23
    if-ne v0, v1, :cond_1

    .line 24
    .line 25
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 28
    .line 29
    const-string v1, "ultraPremium"

    .line 30
    .line 31
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/sd5;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/sd5;-><init>(Ll/fe5;)V

    .line 46
    .line 47
    .line 48
    new-instance v2, Ll/wd5;

    .line 49
    .line 50
    invoke-direct {v2}, Ll/wd5;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iput-object v0, p0, Ll/fe5;->t:Ll/kcg0;

    .line 62
    .line 63
    :cond_1
    iget-object v0, p0, Ll/fe5;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 70
    .line 71
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 72
    .line 73
    const/4 v2, 0x0

    .line 74
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->z5(Lcom/p1/mobile/putong/core/data/ProductCategory;Z)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    new-instance v2, Ll/xd5;

    .line 79
    .line 80
    invoke-direct {v2}, Ll/xd5;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    new-instance v2, Ll/yd5;

    .line 88
    .line 89
    invoke-direct {v2, p0}, Ll/yd5;-><init>(Ll/fe5;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    new-instance v2, Ll/zd5;

    .line 105
    .line 106
    invoke-direct {v2, p0, v0}, Ll/zd5;-><init>(Ll/fe5;Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 107
    .line 108
    .line 109
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {v1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iput-object v0, p0, Ll/fe5;->r:Ll/kcg0;

    .line 118
    .line 119
    invoke-virtual {p0}, Ll/fe5;->D()Lrx/c;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    new-instance v1, Ll/ae5;

    .line 128
    .line 129
    invoke-direct {v1, p0}, Ll/ae5;-><init>(Ll/fe5;)V

    .line 130
    .line 131
    .line 132
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    iput-object v0, p0, Ll/fe5;->s:Ll/kcg0;

    .line 141
    .line 142
    sget-object v0, Ll/i9b0;->INSTANCE:Ll/i9b0;

    .line 143
    .line 144
    iget-object p0, p0, Ll/fe5;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 145
    .line 146
    invoke-virtual {v0, p0}, Ll/i9b0;->a(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public final R()V
    .locals 4

    .line 1
    iget v0, p0, Ll/fe5;->q:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/rd5;->g(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/fe5;->f:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/fe5;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 12
    .line 13
    invoke-static {v1, v0}, Ll/rd5;->d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/hrl;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/fe5;->o:Ll/hrl;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget v0, p0, Ll/fe5;->q:I

    .line 21
    .line 22
    invoke-static {v1, v0}, Ll/rd5;->f(Lcom/p1/mobile/android/app/Act;I)Ll/hrl;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/fe5;->o:Ll/hrl;

    .line 27
    .line 28
    :goto_0
    iget-object v0, p0, Ll/fe5;->o:Ll/hrl;

    .line 29
    .line 30
    iget-object v1, p0, Ll/fe5;->c:Landroid/widget/LinearLayout;

    .line 31
    .line 32
    iget-boolean v2, p0, Ll/fe5;->u:Z

    .line 33
    .line 34
    invoke-interface {v0, v1, v2}, Ll/hrl;->a(Landroid/view/ViewGroup;Z)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 45
    .line 46
    const/4 v2, -0x1

    .line 47
    const/4 v3, -0x2

    .line 48
    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Ll/fe5;->c:Landroid/widget/LinearLayout;

    .line 52
    .line 53
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public final S(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/fe5;->B:I

    .line 2
    .line 3
    return-void
.end method

.method public T(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/fe5;->q:I

    .line 2
    .line 3
    return-void
.end method

.method public final U(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fe5;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public V(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/fe5;->w:J

    .line 2
    .line 3
    return-void
.end method

.method public W(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fe5;->j:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public X(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fe5;->k:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public Y(Ll/a30;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/fe5;->p:Ll/a30;

    .line 2
    .line 3
    return-void
.end method

.method public Z(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/fe5;->z:I

    .line 2
    .line 3
    return-void
.end method

.method public a0(Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fe5;->A:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    return-void
.end method

.method public b0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/fe5;->l:Z

    .line 2
    .line 3
    return-void
.end method

.method public c0(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/fe5;->y:J

    .line 2
    .line 3
    return-void
.end method

.method public d0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fe5;->v:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-void
.end method

.method public final e0()V
    .locals 3

    .line 1
    new-instance v0, Ll/pej0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/fe5;->f:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    sget v2, Ll/dgc0;->g:I

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/fe5;->e:Ll/pej0;

    .line 11
    .line 12
    sget-object v1, Ll/g6e;->c:Lcom/p1/mobile/android/app/Dialog$f;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/pej0;->u(Lcom/p1/mobile/android/app/Dialog$f;)V

    .line 15
    .line 16
    .line 17
    sget v0, Ll/rec0;->e3:I

    .line 18
    .line 19
    iget-object v1, p0, Ll/fe5;->f:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-virtual {v1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0, v0}, Ll/fe5;->v(Landroid/view/View;)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Ll/fe5;->e:Ll/pej0;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 36
    .line 37
    .line 38
    new-instance v0, Ll/fe5$d;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Ll/fe5$d;-><init>(Ll/fe5;)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Ll/fe5;->e:Ll/pej0;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ll/fe5;->e:Ll/pej0;

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ll/fe5;->E()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iput-boolean v0, p0, Ll/fe5;->u:Z

    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const-string v1, "p_purchase_page"

    .line 68
    .line 69
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iput-object v0, p0, Ll/fe5;->i:Ll/l4g0;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/fe5;->N()V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/fe5;->e:Ll/pej0;

    .line 79
    .line 80
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Ll/fe5;->Q()V

    .line 84
    .line 85
    .line 86
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    if-eqz p0, :cond_0

    .line 95
    .line 96
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 97
    .line 98
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 99
    .line 100
    invoke-virtual {p0}, Ll/jan;->N3()Lrx/c;

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 107
    .line 108
    invoke-virtual {p0}, Ll/lqb;->k5()Lrx/c;

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public final f0(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/mib0;->j(Ljava/util/List;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, ","

    .line 6
    .line 7
    invoke-static {p1, v0}, Ll/jyb;->U(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Lorg/json/JSONObject;

    .line 12
    .line 13
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 14
    .line 15
    .line 16
    :try_start_0
    const-string v1, "purchaseShowFrom"

    .line 17
    .line 18
    iget-object v2, p0, Ll/fe5;->h:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v2}, Ll/abb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 25
    .line 26
    .line 27
    const-string v1, "exchange_type"

    .line 28
    .line 29
    iget v2, p0, Ll/fe5;->q:I

    .line 30
    .line 31
    invoke-static {v2}, Ll/a5i0;->n0(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 36
    .line 37
    .line 38
    const-string v1, "productType"

    .line 39
    .line 40
    iget-object v2, p0, Ll/fe5;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 41
    .line 42
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 51
    .line 52
    .line 53
    const-string v1, "skuGroup"

    .line 54
    .line 55
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 56
    .line 57
    .line 58
    const-string p1, "function_type"

    .line 59
    .line 60
    iget v1, p0, Ll/fe5;->q:I

    .line 61
    .line 62
    invoke-static {v1}, Ll/a5i0;->o0(I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 67
    .line 68
    .line 69
    const-string p1, "tooltips_trigger_mode"

    .line 70
    .line 71
    const-string v1, "active"

    .line 72
    .line 73
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 74
    .line 75
    .line 76
    const-string p1, "tooltips_type_ui"

    .line 77
    .line 78
    const-string v1, "alert_self_definition_business_a"

    .line 79
    .line 80
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 81
    .line 82
    .line 83
    const-string p1, "tooltips_trigger_module"

    .line 84
    .line 85
    const-string v1, "purchase_button"

    .line 86
    .line 87
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 88
    .line 89
    .line 90
    const-string p1, "tooltips_trigger_page"

    .line 91
    .line 92
    const-string v1, "anywhere"

    .line 93
    .line 94
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 95
    .line 96
    .line 97
    const-string p1, "tooltips_type"

    .line 98
    .line 99
    const-string v1, "alert"

    .line 100
    .line 101
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 102
    .line 103
    .line 104
    const-string p1, "tooltips_trigger_reason"

    .line 105
    .line 106
    const-string v1, "purchase"

    .line 107
    .line 108
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 109
    .line 110
    .line 111
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->U()Z

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    if-eqz p1, :cond_0

    .line 124
    .line 125
    const-string p1, "no_secret_payment"

    .line 126
    .line 127
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 128
    .line 129
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 130
    .line 131
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->E3()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 136
    .line 137
    .line 138
    const-string p1, "user_secret_staus"

    .line 139
    .line 140
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 141
    .line 142
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 143
    .line 144
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->D3()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 149
    .line 150
    .line 151
    :catch_0
    :cond_0
    iget-object p1, p0, Ll/fe5;->i:Ll/l4g0;

    .line 152
    .line 153
    invoke-virtual {p1, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 154
    .line 155
    .line 156
    iget-object p0, p0, Ll/fe5;->i:Ll/l4g0;

    .line 157
    .line 158
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method public g0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fe5;->t:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/fe5;->t:Ll/kcg0;

    .line 11
    .line 12
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/fe5;->t:Ll/kcg0;

    .line 19
    .line 20
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Ll/fe5;->t:Ll/kcg0;

    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Ll/fe5;->r:Ll/kcg0;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Ll/fe5;->r:Ll/kcg0;

    .line 34
    .line 35
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Ll/fe5;->r:Ll/kcg0;

    .line 42
    .line 43
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 44
    .line 45
    .line 46
    iput-object v1, p0, Ll/fe5;->r:Ll/kcg0;

    .line 47
    .line 48
    :cond_1
    iget-object v0, p0, Ll/fe5;->s:Ll/kcg0;

    .line 49
    .line 50
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    iget-object v0, p0, Ll/fe5;->s:Ll/kcg0;

    .line 57
    .line 58
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-nez v0, :cond_2

    .line 63
    .line 64
    iget-object v0, p0, Ll/fe5;->s:Ll/kcg0;

    .line 65
    .line 66
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 67
    .line 68
    .line 69
    iput-object v1, p0, Ll/fe5;->s:Ll/kcg0;

    .line 70
    .line 71
    :cond_2
    iget-object v0, p0, Ll/fe5;->o:Ll/hrl;

    .line 72
    .line 73
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_3

    .line 78
    .line 79
    iget-object p0, p0, Ll/fe5;->o:Ll/hrl;

    .line 80
    .line 81
    invoke-interface {p0}, Ll/hrl;->release()V

    .line 82
    .line 83
    .line 84
    :cond_3
    return-void
.end method

.method public final v(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ge5;->a(Ll/fe5;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final w()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fe5;->e:Ll/pej0;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    const v1, 0x1020002

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Ll/fdc0;->y:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Landroid/widget/FrameLayout;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/4 v1, 0x3

    .line 33
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Ll/fe5;->a:Landroid/widget/LinearLayout;

    .line 37
    .line 38
    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    new-instance v2, Ll/fe5$c;

    .line 43
    .line 44
    invoke-direct {v2, p0, v0}, Ll/fe5$c;-><init>(Ll/fe5;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method public final x(Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fe5;->m:Ll/grl;

    .line 2
    .line 3
    instance-of v0, v0, Ll/goo;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p1, " "

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/fe5;->f:Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    invoke-static {}, Ll/l9n;->e()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :cond_0
    iget-object v0, p0, Ll/fe5;->f:Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    invoke-static {}, Ll/l9n;->d()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    filled-new-array {p1}, [Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget-object p0, p0, Ll/fe5;->f:Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    sget v1, Ll/h9c0;->f:I

    .line 63
    .line 64
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    const/4 v1, 0x3

    .line 69
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-static {v0, p1, p0, v1}, Ll/z7a;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0
.end method

.method public final y(Ljava/util/List;I)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;I)I"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/vd5;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/vd5;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public z(Lcom/p1/mobile/putong/core/ui/purchase/d;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return-object p0
.end method
