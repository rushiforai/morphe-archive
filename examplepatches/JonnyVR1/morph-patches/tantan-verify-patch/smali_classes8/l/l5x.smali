.class public Ll/l5x;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;",
            ">;"
        }
    .end annotation
.end field

.field public static b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static c:Ljava/lang/String;

.field public static d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static e:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->values()[Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/k5x;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/k5x;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sput-object v0, Ll/l5x;->a:Ljava/util/ArrayList;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    sput-object v0, Ll/l5x;->b:Ljava/util/List;

    .line 22
    .line 23
    const-string v1, "cm"

    .line 24
    .line 25
    sput-object v1, Ll/l5x;->c:Ljava/lang/String;

    .line 26
    .line 27
    sput-object v0, Ll/l5x;->d:Ljava/util/List;

    .line 28
    .line 29
    const-string v0, "kg"

    .line 30
    .line 31
    sput-object v0, Ll/l5x;->e:Ljava/lang/String;

    .line 32
    .line 33
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

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->isRequired()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->getFragClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static b(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 5

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->address:Ljava/util/List;

    .line 18
    .line 19
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/4 v2, 0x0

    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->address:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-lez v1, :cond_1

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 41
    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 43
    .line 44
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->address:Ljava/util/List;

    .line 47
    .line 48
    const/4 v3, 0x0

    .line 49
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Ljava/lang/String;

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    move-object v1, v2

    .line 57
    :goto_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    if-nez v3, :cond_2

    .line 62
    .line 63
    const-string v3, "\u4e2d\u56fd"

    .line 64
    .line 65
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-nez v3, :cond_2

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 75
    .line 76
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 77
    .line 78
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 79
    .line 80
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->address:Ljava/util/List;

    .line 81
    .line 82
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-nez v1, :cond_3

    .line 87
    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 89
    .line 90
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 91
    .line 92
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 93
    .line 94
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->address:Ljava/util/List;

    .line 95
    .line 96
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    const/4 v3, 0x1

    .line 101
    if-le v1, v3, :cond_3

    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 104
    .line 105
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 106
    .line 107
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 108
    .line 109
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->address:Ljava/util/List;

    .line 110
    .line 111
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    check-cast v1, Ljava/lang/String;

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_3
    move-object v1, v2

    .line 119
    :goto_1
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 120
    .line 121
    .line 122
    move-result v3

    .line 123
    const-string v4, "\u00b7"

    .line 124
    .line 125
    if-nez v3, :cond_5

    .line 126
    .line 127
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    if-nez v3, :cond_4

    .line 136
    .line 137
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    :cond_4
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 144
    .line 145
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 146
    .line 147
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 148
    .line 149
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->address:Ljava/util/List;

    .line 150
    .line 151
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    if-nez v1, :cond_6

    .line 156
    .line 157
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 158
    .line 159
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 160
    .line 161
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 162
    .line 163
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->address:Ljava/util/List;

    .line 164
    .line 165
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    const/4 v3, 0x2

    .line 170
    if-le v1, v3, :cond_6

    .line 171
    .line 172
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 173
    .line 174
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 175
    .line 176
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 177
    .line 178
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->address:Ljava/util/List;

    .line 179
    .line 180
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    move-object v2, p0

    .line 185
    check-cast v2, Ljava/lang/String;

    .line 186
    .line 187
    :cond_6
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 188
    .line 189
    .line 190
    move-result p0

    .line 191
    if-nez p0, :cond_7

    .line 192
    .line 193
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    :cond_7
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    return-object p0
.end method

.method public static c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    sget-object v1, Ll/l5x$a;->a:[I

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    aget v1, v1, v2

    .line 12
    .line 13
    const-string v2, "\u6682\u4e0d\u900f\u9732"

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    packed-switch v1, :pswitch_data_0

    .line 17
    .line 18
    .line 19
    :pswitch_0
    return-object v0

    .line 20
    :pswitch_1
    invoke-static {p1}, Ll/l5x;->s(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :pswitch_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->lifeMoment:Ljava/util/List;

    .line 32
    .line 33
    invoke-static {p0}, Ll/l5x;->f(Ljava/util/List;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :pswitch_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateHeight:Ljava/util/List;

    .line 45
    .line 46
    invoke-static {p0}, Ll/l5x;->o(Ljava/util/List;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :pswitch_4
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 52
    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 56
    .line 57
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateAge:Ljava/util/List;

    .line 58
    .line 59
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->MATE_AGE_EDIT:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 60
    .line 61
    if-ne p0, v0, :cond_1

    .line 62
    .line 63
    const/4 v3, 0x1

    .line 64
    :cond_1
    invoke-static {p1, v3}, Ll/l5x;->m(Ljava/util/List;Z)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0

    .line 69
    :pswitch_5
    invoke-static {p1}, Ll/l5x;->b(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0

    .line 74
    :pswitch_6
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 83
    .line 84
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Ym(Lcom/p1/mobile/putong/data/Profile;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    return-object p0

    .line 89
    :pswitch_7
    sget-object p0, Ll/pzi0;->b:Ljava/text/SimpleDateFormat;

    .line 90
    .line 91
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 92
    .line 93
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    return-object p0

    .line 100
    :pswitch_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 101
    .line 102
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Physical;->weight:Ljava/util/List;

    .line 107
    .line 108
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    if-nez p0, :cond_3

    .line 113
    .line 114
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 115
    .line 116
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 117
    .line 118
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 119
    .line 120
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Physical;->weight:Ljava/util/List;

    .line 121
    .line 122
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    check-cast p0, Ljava/lang/CharSequence;

    .line 127
    .line 128
    invoke-static {v2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 129
    .line 130
    .line 131
    move-result p0

    .line 132
    if-eqz p0, :cond_2

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 136
    .line 137
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 140
    .line 141
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Physical;->weight:Ljava/util/List;

    .line 142
    .line 143
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    const-string p1, "%skg"

    .line 152
    .line 153
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    return-object p0

    .line 158
    :cond_3
    :goto_0
    return-object v0

    .line 159
    :pswitch_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 160
    .line 161
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 162
    .line 163
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 164
    .line 165
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Physical;->height:Ljava/util/List;

    .line 166
    .line 167
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 168
    .line 169
    .line 170
    move-result p0

    .line 171
    if-nez p0, :cond_5

    .line 172
    .line 173
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 174
    .line 175
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 176
    .line 177
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 178
    .line 179
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Physical;->height:Ljava/util/List;

    .line 180
    .line 181
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    check-cast p0, Ljava/lang/CharSequence;

    .line 186
    .line 187
    invoke-static {v2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 188
    .line 189
    .line 190
    move-result p0

    .line 191
    if-eqz p0, :cond_4

    .line 192
    .line 193
    goto :goto_1

    .line 194
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 195
    .line 196
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 197
    .line 198
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 199
    .line 200
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Physical;->height:Ljava/util/List;

    .line 201
    .line 202
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    move-result-object p0

    .line 210
    const-string p1, "%scm"

    .line 211
    .line 212
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    return-object p0

    .line 217
    :cond_5
    :goto_1
    return-object v0

    .line 218
    :pswitch_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 219
    .line 220
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 221
    .line 222
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 223
    .line 224
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateDescription:Ljava/util/List;

    .line 225
    .line 226
    invoke-static {p0}, Ll/l5x;->f(Ljava/util/List;)Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    return-object p0

    .line 231
    :pswitch_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 232
    .line 233
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 234
    .line 235
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 236
    .line 237
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->prologue:Ljava/util/List;

    .line 238
    .line 239
    invoke-static {p0}, Ll/l5x;->f(Ljava/util/List;)Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object p0

    .line 243
    return-object p0

    .line 244
    :pswitch_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 245
    .line 246
    return-object p0

    .line 247
    :pswitch_d
    invoke-static {p1}, Ll/l5x;->k(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object p0

    .line 251
    return-object p0

    .line 252
    :pswitch_e
    invoke-static {p1}, Ll/l5x;->t(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object p0

    .line 256
    return-object p0

    .line 257
    :pswitch_f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 258
    .line 259
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 260
    .line 261
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 262
    .line 263
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->bridePrice:Ljava/util/List;

    .line 264
    .line 265
    invoke-static {p0}, Ll/l5x;->f(Ljava/util/List;)Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object p0

    .line 269
    return-object p0

    .line 270
    :pswitch_10
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 271
    .line 272
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 273
    .line 274
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 275
    .line 276
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->familyBackground:Ljava/util/List;

    .line 277
    .line 278
    invoke-static {p0}, Ll/l5x;->f(Ljava/util/List;)Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object p0

    .line 282
    return-object p0

    .line 283
    :pswitch_11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 284
    .line 285
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 286
    .line 287
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 288
    .line 289
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->declaration:Ljava/util/List;

    .line 290
    .line 291
    invoke-static {p0}, Ll/l5x;->f(Ljava/util/List;)Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object p0

    .line 295
    return-object p0

    .line 296
    :pswitch_12
    invoke-static {p0}, Ll/l5x;->d(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ljava/util/List;

    .line 297
    .line 298
    .line 299
    move-result-object p0

    .line 300
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 301
    .line 302
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 303
    .line 304
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 305
    .line 306
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateAddress:Ljava/util/List;

    .line 307
    .line 308
    invoke-static {p0, p1}, Ll/l5x;->r(Ljava/util/List;Ljava/util/List;)Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object p0

    .line 312
    return-object p0

    .line 313
    :pswitch_13
    invoke-static {p0}, Ll/l5x;->d(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ljava/util/List;

    .line 314
    .line 315
    .line 316
    move-result-object p0

    .line 317
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 318
    .line 319
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 320
    .line 321
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 322
    .line 323
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateIncome:Ljava/util/List;

    .line 324
    .line 325
    invoke-static {p0, p1}, Ll/l5x;->r(Ljava/util/List;Ljava/util/List;)Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object p0

    .line 329
    return-object p0

    .line 330
    :pswitch_14
    invoke-static {p0}, Ll/l5x;->d(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ljava/util/List;

    .line 331
    .line 332
    .line 333
    move-result-object p0

    .line 334
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 335
    .line 336
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 337
    .line 338
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 339
    .line 340
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateQualification:Ljava/util/List;

    .line 341
    .line 342
    invoke-static {p0, p1}, Ll/l5x;->r(Ljava/util/List;Ljava/util/List;)Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object p0

    .line 346
    return-object p0

    .line 347
    :pswitch_15
    invoke-static {p0}, Ll/l5x;->d(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ljava/util/List;

    .line 348
    .line 349
    .line 350
    move-result-object p0

    .line 351
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 352
    .line 353
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 354
    .line 355
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 356
    .line 357
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserWealth;->monthlyCost:Ljava/util/List;

    .line 358
    .line 359
    invoke-static {p0, p1}, Ll/l5x;->r(Ljava/util/List;Ljava/util/List;)Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object p0

    .line 363
    return-object p0

    .line 364
    :pswitch_16
    invoke-static {p0}, Ll/l5x;->d(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ljava/util/List;

    .line 365
    .line 366
    .line 367
    move-result-object p0

    .line 368
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 369
    .line 370
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 371
    .line 372
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 373
    .line 374
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateStatus:Ljava/util/List;

    .line 375
    .line 376
    invoke-static {p0, p1}, Ll/l5x;->r(Ljava/util/List;Ljava/util/List;)Ljava/lang/String;

    .line 377
    .line 378
    .line 379
    move-result-object p0

    .line 380
    return-object p0

    .line 381
    :pswitch_17
    invoke-static {p0}, Ll/l5x;->d(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ljava/util/List;

    .line 382
    .line 383
    .line 384
    move-result-object p0

    .line 385
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 386
    .line 387
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 388
    .line 389
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 390
    .line 391
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->babyWilling:Ljava/util/List;

    .line 392
    .line 393
    invoke-static {p0, p1}, Ll/l5x;->r(Ljava/util/List;Ljava/util/List;)Ljava/lang/String;

    .line 394
    .line 395
    .line 396
    move-result-object p0

    .line 397
    return-object p0

    .line 398
    :pswitch_18
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 399
    .line 400
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 401
    .line 402
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 403
    .line 404
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserWealth;->upperIncome:Ljava/util/List;

    .line 405
    .line 406
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserWealth;->lowIncome:Ljava/util/List;

    .line 407
    .line 408
    invoke-static {p1, p0}, Ll/l5x;->l(Ljava/util/List;Ljava/util/List;)Ljava/lang/String;

    .line 409
    .line 410
    .line 411
    move-result-object p0

    .line 412
    return-object p0

    .line 413
    :pswitch_19
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 414
    .line 415
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 416
    .line 417
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 418
    .line 419
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->qualification:Ljava/util/List;

    .line 420
    .line 421
    invoke-static {p0}, Ll/l5x;->f(Ljava/util/List;)Ljava/lang/String;

    .line 422
    .line 423
    .line 424
    move-result-object p0

    .line 425
    return-object p0

    .line 426
    :pswitch_1a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 427
    .line 428
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 429
    .line 430
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 431
    .line 432
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserWealth;->car:Ljava/util/List;

    .line 433
    .line 434
    invoke-static {p0}, Ll/l5x;->f(Ljava/util/List;)Ljava/lang/String;

    .line 435
    .line 436
    .line 437
    move-result-object p0

    .line 438
    return-object p0

    .line 439
    :pswitch_1b
    invoke-static {p0}, Ll/l5x;->d(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ljava/util/List;

    .line 440
    .line 441
    .line 442
    move-result-object p0

    .line 443
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 444
    .line 445
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 446
    .line 447
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 448
    .line 449
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->expectedTime:Ljava/util/List;

    .line 450
    .line 451
    invoke-static {p0, p1}, Ll/l5x;->r(Ljava/util/List;Ljava/util/List;)Ljava/lang/String;

    .line 452
    .line 453
    .line 454
    move-result-object p0

    .line 455
    return-object p0

    .line 456
    :pswitch_1c
    invoke-static {p0}, Ll/l5x;->d(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ljava/util/List;

    .line 457
    .line 458
    .line 459
    move-result-object p0

    .line 460
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 461
    .line 462
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 463
    .line 464
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 465
    .line 466
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->status:Ljava/util/List;

    .line 467
    .line 468
    invoke-static {p0, p1}, Ll/l5x;->r(Ljava/util/List;Ljava/util/List;)Ljava/lang/String;

    .line 469
    .line 470
    .line 471
    move-result-object p0

    .line 472
    return-object p0

    .line 473
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_0
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static d(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;",
            ")",
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/l5x$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const-string v0, "unlimited"

    .line 10
    .line 11
    const-string v1, "\u4e0d\u9650"

    .line 12
    .line 13
    packed-switch p0, :pswitch_data_0

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return-object p0

    .line 18
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Ll/l5x;->g(Lcom/p1/mobile/putong/data/User;)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :pswitch_1
    const-string p0, "\u53ef\u63a5\u53d7\u5f02\u5730"

    .line 32
    .line 33
    const-string v0, "different_city"

    .line 34
    .line 35
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string v0, "\u4e0d\u63a5\u53d7\u5f02\u5730"

    .line 40
    .line 41
    const-string v1, "same_city"

    .line 42
    .line 43
    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    filled-new-array {p0, v0}, [Landroid/util/Pair;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0

    .line 56
    :pswitch_2
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const-string p0, "5\u4e07\u4ee5\u4e0b"

    .line 61
    .line 62
    const-string v1, "5w"

    .line 63
    .line 64
    invoke-static {p0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    const-string p0, "5-10\u4e07"

    .line 69
    .line 70
    const-string v2, "5-10w"

    .line 71
    .line 72
    invoke-static {p0, v2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    const-string p0, "10-20\u4e07"

    .line 77
    .line 78
    const-string v3, "10-20w"

    .line 79
    .line 80
    invoke-static {p0, v3}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    const-string p0, "20-30\u4e07"

    .line 85
    .line 86
    const-string v4, "20-30w"

    .line 87
    .line 88
    invoke-static {p0, v4}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    const-string p0, "30-60\u4e07"

    .line 93
    .line 94
    const-string v5, "30-60w"

    .line 95
    .line 96
    invoke-static {p0, v5}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    const-string p0, "60-100\u4e07"

    .line 101
    .line 102
    const-string v6, "60-100w"

    .line 103
    .line 104
    invoke-static {p0, v6}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 105
    .line 106
    .line 107
    move-result-object v6

    .line 108
    const-string p0, "100\u4e07\u4ee5\u4e0a"

    .line 109
    .line 110
    const-string v7, "100w"

    .line 111
    .line 112
    invoke-static {p0, v7}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 113
    .line 114
    .line 115
    move-result-object v7

    .line 116
    filled-new-array/range {v0 .. v7}, [Landroid/util/Pair;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    return-object p0

    .line 125
    :pswitch_3
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    const-string v0, "\u5927\u4e13\u53ca\u4ee5\u4e0a"

    .line 130
    .line 131
    const-string v1, "associate"

    .line 132
    .line 133
    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    const-string v1, "\u672c\u79d1\u53ca\u4ee5\u4e0a"

    .line 138
    .line 139
    const-string v2, "bachelor"

    .line 140
    .line 141
    invoke-static {v1, v2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    const-string v2, "\u7855\u58eb\u53ca\u4ee5\u4e0a"

    .line 146
    .line 147
    const-string v3, "master"

    .line 148
    .line 149
    invoke-static {v2, v3}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    const-string v3, "\u535a\u58eb"

    .line 154
    .line 155
    const-string v4, "doctor"

    .line 156
    .line 157
    invoke-static {v3, v4}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    filled-new-array {p0, v0, v1, v2, v3}, [Landroid/util/Pair;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    return-object p0

    .line 170
    :pswitch_4
    const-string p0, "1\u5343\u4ee5\u4e0b"

    .line 171
    .line 172
    const-string v0, "1k"

    .line 173
    .line 174
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    const-string p0, "1-2\u5343"

    .line 179
    .line 180
    const-string v0, "1-2k"

    .line 181
    .line 182
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    const-string p0, "2-3\u5343"

    .line 187
    .line 188
    const-string v0, "2-3k"

    .line 189
    .line 190
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 191
    .line 192
    .line 193
    move-result-object v3

    .line 194
    const-string p0, "3-4\u5343"

    .line 195
    .line 196
    const-string v0, "3-4k"

    .line 197
    .line 198
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 199
    .line 200
    .line 201
    move-result-object v4

    .line 202
    const-string p0, "4-5\u5343"

    .line 203
    .line 204
    const-string v0, "4-5k"

    .line 205
    .line 206
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 207
    .line 208
    .line 209
    move-result-object v5

    .line 210
    const-string p0, "5\u5343-1\u4e07"

    .line 211
    .line 212
    const-string v0, "5-10k"

    .line 213
    .line 214
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 215
    .line 216
    .line 217
    move-result-object v6

    .line 218
    const-string p0, "1\u4e07\u4ee5\u4e0a"

    .line 219
    .line 220
    const-string v0, "10k"

    .line 221
    .line 222
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 223
    .line 224
    .line 225
    move-result-object v7

    .line 226
    filled-new-array/range {v1 .. v7}, [Landroid/util/Pair;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    return-object p0

    .line 235
    :pswitch_5
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    const-string v0, "\u672a\u5a5a"

    .line 240
    .line 241
    const-string v1, "unmarried"

    .line 242
    .line 243
    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    const-string v1, "\u79bb\u5f02"

    .line 248
    .line 249
    const-string v2, "divorced"

    .line 250
    .line 251
    invoke-static {v1, v2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    filled-new-array {p0, v0, v1}, [Landroid/util/Pair;

    .line 256
    .line 257
    .line 258
    move-result-object p0

    .line 259
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 260
    .line 261
    .line 262
    move-result-object p0

    .line 263
    return-object p0

    .line 264
    :pswitch_6
    const-string p0, "\u60f3\u8981\u5b69\u5b50"

    .line 265
    .line 266
    const-string v0, "want"

    .line 267
    .line 268
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 269
    .line 270
    .line 271
    move-result-object p0

    .line 272
    const-string v0, "\u4e0d\u8981\u5b69\u5b50"

    .line 273
    .line 274
    const-string v1, "not_want"

    .line 275
    .line 276
    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    const-string v1, "\u751f\u5b69\u5b50\u968f\u7f18"

    .line 281
    .line 282
    const-string v2, "leave_it_to_fate"

    .line 283
    .line 284
    invoke-static {v1, v2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    filled-new-array {p0, v0, v1}, [Landroid/util/Pair;

    .line 289
    .line 290
    .line 291
    move-result-object p0

    .line 292
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 293
    .line 294
    .line 295
    move-result-object p0

    .line 296
    return-object p0

    .line 297
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 298
    .line 299
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->l:I

    .line 300
    .line 301
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object p0

    .line 305
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 306
    .line 307
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->l:I

    .line 308
    .line 309
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 310
    .line 311
    .line 312
    move-result-object v0

    .line 313
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 314
    .line 315
    .line 316
    move-result-object v1

    .line 317
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 318
    .line 319
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->m:I

    .line 320
    .line 321
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object p0

    .line 325
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 326
    .line 327
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->m:I

    .line 328
    .line 329
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 334
    .line 335
    .line 336
    move-result-object v2

    .line 337
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 338
    .line 339
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->n:I

    .line 340
    .line 341
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object p0

    .line 345
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 346
    .line 347
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->n:I

    .line 348
    .line 349
    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 350
    .line 351
    .line 352
    move-result-object v0

    .line 353
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 354
    .line 355
    .line 356
    move-result-object v3

    .line 357
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 358
    .line 359
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->o:I

    .line 360
    .line 361
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 362
    .line 363
    .line 364
    move-result-object p0

    .line 365
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 366
    .line 367
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->o:I

    .line 368
    .line 369
    invoke-virtual {v0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 370
    .line 371
    .line 372
    move-result-object v0

    .line 373
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 374
    .line 375
    .line 376
    move-result-object v4

    .line 377
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 378
    .line 379
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->p:I

    .line 380
    .line 381
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 382
    .line 383
    .line 384
    move-result-object p0

    .line 385
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 386
    .line 387
    sget v5, Lcom/p1/mobile/putong/core/profile/R$string;->p:I

    .line 388
    .line 389
    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 390
    .line 391
    .line 392
    move-result-object v0

    .line 393
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 394
    .line 395
    .line 396
    move-result-object v5

    .line 397
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 398
    .line 399
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->q:I

    .line 400
    .line 401
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 402
    .line 403
    .line 404
    move-result-object p0

    .line 405
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 406
    .line 407
    sget v6, Lcom/p1/mobile/putong/core/profile/R$string;->q:I

    .line 408
    .line 409
    invoke-virtual {v0, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 410
    .line 411
    .line 412
    move-result-object v0

    .line 413
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 414
    .line 415
    .line 416
    move-result-object v6

    .line 417
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 418
    .line 419
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->r:I

    .line 420
    .line 421
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 422
    .line 423
    .line 424
    move-result-object p0

    .line 425
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 426
    .line 427
    sget v7, Lcom/p1/mobile/putong/core/profile/R$string;->r:I

    .line 428
    .line 429
    invoke-virtual {v0, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 430
    .line 431
    .line 432
    move-result-object v0

    .line 433
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 434
    .line 435
    .line 436
    move-result-object v7

    .line 437
    filled-new-array/range {v1 .. v7}, [Landroid/util/Pair;

    .line 438
    .line 439
    .line 440
    move-result-object p0

    .line 441
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 442
    .line 443
    .line 444
    move-result-object p0

    .line 445
    return-object p0

    .line 446
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 447
    .line 448
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->B0:I

    .line 449
    .line 450
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 451
    .line 452
    .line 453
    move-result-object p0

    .line 454
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 455
    .line 456
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->B0:I

    .line 457
    .line 458
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 459
    .line 460
    .line 461
    move-result-object v0

    .line 462
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 463
    .line 464
    .line 465
    move-result-object p0

    .line 466
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 467
    .line 468
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->A0:I

    .line 469
    .line 470
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 471
    .line 472
    .line 473
    move-result-object v0

    .line 474
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 475
    .line 476
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->A0:I

    .line 477
    .line 478
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 479
    .line 480
    .line 481
    move-result-object v1

    .line 482
    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 483
    .line 484
    .line 485
    move-result-object v0

    .line 486
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 487
    .line 488
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->E0:I

    .line 489
    .line 490
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 491
    .line 492
    .line 493
    move-result-object v1

    .line 494
    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 495
    .line 496
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->E0:I

    .line 497
    .line 498
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 499
    .line 500
    .line 501
    move-result-object v2

    .line 502
    invoke-static {v1, v2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 503
    .line 504
    .line 505
    move-result-object v1

    .line 506
    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 507
    .line 508
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->D0:I

    .line 509
    .line 510
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 511
    .line 512
    .line 513
    move-result-object v2

    .line 514
    sget-object v3, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 515
    .line 516
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->D0:I

    .line 517
    .line 518
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 519
    .line 520
    .line 521
    move-result-object v3

    .line 522
    invoke-static {v2, v3}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 523
    .line 524
    .line 525
    move-result-object v2

    .line 526
    sget-object v3, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 527
    .line 528
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->C0:I

    .line 529
    .line 530
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 531
    .line 532
    .line 533
    move-result-object v3

    .line 534
    sget-object v4, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 535
    .line 536
    sget v5, Lcom/p1/mobile/putong/core/profile/R$string;->C0:I

    .line 537
    .line 538
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 539
    .line 540
    .line 541
    move-result-object v4

    .line 542
    invoke-static {v3, v4}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 543
    .line 544
    .line 545
    move-result-object v3

    .line 546
    filled-new-array {p0, v0, v1, v2, v3}, [Landroid/util/Pair;

    .line 547
    .line 548
    .line 549
    move-result-object p0

    .line 550
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 551
    .line 552
    .line 553
    move-result-object p0

    .line 554
    return-object p0

    .line 555
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 556
    .line 557
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->V0:I

    .line 558
    .line 559
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 560
    .line 561
    .line 562
    move-result-object p0

    .line 563
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 564
    .line 565
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->V0:I

    .line 566
    .line 567
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 568
    .line 569
    .line 570
    move-result-object v0

    .line 571
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 572
    .line 573
    .line 574
    move-result-object p0

    .line 575
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 576
    .line 577
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->m2:I

    .line 578
    .line 579
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 580
    .line 581
    .line 582
    move-result-object v0

    .line 583
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 584
    .line 585
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->m2:I

    .line 586
    .line 587
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 588
    .line 589
    .line 590
    move-result-object v1

    .line 591
    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 592
    .line 593
    .line 594
    move-result-object v0

    .line 595
    filled-new-array {p0, v0}, [Landroid/util/Pair;

    .line 596
    .line 597
    .line 598
    move-result-object p0

    .line 599
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 600
    .line 601
    .line 602
    move-result-object p0

    .line 603
    return-object p0

    .line 604
    :pswitch_a
    const-string p0, "\u5e0c\u671b\u4e00\u5e74\u5185\u7ed3\u5a5a"

    .line 605
    .line 606
    const-string v0, "in_one_year"

    .line 607
    .line 608
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 609
    .line 610
    .line 611
    move-result-object p0

    .line 612
    const-string v0, "\u5e0c\u671b\u4e24\u5e74\u5185\u7ed3\u5a5a"

    .line 613
    .line 614
    const-string v1, "in_two_years"

    .line 615
    .line 616
    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 617
    .line 618
    .line 619
    move-result-object v0

    .line 620
    const-string v1, "\u65f6\u673a\u6210\u719f\u5c31\u7ed3\u5a5a"

    .line 621
    .line 622
    const-string v2, "at_right_time"

    .line 623
    .line 624
    invoke-static {v1, v2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 625
    .line 626
    .line 627
    move-result-object v1

    .line 628
    filled-new-array {p0, v0, v1}, [Landroid/util/Pair;

    .line 629
    .line 630
    .line 631
    move-result-object p0

    .line 632
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 633
    .line 634
    .line 635
    move-result-object p0

    .line 636
    return-object p0

    .line 637
    :pswitch_b
    const-string p0, "\u672a\u5a5a\u672a\u80b2"

    .line 638
    .line 639
    const-string v0, "single"

    .line 640
    .line 641
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 642
    .line 643
    .line 644
    move-result-object p0

    .line 645
    const-string v0, "\u79bb\u5f02\u65e0\u5b69\u5b50"

    .line 646
    .line 647
    const-string v1, "divorced_without_child"

    .line 648
    .line 649
    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 650
    .line 651
    .line 652
    move-result-object v0

    .line 653
    const-string v1, "\u79bb\u5f02\u6709\u5b69\u5b50"

    .line 654
    .line 655
    const-string v2, "divorced_with_child"

    .line 656
    .line 657
    invoke-static {v1, v2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 658
    .line 659
    .line 660
    move-result-object v1

    .line 661
    filled-new-array {p0, v0, v1}, [Landroid/util/Pair;

    .line 662
    .line 663
    .line 664
    move-result-object p0

    .line 665
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 666
    .line 667
    .line 668
    move-result-object p0

    .line 669
    return-object p0

    .line 670
    nop

    .line 671
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static e(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;",
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
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->ADDRESS_HOMETOWN:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 7
    .line 8
    if-eq p0, v1, :cond_1

    .line 9
    .line 10
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->ADDRESS_LIVE_NOW:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 11
    .line 12
    if-ne p0, v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-object v0

    .line 16
    :cond_1
    :goto_0
    invoke-static {p1, p0}, Ll/l5x;->j(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static f(Ljava/util/List;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ljava/lang/CharSequence;

    .line 13
    .line 14
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 15
    .line 16
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->l2:I

    .line 17
    .line 18
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Ljava/lang/String;

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 37
    return-object p0
.end method

.method public static g(Lcom/p1/mobile/putong/data/User;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper;->d(Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-ge v1, v2, :cond_0

    .line 16
    .line 17
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 22
    .line 23
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->c()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 32
    .line 33
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->b()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-static {v2, v3}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    add-int/lit8 v1, v1, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    return-object v0
.end method

.method public static h()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/l5x;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/l5x;->b:Ljava/util/List;

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v0, Ll/l5x;->b:Ljava/util/List;

    .line 18
    .line 19
    const/16 v0, 0x8c

    .line 20
    .line 21
    :goto_0
    const/16 v1, 0xd2

    .line 22
    .line 23
    if-gt v0, v1, :cond_1

    .line 24
    .line 25
    sget-object v1, Ll/l5x;->b:Ljava/util/List;

    .line 26
    .line 27
    new-instance v2, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    sget-object v3, Ll/l5x;->c:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    add-int/lit8 v0, v0, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    sget-object v0, Ll/l5x;->b:Ljava/util/List;

    .line 51
    .line 52
    return-object v0
.end method

.method public static i()Lcom/p1/mobile/putong/core/data/HometownSuggest;
    .locals 1

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
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->N6()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method public static j(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ljava/util/ArrayList;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    new-instance v2, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/l5x;->i()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-nez v3, :cond_0

    .line 19
    .line 20
    goto/16 :goto_b

    .line 21
    .line 22
    :cond_0
    sget-object v3, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->ADDRESS_HOMETOWN:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 23
    .line 24
    const-string v4, "\u4e2d\u56fd"

    .line 25
    .line 26
    const/4 v5, 0x0

    .line 27
    const/4 v6, 0x2

    .line 28
    const-string v7, "\u30fb"

    .line 29
    .line 30
    const/4 v8, 0x0

    .line 31
    const-string v9, ""

    .line 32
    .line 33
    const/4 v10, 0x1

    .line 34
    if-ne v1, v3, :cond_b

    .line 35
    .line 36
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_a

    .line 41
    .line 42
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 43
    .line 44
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_a

    .line 49
    .line 50
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 51
    .line 52
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 53
    .line 54
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_a

    .line 59
    .line 60
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 61
    .line 62
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 63
    .line 64
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 65
    .line 66
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_a

    .line 71
    .line 72
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 73
    .line 74
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 75
    .line 76
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 77
    .line 78
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->country:Ljava/util/List;

    .line 79
    .line 80
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-eqz v1, :cond_1

    .line 85
    .line 86
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 87
    .line 88
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 89
    .line 90
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 91
    .line 92
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->province:Ljava/util/List;

    .line 93
    .line 94
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-eqz v1, :cond_1

    .line 99
    .line 100
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 101
    .line 102
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 103
    .line 104
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 105
    .line 106
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->city:Ljava/util/List;

    .line 107
    .line 108
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-nez v1, :cond_a

    .line 113
    .line 114
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 117
    .line 118
    .line 119
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 120
    .line 121
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 122
    .line 123
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 124
    .line 125
    iget-object v3, v3, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->country:Ljava/util/List;

    .line 126
    .line 127
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    if-eqz v3, :cond_2

    .line 132
    .line 133
    move-object v14, v9

    .line 134
    goto :goto_0

    .line 135
    :cond_2
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 136
    .line 137
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 138
    .line 139
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 140
    .line 141
    iget-object v3, v3, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->country:Ljava/util/List;

    .line 142
    .line 143
    invoke-interface {v3, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    check-cast v3, Ljava/lang/String;

    .line 148
    .line 149
    move-object v14, v3

    .line 150
    :goto_0
    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 151
    .line 152
    .line 153
    move-result v3

    .line 154
    if-nez v3, :cond_3

    .line 155
    .line 156
    invoke-virtual {v4, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result v3

    .line 160
    if-nez v3, :cond_3

    .line 161
    .line 162
    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    :cond_3
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 166
    .line 167
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 168
    .line 169
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 170
    .line 171
    iget-object v3, v3, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->province:Ljava/util/List;

    .line 172
    .line 173
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 174
    .line 175
    .line 176
    move-result v3

    .line 177
    if-eqz v3, :cond_4

    .line 178
    .line 179
    move-object v15, v9

    .line 180
    goto :goto_1

    .line 181
    :cond_4
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 182
    .line 183
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 184
    .line 185
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 186
    .line 187
    iget-object v3, v3, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->province:Ljava/util/List;

    .line 188
    .line 189
    invoke-interface {v3, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    check-cast v3, Ljava/lang/String;

    .line 194
    .line 195
    move-object v15, v3

    .line 196
    :goto_1
    invoke-static {v15}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 197
    .line 198
    .line 199
    move-result v3

    .line 200
    if-nez v3, :cond_6

    .line 201
    .line 202
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 203
    .line 204
    .line 205
    move-result v3

    .line 206
    if-lez v3, :cond_5

    .line 207
    .line 208
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    :cond_5
    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    :cond_6
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 215
    .line 216
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 217
    .line 218
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 219
    .line 220
    iget-object v3, v3, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->city:Ljava/util/List;

    .line 221
    .line 222
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 223
    .line 224
    .line 225
    move-result v3

    .line 226
    if-eqz v3, :cond_7

    .line 227
    .line 228
    move-object v0, v9

    .line 229
    goto :goto_2

    .line 230
    :cond_7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 231
    .line 232
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 233
    .line 234
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 235
    .line 236
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->city:Ljava/util/List;

    .line 237
    .line 238
    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    check-cast v0, Ljava/lang/String;

    .line 243
    .line 244
    :goto_2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 245
    .line 246
    .line 247
    move-result v3

    .line 248
    if-nez v3, :cond_9

    .line 249
    .line 250
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 251
    .line 252
    .line 253
    move-result v3

    .line 254
    if-lez v3, :cond_8

    .line 255
    .line 256
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 257
    .line 258
    .line 259
    :cond_8
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    :cond_9
    new-instance v11, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 263
    .line 264
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object v12

    .line 268
    sget-object v13, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;->OLD_DATA:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;

    .line 269
    .line 270
    move-object/from16 v16, v0

    .line 271
    .line 272
    invoke-direct/range {v11 .. v16}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    invoke-virtual {v11, v10}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->setSelected(Z)Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 276
    .line 277
    .line 278
    goto/16 :goto_5

    .line 279
    .line 280
    :cond_a
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 281
    .line 282
    .line 283
    move-result v1

    .line 284
    if-eqz v1, :cond_11

    .line 285
    .line 286
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 287
    .line 288
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 289
    .line 290
    .line 291
    move-result v1

    .line 292
    if-eqz v1, :cond_11

    .line 293
    .line 294
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 295
    .line 296
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 297
    .line 298
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 299
    .line 300
    .line 301
    move-result v1

    .line 302
    if-nez v1, :cond_11

    .line 303
    .line 304
    new-instance v11, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 305
    .line 306
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 307
    .line 308
    iget-object v12, v0, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 309
    .line 310
    sget-object v13, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;->OLD_DATA:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;

    .line 311
    .line 312
    const-string v15, ""

    .line 313
    .line 314
    const-string v16, ""

    .line 315
    .line 316
    const-string v14, ""

    .line 317
    .line 318
    invoke-direct/range {v11 .. v16}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 319
    .line 320
    .line 321
    invoke-virtual {v11, v10}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->setSelected(Z)Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 322
    .line 323
    .line 324
    goto/16 :goto_5

    .line 325
    .line 326
    :cond_b
    sget-object v3, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->ADDRESS_LIVE_NOW:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 327
    .line 328
    if-ne v1, v3, :cond_11

    .line 329
    .line 330
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 331
    .line 332
    .line 333
    move-result v1

    .line 334
    if-eqz v1, :cond_11

    .line 335
    .line 336
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 337
    .line 338
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 339
    .line 340
    .line 341
    move-result v1

    .line 342
    if-eqz v1, :cond_11

    .line 343
    .line 344
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 345
    .line 346
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 347
    .line 348
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 349
    .line 350
    .line 351
    move-result v1

    .line 352
    if-eqz v1, :cond_11

    .line 353
    .line 354
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 355
    .line 356
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 357
    .line 358
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 359
    .line 360
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 361
    .line 362
    .line 363
    move-result v1

    .line 364
    if-eqz v1, :cond_11

    .line 365
    .line 366
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 367
    .line 368
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 369
    .line 370
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 371
    .line 372
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->address:Ljava/util/List;

    .line 373
    .line 374
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 375
    .line 376
    .line 377
    move-result v1

    .line 378
    if-nez v1, :cond_11

    .line 379
    .line 380
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 381
    .line 382
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 383
    .line 384
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 385
    .line 386
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->address:Ljava/util/List;

    .line 387
    .line 388
    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 389
    .line 390
    .line 391
    move-result-object v1

    .line 392
    move-object v14, v1

    .line 393
    check-cast v14, Ljava/lang/String;

    .line 394
    .line 395
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 396
    .line 397
    .line 398
    move-result v1

    .line 399
    if-le v1, v10, :cond_c

    .line 400
    .line 401
    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 402
    .line 403
    .line 404
    move-result-object v1

    .line 405
    check-cast v1, Ljava/lang/String;

    .line 406
    .line 407
    move-object v15, v1

    .line 408
    goto :goto_3

    .line 409
    :cond_c
    move-object v15, v9

    .line 410
    :goto_3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 411
    .line 412
    .line 413
    move-result v1

    .line 414
    if-le v1, v6, :cond_d

    .line 415
    .line 416
    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 417
    .line 418
    .line 419
    move-result-object v0

    .line 420
    check-cast v0, Ljava/lang/String;

    .line 421
    .line 422
    goto :goto_4

    .line 423
    :cond_d
    move-object v0, v9

    .line 424
    :goto_4
    new-instance v1, Ljava/util/ArrayList;

    .line 425
    .line 426
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 427
    .line 428
    .line 429
    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 430
    .line 431
    .line 432
    move-result v3

    .line 433
    if-nez v3, :cond_e

    .line 434
    .line 435
    invoke-virtual {v4, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 436
    .line 437
    .line 438
    move-result v3

    .line 439
    if-nez v3, :cond_e

    .line 440
    .line 441
    invoke-interface {v1, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 442
    .line 443
    .line 444
    :cond_e
    invoke-static {v15}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 445
    .line 446
    .line 447
    move-result v3

    .line 448
    if-nez v3, :cond_f

    .line 449
    .line 450
    invoke-interface {v1, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 451
    .line 452
    .line 453
    :cond_f
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 454
    .line 455
    .line 456
    move-result v3

    .line 457
    if-nez v3, :cond_10

    .line 458
    .line 459
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 460
    .line 461
    .line 462
    :cond_10
    invoke-static {v7, v1}, Ll/du4;->a(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 463
    .line 464
    .line 465
    move-result-object v12

    .line 466
    new-instance v11, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 467
    .line 468
    sget-object v13, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;->OLD_DATA:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;

    .line 469
    .line 470
    move-object/from16 v16, v0

    .line 471
    .line 472
    invoke-direct/range {v11 .. v16}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 473
    .line 474
    .line 475
    invoke-virtual {v11, v10}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->setSelected(Z)Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 476
    .line 477
    .line 478
    goto :goto_5

    .line 479
    :cond_11
    move-object v11, v5

    .line 480
    :goto_5
    invoke-static {}, Ll/l5x;->i()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 481
    .line 482
    .line 483
    move-result-object v0

    .line 484
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/HometownSuggest;->china:Ljava/util/List;

    .line 485
    .line 486
    move v1, v8

    .line 487
    :goto_6
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 488
    .line 489
    .line 490
    move-result v3

    .line 491
    if-ge v1, v3, :cond_15

    .line 492
    .line 493
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 494
    .line 495
    .line 496
    move-result-object v3

    .line 497
    check-cast v3, Lcom/p1/mobile/putong/core/data/HometownChinaItem;

    .line 498
    .line 499
    new-instance v4, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 500
    .line 501
    iget-object v7, v3, Lcom/p1/mobile/putong/core/data/HometownChinaItem;->region:Ljava/lang/String;

    .line 502
    .line 503
    sget-object v12, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;->SELECT_INFO:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;

    .line 504
    .line 505
    invoke-direct {v4, v7, v12}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;)V

    .line 506
    .line 507
    .line 508
    invoke-static {v11}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 509
    .line 510
    .line 511
    move-result v7

    .line 512
    if-eqz v7, :cond_12

    .line 513
    .line 514
    invoke-virtual {v11}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->getShowText()Ljava/lang/String;

    .line 515
    .line 516
    .line 517
    move-result-object v7

    .line 518
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->getShowText()Ljava/lang/String;

    .line 519
    .line 520
    .line 521
    move-result-object v12

    .line 522
    invoke-static {v7, v12}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 523
    .line 524
    .line 525
    move-result v7

    .line 526
    if-eqz v7, :cond_12

    .line 527
    .line 528
    invoke-virtual {v4, v10}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->setSelected(Z)Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 529
    .line 530
    .line 531
    move-object v11, v5

    .line 532
    :cond_12
    invoke-virtual {v4, v10}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->setLevel(I)V

    .line 533
    .line 534
    .line 535
    iget-object v7, v3, Lcom/p1/mobile/putong/core/data/HometownChinaItem;->subRegion:Ljava/util/List;

    .line 536
    .line 537
    invoke-static {v7}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 538
    .line 539
    .line 540
    move-result v7

    .line 541
    if-nez v7, :cond_14

    .line 542
    .line 543
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->setShowArrow()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 544
    .line 545
    .line 546
    new-instance v7, Ljava/util/ArrayList;

    .line 547
    .line 548
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 549
    .line 550
    .line 551
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/HometownChinaItem;->subRegion:Ljava/util/List;

    .line 552
    .line 553
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 554
    .line 555
    .line 556
    move-result-object v3

    .line 557
    :goto_7
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 558
    .line 559
    .line 560
    move-result v12

    .line 561
    if-eqz v12, :cond_13

    .line 562
    .line 563
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 564
    .line 565
    .line 566
    move-result-object v12

    .line 567
    check-cast v12, Ljava/lang/String;

    .line 568
    .line 569
    new-instance v13, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 570
    .line 571
    sget-object v14, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;->SELECT_INFO:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;

    .line 572
    .line 573
    invoke-direct {v13, v12, v14}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;)V

    .line 574
    .line 575
    .line 576
    invoke-virtual {v13, v6}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->setLevel(I)V

    .line 577
    .line 578
    .line 579
    invoke-interface {v7, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 580
    .line 581
    .line 582
    goto :goto_7

    .line 583
    :cond_13
    invoke-virtual {v4, v7}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->setNextList(Ljava/util/List;)V

    .line 584
    .line 585
    .line 586
    goto :goto_8

    .line 587
    :cond_14
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/HometownChinaItem;->region:Ljava/lang/String;

    .line 588
    .line 589
    invoke-virtual {v4, v9, v3, v9}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->setData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 590
    .line 591
    .line 592
    :goto_8
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 593
    .line 594
    .line 595
    add-int/lit8 v1, v1, 0x1

    .line 596
    .line 597
    goto :goto_6

    .line 598
    :cond_15
    new-instance v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 599
    .line 600
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 601
    .line 602
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->Z0:I

    .line 603
    .line 604
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 605
    .line 606
    .line 607
    move-result-object v1

    .line 608
    sget-object v3, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;->SELECT_OVERSEAS:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;

    .line 609
    .line 610
    invoke-direct {v0, v1, v3}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;)V

    .line 611
    .line 612
    .line 613
    invoke-virtual {v0, v8}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->setSelected(Z)Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 614
    .line 615
    .line 616
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->setShowArrow()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 617
    .line 618
    .line 619
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 620
    .line 621
    .line 622
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->u()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 623
    .line 624
    .line 625
    move-result-object v1

    .line 626
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/HometownSuggest;->overseas:Ljava/util/Map;

    .line 627
    .line 628
    invoke-static {v1}, Ll/jyb;->D(Ljava/util/Map;)Ljava/util/List;

    .line 629
    .line 630
    .line 631
    move-result-object v1

    .line 632
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->Q(Ljava/util/List;)Ljava/util/List;

    .line 633
    .line 634
    .line 635
    move-result-object v1

    .line 636
    new-instance v3, Ljava/util/ArrayList;

    .line 637
    .line 638
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 639
    .line 640
    .line 641
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 642
    .line 643
    .line 644
    move-result-object v1

    .line 645
    :cond_16
    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 646
    .line 647
    .line 648
    move-result v4

    .line 649
    if-eqz v4, :cond_18

    .line 650
    .line 651
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 652
    .line 653
    .line 654
    move-result-object v4

    .line 655
    check-cast v4, Ljava/lang/String;

    .line 656
    .line 657
    new-instance v5, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 658
    .line 659
    sget-object v6, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;->SELECT_INFO:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;

    .line 660
    .line 661
    invoke-direct {v5, v4, v6}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;)V

    .line 662
    .line 663
    .line 664
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 665
    .line 666
    .line 667
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->u()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 668
    .line 669
    .line 670
    move-result-object v6

    .line 671
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/HometownSuggest;->overseas:Ljava/util/Map;

    .line 672
    .line 673
    invoke-interface {v6, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 674
    .line 675
    .line 676
    move-result-object v4

    .line 677
    check-cast v4, Ljava/util/List;

    .line 678
    .line 679
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 680
    .line 681
    .line 682
    move-result v6

    .line 683
    if-nez v6, :cond_16

    .line 684
    .line 685
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->setShowArrow()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 686
    .line 687
    .line 688
    new-instance v6, Ljava/util/ArrayList;

    .line 689
    .line 690
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 691
    .line 692
    .line 693
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 694
    .line 695
    .line 696
    move-result-object v4

    .line 697
    :goto_a
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 698
    .line 699
    .line 700
    move-result v7

    .line 701
    if-eqz v7, :cond_17

    .line 702
    .line 703
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 704
    .line 705
    .line 706
    move-result-object v7

    .line 707
    check-cast v7, Ljava/lang/String;

    .line 708
    .line 709
    new-instance v9, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 710
    .line 711
    sget-object v12, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;->SELECT_INFO:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;

    .line 712
    .line 713
    invoke-direct {v9, v7, v12}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;)V

    .line 714
    .line 715
    .line 716
    invoke-virtual {v9, v10}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->setLevel(I)V

    .line 717
    .line 718
    .line 719
    invoke-interface {v6, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 720
    .line 721
    .line 722
    goto :goto_a

    .line 723
    :cond_17
    invoke-virtual {v5, v6}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->setNextList(Ljava/util/List;)V

    .line 724
    .line 725
    .line 726
    goto :goto_9

    .line 727
    :cond_18
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->setNextList(Ljava/util/List;)V

    .line 728
    .line 729
    .line 730
    invoke-static {v11}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 731
    .line 732
    .line 733
    move-result v0

    .line 734
    if-eqz v0, :cond_19

    .line 735
    .line 736
    invoke-virtual {v11}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->getShowText()Ljava/lang/String;

    .line 737
    .line 738
    .line 739
    move-result-object v0

    .line 740
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 741
    .line 742
    .line 743
    move-result v0

    .line 744
    if-nez v0, :cond_19

    .line 745
    .line 746
    invoke-virtual {v2, v8, v11}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 747
    .line 748
    .line 749
    :cond_19
    :goto_b
    return-object v2
.end method

.method public static k(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 4

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserWealth;->houseSubRegion:Ljava/util/List;

    .line 13
    .line 14
    invoke-static {v1}, Ll/l5x;->f(Ljava/util/List;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 23
    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    iget-object v0, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserWealth;->houseSubRegion:Ljava/util/List;

    .line 31
    .line 32
    invoke-static {v0}, Ll/l5x;->f(Ljava/util/List;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    iget-object v1, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserWealth;->houseRegion:Ljava/util/List;

    .line 42
    .line 43
    invoke-static {v1}, Ll/l5x;->f(Ljava/util/List;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-nez v1, :cond_2

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserWealth;->houseRegion:Ljava/util/List;

    .line 60
    .line 61
    invoke-static {v0}, Ll/l5x;->f(Ljava/util/List;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    :cond_2
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 68
    .line 69
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 70
    .line 71
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserWealth;->house:Ljava/util/List;

    .line 72
    .line 73
    invoke-static {v1}, Ll/l5x;->f(Ljava/util/List;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserWealth;->house:Ljava/util/List;

    .line 84
    .line 85
    invoke-static {p0}, Ll/l5x;->f(Ljava/util/List;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 90
    .line 91
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->W0:I

    .line 92
    .line 93
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-static {p0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    if-eqz p0, :cond_3

    .line 102
    .line 103
    new-instance p0, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    return-object p0

    .line 119
    :cond_3
    return-object v1
.end method

.method public static l(Ljava/util/List;Ljava/util/List;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "1000000"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ljava/lang/CharSequence;

    .line 15
    .line 16
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 23
    .line 24
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->r:I

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_0
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const-string v3, ""

    .line 36
    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Ljava/lang/CharSequence;

    .line 44
    .line 45
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 46
    .line 47
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->l2:I

    .line 48
    .line 49
    invoke-virtual {v0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_1

    .line 58
    .line 59
    return-object v3

    .line 60
    :cond_1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-nez p1, :cond_7

    .line 65
    .line 66
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    check-cast p1, Ljava/lang/CharSequence;

    .line 71
    .line 72
    const-string v0, "50000"

    .line 73
    .line 74
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_2

    .line 79
    .line 80
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 81
    .line 82
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->l:I

    .line 83
    .line 84
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    return-object p0

    .line 89
    :cond_2
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    check-cast p1, Ljava/lang/CharSequence;

    .line 94
    .line 95
    const-string v0, "100000"

    .line 96
    .line 97
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_3

    .line 102
    .line 103
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 104
    .line 105
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->m:I

    .line 106
    .line 107
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    return-object p0

    .line 112
    :cond_3
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    check-cast p1, Ljava/lang/CharSequence;

    .line 117
    .line 118
    const-string v0, "200000"

    .line 119
    .line 120
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-eqz p1, :cond_4

    .line 125
    .line 126
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 127
    .line 128
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->n:I

    .line 129
    .line 130
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    return-object p0

    .line 135
    :cond_4
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    check-cast p1, Ljava/lang/CharSequence;

    .line 140
    .line 141
    const-string v0, "300000"

    .line 142
    .line 143
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    if-eqz p1, :cond_5

    .line 148
    .line 149
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 150
    .line 151
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->o:I

    .line 152
    .line 153
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    return-object p0

    .line 158
    :cond_5
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    check-cast p1, Ljava/lang/CharSequence;

    .line 163
    .line 164
    const-string v0, "600000"

    .line 165
    .line 166
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    if-eqz p1, :cond_6

    .line 171
    .line 172
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 173
    .line 174
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->p:I

    .line 175
    .line 176
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    return-object p0

    .line 181
    :cond_6
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    check-cast p0, Ljava/lang/CharSequence;

    .line 186
    .line 187
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 188
    .line 189
    .line 190
    move-result p0

    .line 191
    if-eqz p0, :cond_7

    .line 192
    .line 193
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 194
    .line 195
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->q:I

    .line 196
    .line 197
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    return-object p0

    .line 202
    :cond_7
    return-object v3
.end method

.method public static m(Ljava/util/List;Z)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "18"

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    check-cast v2, Ljava/lang/CharSequence;

    .line 15
    .line 16
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ljava/lang/String;

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    :goto_0
    move-object v0, v1

    .line 31
    :goto_1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    const-string v3, "unlimited"

    .line 36
    .line 37
    if-nez v2, :cond_3

    .line 38
    .line 39
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    const/4 v4, 0x1

    .line 44
    if-gt v2, v4, :cond_2

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_2
    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Ljava/lang/String;

    .line 52
    .line 53
    goto :goto_3

    .line 54
    :cond_3
    :goto_2
    move-object p0, v3

    .line 55
    :goto_3
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_4

    .line 60
    .line 61
    invoke-static {p0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_4

    .line 66
    .line 67
    if-eqz p1, :cond_4

    .line 68
    .line 69
    const-string p0, "\u4e0d\u9650"

    .line 70
    .line 71
    return-object p0

    .line 72
    :cond_4
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-eqz p1, :cond_5

    .line 77
    .line 78
    sget-object p1, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 79
    .line 80
    const-string v0, "%s\u5c81\u4ee5\u4e0b"

    .line 81
    .line 82
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-static {p1, v0, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    return-object p0

    .line 91
    :cond_5
    invoke-static {p0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-eqz p1, :cond_6

    .line 96
    .line 97
    sget-object p0, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 98
    .line 99
    const-string p1, "%s\u5c81\u4ee5\u4e0a"

    .line 100
    .line 101
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-static {p0, p1, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    return-object p0

    .line 110
    :cond_6
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-eqz p1, :cond_7

    .line 115
    .line 116
    sget-object p0, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 117
    .line 118
    const-string p1, "%s\u5c81"

    .line 119
    .line 120
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-static {p0, p1, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    return-object p0

    .line 129
    :cond_7
    sget-object p1, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 130
    .line 131
    const-string v1, "%s - %s\u5c81"

    .line 132
    .line 133
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-static {p1, v1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    return-object p0
.end method

.method public static n(Ljava/lang/String;Z)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
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
    if-eqz p1, :cond_0

    .line 7
    .line 8
    const-string p1, "\u4e0d\u9650"

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    const-string p1, "[0-9]*"

    .line 14
    .line 15
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->matches()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    const/16 v1, 0x12

    .line 28
    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    :catch_0
    :cond_1
    :goto_0
    const/16 p0, 0x32

    .line 36
    .line 37
    if-gt v1, p0, :cond_2

    .line 38
    .line 39
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    add-int/lit8 v1, v1, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    return-object v0
.end method

.method public static o(Ljava/util/List;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "unlimited"

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    check-cast v2, Ljava/lang/CharSequence;

    .line 15
    .line 16
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ljava/lang/String;

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    :goto_0
    move-object v0, v1

    .line 31
    :goto_1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-nez v2, :cond_3

    .line 36
    .line 37
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    const/4 v3, 0x1

    .line 42
    if-gt v2, v3, :cond_2

    .line 43
    .line 44
    goto :goto_2

    .line 45
    :cond_2
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    check-cast p0, Ljava/lang/String;

    .line 50
    .line 51
    goto :goto_3

    .line 52
    :cond_3
    :goto_2
    move-object p0, v1

    .line 53
    :goto_3
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_4

    .line 58
    .line 59
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-eqz v2, :cond_4

    .line 64
    .line 65
    const-string p0, "\u4e0d\u9650"

    .line 66
    .line 67
    return-object p0

    .line 68
    :cond_4
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-eqz v2, :cond_5

    .line 73
    .line 74
    sget-object v0, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 75
    .line 76
    const-string v1, "%scm\u4ee5\u4e0b"

    .line 77
    .line 78
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-static {v0, v1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0

    .line 87
    :cond_5
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_6

    .line 92
    .line 93
    sget-object p0, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 94
    .line 95
    const-string v1, "%scm\u4ee5\u4e0a"

    .line 96
    .line 97
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-static {p0, v1, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    return-object p0

    .line 106
    :cond_6
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-eqz v1, :cond_7

    .line 111
    .line 112
    sget-object p0, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 113
    .line 114
    const-string v1, "%scm"

    .line 115
    .line 116
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-static {p0, v1, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    return-object p0

    .line 125
    :cond_7
    sget-object v1, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 126
    .line 127
    const-string v2, "%s - %scm"

    .line 128
    .line 129
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-static {v1, v2, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    return-object p0
.end method

.method public static p(Ljava/lang/String;Z)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
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
    if-eqz p1, :cond_0

    .line 7
    .line 8
    const-string p1, "\u4e0d\u9650"

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    const-string p1, "[0-9]*"

    .line 14
    .line 15
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->matches()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    const/16 v1, 0x8c

    .line 28
    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    :catch_0
    :cond_1
    :goto_0
    const/16 p0, 0xd2

    .line 36
    .line 37
    if-gt v1, p0, :cond_2

    .line 38
    .line 39
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    add-int/lit8 v1, v1, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    return-object v0
.end method

.method public static q(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "\u4e0d\u9650"

    .line 2
    .line 3
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "unlimited"

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public static r(Ljava/util/List;Ljava/util/List;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_3

    .line 7
    .line 8
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Landroid/util/Pair;

    .line 30
    .line 31
    iget-object v2, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v2, Ljava/lang/CharSequence;

    .line 34
    .line 35
    const/4 v3, 0x0

    .line 36
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    check-cast v4, Ljava/lang/CharSequence;

    .line 41
    .line 42
    invoke-static {v2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    iget-object v4, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 47
    .line 48
    if-eqz v2, :cond_2

    .line 49
    .line 50
    check-cast v4, Ljava/lang/String;

    .line 51
    .line 52
    return-object v4

    .line 53
    :cond_2
    check-cast v4, Ljava/lang/CharSequence;

    .line 54
    .line 55
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    check-cast v2, Ljava/lang/CharSequence;

    .line 60
    .line 61
    invoke-static {v4, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-eqz v2, :cond_1

    .line 66
    .line 67
    iget-object p0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 68
    .line 69
    check-cast p0, Ljava/lang/String;

    .line 70
    .line 71
    return-object p0

    .line 72
    :cond_3
    :goto_0
    return-object v1
.end method

.method public static s(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 4

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-eqz p0, :cond_2

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :cond_0
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 12
    .line 13
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const-string v2, " "

    .line 18
    .line 19
    const-string v3, "+"

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_1

    .line 34
    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 41
    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 43
    .line 44
    iget v1, v1, Lcom/p1/mobile/putong/data/PhoneNumber;->countryCode:I

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 53
    .line 54
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 55
    .line 56
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {v1}, Ll/ky;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    :cond_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 76
    .line 77
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 78
    .line 79
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_2

    .line 84
    .line 85
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 86
    .line 87
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 88
    .line 89
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-nez v1, :cond_2

    .line 96
    .line 97
    new-instance v0, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 103
    .line 104
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 105
    .line 106
    iget v1, v1, Lcom/p1/mobile/putong/data/PhoneNumber;->countryCode:I

    .line 107
    .line 108
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 115
    .line 116
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 117
    .line 118
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 119
    .line 120
    invoke-static {p0}, Ll/ky;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    return-object p0

    .line 132
    :cond_2
    :goto_0
    return-object v0
.end method

.method public static t(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 4
    .line 5
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 10
    .line 11
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->Q2:I

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object p0, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_1
    iget-object v0, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 38
    .line 39
    const-string v1, "\u5176\u4ed6"

    .line 40
    .line 41
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    const-string v2, "\u5176\u5b83"

    .line 46
    .line 47
    if-nez v0, :cond_2

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_4

    .line 60
    .line 61
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_4

    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 76
    .line 77
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_3

    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 86
    .line 87
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 88
    .line 89
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_4

    .line 96
    .line 97
    :cond_3
    return-object v1

    .line 98
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 99
    .line 100
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 101
    .line 102
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 103
    .line 104
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 109
    .line 110
    if-eqz v0, :cond_5

    .line 111
    .line 112
    iget-object p0, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 113
    .line 114
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 115
    .line 116
    return-object p0

    .line 117
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 120
    .line 121
    .line 122
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 123
    .line 124
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    const-string v1, "\u00b7"

    .line 130
    .line 131
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 135
    .line 136
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 137
    .line 138
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 139
    .line 140
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    return-object p0
.end method

.method public static u(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/l5x;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_1

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    filled-new-array {p0}, [Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_3

    .line 36
    .line 37
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 42
    .line 43
    invoke-static {v2, p1}, Ll/l5x;->c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-eqz v3, :cond_2

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    if-nez p0, :cond_4

    .line 58
    .line 59
    return-object v1

    .line 60
    :cond_4
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-eqz p1, :cond_5

    .line 65
    .line 66
    filled-new-array {p0}, [Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0

    .line 75
    :cond_5
    new-instance p1, Ljava/util/ArrayList;

    .line 76
    .line 77
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-nez v0, :cond_6

    .line 85
    .line 86
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    :cond_6
    sget-object v0, Ll/l5x;->a:Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    :goto_1
    sget-object v2, Ll/l5x;->a:Ljava/util/ArrayList;

    .line 96
    .line 97
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    if-ge v0, v3, :cond_8

    .line 102
    .line 103
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    if-eqz v3, :cond_7

    .line 112
    .line 113
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    check-cast v2, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 118
    .line 119
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    :cond_7
    add-int/lit8 v0, v0, 0x1

    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_8
    const/4 v0, 0x0

    .line 126
    :goto_2
    sget-object v2, Ll/l5x;->a:Ljava/util/ArrayList;

    .line 127
    .line 128
    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    if-ge v0, v3, :cond_a

    .line 133
    .line 134
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result v3

    .line 142
    if-eqz v3, :cond_9

    .line 143
    .line 144
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    check-cast v2, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 149
    .line 150
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    :cond_9
    add-int/lit8 v0, v0, 0x1

    .line 154
    .line 155
    goto :goto_2

    .line 156
    :cond_a
    return-object p1
.end method

.method public static v()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/l5x;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/l5x;->d:Ljava/util/List;

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v0, Ll/l5x;->d:Ljava/util/List;

    .line 18
    .line 19
    const/16 v0, 0x1e

    .line 20
    .line 21
    :goto_0
    const/16 v1, 0xc8

    .line 22
    .line 23
    if-gt v0, v1, :cond_1

    .line 24
    .line 25
    sget-object v1, Ll/l5x;->d:Ljava/util/List;

    .line 26
    .line 27
    new-instance v2, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    sget-object v3, Ll/l5x;->e:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    add-int/lit8 v0, v0, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    sget-object v0, Ll/l5x;->d:Ljava/util/List;

    .line 51
    .line 52
    return-object v0
.end method
