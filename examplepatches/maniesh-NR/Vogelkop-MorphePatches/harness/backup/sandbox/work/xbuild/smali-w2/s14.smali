.class public final Ls14;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lih4;
.implements Lf94;
.implements Lebf;
.implements Lu13;
.implements Ly9j;
.implements Lr6l;
.implements Lbln;


# static fields
.field public static final g:Lhp2;

.field public static h:Ls14;


# instance fields
.field public final synthetic a:B

.field public b:Z

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lhp2;

    const/16 v1, 0x9

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lhp2;-><init>(BZ)V

    sput-object v0, Ls14;->g:Lhp2;

    return-void
.end method

.method public constructor <init>(B)V
    .registers 3

    iput-byte p1, p0, Ls14;->a:B

    sparse-switch p1, :sswitch_data_60

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

    :sswitch_9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lj06;

    const/16 v0, 0x10

    invoke-direct {p1, v0}, Lj06;-><init>(B)V

    iput-object p1, p0, Ls14;->c:Ljava/lang/Object;

    new-instance p1, Li72;

    invoke-direct {p1}, Li72;-><init>()V

    iput-object p1, p0, Ls14;->d:Ljava/lang/Object;

    sget-object p1, Lv08;->a:Lv08;

    iput-object p1, p0, Ls14;->e:Ljava/lang/Object;

    return-void

    :sswitch_21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Ls14;->b:Z

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Ls14;->d:Ljava/lang/Object;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Ls14;->e:Ljava/lang/Object;

    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Ls14;->f:Ljava/lang/Object;

    return-void

    :sswitch_3d
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lt72;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Lt72;-><init>(I)V

    iput-object p1, p0, Ls14;->c:Ljava/lang/Object;

    new-instance p1, Ljava/util/Random;

    invoke-direct {p1}, Ljava/util/Random;-><init>()V

    iput-object p1, p0, Ls14;->d:Ljava/lang/Object;

    new-instance p1, Ljw4;

    const/4 v0, 0x2

    invoke-direct {p1, p0, v0}, Ljw4;-><init>(Ls14;B)V

    iput-object p1, p0, Ls14;->e:Ljava/lang/Object;

    new-instance p1, Ljw4;

    const/4 v0, 0x3

    invoke-direct {p1, p0, v0}, Ljw4;-><init>(Ls14;B)V

    iput-object p1, p0, Ls14;->f:Ljava/lang/Object;

    return-void

    :sswitch_data_60
    .sparse-switch
        0x4 -> :sswitch_3d
        0x11 -> :sswitch_21
        0x12 -> :sswitch_9
    .end sparse-switch
.end method

.method public constructor <init>(II)V
    .registers 4

    const/4 v0, 0x7

    iput-byte v0, p0, Ls14;->a:B

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    new-instance v0, Lq0g;

    .line 128
    invoke-direct {v0, p1}, Lq0g;-><init>(I)V

    .line 129
    iput-object v0, p0, Ls14;->c:Ljava/lang/Object;

    .line 130
    new-instance v0, Lq0g;

    .line 131
    invoke-direct {v0, p2}, Lq0g;-><init>(I)V

    .line 132
    iput-object v0, p0, Ls14;->d:Ljava/lang/Object;

    .line 133
    new-instance p2, Lo5c;

    invoke-direct {p2, p1}, Lo5c;-><init>(I)V

    iput-object p2, p0, Ls14;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lwf2;)V
    .registers 6

    const/16 v0, 0xd

    iput-byte v0, p0, Ls14;->a:B

    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 135
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Ls14;->f:Ljava/lang/Object;

    .line 136
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Ls14;->c:Ljava/lang/Object;

    .line 137
    sget-object v0, Lcom/opera/android/settings/UserSettingsContentProvider;->f:Landroid/content/UriMatcher;

    .line 138
    sget-object v0, Lvml;->d:Lumi;

    const-string v1, "user_settings"

    const/4 v2, 0x0

    new-array v2, v2, [Lbg1;

    invoke-static {p1, v0, v1, v2}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    .line 139
    iput-object p1, p0, Ls14;->d:Ljava/lang/Object;

    .line 140
    iput-object p2, p0, Ls14;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup;)V
    .registers 3

    const/16 v0, 0x9

    iput-byte v0, p0, Ls14;->a:B

    .line 148
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 149
    iput-object p1, p0, Ls14;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lbp;Lrhf;Lz13;Loo8;)V
    .registers 6

    const/16 v0, 0xb

    iput-byte v0, p0, Ls14;->a:B

    .line 209
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 210
    iput-object p1, p0, Ls14;->c:Ljava/lang/Object;

    iput-object p2, p0, Ls14;->d:Ljava/lang/Object;

    iput-object p3, p0, Ls14;->e:Ljava/lang/Object;

    iput-object p4, p0, Ls14;->f:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lc30;Ljava/util/List;Ljava/util/List;)V
    .registers 12

    const/16 v0, 0x10

    iput-byte v0, p0, Ls14;->a:B

    const/4 v4, 0x0

    const/16 v7, 0x10

    const/4 v3, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v5, p2

    move-object v6, p3

    .line 179
    invoke-direct/range {v1 .. v7}, Ls14;-><init>(Ljava/lang/Object;Ljava/lang/Object;ZLjava/util/List;Ljava/util/List;B)V

    return-void
.end method

.method public constructor <init>(Lcn8;Loj9;Lpql;Lr16;Z)V
    .registers 7

    const/4 v0, 0x0

    iput-byte v0, p0, Ls14;->a:B

    .line 161
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 162
    iput-object p1, p0, Ls14;->c:Ljava/lang/Object;

    .line 163
    iput-object p2, p0, Ls14;->d:Ljava/lang/Object;

    .line 164
    iput-object p3, p0, Ls14;->e:Ljava/lang/Object;

    .line 165
    iput-object p4, p0, Ls14;->f:Ljava/lang/Object;

    .line 166
    iput-boolean p5, p0, Ls14;->b:Z

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lbvl;Lr22;Lpde;Z)V
    .registers 8

    const/16 v0, 0xc

    iput-byte v0, p0, Ls14;->a:B

    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 111
    iput-object p2, p0, Ls14;->c:Ljava/lang/Object;

    .line 112
    iput-object p3, p0, Ls14;->d:Ljava/lang/Object;

    .line 113
    iput-object p4, p0, Ls14;->e:Ljava/lang/Object;

    .line 114
    iput-boolean p5, p0, Ls14;->b:Z

    .line 115
    new-instance p5, Lpde;

    new-instance v0, Lmnf;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1, v1, v1}, Lmnf;-><init>(IIII)V

    .line 116
    invoke-direct {p5, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 117
    iput-object p5, p0, Ls14;->f:Ljava/lang/Object;

    .line 118
    new-instance p5, Lnnf;

    invoke-direct {p5, p0, v1}, Lnnf;-><init>(Ls14;B)V

    new-instance v0, Lt7d;

    const/4 v1, 0x2

    invoke-direct {v0, p5, v1}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p4, p1, v0}, Lekc;->j(Lndc;Lf7f;)V

    .line 119
    invoke-interface {p2}, Lbvl;->getState()Lpde;

    move-result-object p2

    new-instance p4, Lnnf;

    const/4 p5, 0x1

    invoke-direct {p4, p0, p5}, Lnnf;-><init>(Ls14;B)V

    new-instance p5, Lt7d;

    invoke-direct {p5, p4, v1}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p2, p1, p5}, Lekc;->j(Lndc;Lf7f;)V

    .line 120
    iget-object p2, p3, Lr22;->b:Ljava/lang/Object;

    check-cast p2, Lpde;

    .line 121
    new-instance p3, Lnnf;

    invoke-direct {p3, p0, v1}, Lnnf;-><init>(Ls14;B)V

    new-instance p0, Lt7d;

    invoke-direct {p0, p3, v1}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p2, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public constructor <init>(Lgbf;Lgjm;Lcdn;ZLhv3;)V
    .registers 7

    const/16 v0, 0xa

    iput-byte v0, p0, Ls14;->a:B

    .line 193
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls14;->f:Ljava/lang/Object;

    .line 194
    iput-object p2, p0, Ls14;->c:Ljava/lang/Object;

    .line 195
    iput-object p3, p0, Ls14;->d:Ljava/lang/Object;

    .line 196
    iput-boolean p4, p0, Ls14;->b:Z

    .line 197
    iput-object p5, p0, Ls14;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lhi2;Ljava/lang/String;Lmgh;Lcom/opera/api/Callback;)V
    .registers 5

    const/4 p2, 0x2

    iput-byte p2, p0, Ls14;->a:B

    .line 198
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls14;->f:Ljava/lang/Object;

    .line 199
    iput-object p3, p0, Ls14;->d:Ljava/lang/Object;

    .line 200
    iput-object p4, p0, Ls14;->c:Ljava/lang/Object;

    const/4 p1, 0x0

    .line 201
    invoke-virtual {p0, p1}, Ls14;->s(Lorb;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/File;Lumi;Lonn;)V
    .registers 6

    const/16 v0, 0x16

    iput-byte v0, p0, Ls14;->a:B

    .line 202
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 203
    new-instance v0, Lkze;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 204
    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 205
    iput-object v0, p0, Ls14;->f:Ljava/lang/Object;

    .line 206
    iput-object p1, p0, Ls14;->c:Ljava/lang/Object;

    .line 207
    iput-object p2, p0, Ls14;->d:Ljava/lang/Object;

    .line 208
    iput-object p3, p0, Ls14;->e:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;ZLjava/util/List;Ljava/util/List;B)V
    .registers 7

    .line 96
    iput-byte p6, p0, Ls14;->a:B

    iput-object p1, p0, Ls14;->c:Ljava/lang/Object;

    iput-object p2, p0, Ls14;->d:Ljava/lang/Object;

    iput-boolean p3, p0, Ls14;->b:Z

    iput-object p4, p0, Ls14;->e:Ljava/lang/Object;

    iput-object p5, p0, Ls14;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lkze;Ltjg;Lpde;)V
    .registers 6

    const/16 v0, 0xe

    iput-byte v0, p0, Ls14;->a:B

    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    iput-object p1, p0, Ls14;->c:Ljava/lang/Object;

    .line 105
    iput-object p2, p0, Ls14;->d:Ljava/lang/Object;

    .line 106
    iput-object p3, p0, Ls14;->e:Ljava/lang/Object;

    .line 107
    new-instance p2, Lsjg;

    const/4 v0, 0x6

    const/4 v1, 0x0

    invoke-direct {p2, v0, v1}, Lsjg;-><init>(ILandroidx/media3/ui/PlayerView;)V

    iput-object p2, p0, Ls14;->f:Ljava/lang/Object;

    .line 108
    new-instance p2, Ld8d;

    const/16 v0, 0x17

    invoke-direct {p2, p0, v0}, Ld8d;-><init>(Ljava/lang/Object;B)V

    invoke-static {p3, p1, p2}, La26;->T(Lekc;Likc;Lf7f;)V

    .line 109
    new-instance p2, Lo5f;

    const/16 p3, 0x1c

    invoke-direct {p2, p0, p3}, Lo5f;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Liwa;

    const/16 p3, 0x11

    invoke-direct {p0, p2, p3}, Liwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method

.method public constructor <init>(Lm3c;)V
    .registers 3

    const/16 v0, 0xf

    iput-byte v0, p0, Ls14;->a:B

    .line 141
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls14;->c:Ljava/lang/Object;

    .line 142
    new-instance v0, Llea;

    .line 143
    iget-object p1, p1, Lm3c;->F:Ltah;

    .line 144
    iget-object p1, p1, Ltah;->b:Ljava/lang/Object;

    check-cast p1, Lj8b;

    .line 145
    invoke-direct {v0, p1}, Llea;-><init>(Lb2c;)V

    iput-object v0, p0, Ls14;->d:Ljava/lang/Object;

    .line 146
    new-instance p1, Llld;

    const/16 v0, 0xd

    invoke-direct {p1, v0}, Llld;-><init>(B)V

    iput-object p1, p0, Ls14;->e:Ljava/lang/Object;

    .line 147
    new-instance p1, Loea;

    invoke-direct {p1}, Loea;-><init>()V

    iput-object p1, p0, Ls14;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lode;Likc;Lode;Lode;Lode;Lbml;Ly0a;)V
    .registers 25

    move-object/from16 v0, p0

    const/16 v1, 0x8

    iput-byte v1, v0, Ls14;->a:B

    .line 180
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 181
    new-instance v3, Ldf5;

    invoke-direct {v3, v0}, Ldf5;-><init>(Ls14;)V

    .line 182
    new-instance v1, Lwnm;

    const/4 v2, 0x5

    .line 183
    new-array v2, v2, [Lekc;

    const/4 v4, 0x0

    aput-object p1, v2, v4

    const/4 v4, 0x1

    aput-object p2, v2, v4

    const/4 v4, 0x2

    aput-object p3, v2, v4

    const/4 v4, 0x3

    aput-object p4, v2, v4

    const/4 v4, 0x4

    aput-object p5, v2, v4

    .line 184
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 185
    move-object v9, v2

    check-cast v9, Ljava/lang/Iterable;

    .line 186
    new-instance v10, Ln12;

    const/16 v16, 0x2

    move-object/from16 v11, p1

    move-object/from16 v12, p2

    move-object/from16 v13, p3

    move-object/from16 v14, p4

    move-object/from16 v15, p5

    invoke-direct/range {v10 .. v16}, Ln12;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    .line 187
    new-instance v2, Lkkc;

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    invoke-direct/range {v2 .. v8}, Lkkc;-><init>(Ler9;Lekc;Likc;Lekc;Lekc;Lekc;)V

    const/4 v3, 0x0

    .line 188
    invoke-direct {v1, v3, v9, v10, v2}, Lwnm;-><init>(Ljava/lang/Object;Ljava/lang/Iterable;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    .line 189
    iput-object v1, v0, Ls14;->c:Ljava/lang/Object;

    move-object/from16 v1, p6

    .line 190
    iput-object v1, v0, Ls14;->d:Ljava/lang/Object;

    .line 191
    new-instance v1, Lks6;

    const/16 v2, 0x1b

    invoke-direct {v1, v0, v2}, Lks6;-><init>(Ljava/lang/Object;B)V

    iput-object v1, v0, Ls14;->e:Ljava/lang/Object;

    move-object/from16 v1, p7

    .line 192
    iput-object v1, v0, Ls14;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lokhttp3/internal/connection/RealCall;Lnc9;Lxe9;Lpe9;)V
    .registers 6

    const/4 v0, 0x6

    iput-byte v0, p0, Ls14;->a:B

    .line 211
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 212
    iput-object p1, p0, Ls14;->f:Ljava/lang/Object;

    .line 213
    iput-object p2, p0, Ls14;->c:Ljava/lang/Object;

    .line 214
    iput-object p3, p0, Ls14;->d:Ljava/lang/Object;

    .line 215
    iput-object p4, p0, Ls14;->e:Ljava/lang/Object;

    .line 216
    invoke-interface {p1, p0}, Lv84;->enqueue(Lf94;)V

    return-void
.end method

.method public constructor <init>(Lqln;Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 7

    const/16 v0, 0x17

    iput-byte v0, p0, Ls14;->a:B

    .line 167
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 168
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ls14;->e:Ljava/lang/Object;

    .line 169
    iput-object p1, p0, Ls14;->c:Ljava/lang/Object;

    const/4 v0, 0x0

    if-eqz p3, :cond_1b

    .line 170
    new-instance p1, Lmcj;

    invoke-direct {p1, p0, p3, v0}, Lmcj;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    iput-object p1, p0, Ls14;->d:Ljava/lang/Object;

    goto :goto_3a

    :cond_1b
    if-eqz p4, :cond_31

    .line 171
    new-instance p3, Lh5k;

    invoke-static {p4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p4

    .line 172
    invoke-direct {p3}, Ljava/lang/Object;-><init>()V

    .line 173
    iput-object p4, p3, Lh5k;->b:Ljava/lang/Object;

    .line 174
    iput-object p2, p3, Lh5k;->c:Ljava/lang/Object;

    .line 175
    iput-object p1, p3, Lh5k;->d:Ljava/lang/Object;

    .line 176
    iput-boolean p5, p3, Lh5k;->a:Z

    .line 177
    iput-object p3, p0, Ls14;->d:Ljava/lang/Object;

    goto :goto_3a

    .line 178
    :cond_31
    new-instance p1, Lmcj;

    const-string p2, ""

    invoke-direct {p1, p0, p2, v0}, Lmcj;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    iput-object p1, p0, Ls14;->d:Ljava/lang/Object;

    :goto_3a
    return-void
.end method

.method public constructor <init>(Ltpg;Loqg;Lp8f;ZLjava/util/List;)V
    .registers 7

    const/16 v0, 0x14

    iput-byte v0, p0, Ls14;->a:B

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    iput-object p1, p0, Ls14;->c:Ljava/lang/Object;

    .line 99
    iput-object p2, p0, Ls14;->d:Ljava/lang/Object;

    .line 100
    iput-object p3, p0, Ls14;->e:Ljava/lang/Object;

    .line 101
    iput-boolean p4, p0, Ls14;->b:Z

    .line 102
    iput-object p5, p0, Ls14;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lylh;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Ls14;->a:B

    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 123
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Ls14;->c:Ljava/lang/Object;

    .line 124
    new-instance v0, Lxa1;

    invoke-direct {v0, p0, p1}, Lxa1;-><init>(Ls14;Lylh;)V

    iput-object v0, p0, Ls14;->d:Ljava/lang/Object;

    .line 125
    new-instance p1, Lya1;

    invoke-direct {p1, p0}, Lya1;-><init>(Ls14;)V

    iput-object p1, p0, Ls14;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lywh;Lg77;)V
    .registers 5

    const/4 v0, 0x5

    iput-byte v0, p0, Ls14;->a:B

    .line 150
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 151
    iput-object p1, p0, Ls14;->c:Ljava/lang/Object;

    .line 152
    iget-object p1, p2, Lg77;->a:Ljava/lang/Object;

    check-cast p1, Ljava/net/URL;

    .line 153
    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    .line 154
    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/net/URL;->getAuthority()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/net/Uri$Builder;->encodedAuthority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v1, "v1/localnews"

    .line 155
    invoke-virtual {p1, v1}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v1, "city/search"

    .line 156
    invoke-virtual {p1, v1}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 157
    iput-object v0, p0, Ls14;->d:Ljava/lang/Object;

    .line 158
    iget-object p1, p2, Lg77;->b:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Ls14;->e:Ljava/lang/Object;

    .line 159
    iget-object p2, p2, Lg77;->c:Ljava/lang/Object;

    check-cast p2, Ljava/lang/String;

    iput-object p2, p0, Ls14;->f:Ljava/lang/Object;

    .line 160
    const-string p2, "us"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    iput-boolean p1, p0, Ls14;->b:Z

    return-void
.end method

.method public constructor <init>(ZLt17;)V
    .registers 4

    const/16 v0, 0x13

    iput-byte v0, p0, Ls14;->a:B

    .line 217
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ls14;->b:Z

    iput-object p2, p0, Ls14;->c:Ljava/lang/Object;

    const/4 p1, 0x0

    .line 218
    invoke-static {p1}, Lui6;->a(F)Lcd1;

    move-result-object p1

    iput-object p1, p0, Ls14;->d:Ljava/lang/Object;

    .line 219
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Ls14;->e:Ljava/lang/Object;

    return-void
.end method

.method public static y()Ls14;
    .registers 3

    sget-object v0, Ls14;->h:Ls14;

    if-nez v0, :cond_1d

    new-instance v0, Ls14;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ls14;-><init>(B)V

    sput-object v0, Ls14;->h:Ls14;

    new-instance v1, Ljw4;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2}, Ljw4;-><init>(Ls14;B)V

    const/4 v0, 0x7

    invoke-static {v0, v1}, Lorg/chromium/base/task/PostTask;->c(ILjava/lang/Runnable;)V

    new-instance v0, Lsv2;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lx8;->b:Lsv2;

    :cond_1d
    sget-object v0, Ls14;->h:Ls14;

    return-object v0
.end method


# virtual methods
.method public final A(I)Z
    .registers 2

    invoke-virtual {p0, p1}, Ls14;->z(I)Landroid/view/ViewParent;

    move-result-object p0

    if-eqz p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final B(Ljava/lang/String;)Ljava/io/File;
    .registers 4

    new-instance v0, Ljava/io/File;

    iget-object p0, p0, Ls14;->c:Ljava/lang/Object;

    check-cast p0, Ljava/io/File;

    const-string v1, ".json"

    invoke-static {p1, v1}, Lsko;->u(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public final C()V
    .registers 4

    iget-object v0, p0, Ls14;->f:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-boolean v1, p0, Ls14;->b:Z

    if-eqz v1, :cond_9

    monitor-exit v0

    return-void

    :cond_9
    const/4 v1, 0x1

    iput-boolean v1, p0, Ls14;->b:Z

    iget-object p0, p0, Ls14;->e:Ljava/lang/Object;

    check-cast p0, Lwf2;

    const-string v1, "fake_key"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lwf2;->getInt(Ljava/lang/String;I)I

    monitor-exit v0

    return-void

    :goto_18
    monitor-exit v0
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_1a

    throw p0

    :catchall_1a
    move-exception p0

    goto :goto_18
.end method

.method public final D(Lorg/chromium/base/Callback;Ljava/lang/Object;)V
    .registers 3

    if-eqz p1, :cond_e

    iget-object p0, p0, Ls14;->f:Ljava/lang/Object;

    check-cast p0, Landroid/os/Handler;

    invoke-interface {p1, p2}, Lorg/chromium/base/Callback;->a(Ljava/lang/Object;)Lbi2;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_e
    new-instance p0, Le22;

    check-cast p2, Ljava/lang/Throwable;

    invoke-direct {p0, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p0
.end method

.method public final E(Ljava/lang/String;)V
    .registers 4

    new-instance v0, Loc9;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Loc9;-><init>(Ls14;Ljava/lang/String;B)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final F(Lk5o;Lv31;Z)I
    .registers 20

    move-object/from16 v1, p0

    iget-object v0, v1, Ls14;->d:Ljava/lang/Object;

    check-cast v0, Llea;

    iget-object v2, v1, Ls14;->f:Ljava/lang/Object;

    move-object v6, v2

    check-cast v6, Loea;

    iget-boolean v2, v1, Ls14;->b:Z

    const/4 v9, 0x0

    if-eqz v2, :cond_11

    return v9

    :cond_11
    const/4 v2, 0x1

    :try_start_12
    iput-boolean v2, v1, Ls14;->b:Z

    iget-object v3, v1, Ls14;->e:Ljava/lang/Object;

    check-cast v3, Llld;

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    invoke-virtual {v3, v4, v5}, Llld;->m0(Lk5o;Lv31;)Lrn9;

    move-result-object v10

    iget-object v3, v10, Lrn9;->c:Ljava/lang/Object;

    move-object v11, v3

    check-cast v11, Lj1d;

    invoke-virtual {v11}, Lj1d;->j()I

    move-result v3

    move v4, v9

    :goto_2a
    if-ge v4, v3, :cond_3f

    invoke-virtual {v11, v4}, Lj1d;->k(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Llmg;

    iget-boolean v7, v5, Llmg;->d:Z

    if-nez v7, :cond_3d

    iget-boolean v5, v5, Llmg;->h:Z

    if-nez v5, :cond_3d

    add-int/lit8 v4, v4, 0x1

    goto :goto_2a

    :cond_3d
    move v12, v9

    goto :goto_40

    :cond_3f
    move v12, v2

    :goto_40
    invoke-virtual {v11}, Lj1d;->j()I

    move-result v13

    move v14, v9

    :goto_45
    if-ge v14, v13, :cond_79

    invoke-virtual {v11, v14}, Lj1d;->k(I)Ljava/lang/Object;

    move-result-object v3

    move-object v15, v3

    check-cast v15, Llmg;

    if-nez v12, :cond_56

    invoke-static {v15}, Lwxe;->k(Llmg;)Z

    move-result v3

    if-eqz v3, :cond_76

    :cond_56
    iget-object v3, v1, Ls14;->c:Ljava/lang/Object;

    check-cast v3, Lm3c;

    iget-wide v4, v15, Llmg;->c:J

    iget-byte v7, v15, Llmg;->i:B

    const/4 v8, 0x1

    invoke-virtual/range {v3 .. v8}, Lm3c;->A(JLoea;IZ)V

    iget-object v3, v6, Loea;->a:Ldee;

    invoke-virtual {v3}, Ldee;->i()Z

    move-result v3

    if-nez v3, :cond_76

    iget-wide v3, v15, Llmg;->a:J

    invoke-static {v15}, Lwxe;->k(Llmg;)Z

    move-result v5

    invoke-virtual {v0, v6, v5, v3, v4}, Llea;->a(Ljava/util/List;ZJ)V

    invoke-virtual {v6}, Loea;->clear()V

    :cond_76
    add-int/lit8 v14, v14, 0x1

    goto :goto_45

    :cond_79
    move/from16 v3, p3

    invoke-virtual {v0, v10, v3}, Llea;->b(Lrn9;Z)Z

    move-result v0

    iget-boolean v3, v10, Lrn9;->b:Z

    if-nez v3, :cond_a7

    invoke-virtual {v11}, Lj1d;->j()I

    move-result v3

    move v4, v9

    :goto_88
    if-ge v4, v3, :cond_a7

    invoke-virtual {v11, v4}, Lj1d;->k(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Llmg;

    invoke-static {v5, v2}, Lwxe;->T(Llmg;Z)J

    move-result-wide v6

    const-wide/16 v12, 0x0

    invoke-static {v6, v7, v12, v13}, Ly8f;->b(JJ)Z

    move-result v6

    if-nez v6, :cond_a4

    invoke-virtual {v5}, Llmg;->c()Z

    move-result v5

    if-eqz v5, :cond_a4

    move v3, v2

    goto :goto_a8

    :cond_a4
    add-int/lit8 v4, v4, 0x1

    goto :goto_88

    :cond_a7
    move v3, v9

    :goto_a8
    invoke-virtual {v11}, Lj1d;->j()I

    move-result v4

    move v5, v9

    :goto_ad
    if-ge v5, v4, :cond_c0

    invoke-virtual {v11, v5}, Lj1d;->k(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Llmg;

    invoke-virtual {v6}, Llmg;->c()Z

    move-result v6
    :try_end_b9
    .catchall {:try_start_12 .. :try_end_b9} :catchall_c9

    if-eqz v6, :cond_bd

    move v4, v2

    goto :goto_c1

    :cond_bd
    add-int/lit8 v5, v5, 0x1

    goto :goto_ad

    :cond_c0
    move v4, v9

    :goto_c1
    shl-int/2addr v3, v2

    or-int/2addr v0, v3

    shl-int/lit8 v4, v4, 0x2

    or-int/2addr v0, v4

    iput-boolean v9, v1, Ls14;->b:Z

    return v0

    :catchall_c9
    move-exception v0

    iput-boolean v9, v1, Ls14;->b:Z

    throw v0
.end method

.method public final G(Ljava/lang/Runnable;)V
    .registers 6

    iget-object v0, p0, Ls14;->d:Ljava/lang/Object;

    check-cast v0, Lumi;

    new-instance v1, Lr2n;

    const/16 v2, 0xd

    invoke-direct {v1, p0, v2}, Lr2n;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v1

    new-instance v2, Lroj;

    const/16 v3, 0x10

    invoke-direct {v2, p0, p1, v3}, Lroj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {v1, p0}, Lnml;->b(Lnml;)V

    const/4 p0, 0x0

    invoke-virtual {v1, p0}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final H(Landroid/content/ContentResolver;Landroid/net/Uri;IZ)Lkln;
    .registers 27

    move-object/from16 v1, p0

    move/from16 v0, p3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    const-string v3, "_"

    if-eqz p4, :cond_28

    sget-object v4, Lf8a;->e:Lf8a;

    invoke-virtual/range {p2 .. p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lf8a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "FILE_storefront_wallpaper_"

    invoke-static {v5, v4}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "storefront_image_"

    invoke-static {v6, v4}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :goto_26
    move-object v7, v5

    goto :goto_51

    :cond_28
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "FILE_user_wallpaper_"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, "user_image_"

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_26

    :goto_51
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    new-instance v2, Ljava/io/File;

    iget-object v0, v1, Ls14;->c:Ljava/lang/Object;

    check-cast v0, Ljava/io/File;

    invoke-direct {v2, v0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static/range {p2 .. p2}, Lwqm;->D(Landroid/net/Uri;)Z

    move-result v0

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v11, 0x0

    if-eqz v0, :cond_e9

    sget-object v0, Lxne;->b:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    new-instance v5, Lfvh;

    invoke-direct {v5}, Lfvh;-><init>()V

    invoke-virtual/range {p2 .. p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lfvh;->h(Ljava/lang/String;)V

    new-instance v6, Lkvh;

    invoke-direct {v6, v5}, Lkvh;-><init>(Lfvh;)V

    new-instance v5, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v5, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    invoke-virtual {v0, v6}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object v12

    new-instance v13, Liln;

    invoke-direct {v13, v2, v5, v4}, Liln;-><init>(Ljava/io/File;Ljava/util/concurrent/atomic/AtomicBoolean;B)V

    new-instance v14, Liln;

    invoke-direct {v14, v2, v5, v3}, Liln;-><init>(Ljava/io/File;Ljava/util/concurrent/atomic/AtomicBoolean;B)V

    sget-object v0, Lvn7;->a:[I

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v6}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    aget v0, v0, v6

    packed-switch v0, :pswitch_data_1f8

    invoke-static {}, Lh9o;->p()V

    return-object v11

    :pswitch_b2
    sget-object v0, Lun7;->h:Lun7;

    :goto_b4
    move-object/from16 p3, v11

    move-object/from16 p1, v12

    goto :goto_cb

    :pswitch_b9
    sget-object v0, Lun7;->g:Lun7;

    goto :goto_b4

    :pswitch_bc
    sget-object v0, Lun7;->f:Lun7;

    goto :goto_b4

    :pswitch_bf
    sget-object v0, Lun7;->e:Lun7;

    goto :goto_b4

    :pswitch_c2
    sget-object v0, Lun7;->d:Lun7;

    goto :goto_b4

    :pswitch_c5
    sget-object v0, Lun7;->c:Lun7;

    goto :goto_b4

    :pswitch_c8
    sget-object v0, Lun7;->b:Lun7;

    goto :goto_b4

    :goto_cb
    const-wide/16 v11, 0x1e

    invoke-static {v11, v12, v0}, Lcs5;->y0(JLun7;)J

    move-result-wide v16

    const-wide/16 v10, 0x1

    invoke-static {v10, v11, v0}, Lcs5;->y0(JLun7;)J

    move-result-wide v18

    const-wide/16 v10, 0xa

    invoke-static {v10, v11, v0}, Lcs5;->y0(JLun7;)J

    move-result-wide v20

    const/4 v15, 0x4

    move-object/from16 v12, p1

    invoke-static/range {v12 .. v21}, Lvtp;->Q(Lokhttp3/internal/connection/RealCall;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;IJJJ)Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    goto/16 :goto_161

    :cond_e9
    move-object/from16 p3, v11

    invoke-virtual/range {p2 .. p2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v5, "opera-aria"

    invoke-static {v0, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_111

    invoke-virtual/range {p2 .. p2}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    const-string v5, "images"

    invoke-static {v0, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_111

    invoke-virtual/range {p2 .. p2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_111

    const-string v5, ".webp"

    invoke-static {v0, v5}, Lkotlin/text/StringsKt;->U(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-ne v0, v6, :cond_114

    :cond_111
    move-object/from16 v5, p3

    goto :goto_12a

    :cond_114
    const-string v0, "/"

    invoke-static {v6, v0}, Lkotlin/text/StringsKt;->T(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v6, Lsnf;->c:Ljava/lang/String;

    invoke-static {v0, v5}, Lsko;->u(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v5, Ljava/io/File;

    new-instance v8, Ljava/io/File;

    invoke-direct {v8, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v8, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :goto_12a
    if-eqz v5, :cond_131

    invoke-static {v5, v2}, Ls29;->b(Ljava/io/File;Ljava/io/File;)Z

    move-result v0

    goto :goto_161

    :cond_131
    :try_start_131
    invoke-virtual/range {p1 .. p2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v5
    :try_end_135
    .catch Ljava/io/IOException; {:try_start_131 .. :try_end_135} :catch_15d

    :try_start_135
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_13a
    .catchall {:try_start_135 .. :try_end_13a} :catchall_150

    :try_start_13a
    invoke-static {v5, v6}, Ls29;->a(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_13d
    .catchall {:try_start_13a .. :try_end_13d} :catchall_145

    :try_start_13d
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V
    :try_end_140
    .catchall {:try_start_13d .. :try_end_140} :catchall_150

    :try_start_140
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_143
    .catch Ljava/io/IOException; {:try_start_140 .. :try_end_143} :catch_15d

    move v0, v3

    goto :goto_161

    :catchall_145
    move-exception v0

    move-object v8, v0

    :try_start_147
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V
    :try_end_14a
    .catchall {:try_start_147 .. :try_end_14a} :catchall_14b

    goto :goto_14f

    :catchall_14b
    move-exception v0

    :try_start_14c
    invoke-virtual {v8, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_14f
    throw v8
    :try_end_150
    .catchall {:try_start_14c .. :try_end_150} :catchall_150

    :catchall_150
    move-exception v0

    move-object v6, v0

    if-eqz v5, :cond_15c

    :try_start_154
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_157
    .catchall {:try_start_154 .. :try_end_157} :catchall_158

    goto :goto_15c

    :catchall_158
    move-exception v0

    :try_start_159
    invoke-virtual {v6, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_15c
    :goto_15c
    throw v6
    :try_end_15d
    .catch Ljava/io/IOException; {:try_start_159 .. :try_end_15d} :catch_15d

    :catch_15d
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move v0, v4

    :goto_161
    if-nez v0, :cond_164

    return-object p3

    :cond_164
    if-eqz p4, :cond_16c

    invoke-virtual/range {p2 .. p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v10, v0

    goto :goto_16e

    :cond_16c
    move-object/from16 v10, p3

    :goto_16e
    sget-object v0, Ljkn;->b:Landroid/graphics/Bitmap$Config;

    new-instance v5, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v5}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    iput-object v0, v5, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    iput-boolean v3, v5, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v5}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    iput-boolean v4, v5, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    iget v3, v5, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    const/16 v6, 0x3d

    if-gt v3, v6, :cond_18c

    iget v8, v5, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-le v8, v6, :cond_1a2

    :cond_18c
    int-to-float v3, v3

    const/high16 v6, 0x42740000    # 61.0f

    div-float/2addr v3, v6

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    iget v8, v5, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    int-to-float v8, v8

    div-float/2addr v8, v6

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v6

    invoke-static {v3, v6}, Ljava/lang/Math;->min(II)I

    move-result v3

    iput v3, v5, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    :cond_1a2
    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v5}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v3

    if-nez v3, :cond_1af

    move-object/from16 v0, p3

    goto :goto_1b8

    :cond_1af
    invoke-static {v3, v0}, Ljkn;->d(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-eq v0, v3, :cond_1b8

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->recycle()V

    :cond_1b8
    :goto_1b8
    if-eqz v0, :cond_1c8

    new-instance v3, Lsa2;

    invoke-static {v0}, Ljkn;->b(Landroid/graphics/Bitmap;)Likn;

    move-result-object v0

    iget v0, v0, Likn;->a:I

    const/16 v5, 0x15

    invoke-direct {v3, v5, v0, v4}, Lsa2;-><init>(BIZ)V

    goto :goto_1ca

    :cond_1c8
    move-object/from16 v3, p3

    :goto_1ca
    if-nez v3, :cond_1cf

    move-object/from16 v5, p3

    goto :goto_1da

    :cond_1cf
    new-instance v5, Lkln;

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    iget v6, v3, Lsa2;->b:I

    invoke-direct/range {v5 .. v10}, Lkln;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_1da
    if-nez v5, :cond_1df

    :goto_1dc
    move-object/from16 v11, p3

    goto :goto_1f6

    :cond_1df
    invoke-virtual {v1, v7}, Ls14;->B(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    :try_start_1e3
    invoke-virtual {v5}, Lkln;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-static {v0, v1}, Ls29;->j(Ljava/io/File;[B)V
    :try_end_1f0
    .catch Ljava/io/IOException; {:try_start_1e3 .. :try_end_1f0} :catch_1f2

    move-object v11, v5

    goto :goto_1f6

    :catch_1f2
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    goto :goto_1dc

    :goto_1f6
    return-object v11

    nop

    :pswitch_data_1f8
    .packed-switch 0x1
        :pswitch_c8
        :pswitch_c5
        :pswitch_c2
        :pswitch_bf
        :pswitch_bc
        :pswitch_b9
        :pswitch_b2
    .end packed-switch
.end method

.method public final declared-synchronized I()V
    .registers 3

    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Ls14;->b:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_29

    if-eqz v0, :cond_7

    monitor-exit p0

    return-void

    :cond_7
    const/4 v0, 0x1

    :try_start_8
    iput-boolean v0, p0, Ls14;->b:Z

    iget-object v0, p0, Ls14;->f:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    if-eqz v0, :cond_1e

    iget-object v1, p0, Ls14;->d:Ljava/lang/Object;

    check-cast v1, Lxa1;

    invoke-virtual {v1, v0}, Lxa1;->a(Landroid/content/Context;)V

    iget-object v1, p0, Ls14;->e:Ljava/lang/Object;

    check-cast v1, Lya1;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    :cond_1e
    iget-object v0, p0, Ls14;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->clear()V
    :try_end_25
    .catchall {:try_start_8 .. :try_end_25} :catchall_29

    monitor-exit p0

    return-void

    :goto_27
    :try_start_27
    monitor-exit p0
    :try_end_28
    .catchall {:try_start_27 .. :try_end_28} :catchall_29

    throw v0

    :catchall_29
    move-exception v0

    goto :goto_27
.end method

.method public final J(II)Z
    .registers 10

    iget-object v0, p0, Ls14;->e:Ljava/lang/Object;

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {p0, p2}, Ls14;->A(I)Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_4a

    iget-boolean v1, p0, Ls14;->b:Z

    const/4 v3, 0x0

    if-eqz v1, :cond_57

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    move-object v4, v0

    :goto_15
    if-eqz v1, :cond_57

    instance-of v5, v1, Llle;

    if-eqz v5, :cond_23

    move-object v6, v1

    check-cast v6, Llle;

    invoke-interface {v6, v4, v0, p1, p2}, Llle;->k(Landroid/view/View;Landroid/view/View;II)Z

    move-result v6

    goto :goto_2e

    :cond_23
    if-nez p2, :cond_2d

    :try_start_25
    invoke-interface {v1, v4, v0, p1}, Landroid/view/ViewParent;->onStartNestedScroll(Landroid/view/View;Landroid/view/View;I)Z

    move-result v6
    :try_end_29
    .catch Ljava/lang/AbstractMethodError; {:try_start_25 .. :try_end_29} :catch_2a

    goto :goto_2e

    :catch_2a
    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    :cond_2d
    move v6, v3

    :goto_2e
    if-eqz v6, :cond_4b

    if-eqz p2, :cond_37

    if-ne p2, v2, :cond_39

    iput-object v1, p0, Ls14;->d:Ljava/lang/Object;

    goto :goto_39

    :cond_37
    iput-object v1, p0, Ls14;->c:Ljava/lang/Object;

    :cond_39
    :goto_39
    if-eqz v5, :cond_41

    check-cast v1, Llle;

    invoke-interface {v1, v4, v0, p1, p2}, Llle;->d(Landroid/view/View;Landroid/view/View;II)V

    goto :goto_4a

    :cond_41
    if-nez p2, :cond_4a

    :try_start_43
    invoke-interface {v1, v4, v0, p1}, Landroid/view/ViewParent;->onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;I)V
    :try_end_46
    .catch Ljava/lang/AbstractMethodError; {:try_start_43 .. :try_end_46} :catch_47

    goto :goto_4a

    :catch_47
    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    :cond_4a
    :goto_4a
    return v2

    :cond_4b
    instance-of v5, v1, Landroid/view/View;

    if-eqz v5, :cond_52

    move-object v4, v1

    check-cast v4, Landroid/view/View;

    :cond_52
    invoke-interface {v1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    goto :goto_15

    :cond_57
    return v3
.end method

.method public final K(I)V
    .registers 5

    invoke-virtual {p0, p1}, Ls14;->z(I)Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_28

    iget-object v1, p0, Ls14;->e:Ljava/lang/Object;

    check-cast v1, Landroid/view/ViewGroup;

    instance-of v2, v0, Llle;

    if-eqz v2, :cond_14

    check-cast v0, Llle;

    invoke-interface {v0, p1, v1}, Llle;->b(ILandroid/view/View;)V

    goto :goto_1d

    :cond_14
    if-nez p1, :cond_1d

    :try_start_16
    invoke-interface {v0, v1}, Landroid/view/ViewParent;->onStopNestedScroll(Landroid/view/View;)V
    :try_end_19
    .catch Ljava/lang/AbstractMethodError; {:try_start_16 .. :try_end_19} :catch_1a

    goto :goto_1d

    :catch_1a
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    :cond_1d
    :goto_1d
    const/4 v0, 0x0

    if-eqz p1, :cond_26

    const/4 v1, 0x1

    if-ne p1, v1, :cond_28

    iput-object v0, p0, Ls14;->d:Ljava/lang/Object;

    goto :goto_28

    :cond_26
    iput-object v0, p0, Ls14;->c:Ljava/lang/Object;

    :cond_28
    :goto_28
    return-void
.end method

.method public final L(Lorg/chromium/base/Callback;)V
    .registers 5

    iget-object v0, p0, Ls14;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    iget-boolean v1, p0, Ls14;->b:Z

    const/4 v2, 0x1

    if-ne v1, v2, :cond_f

    iget-object v1, p0, Ls14;->c:Ljava/lang/Object;

    invoke-virtual {p0, p1, v1}, Ls14;->D(Lorg/chromium/base/Callback;Ljava/lang/Object;)V

    goto :goto_18

    :cond_f
    if-nez v1, :cond_18

    iget-object v1, p0, Ls14;->d:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_18
    :goto_18
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_26

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_26

    return-void

    :cond_26
    iget-boolean p1, p0, Ls14;->b:Z

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-ne p1, v1, :cond_30

    invoke-virtual {p0, v2, v2}, Ls14;->D(Lorg/chromium/base/Callback;Ljava/lang/Object;)V

    return-void

    :cond_30
    if-nez p1, :cond_35

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_35
    return-void
.end method

.method public final M()V
    .registers 8

    iget-byte v0, p0, Ls14;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_c8

    iget-object v0, p0, Ls14;->f:Ljava/lang/Object;

    check-cast v0, Lsjg;

    iget-object v3, p0, Ls14;->d:Ljava/lang/Object;

    check-cast v3, Ltjg;

    iget-object v4, p0, Ls14;->c:Ljava/lang/Object;

    check-cast v4, Lkze;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lpg;

    sget-object v5, Lng;->a:Lng;

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_61

    iget-object v1, p0, Ls14;->e:Ljava/lang/Object;

    check-cast v1, Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_33

    const/4 v1, 0x7

    goto :goto_34

    :cond_33
    const/4 v1, 0x6

    :goto_34
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v4, v0, Lsjg;->a:I

    if-eq v1, v4, :cond_57

    iput v1, v0, Lsjg;->a:I

    iget-object v1, v3, Ltjg;->w:Lsjg;

    if-ne v0, v1, :cond_57

    iget-object v1, v3, Ltjg;->q:Li7f;

    invoke-static {v1, v1}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v1

    :goto_47
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_57

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lrjg;

    invoke-interface {v4}, Lrjg;->e()V

    goto :goto_47

    :cond_57
    iget-boolean v1, p0, Ls14;->b:Z

    if-nez v1, :cond_76

    iput-boolean v2, p0, Ls14;->b:Z

    invoke-virtual {v3, v0, v2}, Ltjg;->b(Lsjg;Z)V

    goto :goto_76

    :cond_61
    sget-object v2, Log;->a:Log;

    invoke-static {v4, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_73

    iget-boolean v2, p0, Ls14;->b:Z

    if-eqz v2, :cond_76

    iput-boolean v1, p0, Ls14;->b:Z

    invoke-virtual {v3, v0}, Ltjg;->j(Lsjg;)V

    goto :goto_76

    :cond_73
    invoke-static {}, Lh9o;->p()V

    :cond_76
    :goto_76
    return-void

    :pswitch_77
    iget-object v0, p0, Ls14;->f:Ljava/lang/Object;

    check-cast v0, Lpde;

    iget-object v3, p0, Ls14;->e:Ljava/lang/Object;

    check-cast v3, Lpde;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljzk;

    iget v4, v4, Ljzk;->a:I

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljzk;

    iget v3, v3, Ljzk;->b:I

    iget-object v5, p0, Ls14;->c:Ljava/lang/Object;

    check-cast v5, Lbvl;

    invoke-interface {v5}, Lbvl;->getState()Lpde;

    move-result-object v5

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lavl;

    iget-object v6, p0, Ls14;->d:Ljava/lang/Object;

    check-cast v6, Lr22;

    iget-object v6, v6, Lr22;->b:Ljava/lang/Object;

    check-cast v6, Lpde;

    invoke-virtual {v6}, Lekc;->g()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lnp3;

    iget-boolean p0, p0, Ls14;->b:Z

    if-eqz p0, :cond_b4

    iget-byte p0, v5, Lavl;->e:B

    if-ne p0, v2, :cond_b4

    move v1, v2

    :cond_b4
    new-instance p0, Lmnf;

    if-eqz v1, :cond_ba

    move v1, v4

    goto :goto_bd

    :cond_ba
    iget v1, v5, Lavl;->c:I

    add-int/2addr v1, v4

    :goto_bd
    iget v2, v6, Lnp3;->b:I

    add-int/2addr v2, v3

    invoke-direct {p0, v1, v2, v4, v3}, Lmnf;-><init>(IIII)V

    invoke-static {v0, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void

    nop

    :pswitch_data_c8
    .packed-switch 0xc
        :pswitch_77
    .end packed-switch
.end method

.method public final N(II)V
    .registers 5

    int-to-float v0, p1

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-gez v0, :cond_1c

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Index should be non-negative ("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ld8b;->a(Ljava/lang/String;)V

    :cond_1c
    iget-object v0, p0, Ls14;->c:Ljava/lang/Object;

    check-cast v0, Lq0g;

    invoke-virtual {v0, p1}, Lq0g;->i(I)V

    iget-object v0, p0, Ls14;->f:Ljava/lang/Object;

    check-cast v0, Lo5c;

    invoke-virtual {v0, p1}, Lo5c;->b(I)V

    iget-object p0, p0, Ls14;->d:Ljava/lang/Object;

    check-cast p0, Lq0g;

    invoke-virtual {p0, p2}, Lq0g;->i(I)V

    return-void
.end method

.method public final a(Lezg;)V
    .registers 2

    iget-object p0, p0, Ls14;->e:Ljava/lang/Object;

    check-cast p0, Lwf2;

    invoke-virtual {p0, p1}, Lwf2;->a(Lezg;)V

    return-void
.end method

.method public final b(Ljava/lang/String;)Laln;
    .registers 2

    :try_start_0
    invoke-static {p1}, Lkln;->h(Ljava/lang/String;)Lkln;

    move-result-object p0
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_4} :catch_5

    return-object p0

    :catch_5
    const/4 p0, 0x0

    return-object p0
.end method

.method public final c()V
    .registers 1

    iget-object p0, p0, Ls14;->c:Ljava/lang/Object;

    check-cast p0, Lbp;

    invoke-virtual {p0}, Lbp;->W()V

    return-void
.end method

.method public final cancel()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Ls14;->b:Z

    iget-object p0, p0, Ls14;->f:Ljava/lang/Object;

    check-cast p0, Lokhttp3/internal/connection/RealCall;

    invoke-interface {p0}, Lv84;->cancel()V

    return-void
.end method

.method public final contains(Ljava/lang/String;)Z
    .registers 3

    sget-object v0, Lcom/opera/android/settings/UserSettingsContentProvider;->f:Landroid/content/UriMatcher;

    const-string v0, "previous_version_code"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    iget-object p0, p0, Ls14;->e:Ljava/lang/Object;

    check-cast p0, Lwf2;

    invoke-virtual {p0, p1}, Lwf2;->contains(Ljava/lang/String;)Z

    move-result p0

    return p0

    :cond_13
    invoke-virtual {p0}, Ls14;->C()V

    iget-object p0, p0, Ls14;->d:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public final d(Ljava/lang/String;)Z
    .registers 2

    iget-object p0, p0, Ls14;->e:Ljava/lang/Object;

    check-cast p0, Lwf2;

    invoke-virtual {p0, p1}, Lwf2;->d(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public final e(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    iget-object p0, p0, Ls14;->e:Ljava/lang/Object;

    check-cast p0, Lwf2;

    invoke-virtual {p0, p1, p2}, Lwf2;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final f(Ljava/lang/String;)Laln;
    .registers 2

    const/4 p0, 0x0

    return-object p0
.end method

.method public final g(Lcm;)V
    .registers 3

    iget-boolean v0, p0, Ls14;->b:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Ls14;->b:Z

    iget-object v0, p0, Ls14;->e:Ljava/lang/Object;

    check-cast v0, Lz13;

    invoke-virtual {v0}, Lz13;->f()V

    iget-object p0, p0, Ls14;->d:Ljava/lang/Object;

    check-cast p0, Lrhf;

    sget-object v0, Lv50;->n:Lv50;

    invoke-virtual {p0, p1, v0}, Lrn;->h(Lcm;Lv50;)V

    return-void
.end method

.method public final getInt(Ljava/lang/String;I)I
    .registers 4

    sget-object v0, Lcom/opera/android/settings/UserSettingsContentProvider;->f:Landroid/content/UriMatcher;

    const-string v0, "previous_version_code"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    iget-object p0, p0, Ls14;->e:Ljava/lang/Object;

    check-cast p0, Lwf2;

    invoke-virtual {p0, p1, p2}, Lwf2;->getInt(Ljava/lang/String;I)I

    move-result p0

    return p0

    :cond_13
    invoke-virtual {p0}, Ls14;->C()V

    iget-object p0, p0, Ls14;->d:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-static {p0, p1}, Lcom/opera/android/settings/UserSettingsContentProvider;->j(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_2b

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    return p0

    :cond_2b
    return p2
.end method

.method public final getLong(Ljava/lang/String;J)J
    .registers 5

    sget-object v0, Lcom/opera/android/settings/UserSettingsContentProvider;->f:Landroid/content/UriMatcher;

    const-string v0, "previous_version_code"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    iget-object p0, p0, Ls14;->e:Ljava/lang/Object;

    check-cast p0, Lwf2;

    invoke-virtual {p0, p1, p2, p3}, Lwf2;->getLong(Ljava/lang/String;J)J

    move-result-wide p0

    return-wide p0

    :cond_13
    invoke-virtual {p0}, Ls14;->C()V

    iget-object p0, p0, Ls14;->d:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-static {p0, p1}, Lcom/opera/android/settings/UserSettingsContentProvider;->j(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_2b

    invoke-interface {p0, p1, p2, p3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide p0

    return-wide p0

    :cond_2b
    return-wide p2
.end method

.method public final getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    sget-object v0, Lcom/opera/android/settings/UserSettingsContentProvider;->f:Landroid/content/UriMatcher;

    const-string v0, "previous_version_code"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    iget-object p0, p0, Ls14;->e:Ljava/lang/Object;

    check-cast p0, Lwf2;

    invoke-virtual {p0, p1, p2}, Lwf2;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_13
    invoke-virtual {p0}, Ls14;->C()V

    iget-object p0, p0, Ls14;->d:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-static {p0, p1}, Lcom/opera/android/settings/UserSettingsContentProvider;->j(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_2b

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2b
    return-object p2
.end method

.method public final h()Lpxh;
    .registers 4

    iget-object v0, p0, Ls14;->f:Ljava/lang/Object;

    check-cast v0, Ljava/util/AbstractList;

    iget-object v1, p0, Ls14;->d:Ljava/lang/Object;

    check-cast v1, Lm4l;

    iget-boolean p0, p0, Ls14;->b:Z

    if-eqz p0, :cond_15

    new-instance p0, Lrxh;

    const v0, 0x7f141254

    invoke-direct {p0, v0}, Lrxh;-><init>(I)V

    return-object p0

    :cond_15
    iget p0, v1, Lm4l;->a:I

    if-nez p0, :cond_1d

    const p0, 0x7f120048

    goto :goto_20

    :cond_1d
    const p0, 0x7f120047

    :goto_20
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1}, Lm4l;->c()Lpxh;

    move-result-object v1

    filled-new-array {v0, v1}, [Ljava/lang/Object;

    move-result-object v0

    new-instance v1, Ltxh;

    invoke-direct {v1, v0, p0, v2}, Ltxh;-><init>([Ljava/lang/Object;II)V

    return-object v1
.end method

.method public final i(JJLjava/lang/String;)V
    .registers 12

    iget-object p0, p0, Ls14;->e:Ljava/lang/Object;

    move-object v0, p0

    check-cast v0, Lwf2;

    move-wide v1, p1

    move-wide v3, p3

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lwf2;->i(JJLjava/lang/String;)V

    return-void
.end method

.method public final j(Landroid/view/ViewStub;Labf;)V
    .registers 19

    move-object/from16 v0, p0

    iget-object v1, v0, Ls14;->f:Ljava/lang/Object;

    check-cast v1, Lgbf;

    iget-object v2, v1, Lgbf;->j:Lvbf;

    iget-object v2, v2, Lvbf;->t:Ltbf;

    iget-boolean v3, v1, Lgbf;->e:Z

    const/4 v4, 0x1

    if-ne v3, v4, :cond_11

    :goto_f
    move v15, v4

    goto :goto_13

    :cond_11
    const/4 v4, 0x0

    goto :goto_f

    :goto_13
    new-instance v5, Lbdn;

    new-instance v7, Lz0c;

    const/16 v3, 0x1d

    move-object/from16 v4, p2

    invoke-direct {v7, v0, v4, v3}, Lz0c;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v8, v1, Lgbf;->f:Lydn;

    iget-object v1, v2, Ltbf;->b:Lypm;

    iget-boolean v9, v1, Lypm;->j:Z

    const-wide/16 v3, 0x80

    invoke-virtual {v2, v3, v4}, Ltbf;->b(J)Z

    move-result v10

    iget-object v1, v2, Ltbf;->b:Lypm;

    iget-object v1, v1, Lypm;->c:Ljava/lang/String;

    invoke-static {v1}, Lcom/opera/android/browser/BrowserUtils;->getRendererUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iget-object v1, v0, Ls14;->d:Ljava/lang/Object;

    move-object v12, v1

    check-cast v12, Lcdn;

    iget-object v1, v0, Ls14;->e:Ljava/lang/Object;

    move-object v13, v1

    check-cast v13, Lhv3;

    iget-boolean v14, v0, Ls14;->b:Z

    move-object/from16 v6, p1

    invoke-direct/range {v5 .. v15}, Lbdn;-><init>(Landroid/view/ViewStub;Lz0c;Lydn;ZZLjava/lang/String;Lcdn;Lhv3;ZZ)V

    return-void
.end method

.method public final k(Ljava/lang/String;Llt2;)V
    .registers 6

    iget-object v0, p0, Ls14;->d:Ljava/lang/Object;

    check-cast v0, Lumi;

    new-instance v1, Lroj;

    const/16 v2, 0xe

    invoke-direct {v1, p0, p1, v2}, Lroj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p0

    new-instance p1, Lr2n;

    const/16 v1, 0xc

    invoke-direct {p1, p2, v1}, Lr2n;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnml;->b(Lnml;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final l()V
    .registers 14

    iget-object v0, p0, Ls14;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    iget-object v1, p0, Ls14;->c:Ljava/lang/Object;

    check-cast v1, Lk6l;

    sget-object v2, Lh6l;->d:Lh6l;

    invoke-virtual {v1, v2}, Lk6l;->h(Lh6l;)V

    iget-object v3, v1, Lk6l;->b:Ljava/util/ArrayList;

    :try_start_f
    iget-object p0, p0, Ls14;->f:Ljava/lang/Object;

    check-cast p0, Ljava/util/AbstractList;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_17
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3e

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ls6l;

    iget-object v5, v4, Ls6l;->a:Lb2l;

    move-object v6, v5

    check-cast v6, Ld7l;

    iget-object v6, v6, Ld7l;->j:Le7l;

    invoke-interface {v6}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v7

    iget v11, v4, Ls6l;->b:I

    const/4 v12, 0x7

    const-wide/16 v8, 0x0

    const/4 v10, 0x0

    invoke-static/range {v7 .. v12}, Lcom/opera/android/browser/TabInfo;->a(Lcom/opera/android/browser/TabInfo;JIII)Lcom/opera/android/browser/TabInfo;

    move-result-object v4

    check-cast v5, Ld7l;

    invoke-virtual {v5, v4}, Ld7l;->s(Lcom/opera/android/browser/TabInfo;)Z
    :try_end_3d
    .catchall {:try_start_f .. :try_end_3d} :catchall_5b

    goto :goto_17

    :cond_3e
    invoke-virtual {v1, v2}, Lk6l;->n(Lh6l;)V

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result p0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ne p0, v2, :cond_5a

    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    check-cast p0, Ljava/util/Collection;

    invoke-interface {v0, p0}, Ljava/util/List;->containsAll(Ljava/util/Collection;)Z

    move-result p0

    if-eqz p0, :cond_5a

    invoke-static {v1, v0}, Lexg;->c(Lk6l;Ljava/util/List;)I

    :cond_5a
    return-void

    :catchall_5b
    move-exception v0

    move-object p0, v0

    invoke-virtual {v1, v2}, Lk6l;->n(Lh6l;)V

    throw p0
.end method

.method public final m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    iget-object p0, p0, Ls14;->e:Ljava/lang/Object;

    check-cast p0, Lwf2;

    invoke-virtual {p0, p1, p2, p3}, Lwf2;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final n(ILjava/lang/String;)V
    .registers 3

    iget-object p0, p0, Ls14;->e:Ljava/lang/Object;

    check-cast p0, Lwf2;

    invoke-virtual {p0, p1, p2}, Lwf2;->n(ILjava/lang/String;)V

    return-void
.end method

.method public final o(IILjava/lang/String;)V
    .registers 4

    iget-object p0, p0, Ls14;->e:Ljava/lang/Object;

    check-cast p0, Lwf2;

    invoke-virtual {p0, p1, p2, p3}, Lwf2;->o(IILjava/lang/String;)V

    return-void
.end method

.method public final onAdClicked()V
    .registers 1

    iget-object p0, p0, Ls14;->c:Ljava/lang/Object;

    check-cast p0, Lbp;

    invoke-virtual {p0}, Lbp;->V()V

    return-void
.end method

.method public final onAdLoaded(Ljava/lang/Object;)V
    .registers 12

    check-cast p1, Lq13;

    iget-boolean p1, p0, Ls14;->b:Z

    if-eqz p1, :cond_7

    return-void

    :cond_7
    const/4 p1, 0x1

    iput-boolean p1, p0, Ls14;->b:Z

    iget-object v0, p0, Ls14;->d:Ljava/lang/Object;

    check-cast v0, Lrhf;

    new-instance v1, Lejf;

    iget-object v2, p0, Ls14;->e:Ljava/lang/Object;

    check-cast v2, Lz13;

    iget-object v3, p0, Ls14;->f:Ljava/lang/Object;

    check-cast v3, Loo8;

    move-object v4, v3

    iget-object v3, v4, Lbqi;->f:Lrm;

    move-object v5, v4

    iget-object v4, v0, Lk43;->c:Ljava/lang/String;

    move-object v6, v5

    iget-object v5, v0, Lk43;->d:Ldl;

    sget v7, Loo8;->s:I

    add-int/2addr v7, p1

    sput v7, Loo8;->s:I

    iget-object p0, p0, Ls14;->c:Ljava/lang/Object;

    check-cast p0, Lbp;

    iget-object v8, v6, Lbqi;->h:Li3j;

    iget-object v9, v6, Lbqi;->i:Lap;

    move v6, v7

    move-object v7, p0

    invoke-direct/range {v1 .. v9}, Lejf;-><init>(Lz13;Lrm;Ljava/lang/String;Ldl;ILbp;Li3j;Lap;)V

    invoke-virtual {v0, v1}, Lk43;->d(Laqi;)V

    return-void
.end method

.method public final onFailure(Lv84;Ljava/io/IOException;)V
    .registers 3

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ls14;->E(Ljava/lang/String;)V

    return-void
.end method

.method public final onResponse(Lv84;Lpzh;)V
    .registers 5

    iget-boolean p1, p2, Lpzh;->q:Z

    if-eqz p1, :cond_29

    const-string p1, "Location"

    invoke-static {p2, p1}, Lpzh;->k(Lpzh;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_23

    :try_start_c
    invoke-static {p1}, La26;->B(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Loc9;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Loc9;-><init>(Ls14;Ljava/lang/String;B)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V
    :try_end_19
    .catch Ljava/lang/IllegalArgumentException; {:try_start_c .. :try_end_19} :catch_1a

    goto :goto_2e

    :catch_1a
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ls14;->E(Ljava/lang/String;)V

    goto :goto_2e

    :cond_23
    const-string p1, "No location in response"

    invoke-virtual {p0, p1}, Ls14;->E(Ljava/lang/String;)V

    goto :goto_2e

    :cond_29
    iget-object p1, p2, Lpzh;->c:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ls14;->E(Ljava/lang/String;)V

    :goto_2e
    invoke-virtual {p2}, Lpzh;->close()V

    return-void
.end method

.method public final p(Landroid/content/Context;)Landroid/content/Context;
    .registers 3

    iget-object p0, p0, Ls14;->f:Ljava/lang/Object;

    check-cast p0, Lgbf;

    iget-object p0, p0, Lgbf;->f:Lydn;

    iget-object p0, p0, Lydn;->c:Lgfn;

    invoke-interface {p0}, Lgfn;->isEnabled()Z

    move-result p0

    if-eqz p0, :cond_17

    new-instance p0, Ls8n;

    const v0, 0x7f040a7e

    invoke-direct {p0, p1, v0}, Ls8n;-><init>(Landroid/content/Context;I)V

    return-object p0

    :cond_17
    return-object p1
.end method

.method public final q(IILjava/lang/String;)V
    .registers 4

    iget-object p0, p0, Ls14;->e:Ljava/lang/Object;

    check-cast p0, Lwf2;

    invoke-virtual {p0, p1, p2, p3}, Lwf2;->q(IILjava/lang/String;)V

    return-void
.end method

.method public final r(Ljava/lang/Object;)V
    .registers 5

    iget-object v0, p0, Ls14;->c:Ljava/lang/Object;

    check-cast v0, Lj06;

    monitor-enter v0

    :try_start_5
    iget-object v1, p0, Ls14;->f:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Throwable;

    if-nez v1, :cond_6b

    iget-object v1, p0, Ls14;->d:Ljava/lang/Object;

    check-cast v1, Li72;

    invoke-virtual {v1, p1}, Li72;->addLast(Ljava/lang/Object;)V

    iget-boolean p1, p0, Ls14;->b:Z
    :try_end_14
    .catchall {:try_start_5 .. :try_end_14} :catchall_73

    if-eqz p1, :cond_18

    monitor-exit v0

    return-void

    :cond_18
    const/4 p1, 0x1

    :try_start_19
    iput-boolean p1, p0, Ls14;->b:Z
    :try_end_1b
    .catchall {:try_start_19 .. :try_end_1b} :catchall_73

    monitor-exit v0

    :cond_1c
    iget-object p1, p0, Ls14;->c:Ljava/lang/Object;

    check-cast p1, Lj06;

    monitor-enter p1

    :try_start_21
    iget-object v0, p0, Ls14;->d:Ljava/lang/Object;

    check-cast v0, Li72;

    invoke-virtual {v0}, Li72;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_30

    iput-boolean v1, p0, Ls14;->b:Z
    :try_end_2e
    .catchall {:try_start_21 .. :try_end_2e} :catchall_68

    monitor-exit p1

    return-void

    :cond_30
    :try_start_30
    iget-object v0, p0, Ls14;->d:Ljava/lang/Object;

    check-cast v0, Li72;

    invoke-virtual {v0}, Li72;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    iget-object v2, p0, Ls14;->e:Ljava/lang/Object;

    check-cast v2, Ljava/util/Set;
    :try_end_3c
    .catchall {:try_start_30 .. :try_end_3c} :catchall_68

    monitor-exit p1

    :try_start_3d
    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_43
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkotlin/jvm/functions/Function1;

    invoke-interface {v2, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_52
    .catchall {:try_start_3d .. :try_end_52} :catchall_53

    goto :goto_43

    :catchall_53
    move-exception p1

    iget-object v0, p0, Ls14;->c:Ljava/lang/Object;

    check-cast v0, Lj06;

    monitor-enter v0

    :try_start_59
    iget-object v2, p0, Ls14;->d:Ljava/lang/Object;

    check-cast v2, Li72;

    invoke-virtual {v2}, Li72;->clear()V

    iput-boolean v1, p0, Ls14;->b:Z

    iput-object p1, p0, Ls14;->f:Ljava/lang/Object;

    throw p1
    :try_end_65
    .catchall {:try_start_59 .. :try_end_65} :catchall_65

    :catchall_65
    move-exception p0

    monitor-exit v0

    throw p0

    :catchall_68
    move-exception p0

    monitor-exit p1

    throw p0

    :cond_6b
    :try_start_6b
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Can\'t process the event due to a previous failure"

    invoke-direct {p0, p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0
    :try_end_73
    .catchall {:try_start_6b .. :try_end_73} :catchall_73

    :catchall_73
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public final remove(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Ls14;->e:Ljava/lang/Object;

    check-cast p0, Lwf2;

    invoke-virtual {p0, p1}, Lwf2;->remove(Ljava/lang/String;)V

    return-void
.end method

.method public final s(Lorb;)V
    .registers 12

    iget-object v0, p0, Ls14;->d:Ljava/lang/Object;

    check-cast v0, Lmgh;

    iget-object v1, v0, Lmgh;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/api/Callback;

    if-nez v1, :cond_b

    return-void

    :cond_b
    iget-object v1, p0, Ls14;->f:Ljava/lang/Object;

    check-cast v1, Lhi2;

    iget-object v3, v1, Lhi2;->a:Lmyk;

    new-instance v7, Lfi2;

    const/4 v1, 0x0

    invoke-direct {v7, p0, v1}, Lfi2;-><init>(Ls14;B)V

    new-instance v8, Lfi2;

    const/4 v2, 0x1

    invoke-direct {v8, p0, v2}, Lfi2;-><init>(Ls14;B)V

    new-instance v5, Lab;

    const/16 p0, 0x15

    invoke-direct {v5, v0, p0}, Lab;-><init>(Ljava/lang/Object;B)V

    iget-object p0, v3, Lmyk;->b:Ldb;

    invoke-virtual {p0}, Ldb;->f()Z

    move-result v2

    if-nez v2, :cond_34

    const-string p0, "Not signed in"

    invoke-virtual {v5, p0}, Lab;->run(Ljava/lang/Object;)V

    sget-object p0, Lbf9;->A:Lbxl;

    goto :goto_54

    :cond_34
    new-instance v4, Lmgh;

    const/4 v2, 0x0

    const/16 v6, 0x8

    invoke-direct {v4, v2, v5, v6}, Lmgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v2, Lqe9;

    const/4 v9, 0x6

    move-object v6, p1

    invoke-direct/range {v2 .. v9}, Lqe9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p1, Leme;

    invoke-direct {p1, p0, v2}, Leme;-><init>(Ldb;Lcom/opera/api/Callback;)V

    iget-object p0, p0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-nez p0, :cond_50

    invoke-virtual {p1}, Leme;->b()V

    goto :goto_53

    :cond_50
    invoke-virtual {p0, v1, p1}, Lcom/opera/android/oauth2/OAuth2Account;->a(ILahf;)V

    :goto_53
    move-object p0, v4

    :goto_54
    iput-object p0, v0, Lmgh;->b:Ljava/lang/Object;

    return-void
.end method

.method public final t(FFZ)Z
    .registers 6

    iget-boolean v0, p0, Ls14;->b:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_17

    invoke-virtual {p0, v1}, Ls14;->z(I)Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_17

    iget-object p0, p0, Ls14;->e:Ljava/lang/Object;

    check-cast p0, Landroid/view/ViewGroup;

    :try_start_f
    invoke-interface {v0, p0, p1, p2, p3}, Landroid/view/ViewParent;->onNestedFling(Landroid/view/View;FFZ)Z

    move-result p0
    :try_end_13
    .catch Ljava/lang/AbstractMethodError; {:try_start_f .. :try_end_13} :catch_14

    return p0

    :catch_14
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    :cond_17
    return v1
.end method

.method public final u(FF)Z
    .registers 5

    iget-boolean v0, p0, Ls14;->b:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_17

    invoke-virtual {p0, v1}, Ls14;->z(I)Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_17

    iget-object p0, p0, Ls14;->e:Ljava/lang/Object;

    check-cast p0, Landroid/view/ViewGroup;

    :try_start_f
    invoke-interface {v0, p0, p1, p2}, Landroid/view/ViewParent;->onNestedPreFling(Landroid/view/View;FF)Z

    move-result p0
    :try_end_13
    .catch Ljava/lang/AbstractMethodError; {:try_start_f .. :try_end_13} :catch_14

    return p0

    :catch_14
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    :cond_17
    return v1
.end method

.method public final v(III[I[I)Z
    .registers 17

    move-object/from16 v6, p5

    iget-object v1, p0, Ls14;->e:Ljava/lang/Object;

    check-cast v1, Landroid/view/ViewGroup;

    iget-boolean v2, p0, Ls14;->b:Z

    const/4 v7, 0x0

    if-eqz v2, :cond_6e

    invoke-virtual {p0, p3}, Ls14;->z(I)Landroid/view/ViewParent;

    move-result-object v2

    if-eqz v2, :cond_6e

    const/4 v8, 0x1

    if-nez p1, :cond_1d

    if-nez p2, :cond_1d

    if-eqz v6, :cond_6e

    aput v7, v6, v7

    aput v7, v6, v8

    return v7

    :cond_1d
    if-eqz v6, :cond_29

    invoke-virtual {v1, v6}, Landroid/view/View;->getLocationInWindow([I)V

    aget v3, v6, v7

    aget v4, v6, v8

    move v9, v3

    move v10, v4

    goto :goto_2b

    :cond_29
    move v9, v7

    move v10, v9

    :goto_2b
    if-nez p4, :cond_3a

    iget-object v3, p0, Ls14;->f:Ljava/lang/Object;

    check-cast v3, [I

    if-nez v3, :cond_38

    const/4 v3, 0x2

    new-array v3, v3, [I

    iput-object v3, p0, Ls14;->f:Ljava/lang/Object;

    :cond_38
    move-object v4, v3

    goto :goto_3b

    :cond_3a
    move-object v4, p4

    :goto_3b
    aput v7, v4, v7

    aput v7, v4, v8

    instance-of v0, v2, Llle;

    if-eqz v0, :cond_4d

    move-object v0, v2

    check-cast v0, Llle;

    move v2, p1

    move v3, p2

    move v5, p3

    invoke-interface/range {v0 .. v5}, Llle;->e(Landroid/view/View;II[II)V

    goto :goto_56

    :cond_4d
    if-nez p3, :cond_56

    :try_start_4f
    invoke-interface {v2, v1, p1, p2, v4}, Landroid/view/ViewParent;->onNestedPreScroll(Landroid/view/View;II[I)V
    :try_end_52
    .catch Ljava/lang/AbstractMethodError; {:try_start_4f .. :try_end_52} :catch_53

    goto :goto_56

    :catch_53
    invoke-static {v2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    :cond_56
    :goto_56
    if-eqz v6, :cond_65

    invoke-virtual {v1, v6}, Landroid/view/View;->getLocationInWindow([I)V

    aget v0, v6, v7

    sub-int/2addr v0, v9

    aput v0, v6, v7

    aget v0, v6, v8

    sub-int/2addr v0, v10

    aput v0, v6, v8

    :cond_65
    aget v0, v4, v7

    if-nez v0, :cond_6d

    aget v0, v4, v8

    if-eqz v0, :cond_6e

    :cond_6d
    move v7, v8

    :cond_6e
    return v7
.end method

.method public final w(IIII[II[I)Z
    .registers 21

    move-object/from16 v0, p5

    move/from16 v7, p6

    iget-object v1, p0, Ls14;->e:Ljava/lang/Object;

    move-object v2, v1

    check-cast v2, Landroid/view/ViewGroup;

    iget-boolean v1, p0, Ls14;->b:Z

    const/4 v9, 0x0

    if-eqz v1, :cond_99

    invoke-virtual {p0, v7}, Ls14;->z(I)Landroid/view/ViewParent;

    move-result-object v1

    if-eqz v1, :cond_99

    const/4 v10, 0x1

    if-nez p1, :cond_24

    if-nez p2, :cond_24

    if-nez p3, :cond_24

    if-nez p4, :cond_24

    if-eqz v0, :cond_99

    aput v9, v0, v9

    aput v9, v0, v10

    return v9

    :cond_24
    if-eqz v0, :cond_30

    invoke-virtual {v2, v0}, Landroid/view/View;->getLocationInWindow([I)V

    aget v3, v0, v9

    aget v4, v0, v10

    move v11, v3

    move v12, v4

    goto :goto_32

    :cond_30
    move v11, v9

    move v12, v11

    :goto_32
    if-nez p7, :cond_45

    iget-object v3, p0, Ls14;->f:Ljava/lang/Object;

    check-cast v3, [I

    if-nez v3, :cond_3f

    const/4 v3, 0x2

    new-array v3, v3, [I

    iput-object v3, p0, Ls14;->f:Ljava/lang/Object;

    :cond_3f
    aput v9, v3, v9

    aput v9, v3, v10

    move-object v8, v3

    goto :goto_47

    :cond_45
    move-object/from16 v8, p7

    :goto_47
    instance-of p0, v1, Lmle;

    if-eqz p0, :cond_57

    check-cast v1, Lmle;

    move v3, p1

    move v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    invoke-interface/range {v1 .. v8}, Lmle;->g(Landroid/view/View;IIIII[I)V

    goto :goto_89

    :cond_57
    aget p0, v8, v9

    add-int p0, p0, p3

    aput p0, v8, v9

    aget p0, v8, v10

    add-int p0, p0, p4

    aput p0, v8, v10

    instance-of p0, v1, Llle;

    if-eqz p0, :cond_75

    check-cast v1, Llle;

    move v3, p1

    move v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p6

    invoke-interface/range {v1 .. v7}, Llle;->i(Landroid/view/View;IIIII)V

    goto :goto_89

    :cond_75
    if-nez p6, :cond_89

    move v4, p1

    move v5, p2

    move/from16 v6, p3

    move/from16 v7, p4

    move-object v3, v2

    move-object v2, v1

    :try_start_7f
    invoke-interface/range {v2 .. v7}, Landroid/view/ViewParent;->onNestedScroll(Landroid/view/View;IIII)V
    :try_end_82
    .catch Ljava/lang/AbstractMethodError; {:try_start_7f .. :try_end_82} :catch_84

    move-object v2, v3

    goto :goto_89

    :catch_84
    move-object p0, v2

    move-object v2, v3

    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    :cond_89
    :goto_89
    if-eqz v0, :cond_98

    invoke-virtual {v2, v0}, Landroid/view/View;->getLocationInWindow([I)V

    aget p0, v0, v9

    sub-int/2addr p0, v11

    aput p0, v0, v9

    aget p0, v0, v10

    sub-int/2addr p0, v12

    aput p0, v0, v10

    :cond_98
    return v10

    :cond_99
    return v9
.end method

.method public final x(Ljava/lang/Object;)V
    .registers 6

    const/4 v0, 0x1

    iput-boolean v0, p0, Ls14;->b:Z

    iput-object p1, p0, Ls14;->c:Ljava/lang/Object;

    iget-object v0, p0, Ls14;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_e
    if-ge v2, v1, :cond_1c

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lorg/chromium/base/Callback;

    invoke-virtual {p0, v3, p1}, Ls14;->D(Lorg/chromium/base/Callback;Ljava/lang/Object;)V

    goto :goto_e

    :cond_1c
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->trimToSize()V

    return-void
.end method

.method public final z(I)Landroid/view/ViewParent;
    .registers 3

    if-eqz p1, :cond_c

    const/4 v0, 0x1

    if-eq p1, v0, :cond_7

    const/4 p0, 0x0

    return-object p0

    :cond_7
    iget-object p0, p0, Ls14;->d:Ljava/lang/Object;

    check-cast p0, Landroid/view/ViewParent;

    return-object p0

    :cond_c
    iget-object p0, p0, Ls14;->c:Ljava/lang/Object;

    check-cast p0, Landroid/view/ViewParent;

    return-object p0
.end method
