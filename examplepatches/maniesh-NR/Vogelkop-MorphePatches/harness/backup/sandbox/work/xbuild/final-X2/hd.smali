.class public final Lhd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfv;
.implements Lann;
.implements Lubk;
.implements Lhh4;


# static fields
.field public static h:Lhd;


# instance fields
.field public final synthetic a:B

.field public b:Z

.field public final c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;


# direct methods
.method public constructor <init>(IFLsxf;)V
    .registers 5

    const/16 v0, 0x8

    iput-byte v0, p0, Lhd;->a:B

    .line 165
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 166
    iput-object p3, p0, Lhd;->c:Ljava/lang/Object;

    .line 167
    new-instance p3, Lq0g;

    .line 168
    invoke-direct {p3, p1}, Lq0g;-><init>(I)V

    .line 169
    iput-object p3, p0, Lhd;->d:Ljava/lang/Object;

    .line 170
    new-instance p3, Lp0g;

    .line 171
    invoke-direct {p3, p2}, Lp0g;-><init>(F)V

    .line 172
    iput-object p3, p0, Lhd;->e:Ljava/lang/Object;

    .line 173
    new-instance p2, Lo5c;

    invoke-direct {p2, p1}, Lo5c;-><init>(I)V

    iput-object p2, p0, Lhd;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(La5l;Ljava/lang/String;Lp6l;Ln6k;)V
    .registers 6

    const/16 v0, 0xb

    iput-byte v0, p0, Lhd;->a:B

    .line 224
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhd;->g:Ljava/lang/Object;

    .line 225
    iput-object p2, p0, Lhd;->c:Ljava/lang/Object;

    .line 226
    iput-object p3, p0, Lhd;->d:Ljava/lang/Object;

    .line 227
    iput-object p4, p0, Lhd;->e:Ljava/lang/Object;

    .line 228
    iget-object p2, p1, La5l;->a:Lumi;

    .line 229
    new-instance p3, Lrml;

    sget-object p4, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {p3, p4, p2}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    .line 230
    new-instance p2, Ld7k;

    const/16 p4, 0xd

    invoke-direct {p2, p1, p0, p4}, Ld7k;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p3, p2}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p2

    .line 231
    iget-object p1, p1, La5l;->g:Lqie;

    .line 232
    invoke-virtual {p2, p1}, Lplk;->m(Lqie;)Lp1j;

    move-result-object p1

    iput-object p1, p0, Lhd;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;B)V
    .registers 6

    iput-byte p3, p0, Lhd;->a:B

    const/16 v0, 0x13

    const/4 v1, 0x0

    packed-switch p3, :pswitch_data_9c

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p3, Ljava/lang/Object;

    invoke-direct {p3}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lhd;->e:Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lhd;->f:Ljava/lang/Object;

    iput-object p2, p0, Lhd;->g:Ljava/lang/Object;

    new-instance p1, Lfse;

    invoke-direct {p1, p0, v1}, Lfse;-><init>(Lhd;B)V

    invoke-static {p1, p2}, Lcom/opera/android/Lazy;->e(Lcom/opera/android/Lazy;Lumi;)V

    iput-object p1, p0, Lhd;->c:Ljava/lang/Object;

    new-instance p1, Lfse;

    const/4 p3, 0x1

    invoke-direct {p1, p0, p3}, Lfse;-><init>(Lhd;B)V

    invoke-static {p1, p2}, Lcom/opera/android/Lazy;->e(Lcom/opera/android/Lazy;Lumi;)V

    iput-object p1, p0, Lhd;->d:Ljava/lang/Object;

    new-instance p1, Lkqd;

    const/16 v0, 0x9

    invoke-direct {p1, p0, v0}, Lkqd;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Ly0a;

    const/16 v1, 0x1b

    invoke-direct {v0, p0, v1}, Ly0a;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p0

    new-instance p1, Llw0;

    invoke-direct {p1, v0, p3}, Llw0;-><init>(Lcom/opera/api/Callback;B)V

    invoke-virtual {p2, p1}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnml;->b(Lnml;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void

    :pswitch_52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lhd;->c:Ljava/lang/Object;

    new-instance p2, Ln9a;

    const/16 p3, 0x14

    invoke-direct {p2, p3}, Ln9a;-><init>(B)V

    iput-object p2, p0, Lhd;->d:Ljava/lang/Object;

    new-instance p2, Lshf;

    sget-object p3, Llkk;->c:Llkk;

    invoke-direct {p2, p1, p3}, Lshf;-><init>(Landroid/content/Context;Llkk;)V

    iput-object p2, p0, Lhd;->e:Ljava/lang/Object;

    new-instance p1, Lqie;

    invoke-direct {p1, v0}, Lqie;-><init>(B)V

    iput-object p1, p0, Lhd;->f:Ljava/lang/Object;

    new-instance p1, Lmgh;

    invoke-direct {p1, v1}, Lmgh;-><init>(B)V

    iput-object p1, p0, Lhd;->g:Ljava/lang/Object;

    return-void

    :pswitch_78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lhd;->c:Ljava/lang/Object;

    new-instance p2, Ly55;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lhd;->d:Ljava/lang/Object;

    new-instance p2, Lshf;

    sget-object p3, Llkk;->f:Llkk;

    invoke-direct {p2, p1, p3}, Lshf;-><init>(Landroid/content/Context;Llkk;)V

    iput-object p2, p0, Lhd;->e:Ljava/lang/Object;

    new-instance p1, Lqie;

    invoke-direct {p1, v0}, Lqie;-><init>(B)V

    iput-object p1, p0, Lhd;->f:Ljava/lang/Object;

    new-instance p1, Lmgh;

    invoke-direct {p1, v1}, Lmgh;-><init>(B)V

    iput-object p1, p0, Lhd;->g:Ljava/lang/Object;

    return-void

    :pswitch_data_9c
    .packed-switch 0x6
        :pswitch_78
        :pswitch_52
    .end packed-switch
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;Lxbf;)V
    .registers 6

    const/16 v0, 0x9

    iput-byte v0, p0, Lhd;->a:B

    .line 208
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 209
    new-instance v0, Lse3;

    const/4 v1, 0x3

    .line 210
    invoke-direct {v0, p0, v1}, Lse3;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lhd;->e:Ljava/lang/Object;

    .line 211
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lhd;->c:Ljava/lang/Object;

    .line 212
    iput-object p3, p0, Lhd;->d:Ljava/lang/Object;

    .line 213
    new-instance p3, Lko7;

    invoke-direct {p3, p0, p2}, Lko7;-><init>(Lhd;Lumi;)V

    iput-object p3, p0, Lhd;->f:Ljava/lang/Object;

    .line 214
    new-instance p2, Lwe7;

    new-instance v0, Lve7;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lve7;-><init>(Ljava/lang/Object;B)V

    const/4 v1, 0x7

    invoke-direct {p2, p0, v0, v1}, Lwe7;-><init>(Ljava/lang/Object;Leig;B)V

    iput-object p2, p0, Lhd;->g:Ljava/lang/Object;

    .line 215
    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    .line 216
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    .line 217
    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object p1

    .line 218
    iget-object p1, p1, Lsf7;->a:Lrf7;

    .line 219
    iget-object p1, p1, Lrf7;->g:Lnrl;

    .line 220
    iget-boolean p2, p1, Lnrl;->a:Z

    if-eqz p2, :cond_44

    .line 221
    invoke-virtual {p3}, Lldk;->h()V

    goto :goto_4d

    .line 222
    :cond_44
    new-instance p2, Lpjg;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p3}, Lpjg;-><init>(Ljava/lang/Object;B)V

    .line 223
    invoke-virtual {p1, p2}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    :goto_4d
    return-void
.end method

.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lqln;Lga6;Lgb3;Ljava/lang/String;)V
    .registers 7

    const/4 v0, 0x2

    iput-byte v0, p0, Lhd;->a:B

    .line 199
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 200
    iput-object p1, p0, Lhd;->c:Ljava/lang/Object;

    .line 201
    iput-object p2, p0, Lhd;->d:Ljava/lang/Object;

    .line 202
    iput-object p3, p0, Lhd;->e:Ljava/lang/Object;

    .line 203
    iput-object p4, p0, Lhd;->f:Ljava/lang/Object;

    .line 204
    iput-object p5, p0, Lhd;->g:Ljava/lang/Object;

    const/4 p1, 0x1

    .line 205
    iput-boolean p1, p0, Lhd;->b:Z

    .line 206
    new-instance p3, Lup7;

    invoke-direct {p3, p0, p1}, Lup7;-><init>(Lhd;B)V

    .line 207
    invoke-virtual {p2, p5, v0, p3}, Lqln;->l(Ljava/lang/String;ILcom/opera/api/Callback;)V

    return-void
.end method

.method public constructor <init>(Ldx3;Lumi;Ljava/lang/String;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lhd;->a:B

    .line 233
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 234
    iput-object p1, p0, Lhd;->c:Ljava/lang/Object;

    .line 235
    iput-object p2, p0, Lhd;->d:Ljava/lang/Object;

    .line 236
    iput-object p3, p0, Lhd;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lfe5;Liv7;Lky1;Lx5f;Lysj;Ljv3;)V
    .registers 8

    const/4 v0, 0x3

    iput-byte v0, p0, Lhd;->a:B

    .line 175
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 176
    iput-object p2, p0, Lhd;->c:Ljava/lang/Object;

    .line 177
    iput-object p5, p0, Lhd;->d:Ljava/lang/Object;

    .line 178
    iput-object p6, p0, Lhd;->e:Ljava/lang/Object;

    .line 179
    new-instance p2, Lxl6;

    const/4 p5, 0x1

    invoke-direct {p2, p4, p5}, Lxl6;-><init>(Lx5f;B)V

    .line 180
    new-instance p4, Lxm5;

    invoke-direct {p4, p0}, Lxm5;-><init>(Ljava/lang/Object;)V

    .line 181
    invoke-virtual {p3, p1, p2, p4}, Lky1;->a(Lndc;Lcy1;Lgy1;)Liy1;

    move-result-object p1

    iput-object p1, p0, Lhd;->f:Ljava/lang/Object;

    .line 182
    iget-object p1, p1, Liy1;->m:Lqde;

    .line 183
    iput-object p1, p0, Lhd;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lldk;Ltcl;)V
    .registers 7

    const/16 v0, 0xa

    iput-byte v0, p0, Lhd;->a:B

    .line 184
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhd;->g:Ljava/lang/Object;

    .line 185
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lhd;->c:Ljava/lang/Object;

    .line 186
    new-instance v0, Ljdk;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Ljdk;-><init>(Lhd;B)V

    .line 187
    iget-boolean v2, p1, Lldk;->c:Z

    .line 188
    iget-object p1, p1, Lldk;->a:Ltcl;

    if-eqz v2, :cond_35

    .line 189
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 190
    new-instance v2, Lqj;

    const/4 v3, 0x5

    invoke-direct {v2, v0, v3}, Lqj;-><init>(Ljava/lang/Runnable;B)V

    check-cast p1, Lumi;

    .line 191
    new-instance v0, Lnml;

    iget-object v3, p1, Lumi;->c:Ldhi;

    invoke-direct {v0, p1, v2, v3}, Lnml;-><init>(Lumi;Ln5o;Lrmi;)V

    .line 192
    new-instance p1, Loml;

    invoke-direct {p1, v0}, Loml;-><init>(Lnml;)V

    goto :goto_3f

    .line 193
    :cond_35
    invoke-interface {p1, v0}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object p1

    .line 194
    new-instance v0, Loml;

    invoke-direct {v0, p1}, Loml;-><init>(Lnml;)V

    move-object p1, v0

    .line 195
    :goto_3f
    iput-object p1, p0, Lhd;->d:Ljava/lang/Object;

    .line 196
    new-instance p1, Ljdk;

    invoke-direct {p1, p0, v1}, Ljdk;-><init>(Lhd;B)V

    invoke-interface {p2, p1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p1

    .line 197
    new-instance p2, Loml;

    invoke-direct {p2, p1}, Loml;-><init>(Lnml;)V

    .line 198
    iput-object p2, p0, Lhd;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ltcc;Lfd;Lva2;Ljf;)V
    .registers 11

    const/4 v0, 0x0

    iput-byte v0, p0, Lhd;->a:B

    .line 156
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 157
    iput-object p2, p0, Lhd;->c:Ljava/lang/Object;

    .line 158
    iput-object p3, p0, Lhd;->d:Ljava/lang/Object;

    .line 159
    iput-object p4, p0, Lhd;->e:Ljava/lang/Object;

    .line 160
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    iput-object p3, p0, Lhd;->f:Ljava/lang/Object;

    .line 161
    new-instance p3, Lc4;

    const/4 p4, 0x5

    invoke-direct {p3, p0, p4}, Lc4;-><init>(Ljava/lang/Object;B)V

    iput-object p3, p0, Lhd;->g:Ljava/lang/Object;

    .line 162
    new-instance v2, Lz3;

    const/4 p3, 0x4

    invoke-direct {v2, p0, p3}, Lz3;-><init>(Ljava/lang/Object;B)V

    const/4 v4, 0x0

    const/16 v5, 0xd

    const/4 v1, 0x0

    const/4 v3, 0x0

    move-object v0, p1

    invoke-static/range {v0 .. v5}, Loup;->l0(Ltcc;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;I)V

    .line 163
    new-instance p1, Lyc;

    const/4 p3, 0x1

    invoke-direct {p1, p0, p3}, Lyc;-><init>(Ljava/lang/Object;B)V

    .line 164
    invoke-static {p2, v0, p1}, Laib;->C(Lw6f;Ltcc;Ljava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(Lv31;)V
    .registers 3

    const/4 v0, 0x4

    iput-byte v0, p0, Lhd;->a:B

    .line 174
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhd;->c:Ljava/lang/Object;

    return-void
.end method

.method public static h(Lmse;Ljava/lang/String;)Lhse;
    .registers 6

    iget-object p0, p0, Lnse;->b:Ljava/io/Serializable;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :cond_9
    if-ge v1, v0, :cond_1c

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lhse;

    iget-object v3, v2, Lhse;->a:Ljava/lang/String;

    invoke-static {v3, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_9

    return-object v2

    :cond_1c
    const/4 p0, 0x0

    return-object p0
.end method

.method public static j(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 3

    const-string v0, "news_push_tracker"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method public static o(Landroid/content/Context;)Lhd;
    .registers 4

    sget-object v0, Lhd;->h:Lhd;

    if-nez v0, :cond_e

    new-instance v0, Lhd;

    sget-object v1, Lvml;->d:Lumi;

    const/4 v2, 0x5

    invoke-direct {v0, p0, v1, v2}, Lhd;-><init>(Landroid/content/Context;Lumi;B)V

    sput-object v0, Lhd;->h:Lhd;

    :cond_e
    return-object v0
.end method

.method public static q(Lb8e;Lh7h;)V
    .registers 12

    iget-object v0, p0, Lb8e;->a:Lb8e;

    iget-boolean v0, v0, Lb8e;->n:Z

    if-nez v0, :cond_b

    const-string v0, "visitSubtreeIf called on an unattached node"

    invoke-static {v0}, La8b;->b(Ljava/lang/String;)V

    :cond_b
    new-instance v0, Ldfe;

    const/16 v1, 0x10

    new-array v2, v1, [Lb8e;

    invoke-direct {v0, v2}, Ldfe;-><init>([Ljava/lang/Object;)V

    iget-object p0, p0, Lb8e;->a:Lb8e;

    iget-object v2, p0, Lb8e;->f:Lb8e;

    if-nez v2, :cond_1e

    invoke-static {v0, p0}, Lui6;->h(Ldfe;Lb8e;)V

    goto :goto_21

    :cond_1e
    invoke-virtual {v0, v2}, Ldfe;->c(Ljava/lang/Object;)V

    :goto_21
    iget p0, v0, Ldfe;->c:I

    if-eqz p0, :cond_98

    add-int/lit8 p0, p0, -0x1

    invoke-virtual {v0, p0}, Ldfe;->l(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lb8e;

    iget v2, p0, Lb8e;->d:I

    and-int/lit8 v2, v2, 0x20

    if-eqz v2, :cond_94

    move-object v2, p0

    :goto_34
    if-eqz v2, :cond_94

    iget-boolean v3, v2, Lb8e;->n:Z

    if-eqz v3, :cond_94

    iget v3, v2, Lb8e;->c:I

    and-int/lit8 v3, v3, 0x20

    if-eqz v3, :cond_91

    const/4 v3, 0x0

    move-object v4, v2

    move-object v5, v3

    :cond_43
    :goto_43
    if-eqz v4, :cond_91

    instance-of v6, v4, Le8e;

    if-eqz v6, :cond_56

    check-cast v4, Le8e;

    invoke-interface {v4}, Le8e;->B()Lj14;

    move-result-object v4

    invoke-virtual {v4, p1}, Lj14;->x(Lh7h;)Z

    move-result v4

    if-eqz v4, :cond_8c

    goto :goto_21

    :cond_56
    iget v6, v4, Lb8e;->c:I

    and-int/lit8 v6, v6, 0x20

    if-eqz v6, :cond_8c

    instance-of v6, v4, Li17;

    if-eqz v6, :cond_8c

    move-object v6, v4

    check-cast v6, Li17;

    iget-object v6, v6, Li17;->p:Lb8e;

    const/4 v7, 0x0

    :goto_66
    const/4 v8, 0x1

    if-eqz v6, :cond_8a

    iget v9, v6, Lb8e;->c:I

    and-int/lit8 v9, v9, 0x20

    if-eqz v9, :cond_87

    add-int/lit8 v7, v7, 0x1

    if-ne v7, v8, :cond_75

    move-object v4, v6

    goto :goto_87

    :cond_75
    if-nez v5, :cond_7e

    new-instance v5, Ldfe;

    new-array v8, v1, [Lb8e;

    invoke-direct {v5, v8}, Ldfe;-><init>([Ljava/lang/Object;)V

    :cond_7e
    if-eqz v4, :cond_84

    invoke-virtual {v5, v4}, Ldfe;->c(Ljava/lang/Object;)V

    move-object v4, v3

    :cond_84
    invoke-virtual {v5, v6}, Ldfe;->c(Ljava/lang/Object;)V

    :cond_87
    :goto_87
    iget-object v6, v6, Lb8e;->f:Lb8e;

    goto :goto_66

    :cond_8a
    if-eq v7, v8, :cond_43

    :cond_8c
    invoke-static {v5}, Lui6;->U(Ldfe;)Lb8e;

    move-result-object v4

    goto :goto_43

    :cond_91
    iget-object v2, v2, Lb8e;->f:Lb8e;

    goto :goto_34

    :cond_94
    invoke-static {v0, p0}, Lui6;->h(Ldfe;Lb8e;)V

    goto :goto_21

    :cond_98
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljv;)V
    .registers 20

    move-object/from16 v0, p0

    iget-object v1, v0, Lhd;->c:Ljava/lang/Object;

    move-object v2, v1

    check-cast v2, Ldx3;

    iget-object v1, v0, Lhd;->e:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v3, v0, Lhd;->f:Ljava/lang/Object;

    move-object v7, v3

    check-cast v7, Landroid/graphics/Bitmap;

    if-nez v7, :cond_1f

    new-instance v1, Lhv;

    const/4 v2, 0x0

    move-object/from16 v4, p1

    move-object/from16 v3, p2

    invoke-direct {v1, v0, v4, v3, v2}, Lhv;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v1, v0, Lhd;->g:Ljava/lang/Object;

    return-void

    :cond_1f
    move-object/from16 v4, p1

    invoke-static {v1}, Lcom/opera/android/browser/BrowserUtils;->getRendererUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    iget-object v0, v0, Lhd;->d:Ljava/lang/Object;

    check-cast v0, Lumi;

    new-instance v6, Landroid/net/Uri$Builder;

    invoke-direct {v6}, Landroid/net/Uri$Builder;-><init>()V

    const-string v8, "ofa"

    invoke-virtual {v6, v8}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v6

    const-string v8, "ui"

    invoke-virtual {v6, v8}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v6

    const-string v8, "/ai_search"

    invoke-virtual {v6, v8}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v6

    const-string v8, "q"

    invoke-static {v5, v8}, Lwqm;->m(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v6

    const-string v8, "s"

    invoke-static {v5, v8}, Lwqm;->m(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v8, v5}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v5

    const v6, 0x7f14017c

    invoke-virtual {v2, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-static {v1}, Lcom/opera/android/browser/BrowserUtils;->getDisplayString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    const/4 v6, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const-wide v11, 0x80000000L

    const-wide v13, 0x80000000L

    move-object v3, v0

    invoke-static/range {v2 .. v16}, Lcom/opera/android/webapps/ShortcutHelper;->a(Ldx3;Lumi;Ljava/lang/String;Landroid/net/Uri;ZLandroid/graphics/Bitmap;ZIIJJLjava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Ljv;->run()V

    return-void
.end method

.method public final b(Lbi;)V
    .registers 5

    const/4 v0, 0x1

    iput-boolean v0, p0, Lhd;->b:Z

    iget-object v0, p0, Lhd;->e:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/opera/android/browser/BrowserUtils;->getDisplayString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lbi;->l(Ljava/lang/String;)V

    iget-object p1, p0, Lhd;->c:Ljava/lang/Object;

    check-cast p1, Ldx3;

    const v0, 0x7f070a3c

    invoke-virtual {p1}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iget-object v0, p0, Lhd;->d:Ljava/lang/Object;

    check-cast v0, Lumi;

    new-instance v1, Lrml;

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v1, v2, v0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Lgv;

    const/4 v2, 0x0

    invoke-direct {v0, p0, p1, v2}, Lgv;-><init>(Ljava/lang/Object;IB)V

    invoke-virtual {v1, v0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    new-instance v0, Lz3;

    const/16 v1, 0xc

    invoke-direct {v0, p0, v1}, Lz3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void
.end method

.method public final c()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lhd;->b:Z

    return-void
.end method

.method public final cancel()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lhd;->b:Z

    iget-object p0, p0, Lhd;->f:Ljava/lang/Object;

    check-cast p0, Lp1j;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lp1j;->cancel(Z)Z

    return-void
.end method

.method public final d()V
    .registers 5

    iget-boolean v0, p0, Lhd;->b:Z

    if-eqz v0, :cond_19

    invoke-virtual {p0}, Lhd;->g()V

    iget-object v0, p0, Lhd;->d:Ljava/lang/Object;

    check-cast v0, Lqln;

    iget-object v1, p0, Lhd;->g:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    new-instance v2, Lup7;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lup7;-><init>(Lhd;B)V

    const/4 p0, 0x0

    invoke-virtual {v0, v1, p0, v2}, Lqln;->l(Ljava/lang/String;ILcom/opera/api/Callback;)V

    :cond_19
    return-void
.end method

.method public final e()V
    .registers 1

    invoke-virtual {p0}, Lhd;->g()V

    return-void
.end method

.method public final f()V
    .registers 3

    iget-object v0, p0, Lhd;->g:Ljava/lang/Object;

    check-cast v0, Lldk;

    iget-boolean v1, p0, Lhd;->b:Z

    if-nez v1, :cond_2b

    const/4 v1, 0x1

    iput-boolean v1, p0, Lhd;->b:Z

    iget-object p0, p0, Lhd;->f:Ljava/lang/Object;

    invoke-virtual {v0, p0}, Lldk;->d(Ljava/lang/Object;)V

    iget-object p0, v0, Lldk;->g:Ljava/util/ArrayDeque;

    if-eqz p0, :cond_2b

    :goto_14
    iget-object p0, v0, Lldk;->g:Ljava/util/ArrayDeque;

    invoke-virtual {p0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_28

    iget-object p0, v0, Lldk;->g:Ljava/util/ArrayDeque;

    invoke-virtual {p0}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    goto :goto_14

    :cond_28
    const/4 p0, 0x0

    iput-object p0, v0, Lldk;->g:Ljava/util/ArrayDeque;

    :cond_2b
    return-void
.end method

.method public final g()V
    .registers 2

    iget-boolean v0, p0, Lhd;->b:Z

    if-eqz v0, :cond_e

    const/4 v0, 0x0

    iput-boolean v0, p0, Lhd;->b:Z

    iget-object p0, p0, Lhd;->f:Ljava/lang/Object;

    check-cast p0, Lgb3;

    invoke-virtual {p0}, Lgb3;->invoke()Ljava/lang/Object;

    :cond_e
    return-void
.end method

.method public final i(Landroidx/fragment/app/r;)V
    .registers 3

    iget-byte v0, p0, Lhd;->a:B

    packed-switch v0, :pswitch_data_16

    iget-object p0, p0, Lhd;->e:Ljava/lang/Object;

    check-cast p0, Lshf;

    invoke-virtual {p0, p1}, Lshf;->N(Landroidx/fragment/app/r;)V

    return-void

    :pswitch_d
    iget-object p0, p0, Lhd;->e:Ljava/lang/Object;

    check-cast p0, Lshf;

    invoke-virtual {p0, p1}, Lshf;->N(Landroidx/fragment/app/r;)V

    return-void

    nop

    :pswitch_data_16
    .packed-switch 0x6
        :pswitch_d
    .end packed-switch
.end method

.method public final k()Z
    .registers 4

    iget-object p0, p0, Lhd;->g:Ljava/lang/Object;

    check-cast p0, Lqde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    instance-of v0, p0, Ljava/util/Collection;

    const/4 v1, 0x0

    if-eqz v0, :cond_18

    move-object v0, p0

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3f

    :cond_18
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1c
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3f

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljx1;

    if-eqz v0, :cond_3c

    instance-of v2, v0, Lsx1;

    if-eqz v2, :cond_30

    const/4 p0, 0x1

    return p0

    :cond_30
    instance-of v2, v0, Lpx1;

    if-nez v2, :cond_1c

    instance-of v2, v0, Lrx1;

    if-nez v2, :cond_1c

    instance-of v0, v0, Lfz1;

    if-nez v0, :cond_1c

    :cond_3c
    invoke-static {}, Lh9o;->p()V

    :cond_3f
    return v1
.end method

.method public final m(Landroidx/fragment/app/r;)V
    .registers 3

    iget-byte v0, p0, Lhd;->a:B

    packed-switch v0, :pswitch_data_16

    iget-object p0, p0, Lhd;->e:Ljava/lang/Object;

    check-cast p0, Lshf;

    invoke-virtual {p0, p1}, Lshf;->f(Landroidx/fragment/app/r;)V

    return-void

    :pswitch_d
    iget-object p0, p0, Lhd;->e:Ljava/lang/Object;

    check-cast p0, Lshf;

    invoke-virtual {p0, p1}, Lshf;->f(Landroidx/fragment/app/r;)V

    return-void

    nop

    :pswitch_data_16
    .packed-switch 0x6
        :pswitch_d
    .end packed-switch
.end method

.method public final n(JZ)V
    .registers 13

    iget-byte v0, p0, Lhd;->a:B

    iget-object v1, p0, Lhd;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_42

    check-cast v1, Lumi;

    new-instance v0, Lrml;

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v0, v2, v1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v3, Lh5f;

    const/4 v8, 0x0

    move-object v4, p0

    move-wide v5, p1

    move v7, p3

    invoke-direct/range {v3 .. v8}, Lh5f;-><init>(Lhd;JZB)V

    invoke-virtual {v0, v3}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    iget-object p1, v4, Lhd;->f:Ljava/lang/Object;

    check-cast p1, Lqie;

    invoke-virtual {p0, p1}, Lplk;->m(Lqie;)Lp1j;

    return-void

    :pswitch_25
    move-object v4, p0

    move-wide v5, p1

    move v7, p3

    check-cast v1, Lumi;

    new-instance p0, Lrml;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {p0, p1, v1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p1, Lh5f;

    invoke-direct {p1, v4, v5, v6, v7}, Lh5f;-><init>(Lhd;JZ)V

    invoke-virtual {p0, p1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    iget-object p1, v4, Lhd;->f:Ljava/lang/Object;

    check-cast p1, Lqie;

    invoke-virtual {p0, p1}, Lplk;->m(Lqie;)Lp1j;

    return-void

    :pswitch_data_42
    .packed-switch 0x6
        :pswitch_25
    .end packed-switch
.end method

.method public final p()V
    .registers 4

    iget-boolean v0, p0, Lhd;->b:Z

    if-nez v0, :cond_1c

    const/4 v0, 0x1

    iput-boolean v0, p0, Lhd;->b:Z

    iget-object v0, p0, Lhd;->c:Ljava/lang/Object;

    check-cast v0, Lv31;

    new-instance v1, Ld8e;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Ld8e;-><init>(Ljava/lang/Object;B)V

    iget-object p0, v0, Lv31;->p0:Ldee;

    invoke-virtual {p0, v1}, Ldee;->e(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    invoke-virtual {p0, v1}, Ldee;->a(Ljava/lang/Object;)V

    :cond_1c
    return-void
.end method

.method public final r(Ljava/lang/String;Z)V
    .registers 7

    iget-boolean v0, p0, Lhd;->b:Z

    if-eqz v0, :cond_24

    iget-object v0, p0, Lhd;->d:Ljava/lang/Object;

    check-cast v0, Ln9a;

    invoke-static {}, Ln9a;->o()Lw56;

    move-result-object v1

    new-instance v2, Lbk0;

    invoke-direct {v2, v0, v1}, Lbk0;-><init>(Ln9a;Lw56;)V

    new-instance v0, Lxsf;

    const/4 v3, 0x1

    invoke-direct {v0, v3, p2}, Lxsf;-><init>(BZ)V

    invoke-virtual {v2, p1, v0}, Lbk0;->b(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    iget-object p1, p0, Lhd;->g:Ljava/lang/Object;

    check-cast p1, Lmgh;

    invoke-virtual {p1, v1}, Lmgh;->c(Ljf0;)Z

    move-result p1

    if-eqz p1, :cond_25

    :cond_24
    return-void

    :cond_25
    iget-object p1, p0, Lhd;->c:Ljava/lang/Object;

    check-cast p1, Lumi;

    new-instance p2, Lrml;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {p2, v0, p1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p1, Lo5f;

    const/16 v0, 0x12

    invoke-direct {p1, p0, v0}, Lo5f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    iget-object p0, p0, Lhd;->f:Ljava/lang/Object;

    check-cast p0, Lqie;

    invoke-virtual {p1, p0}, Lplk;->m(Lqie;)Lp1j;

    return-void
.end method

.method public final s(Lgse;)V
    .registers 6

    if-nez p1, :cond_3

    return-void

    :cond_3
    new-instance v0, Lta7;

    iget-object v1, p0, Lhd;->f:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    iget-object v2, p0, Lhd;->g:Ljava/lang/Object;

    check-cast v2, Lumi;

    invoke-direct {v0, v1, v2}, Lta7;-><init>(Landroid/content/Context;Lumi;)V

    invoke-virtual {v0}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "user_id"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Laik;->a:[Ljava/lang/String;

    if-nez v1, :cond_21

    const-string v1, ""

    :cond_21
    invoke-virtual {v0}, Lta7;->r()Lyla;

    move-result-object v0

    if-eqz v0, :cond_2d

    iget-object v0, v0, Lyla;->a:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_2d
    iget-object v0, p0, Lhd;->e:Ljava/lang/Object;

    monitor-enter v0

    :try_start_30
    iget-object v2, p0, Lhd;->d:Ljava/lang/Object;

    check-cast v2, Lfse;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lmse;

    invoke-static {v2, v1}, Lhd;->h(Lmse;Ljava/lang/String;)Lhse;

    move-result-object v2

    if-nez v2, :cond_52

    new-instance v2, Lhse;

    invoke-direct {v2, v1, v3}, Lhse;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lhd;->d:Ljava/lang/Object;

    check-cast v1, Lfse;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmse;

    invoke-virtual {v1, v2}, Lmse;->e(Ljava/lang/Object;)V

    :cond_52
    iget-object v1, v2, Lhse;->c:Lnse;

    iget-object v2, v1, Lnse;->b:Ljava/io/Serializable;

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1}, Lnse;->a()V

    iget-object p1, p0, Lhd;->d:Ljava/lang/Object;

    check-cast p1, Lfse;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lmse;

    invoke-virtual {p1}, Lmse;->g()V

    monitor-exit v0
    :try_end_6c
    .catchall {:try_start_30 .. :try_end_6c} :catchall_76

    iget-object p0, p0, Lhd;->f:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-static {p0}, Lcom/opera/android/news/newsfeed/internal/NewsPushTrackEventsUploaderWorker;->d(Landroid/content/Context;)V

    return-void

    :goto_74
    :try_start_74
    monitor-exit v0
    :try_end_75
    .catchall {:try_start_74 .. :try_end_75} :catchall_76

    throw p0

    :catchall_76
    move-exception p0

    goto :goto_74
.end method

.method public final setEnabled(Z)V
    .registers 3

    iget-byte v0, p0, Lhd;->a:B

    packed-switch v0, :pswitch_data_c

    iput-boolean p1, p0, Lhd;->b:Z

    return-void

    :pswitch_8
    iput-boolean p1, p0, Lhd;->b:Z

    return-void

    nop

    :pswitch_data_c
    .packed-switch 0x6
        :pswitch_8
    .end packed-switch
.end method

.method public final t(Lkotlin/jvm/functions/Function1;)V
    .registers 5

    iget-object v0, p0, Lhd;->d:Ljava/lang/Object;

    check-cast v0, Ln9a;

    invoke-static {}, Ln9a;->o()Lw56;

    move-result-object v1

    new-instance v2, Lbk0;

    invoke-direct {v2, v0, v1}, Lbk0;-><init>(Ln9a;Lw56;)V

    invoke-interface {p1, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lhd;->g:Ljava/lang/Object;

    check-cast p1, Lmgh;

    invoke-virtual {p1, v1}, Lmgh;->c(Ljf0;)Z

    move-result p1

    if-eqz p1, :cond_1b

    return-void

    :cond_1b
    iget-object p1, p0, Lhd;->c:Ljava/lang/Object;

    check-cast p1, Lumi;

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v0, v1, p1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p1, Lo5f;

    const/16 v1, 0x12

    invoke-direct {p1, p0, v1}, Lo5f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    iget-object p0, p0, Lhd;->f:Ljava/lang/Object;

    check-cast p0, Lqie;

    invoke-virtual {p1, p0}, Lplk;->m(Lqie;)Lp1j;

    return-void
.end method

.method public final u(Lbnn;)V
    .registers 2

    invoke-virtual {p0}, Lhd;->g()V

    return-void
.end method

.method public final v(Lkotlin/jvm/functions/Function1;)V
    .registers 5

    iget-object v0, p0, Lhd;->d:Ljava/lang/Object;

    check-cast v0, Ly55;

    invoke-static {}, Ly55;->w()Lu56;

    move-result-object v1

    new-instance v2, Lzj0;

    invoke-direct {v2, v0, v1}, Lzj0;-><init>(Ly55;Lu56;)V

    invoke-interface {p1, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lhd;->g:Ljava/lang/Object;

    check-cast p1, Lmgh;

    invoke-virtual {p1, v1}, Lmgh;->c(Ljf0;)Z

    move-result p1

    if-eqz p1, :cond_1b

    return-void

    :cond_1b
    iget-object p1, p0, Lhd;->c:Ljava/lang/Object;

    check-cast p1, Lumi;

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v0, v1, p1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p1, Lo5f;

    const/16 v1, 0x10

    invoke-direct {p1, p0, v1}, Lo5f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    iget-object p0, p0, Lhd;->f:Ljava/lang/Object;

    check-cast p0, Lqie;

    invoke-virtual {p1, p0}, Lplk;->m(Lqie;)Lp1j;

    return-void
.end method

.method public final w()V
    .registers 7

    const/4 v0, 0x0

    iput-boolean v0, p0, Lhd;->b:Z

    iget-object v1, p0, Lhd;->f:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_b
    if-ge v0, v2, :cond_33

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v0, v0, 0x1

    check-cast v3, Lgd;

    iget-object v4, v3, Lgd;->c:Lsc;

    iget-object v3, v3, Lgd;->b:Lpc;

    iget-object v5, p0, Lhd;->c:Ljava/lang/Object;

    check-cast v5, Lfd;

    invoke-virtual {v5, v3}, Lfd;->e(Lpc;)Ljf;

    move-result-object v3

    if-nez v3, :cond_27

    iget-object v3, p0, Lhd;->e:Ljava/lang/Object;

    check-cast v3, Ljf;

    :cond_27
    iget-object v5, v4, Lsc;->a:Ljava/lang/Object;

    check-cast v5, Lqc;

    invoke-virtual {v4, v3}, Lsc;->i(Ljf;)Lrc;

    move-result-object v3

    invoke-interface {v5, v3}, Lqc;->b(Lrc;)V

    goto :goto_b

    :cond_33
    return-void
.end method

.method public final x(Ljava/util/List;)V
    .registers 19

    move-object/from16 v4, p0

    iget-object v0, v4, Lhd;->f:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v7

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v8, 0x0

    move v1, v8

    :goto_11
    sget-object v9, Log;->a:Log;

    if-ge v1, v0, :cond_23

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lgd;

    iget-object v2, v2, Lgd;->a:Lkze;

    invoke-static {v2, v9}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    goto :goto_11

    :cond_23
    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_2e
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_13d

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lpc;

    new-instance v2, Lkze;

    invoke-direct {v2, v9}, Lekc;-><init>(Ljava/lang/Object;)V

    new-instance v11, Lgd;

    iget-object v0, v4, Lhd;->d:Ljava/lang/Object;

    check-cast v0, Lva2;

    iget-object v0, v0, Lva2;->b:Ljava/lang/Object;

    check-cast v0, Ltah;

    iget-object v5, v0, Ltah;->e:Ljava/lang/Object;

    check-cast v5, Lv1f;

    iget-object v12, v0, Ltah;->h:Ljava/lang/Object;

    check-cast v12, Landroid/view/ViewGroup;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v13

    const/4 v14, 0x7

    const-string v15, "rootView"

    if-eq v13, v14, :cond_108

    const/16 v0, 0x8

    const v14, 0x7f0d009e

    if-eq v13, v0, :cond_e2

    const/16 v0, 0xc

    if-eq v13, v0, :cond_b8

    const/16 v0, 0xe

    if-eq v13, v0, :cond_8d

    new-instance v0, Ltc;

    new-instance v1, Li3j;

    invoke-virtual {v12}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    invoke-virtual {v5, v14, v12, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v12, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    if-eqz v5, :cond_89

    check-cast v5, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-direct {v1, v5}, Li3j;-><init>(Lcom/opera/android/custom_views/StylingImageButton;)V

    invoke-direct {v0, v1, v3, v4}, Lsc;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_131

    :cond_89
    invoke-static {v15}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_8d
    new-instance v0, Lg3f;

    new-instance v13, Li3j;

    invoke-virtual {v12}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-virtual {v1, v14, v12, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v12, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    if-eqz v1, :cond_b4

    check-cast v1, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-direct {v13, v1}, Li3j;-><init>(Lcom/opera/android/custom_views/StylingImageButton;)V

    const/4 v1, 0x1

    invoke-virtual {v5, v1}, Lv1f;->a(I)Lp1f;

    move-result-object v5

    move-object v1, v13

    invoke-direct/range {v0 .. v5}, Lg3f;-><init>(Li3j;Lkze;Lpc;Lhd;Lp1f;)V

    move-object/from16 v4, p0

    goto/16 :goto_131

    :cond_b4
    invoke-static {v15}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_b8
    new-instance v0, Lg3f;

    new-instance v1, Li3j;

    invoke-virtual {v12}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    invoke-virtual {v4, v14, v12, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v12, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    if-eqz v4, :cond_de

    check-cast v4, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-direct {v1, v4}, Li3j;-><init>(Lcom/opera/android/custom_views/StylingImageButton;)V

    const/16 v4, 0x8

    invoke-virtual {v5, v4}, Lv1f;->a(I)Lp1f;

    move-result-object v5

    move-object/from16 v4, p0

    invoke-direct/range {v0 .. v5}, Lg3f;-><init>(Li3j;Lkze;Lpc;Lhd;Lp1f;)V

    goto :goto_131

    :cond_de
    invoke-static {v15}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_e2
    new-instance v0, Lg3f;

    new-instance v1, Li3j;

    invoke-virtual {v12}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    invoke-virtual {v4, v14, v12, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v12, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    if-eqz v4, :cond_104

    check-cast v4, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-direct {v1, v4}, Li3j;-><init>(Lcom/opera/android/custom_views/StylingImageButton;)V

    iget-object v5, v5, Lv1f;->c:Lr1f;

    move-object/from16 v4, p0

    invoke-direct/range {v0 .. v5}, Lg3f;-><init>(Li3j;Lkze;Lpc;Lhd;Lp1f;)V

    goto :goto_131

    :cond_104
    invoke-static {v15}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_108
    new-instance v1, Lg3f;

    move-object v4, v1

    new-instance v1, Lpjn;

    invoke-virtual {v12}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    const v13, 0x7f0d00a4

    invoke-virtual {v5, v13, v12, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v12, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    if-eqz v5, :cond_139

    check-cast v5, Lcom/opera/android/custom_views/TabCountButton;

    invoke-direct {v1, v5}, Lpjn;-><init>(Lcom/opera/android/custom_views/TabCountButton;)V

    iget-object v0, v0, Ltah;->b:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lk6l;

    move-object v0, v4

    move-object/from16 v4, p0

    invoke-direct/range {v0 .. v5}, Lg3f;-><init>(Lpjn;Lkze;Lpc;Lhd;Lk6l;)V

    :goto_131
    invoke-direct {v11, v2, v3, v0}, Lgd;-><init>(Lkze;Lpc;Lsc;)V

    invoke-virtual {v6, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2e

    :cond_139
    invoke-static {v15}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_13d
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v1, v8

    :goto_142
    if-ge v1, v0, :cond_154

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lgd;

    iget-object v2, v2, Lgd;->a:Lkze;

    sget-object v3, Lng;->a:Lng;

    invoke-static {v2, v3}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    goto :goto_142

    :cond_154
    iget-object v0, v4, Lhd;->c:Ljava/lang/Object;

    check-cast v0, Lfd;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v2, v8

    :cond_15d
    const/4 v3, 0x0

    if-ge v2, v1, :cond_170

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v2, v2, 0x1

    move-object v9, v5

    check-cast v9, Lgd;

    iget-object v9, v9, Lgd;->b:Lpc;

    sget-object v10, Lpc;->j:Lpc;

    if-ne v9, v10, :cond_15d

    goto :goto_171

    :cond_170
    move-object v5, v3

    :goto_171
    if-eqz v5, :cond_175

    const/4 v10, 0x1

    goto :goto_176

    :cond_175
    move v10, v8

    :goto_176
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v2, v8

    :cond_17b
    if-ge v2, v1, :cond_18d

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v2, v2, 0x1

    move-object v9, v5

    check-cast v9, Lgd;

    iget-object v9, v9, Lgd;->b:Lpc;

    sget-object v11, Lpc;->g:Lpc;

    if-ne v9, v11, :cond_17b

    goto :goto_18e

    :cond_18d
    move-object v5, v3

    :goto_18e
    if-eqz v5, :cond_192

    const/4 v11, 0x1

    goto :goto_193

    :cond_192
    move v11, v8

    :goto_193
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v2, v8

    :cond_198
    if-ge v2, v1, :cond_1aa

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v2, v2, 0x1

    move-object v9, v5

    check-cast v9, Lgd;

    iget-object v9, v9, Lgd;->b:Lpc;

    sget-object v12, Lpc;->m:Lpc;

    if-ne v9, v12, :cond_198

    goto :goto_1ab

    :cond_1aa
    move-object v5, v3

    :goto_1ab
    if-eqz v5, :cond_1af

    const/4 v12, 0x1

    goto :goto_1b0

    :cond_1af
    move v12, v8

    :goto_1b0
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v2, v8

    :cond_1b5
    if-ge v2, v1, :cond_1c7

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v2, v2, 0x1

    move-object v9, v5

    check-cast v9, Lgd;

    iget-object v9, v9, Lgd;->b:Lpc;

    sget-object v13, Lpc;->h:Lpc;

    if-ne v9, v13, :cond_1b5

    goto :goto_1c8

    :cond_1c7
    move-object v5, v3

    :goto_1c8
    if-eqz v5, :cond_1cc

    const/4 v13, 0x1

    goto :goto_1cd

    :cond_1cc
    move v13, v8

    :goto_1cd
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v2, v8

    :cond_1d2
    if-ge v2, v1, :cond_1e4

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v2, v2, 0x1

    move-object v9, v5

    check-cast v9, Lgd;

    iget-object v9, v9, Lgd;->b:Lpc;

    sget-object v14, Lpc;->e:Lpc;

    if-ne v9, v14, :cond_1d2

    move-object v3, v5

    :cond_1e4
    if-eqz v3, :cond_1e8

    const/4 v14, 0x1

    goto :goto_1e9

    :cond_1e8
    move v14, v8

    :goto_1e9
    new-instance v9, Lyk5;

    invoke-direct/range {v9 .. v14}, Lyk5;-><init>(ZZZZZ)V

    iget-object v1, v0, Lfd;->b:Lyk5;

    invoke-virtual {v9, v1}, Lyk5;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1fb

    iput-object v9, v0, Lfd;->b:Lyk5;

    invoke-virtual {v0}, Lfd;->c()V

    :cond_1fb
    if-eqz v7, :cond_201

    invoke-virtual {v4}, Lhd;->w()V

    return-void

    :cond_201
    iget-boolean v0, v4, Lhd;->b:Z

    if-eqz v0, :cond_206

    return-void

    :cond_206
    const/4 v1, 0x1

    iput-boolean v1, v4, Lhd;->b:Z

    iget-object v0, v4, Lhd;->g:Ljava/lang/Object;

    check-cast v0, Lc4;

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final z(Lcnn;)V
    .registers 6

    iget-object p1, p0, Lhd;->e:Ljava/lang/Object;

    check-cast p1, Lga6;

    invoke-virtual {p1}, Lga6;->p()Z

    move-result p1

    if-nez p1, :cond_e

    invoke-virtual {p0}, Lhd;->g()V

    return-void

    :cond_e
    iget-object p1, p0, Lhd;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/settings/SettingsManager;

    iget-object v0, p0, Lhd;->g:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v1, p1, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    iget-object p1, p1, Lcom/opera/android/settings/SettingsManager;->c:Landroid/os/Bundle;

    const/4 v2, 0x0

    const-string v3, "wallpaper_current"

    invoke-virtual {p1, v3, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v1, v0, p1}, Ly9j;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lhd;->g()V

    return-void
.end method
