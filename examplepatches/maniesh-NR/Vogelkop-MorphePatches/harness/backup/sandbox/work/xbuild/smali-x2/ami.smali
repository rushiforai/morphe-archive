.class public final Lami;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lu9j;


# static fields
.field public static final i:Luli;

.field public static final j:Luli;

.field public static final k:Luli;

.field public static final l:Lill;

.field public static final m:Lby6;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;

.field public h:Ljava/lang/Object;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 4

    new-instance v0, Luli;

    new-instance v1, Llxh;

    const v2, 0x7f0804f9

    invoke-direct {v1, v2}, Llxh;-><init>(I)V

    new-instance v2, Lrxh;

    const v3, 0x7f1412a9

    invoke-direct {v2, v3}, Lrxh;-><init>(I)V

    invoke-direct {v0, v1, v2}, Luli;-><init>(Llxh;Lrxh;)V

    sput-object v0, Lami;->i:Luli;

    new-instance v0, Luli;

    new-instance v1, Llxh;

    const v2, 0x7f08063c

    invoke-direct {v1, v2}, Llxh;-><init>(I)V

    new-instance v2, Lrxh;

    const v3, 0x7f1412c7

    invoke-direct {v2, v3}, Lrxh;-><init>(I)V

    invoke-direct {v0, v1, v2}, Luli;-><init>(Llxh;Lrxh;)V

    sput-object v0, Lami;->j:Luli;

    new-instance v0, Luli;

    new-instance v1, Llxh;

    const v2, 0x7f0805e7

    invoke-direct {v1, v2}, Llxh;-><init>(I)V

    new-instance v2, Lrxh;

    const v3, 0x7f1412ba

    invoke-direct {v2, v3}, Lrxh;-><init>(I)V

    invoke-direct {v0, v1, v2}, Luli;-><init>(Llxh;Lrxh;)V

    sput-object v0, Lami;->k:Luli;

    new-instance v0, Lill;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lami;->l:Lill;

    new-instance v0, Lby6;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lami;->m:Lby6;

    return-void
.end method

.method public synthetic constructor <init>(B)V
    .registers 2

    .line 184
    iput-byte p1, p0, Lami;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;B)V
    .registers 8

    iput-byte p2, p0, Lami;->a:B

    packed-switch p2, :pswitch_data_7c

    .line 223
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lami;->b:Ljava/lang/Object;

    .line 224
    new-instance p1, Lj3i;

    const/16 p2, 0x15

    invoke-direct {p1, p0, p2}, Lj3i;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lami;->c:Ljava/lang/Object;

    .line 225
    new-instance p1, Lh42;

    const/4 p2, 0x2

    invoke-direct {p1, p0, p2}, Lh42;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lami;->d:Ljava/lang/Object;

    .line 226
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lami;->e:Ljava/lang/Object;

    .line 227
    new-instance p1, Landroid/util/SparseIntArray;

    invoke-direct {p1}, Landroid/util/SparseIntArray;-><init>()V

    iput-object p1, p0, Lami;->f:Ljava/lang/Object;

    .line 228
    sget-object p1, Lv08;->a:Lv08;

    .line 229
    iput-object p1, p0, Lami;->g:Ljava/lang/Object;

    .line 230
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p1, p0, Lami;->h:Ljava/lang/Object;

    return-void

    .line 231
    :pswitch_3a
    new-instance p2, Ljava/util/WeakHashMap;

    invoke-direct {p2}, Ljava/util/WeakHashMap;-><init>()V

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    new-instance v1, Ljava/util/WeakHashMap;

    invoke-direct {v1}, Ljava/util/WeakHashMap;-><init>()V

    new-instance v2, Lrii;

    invoke-direct {v2}, Lrii;-><init>()V

    new-instance v3, Ltuj;

    const/4 v4, 0x1

    invoke-direct {v3, p1, v4}, Ltuj;-><init>(Landroid/content/Context;B)V

    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-direct {p1, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 232
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lami;->c:Ljava/lang/Object;

    iput-object v0, p0, Lami;->d:Ljava/lang/Object;

    iput-object v1, p0, Lami;->e:Ljava/lang/Object;

    iput-object v2, p0, Lami;->h:Ljava/lang/Object;

    iput-object v3, p0, Lami;->b:Ljava/lang/Object;

    new-instance p2, Ldgo;

    const/4 v0, 0x5

    invoke-direct {p2, p0, v0}, Ldgo;-><init>(Ljava/lang/Object;B)V

    .line 233
    iput-object p2, v3, Ltuj;->i:Ljava/lang/Object;

    .line 234
    iput-object p1, p0, Lami;->f:Ljava/lang/Object;

    new-instance p1, Liv;

    invoke-direct {p1, p0}, Liv;-><init>(Lami;)V

    iput-object p1, p0, Lami;->g:Ljava/lang/Object;

    return-void

    :pswitch_data_7c
    .packed-switch 0x10
        :pswitch_3a
    .end packed-switch
.end method

.method public constructor <init>(Landroid/content/Context;Ljl5;La5o;Lt1h;Landroidx/work/impl/WorkDatabase;Lh5o;Ljava/util/ArrayList;)V
    .registers 9

    const/16 v0, 0xf

    iput-byte v0, p0, Lami;->a:B

    .line 254
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 255
    iput-object p2, p0, Lami;->b:Ljava/lang/Object;

    .line 256
    iput-object p3, p0, Lami;->c:Ljava/lang/Object;

    .line 257
    iput-object p4, p0, Lami;->d:Ljava/lang/Object;

    .line 258
    iput-object p5, p0, Lami;->e:Ljava/lang/Object;

    .line 259
    iput-object p6, p0, Lami;->f:Ljava/lang/Object;

    .line 260
    iput-object p7, p0, Lami;->g:Ljava/lang/Object;

    .line 261
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lami;->h:Ljava/lang/Object;

    .line 262
    new-instance p0, Ld7h;

    const/16 p1, 0xe

    invoke-direct {p0, p1}, Ld7h;-><init>(B)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lvzk;Lb59;Lsy;Lwjh;)V
    .registers 7

    const/4 v0, 0x2

    iput-byte v0, p0, Lami;->a:B

    .line 246
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 247
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lami;->b:Ljava/lang/Object;

    .line 248
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lami;->c:Ljava/lang/Object;

    .line 249
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lami;->d:Ljava/lang/Object;

    .line 250
    iput-object p2, p0, Lami;->e:Ljava/lang/Object;

    .line 251
    iput-object p3, p0, Lami;->f:Ljava/lang/Object;

    .line 252
    iput-object p4, p0, Lami;->g:Ljava/lang/Object;

    .line 253
    iput-object p5, p0, Lami;->h:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Laxm;Lhxm;Ljava/lang/String;Lowm;Ls9j;Lv4m;Lsp4;Lz6j;Li1l;Ltv;Lra7;Lf77;)V
    .registers 14

    const/16 v0, 0xe

    iput-byte v0, p0, Lami;->a:B

    .line 176
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 177
    iput-object p1, p0, Lami;->b:Ljava/lang/Object;

    .line 178
    iput-object p2, p0, Lami;->c:Ljava/lang/Object;

    .line 179
    iput-object p3, p0, Lami;->d:Ljava/lang/Object;

    .line 180
    iput-object p4, p0, Lami;->e:Ljava/lang/Object;

    .line 181
    iput-object p9, p0, Lami;->f:Ljava/lang/Object;

    .line 182
    iput-object p12, p0, Lami;->g:Ljava/lang/Object;

    .line 183
    new-instance p1, La33;

    move-object p4, p6

    move-object p6, p7

    move-object p3, p8

    move-object p7, p10

    move-object p8, p2

    move-object p2, p5

    move-object p5, p9

    move-object p9, p11

    invoke-direct/range {p1 .. p9}, La33;-><init>(Ls9j;Lz6j;Lv4m;Li1l;Lsp4;Ltv;Lhxm;Lra7;)V

    iput-object p1, p0, Lami;->h:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/qr/ScanQrCodeActivity;Lcom/opera/android/qr/ScanQrCodeActivity;Lumi;Lei;Ltsd;Llfh;Lpde;Lqli;Lpli;La7b;Lqli;)V
    .registers 16

    const/4 p10, 0x0

    iput-byte p10, p0, Lami;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lami;->b:Ljava/lang/Object;

    iput-object p4, p0, Lami;->c:Ljava/lang/Object;

    iput-object p5, p0, Lami;->d:Ljava/lang/Object;

    iput-object p6, p0, Lami;->e:Ljava/lang/Object;

    iput-object p8, p0, Lami;->f:Ljava/lang/Object;

    iput-object p9, p0, Lami;->g:Ljava/lang/Object;

    iget-object p1, p6, Llfh;->j:Lpde;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lgfh;

    iget-object p8, p6, Llfh;->k:Lpde;

    invoke-virtual {p8}, Lekc;->g()Ljava/lang/Object;

    move-result-object p9

    check-cast p9, Ljfh;

    invoke-virtual {p7}, Lekc;->g()Ljava/lang/Object;

    move-result-object p11

    check-cast p11, Lt0a;

    invoke-virtual {p0, p1, p9}, Lami;->e(Lgfh;Ljfh;)Lyli;

    move-result-object p1

    iget-object p6, p6, Llfh;->j:Lpde;

    sget-object p9, Lpn7;->b:Lon7;

    sget-object p9, Lun7;->e:Lun7;

    const/4 p11, 0x1

    invoke-static {p11, p9}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    new-instance p9, Lali;

    const/4 v2, 0x4

    invoke-direct {p9, v2}, Lali;-><init>(B)V

    new-instance v3, Lknl;

    invoke-direct {v3, p3, v0, v1}, Lknl;-><init>(Lumi;J)V

    new-instance p3, Lsmi;

    new-instance v0, Lj3i;

    const/16 v1, 0x9

    invoke-direct {v0, p6, v1}, Lj3i;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p3, v3, v0}, Lsmi;-><init>(Lknl;Lj3i;)V

    new-instance v0, Ltmi;

    invoke-direct {v0, p9, p3, v3, p10}, Ltmi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p9, Lw4i;

    invoke-direct {p9, v0, v2}, Lw4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p3, p6, p9}, Ltsd;->s(Lekc;Lf7f;)V

    new-instance p6, Lj04;

    const/16 p9, 0xf

    invoke-direct {p6, p0, p9}, Lj04;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p3, p8, p7, p6}, Lxf8;->X(Ljava/lang/Object;Lekc;Lekc;Lekc;Lcr9;)Lwnm;

    move-result-object p1

    new-instance p3, Lsli;

    invoke-direct {p3, p0, p10}, Lsli;-><init>(Lami;B)V

    new-instance p6, Lt7d;

    const/16 p8, 0xa

    invoke-direct {p6, p3, p8}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p5, p2, p6}, Lekc;->j(Lndc;Lf7f;)V

    iget-object p3, p4, Lei;->f:Ljava/lang/Object;

    check-cast p3, Lcom/opera/android/custom_views/StylingImageView;

    new-instance p4, Lh4i;

    invoke-direct {p4, p0, p11}, Lh4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p3, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p3, Lsli;

    invoke-direct {p3, p0, p11}, Lsli;-><init>(Lami;B)V

    new-instance p4, Lt7d;

    invoke-direct {p4, p3, p8}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p7, p2, p4}, Lekc;->j(Lndc;Lf7f;)V

    new-instance p3, Lsli;

    const/4 p4, 0x2

    invoke-direct {p3, p0, p4}, Lsli;-><init>(Lami;B)V

    new-instance p0, Lt7d;

    invoke-direct {p0, p3, p8}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p1, p2, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lfw3;Landroid/content/res/Resources;Ljt3;)V
    .registers 6

    const/4 v0, 0x4

    iput-byte v0, p0, Lami;->a:B

    .line 166
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 167
    iput-object p1, p0, Lami;->b:Ljava/lang/Object;

    .line 168
    iput-object p2, p0, Lami;->c:Ljava/lang/Object;

    .line 169
    iput-object p3, p0, Lami;->d:Ljava/lang/Object;

    .line 170
    iput-object p4, p0, Lami;->e:Ljava/lang/Object;

    .line 171
    new-instance p1, Loc2;

    const/16 p2, 0xe

    invoke-direct {p1, p0, p2}, Loc2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lami;->f:Ljava/lang/Object;

    .line 172
    new-instance p1, Lv9j;

    invoke-direct {p1, p0}, Lv9j;-><init>(Lu9j;)V

    iput-object p1, p0, Lami;->g:Ljava/lang/Object;

    .line 173
    const-string p1, "toolbar_bottom_actions"

    .line 174
    invoke-static {p1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p1

    .line 175
    iput-object p1, p0, Lami;->h:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lgpm;Lapa;Lj9a;Ljtf;Lcsk;Lpj5;)V
    .registers 8

    const/4 v0, 0x7

    iput-byte v0, p0, Lami;->a:B

    .line 235
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 236
    iput-object p1, p0, Lami;->b:Ljava/lang/Object;

    .line 237
    iput-object p2, p0, Lami;->c:Ljava/lang/Object;

    .line 238
    iput-object p3, p0, Lami;->d:Ljava/lang/Object;

    .line 239
    iput-object p4, p0, Lami;->e:Ljava/lang/Object;

    .line 240
    iput-object p5, p0, Lami;->f:Ljava/lang/Object;

    .line 241
    iput-object p6, p0, Lami;->g:Ljava/lang/Object;

    .line 242
    sget-object p1, Lboa;->a:Ljf2;

    .line 243
    invoke-virtual {p6, p1}, Lpj5;->e(Ljf2;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    if-eqz p1, :cond_22

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p1

    if-nez p1, :cond_24

    .line 244
    :cond_22
    sget-object p1, Lv08;->a:Lv08;

    .line 245
    :cond_24
    iput-object p1, p0, Lami;->h:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lgqg;Lgqg;Lgqg;Lgqg;Lgqg;Lgqg;Lw14;I)V
    .registers 11

    const/4 v0, 0x6

    iput-byte v0, p0, Lami;->a:B

    and-int/lit8 v0, p8, 0x1

    const/4 v1, 0x0

    if-eqz v0, :cond_9

    move-object p1, v1

    :cond_9
    and-int/lit8 v0, p8, 0x2

    if-eqz v0, :cond_e

    move-object p2, v1

    :cond_e
    and-int/lit8 v0, p8, 0x4

    if-eqz v0, :cond_13

    move-object p3, v1

    :cond_13
    and-int/lit8 v0, p8, 0x8

    if-eqz v0, :cond_18

    move-object p4, v1

    :cond_18
    and-int/lit8 v0, p8, 0x10

    if-eqz v0, :cond_1d

    move-object p5, v1

    :cond_1d
    and-int/lit8 p8, p8, 0x20

    if-eqz p8, :cond_22

    move-object p6, v1

    .line 158
    :cond_22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 159
    iput-object p1, p0, Lami;->b:Ljava/lang/Object;

    .line 160
    iput-object p2, p0, Lami;->c:Ljava/lang/Object;

    .line 161
    iput-object p3, p0, Lami;->d:Ljava/lang/Object;

    .line 162
    iput-object p4, p0, Lami;->e:Ljava/lang/Object;

    .line 163
    iput-object p5, p0, Lami;->f:Ljava/lang/Object;

    .line 164
    iput-object p6, p0, Lami;->g:Ljava/lang/Object;

    .line 165
    iput-object p7, p0, Lami;->h:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 9

    .line 157
    iput-byte p8, p0, Lami;->a:B

    iput-object p1, p0, Lami;->b:Ljava/lang/Object;

    iput-object p2, p0, Lami;->c:Ljava/lang/Object;

    iput-object p3, p0, Lami;->d:Ljava/lang/Object;

    iput-object p4, p0, Lami;->e:Ljava/lang/Object;

    iput-object p5, p0, Lami;->f:Ljava/lang/Object;

    iput-object p6, p0, Lami;->g:Ljava/lang/Object;

    iput-object p7, p0, Lami;->h:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lndc;Landroid/content/Context;Ljava/io/File;Lumi;Lii;Lrgh;Lvzk;Lonn;Lqi5;)V
    .registers 23

    move-object/from16 v1, p7

    const/4 v2, 0x1

    iput-byte v2, p0, Lami;->a:B

    .line 197
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 198
    new-instance v3, Lkze;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 199
    invoke-direct {v3, v4}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 200
    iput-object v3, p0, Lami;->g:Ljava/lang/Object;

    .line 201
    new-instance v3, Lkze;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 202
    invoke-direct {v3, v4}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 203
    iput-object v3, p0, Lami;->h:Ljava/lang/Object;

    .line 204
    iput-object p2, p0, Lami;->b:Ljava/lang/Object;

    .line 205
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "android_id"

    invoke-static {v3, v4}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 206
    sget-object v4, Laik;->a:[Ljava/lang/String;

    if-nez v3, :cond_32

    .line 207
    const-string v3, ""

    .line 208
    :cond_32
    iput-object v3, p0, Lami;->c:Ljava/lang/Object;

    .line 209
    new-instance v3, Ls14;

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v4, p8

    invoke-direct {v3, v5, v6, v4}, Ls14;-><init>(Ljava/io/File;Lumi;Lonn;)V

    iput-object v3, p0, Lami;->d:Ljava/lang/Object;

    .line 210
    iput-object v1, p0, Lami;->f:Ljava/lang/Object;

    .line 211
    new-instance v4, Lvq8;

    .line 212
    new-instance v8, Lhga;

    invoke-static {p2}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object v7

    const/4 v12, 0x0

    invoke-direct {v8, v7, v12}, Lhga;-><init>(Ljava/lang/Object;B)V

    .line 213
    new-instance v9, Lt1;

    const/16 v7, 0x10

    invoke-direct {v9, p2, v7}, Lt1;-><init>(Landroid/content/Context;B)V

    move-object/from16 v7, p5

    move-object/from16 v10, p6

    move-object/from16 v11, p9

    invoke-direct/range {v4 .. v11}, Lvq8;-><init>(Ljava/io/File;Lumi;Lii;Lhga;Lt1;Lrgh;Lqi5;)V

    iput-object v4, p0, Lami;->e:Ljava/lang/Object;

    .line 214
    sget-object v0, Lmln;->d:Lmln;

    .line 215
    iget-object v3, v3, Ls14;->f:Ljava/lang/Object;

    check-cast v3, Lkze;

    .line 216
    iget-object v4, v4, Lvq8;->j:Ljava/lang/Object;

    check-cast v4, Lkze;

    .line 217
    iget-object v5, v11, Lqi5;->c:Lode;

    check-cast v5, Lh42;

    .line 218
    new-instance v6, Llf5;

    const/16 v7, 0x19

    invoke-direct {v6, v7}, Llf5;-><init>(B)V

    .line 219
    invoke-static {v0, v3, v4, v5, v6}, Lxf8;->X(Ljava/lang/Object;Lekc;Lekc;Lekc;Lcr9;)Lwnm;

    move-result-object v0

    .line 220
    new-instance v3, Llln;

    invoke-direct {v3, p0, v12}, Llln;-><init>(Lami;B)V

    invoke-virtual {v0, p1, v3}, Lekc;->j(Lndc;Lf7f;)V

    .line 221
    iget-object v0, v1, Lvzk;->c:Ljava/lang/Object;

    check-cast v0, Lkze;

    .line 222
    new-instance v1, Llln;

    invoke-direct {v1, p0, v2}, Llln;-><init>(Lami;B)V

    invoke-virtual {v0, p1, v1}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public constructor <init>(Lumi;Lcom/opera/android/browser/BrowserFragment;Lvp5;Lk6l;Lvx;)V
    .registers 8

    const/4 v0, 0x3

    iput-byte v0, p0, Lami;->a:B

    .line 185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 186
    new-instance v1, Lro9;

    invoke-direct {v1, p0, v0}, Lro9;-><init>(Lami;I)V

    iput-object v1, p0, Lami;->g:Ljava/lang/Object;

    .line 187
    iput-object p1, p0, Lami;->b:Ljava/lang/Object;

    .line 188
    iput-object p2, p0, Lami;->c:Ljava/lang/Object;

    .line 189
    iput-object p3, p0, Lami;->d:Ljava/lang/Object;

    .line 190
    iput-object p4, p0, Lami;->e:Ljava/lang/Object;

    .line 191
    iput-object p5, p0, Lami;->f:Ljava/lang/Object;

    .line 192
    new-instance p1, Lvz2;

    invoke-direct {p1, p0}, Lvz2;-><init>(Lami;)V

    invoke-virtual {p4, p1}, Lk6l;->c(Lj6l;)V

    return-void
.end method

.method public constructor <init>(Lvwh;)V
    .registers 4

    const/16 v0, 0xd

    iput-byte v0, p0, Lami;->a:B

    .line 193
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 194
    new-instance v0, Lic;

    const/16 v1, 0x10

    invoke-direct {v0, p0, v1}, Lic;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lami;->g:Ljava/lang/Object;

    .line 195
    new-instance v0, Lpt;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lpt;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lami;->h:Ljava/lang/Object;

    .line 196
    iput-object p1, p0, Lami;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lwy9;Lwy9;Lwy9;Lwy9;Lf38;Lf38;)V
    .registers 9

    const/4 v0, 0x5

    iput-byte v0, p0, Lami;->a:B

    .line 263
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 264
    new-instance v0, Leq6;

    invoke-direct {v0, p0}, Leq6;-><init>(Ljava/lang/Object;)V

    const/16 v1, 0x96

    .line 265
    invoke-static {v1, v0}, Lzn8;->a(ILwn8;)Lua7;

    move-result-object v0

    iput-object v0, p0, Lami;->h:Ljava/lang/Object;

    .line 266
    iput-object p1, p0, Lami;->b:Ljava/lang/Object;

    .line 267
    iput-object p2, p0, Lami;->c:Ljava/lang/Object;

    .line 268
    iput-object p3, p0, Lami;->d:Ljava/lang/Object;

    .line 269
    iput-object p4, p0, Lami;->e:Ljava/lang/Object;

    .line 270
    iput-object p5, p0, Lami;->f:Ljava/lang/Object;

    .line 271
    iput-object p6, p0, Lami;->g:Ljava/lang/Object;

    return-void
.end method

.method public static g(Lxx;)Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "providers_config_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Llyf;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Llyf;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static varargs o([Lgqg;)Ljava/util/ArrayList;
    .registers 11

    invoke-static {p0}, Le82;->p([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p0, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_13
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_36

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lgqg;

    iget-object v3, v1, Lc30;->b:Ljava/lang/String;

    iget-object v5, v1, Lgqg;->o:Lwpg;

    iget-object v4, v1, Lgqg;->n:Lmpg;

    iget-object v6, v1, Lgqg;->p:Ljava/lang/String;

    iget-object v7, v1, Lgqg;->q:Ljava/lang/String;

    iget-object v8, v1, Lgqg;->r:Ljava/lang/String;

    iget-object v9, v1, Lgqg;->s:Ljava/lang/String;

    new-instance v2, Lgqg;

    invoke-direct/range {v2 .. v9}, Lgqg;-><init>(Ljava/lang/String;Lmpg;Lwpg;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_13

    :cond_36
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_3d

    return-object v0

    :cond_3d
    const/4 p0, 0x0

    return-object p0
.end method

.method public static s(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 3

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "_data"

    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "_url"

    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "_timestamp"

    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "_request_time"

    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method


# virtual methods
.method public final A(Lgtj;)V
    .registers 4

    iget-object v0, p0, Lami;->g:Ljava/lang/Object;

    check-cast v0, Lic;

    iget-object v1, p0, Lami;->f:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_15

    const p0, 0x7f1412ee

    invoke-virtual {p1, p0, v0}, Lgtj;->f(ILandroid/view/View$OnClickListener;)V

    goto :goto_1c

    :cond_15
    iget-object p0, p0, Lami;->f:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p1, p0, v0}, Lgtj;->g(Ljava/lang/CharSequence;Landroid/view/View$OnClickListener;)V

    :goto_1c
    iget-object p0, p1, Lgtj;->a:Lasj;

    iget-object p0, p0, Lna3;->i:Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;

    const p1, 0x7f0a0a8b

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    if-nez p0, :cond_2a

    return-void

    :cond_2a
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final B()V
    .registers 10

    iget-object v0, p0, Lami;->h:Ljava/lang/Object;

    check-cast v0, Lkze;

    iget-object v1, p0, Lami;->f:Ljava/lang/Object;

    check-cast v1, Lvzk;

    iget-object p0, p0, Lami;->g:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, v1, Lvzk;->d:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    :cond_23
    :goto_23
    if-ge v4, v3, :cond_55

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Ljava/lang/String;

    move-object v6, p0

    check-cast v6, Ljava/lang/Iterable;

    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_34
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4c

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    move-object v8, v7

    check-cast v8, Laln;

    invoke-interface {v8}, Laln;->getId()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_34

    goto :goto_4d

    :cond_4c
    const/4 v7, 0x0

    :goto_4d
    check-cast v7, Laln;

    if-eqz v7, :cond_23

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_23

    :cond_55
    invoke-virtual {v0, v2}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final C(Lr6j;)V
    .registers 13

    iget-object v0, p0, Lami;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lami;->f:Ljava/lang/Object;

    check-cast v1, Landroid/util/SparseIntArray;

    iget-object p0, p0, Lami;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    iget v3, p1, Lr6j;->a:I

    iget-object v4, p1, Lr6j;->b:Lx6j;

    iget-object v2, p1, Lr6j;->c:Lq6j;

    invoke-interface {v2, p0}, Lq6j;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p1, Lr6j;->d:Lq6j;

    invoke-interface {v6, p0}, Lq6j;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    iget v7, p1, Lr6j;->e:I

    iget-boolean v8, p1, Lr6j;->f:Z

    iget-boolean v9, p1, Lr6j;->h:Z

    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v10

    invoke-interface {v2, p0}, Lq6j;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v10, v2}, Lehc;->add(Ljava/lang/Object;)Z

    iget-object p1, p1, Lr6j;->i:Ljava/util/List;

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_35
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_49

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lq6j;

    invoke-interface {v2, p0}, Lq6j;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v10, v2}, Lehc;->add(Ljava/lang/Object;)Z

    goto :goto_35

    :cond_49
    invoke-static {v10}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object v10

    new-instance v2, Ll6j;

    invoke-direct/range {v2 .. v10}, Ll6j;-><init>(ILx6j;Ljava/lang/String;Ljava/lang/String;IZZLehc;)V

    const/4 p0, -0x1

    invoke-virtual {v1, v3, p0}, Landroid/util/SparseIntArray;->get(II)I

    move-result p1

    if-eq p1, p0, :cond_5d

    invoke-virtual {v0, p1, v2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_5d
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v0}, Lj95;->h(Ljava/util/List;)I

    move-result p0

    invoke-virtual {v1, v3, p0}, Landroid/util/SparseIntArray;->put(II)V

    return-void
.end method

.method public final D(Laln;)V
    .registers 5

    iget-object p0, p0, Lami;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    invoke-interface {p1}, Laln;->getId()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences$Editor;

    const-string v2, "wallpaper.item_data.id"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "wallpaper.item_data.content"

    invoke-interface {v1, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    return-void
.end method

.method public final E()V
    .registers 11

    iget-object v0, p0, Lami;->g:Ljava/lang/Object;

    check-cast v0, Lv9j;

    iget-object v1, p0, Lami;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/settings/SettingsManager;

    iget-object v2, p0, Lami;->c:Ljava/lang/Object;

    check-cast v2, Lfw3;

    invoke-static {v1, v2}, Lvtp;->I(Lcom/opera/android/settings/SettingsManager;Lfw3;)Ljava/util/List;

    move-result-object v2

    sget-object v3, Ldq3;->a:Ljava/util/ArrayList;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/4 v6, 0x0

    :cond_1c
    :goto_1c
    if-ge v6, v5, :cond_3d

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v6, v6, 0x1

    move-object v8, v7

    check-cast v8, Lpc;

    invoke-interface {v2, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_1c

    iget-object v9, p0, Lami;->e:Ljava/lang/Object;

    check-cast v9, Ljt3;

    iget-object v9, v9, Ljt3;->f:Lfd;

    invoke-virtual {v9, v8}, Lfd;->b(Lpc;)Z

    move-result v8

    if-eqz v8, :cond_1c

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1c

    :cond_3d
    iget-object p0, p0, Lami;->d:Ljava/lang/Object;

    check-cast p0, Landroid/content/res/Resources;

    new-instance v3, Lta2;

    invoke-direct {v3, p0}, Lta2;-><init>(Landroid/content/res/Resources;)V

    invoke-static {v3, v4}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p0

    const-string v3, "toolbar_bottom_actions"

    iget-object v1, v1, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-interface {v1, v3}, Ly9j;->contains(Ljava/lang/String;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    new-instance v3, Lxo3;

    invoke-direct {v3, v2, p0, v1}, Lxo3;-><init>(Ljava/util/List;Ljava/util/List;Z)V

    invoke-virtual {v0, v3}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final a(Landroid/view/View;)V
    .registers 3

    iget-object v0, p0, Lami;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lami;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lami;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lami;->b:Ljava/lang/Object;

    check-cast p0, Ltuj;

    iget-object p0, p0, Ltuj;->g:Ljava/lang/Object;

    check-cast p0, Ljava/util/WeakHashMap;

    invoke-virtual {p0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final b(Landroid/view/View;Looo;)V
    .registers 10

    iget-object v0, p0, Lami;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, p2, :cond_13

    invoke-virtual {p0, p1}, Lami;->a(Landroid/view/View;)V

    invoke-interface {p2}, Looo;->f()Z

    move-result v1

    if-eqz v1, :cond_14

    :cond_13
    return-void

    :cond_14
    invoke-virtual {v0, p1, p2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {p2}, Looo;->e()I

    move-result v0

    iget-object p0, p0, Lami;->b:Ljava/lang/Object;

    move-object v1, p0

    check-cast v1, Ltuj;

    if-lez v0, :cond_34

    invoke-interface {p2}, Looo;->h()I

    move-result v4

    invoke-interface {p2}, Looo;->e()I

    move-result v5

    invoke-interface {p2}, Looo;->d()Ljava/lang/Integer;

    move-result-object v6

    move-object v3, p1

    move-object v2, p1

    invoke-virtual/range {v1 .. v6}, Ltuj;->b(Landroid/view/View;Landroid/view/View;IILjava/lang/Integer;)V

    return-void

    :cond_34
    move-object v2, p1

    invoke-interface {p2}, Looo;->h()I

    move-result v4

    invoke-interface {p2}, Looo;->d()Ljava/lang/Integer;

    move-result-object v6

    move-object v3, v2

    move v5, v4

    invoke-virtual/range {v1 .. v6}, Ltuj;->b(Landroid/view/View;Landroid/view/View;IILjava/lang/Integer;)V

    return-void
.end method

.method public final c()Lfai;
    .registers 13

    iget-object v0, p0, Lami;->b:Ljava/lang/Object;

    check-cast v0, Lkai;

    const/4 v1, 0x0

    if-eqz v0, :cond_11a

    iget-object v2, p0, Lami;->d:Ljava/lang/Object;

    check-cast v2, Lqie;

    if-eqz v2, :cond_114

    iget-object v3, p0, Lami;->e:Ljava/lang/Object;

    check-cast v3, Lqie;

    if-eqz v3, :cond_114

    iget-object v4, p0, Lami;->c:Ljava/lang/Object;

    check-cast v4, Lqie;

    if-eqz v4, :cond_10e

    iget-object v5, p0, Lami;->f:Ljava/lang/Object;

    check-cast v5, Lqie;

    if-eqz v5, :cond_108

    iget-object v6, p0, Lami;->g:Ljava/lang/Object;

    check-cast v6, Lqie;

    if-eqz v6, :cond_108

    iget-object v7, p0, Lami;->h:Ljava/lang/Object;

    check-cast v7, Lqie;

    if-eqz v7, :cond_102

    iget-object v8, v0, Lkai;->f:Lbai;

    iget-object v8, v8, Lbai;->b:Ljava/math/BigInteger;

    iget-object v0, v0, Lkai;->g:Ljava/math/BigInteger;

    iget-object v2, v2, Lqie;->b:Ljava/lang/Object;

    check-cast v2, Ljava/math/BigInteger;

    iget-object v3, v3, Lqie;->b:Ljava/lang/Object;

    check-cast v3, Ljava/math/BigInteger;

    iget-object v4, v4, Lqie;->b:Ljava/lang/Object;

    check-cast v4, Ljava/math/BigInteger;

    iget-object v5, v5, Lqie;->b:Ljava/lang/Object;

    check-cast v5, Ljava/math/BigInteger;

    iget-object v6, v6, Lqie;->b:Ljava/lang/Object;

    check-cast v6, Ljava/math/BigInteger;

    iget-object v7, v7, Lqie;->b:Ljava/lang/Object;

    check-cast v7, Ljava/math/BigInteger;

    const/16 v9, 0xa

    invoke-virtual {v2, v9}, Ljava/math/BigInteger;->isProbablePrime(I)Z

    move-result v10

    if-eqz v10, :cond_fc

    invoke-virtual {v3, v9}, Ljava/math/BigInteger;->isProbablePrime(I)Z

    move-result v9

    if-eqz v9, :cond_f6

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f0

    sget-object v0, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v2, v0}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v9

    invoke-virtual {v3, v0}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/math/BigInteger;->gcd(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v11

    invoke-virtual {v8, v4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v4, v11}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ea

    invoke-virtual {v8, v5}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v4, v9}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_e4

    invoke-virtual {v8, v6}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v4, v10}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_de

    invoke-virtual {v3, v7}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d8

    new-instance v2, Lfai;

    iget-object v0, p0, Lami;->b:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lkai;

    iget-object v0, p0, Lami;->d:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Lqie;

    iget-object v0, p0, Lami;->e:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lqie;

    iget-object v0, p0, Lami;->c:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Lqie;

    iget-object v0, p0, Lami;->f:Ljava/lang/Object;

    move-object v7, v0

    check-cast v7, Lqie;

    iget-object v0, p0, Lami;->g:Ljava/lang/Object;

    move-object v8, v0

    check-cast v8, Lqie;

    iget-object p0, p0, Lami;->h:Ljava/lang/Object;

    move-object v9, p0

    check-cast v9, Lqie;

    invoke-direct/range {v2 .. v9}, Lfai;-><init>(Lkai;Lqie;Lqie;Lqie;Lqie;Lqie;Lqie;)V

    return-object v2

    :cond_d8
    const-string p0, "qInv is invalid."

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_de
    const-string p0, "dQ is invalid."

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_e4
    const-string p0, "dP is invalid."

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_ea
    const-string p0, "D is invalid."

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_f0
    const-string p0, "Prime p times prime q is not equal to the public key\'s modulus"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_f6
    const-string p0, "q is not a prime"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_fc
    const-string p0, "p is not a prime"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_102
    const-string p0, "Cannot build without CRT coefficient"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_108
    const-string p0, "Cannot build without prime exponents"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_10e
    const-string p0, "Cannot build without private exponent"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_114
    const-string p0, "Cannot build without prime factors"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_11a
    const-string p0, "Cannot build without a RSA SSA PKCS1 public key"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1
.end method

.method public final d(Ljfh;)Ltli;
    .registers 7

    instance-of v0, p1, Lhfh;

    if-eqz v0, :cond_3e

    new-instance v0, Ltli;

    new-instance v1, Luli;

    move-object v2, p1

    check-cast v2, Lhfh;

    iget-boolean v2, v2, Lhfh;->a:Z

    if-eqz v2, :cond_20

    new-instance v2, Llxh;

    const v3, 0x7f080556

    invoke-direct {v2, v3}, Llxh;-><init>(I)V

    new-instance v3, Lrxh;

    const v4, 0x7f1412c5

    invoke-direct {v3, v4}, Lrxh;-><init>(I)V

    goto :goto_30

    :cond_20
    new-instance v2, Llxh;

    const v3, 0x7f080555

    invoke-direct {v2, v3}, Llxh;-><init>(I)V

    new-instance v3, Lrxh;

    const v4, 0x7f1412c6

    invoke-direct {v3, v4}, Lrxh;-><init>(I)V

    :goto_30
    invoke-direct {v1, v2, v3}, Luli;-><init>(Llxh;Lrxh;)V

    new-instance v2, Lj5g;

    const/16 v3, 0x9

    invoke-direct {v2, p0, p1, v3}, Lj5g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v0, v1, v2}, Ltli;-><init>(Luli;Landroid/view/View$OnClickListener;)V

    return-object v0

    :cond_3e
    sget-object p0, Lifh;->a:Lifh;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    const/4 p1, 0x0

    if-eqz p0, :cond_48

    return-object p1

    :cond_48
    invoke-static {}, Lh9o;->p()V

    return-object p1
.end method

.method public final e(Lgfh;Ljfh;)Lyli;
    .registers 16

    iget-object v0, p0, Lami;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/qr/ScanQrCodeActivity;

    instance-of v1, p1, Lcfh;

    if-nez v1, :cond_108

    sget-object v1, Ldfh;->a:Ldfh;

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_108

    instance-of v1, p1, Lefh;

    if-eqz v1, :cond_21

    new-instance v2, Lyli;

    const/4 v7, 0x0

    const/16 v8, 0x1f

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v2 .. v8}, Lyli;-><init>(Ltli;Ltli;Lh4i;Lj5g;La4h;I)V

    return-object v2

    :cond_21
    instance-of v1, p1, Lffh;

    const/4 v2, 0x0

    if-eqz v1, :cond_104

    move-object v1, p1

    check-cast v1, Lffh;

    iget-object v1, v1, Lffh;->a:Lhmi;

    if-eqz v1, :cond_e9

    iget-object v3, v1, Lhmi;->d:Lfmi;

    new-instance v6, Ltli;

    instance-of v4, v3, Lemi;

    sget-object v5, Lami;->i:Luli;

    if-eqz v4, :cond_3a

    sget-object v4, Lami;->j:Luli;

    goto :goto_4a

    :cond_3a
    instance-of v4, v3, Lbmi;

    if-nez v4, :cond_42

    instance-of v4, v3, Ldmi;

    if-eqz v4, :cond_44

    :cond_42
    move-object v4, v5

    goto :goto_4a

    :cond_44
    instance-of v4, v3, Lcmi;

    if-eqz v4, :cond_e5

    sget-object v4, Lami;->k:Luli;

    :goto_4a
    new-instance v7, Lj5g;

    const/16 v8, 0x8

    invoke-direct {v7, p0, v1, v8}, Lj5g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v6, v4, v7}, Ltli;-><init>(Luli;Landroid/view/View$OnClickListener;)V

    move-object v1, v4

    new-instance v4, Lyli;

    move-object v7, v5

    invoke-virtual {p0, p2}, Lami;->d(Ljfh;)Ltli;

    move-result-object v5

    move-object p2, v7

    new-instance v7, Lh4i;

    invoke-direct {v7, p0, p1}, Lh4i;-><init>(Lami;Lgfh;)V

    invoke-virtual {v1, p2}, Luli;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_70

    new-instance p2, Lj5g;

    const/4 v1, 0x7

    invoke-direct {p2, p0, p1, v1}, Lj5g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object v8, p2

    goto :goto_71

    :cond_70
    move-object v8, v2

    :goto_71
    instance-of p0, v3, Lbmi;

    if-eqz p0, :cond_80

    new-instance p0, Lxli;

    check-cast v3, Lbmi;

    iget-object p1, v3, Lbmi;->a:Ljava/lang/String;

    invoke-direct {p0, p1}, Lxli;-><init>(Ljava/lang/String;)V

    :goto_7e
    move-object v9, p0

    goto :goto_db

    :cond_80
    instance-of p0, v3, Ldmi;

    if-eqz p0, :cond_8e

    new-instance p0, Lxli;

    check-cast v3, Ldmi;

    iget-object p1, v3, Ldmi;->a:Ljava/lang/String;

    invoke-direct {p0, p1}, Lxli;-><init>(Ljava/lang/String;)V

    goto :goto_7e

    :cond_8e
    instance-of p0, v3, Lcmi;

    if-eqz p0, :cond_9c

    new-instance p0, Lwli;

    check-cast v3, Lcmi;

    iget-object p1, v3, Lcmi;->a:Ljava/lang/String;

    invoke-direct {p0, p1}, Lwli;-><init>(Ljava/lang/String;)V

    goto :goto_7e

    :cond_9c
    instance-of p0, v3, Lemi;

    if-eqz p0, :cond_e1

    new-instance p0, Lwli;

    check-cast v3, Lemi;

    iget-object p1, v3, Lemi;->b:Ll1o;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const v1, 0x7f1415ae

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Ll1o;->b:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0xa

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object p1, p1, Ll1o;->c:Ljava/lang/String;

    if-eqz p1, :cond_d3

    const v2, 0x7f1415af

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_d3
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lwli;-><init>(Ljava/lang/String;)V

    goto :goto_7e

    :goto_db
    const/16 v10, 0x20

    invoke-direct/range {v4 .. v10}, Lyli;-><init>(Ltli;Ltli;Lh4i;Lj5g;La4h;I)V

    return-object v4

    :cond_e1
    invoke-static {}, Lh9o;->p()V

    return-object v2

    :cond_e5
    invoke-static {}, Lh9o;->p()V

    return-object v2

    :cond_e9
    new-instance v5, Lyli;

    invoke-virtual {p0, p2}, Lami;->d(Ljfh;)Ltli;

    move-result-object v6

    new-instance v10, Lwli;

    const p0, 0x7f140d6f

    invoke-virtual {v0, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v10, p0}, Lwli;-><init>(Ljava/lang/String;)V

    const/16 v11, 0x2e

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v5 .. v11}, Lyli;-><init>(Ltli;Ltli;Lh4i;Lj5g;La4h;I)V

    return-object v5

    :cond_104
    invoke-static {}, Lh9o;->p()V

    return-object v2

    :cond_108
    new-instance v6, Lyli;

    const/4 v11, 0x0

    const/16 v12, 0x3f

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v6 .. v12}, Lyli;-><init>(Ltli;Ltli;Lh4i;Lj5g;La4h;I)V

    return-object v6
.end method

.method public final f(Ljava/lang/String;Ljava/lang/Runnable;)V
    .registers 6

    iget-object p0, p0, Lami;->d:Ljava/lang/Object;

    check-cast p0, Ls14;

    iget-object v0, p0, Ls14;->f:Ljava/lang/Object;

    check-cast v0, Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_51

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Laln;

    invoke-interface {v1}, Laln;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    invoke-interface {v1}, Laln;->getId()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iget-object v0, p0, Ls14;->d:Ljava/lang/Object;

    check-cast v0, Lumi;

    new-instance v1, Lnpl;

    const/16 v2, 0x1a

    invoke-direct {v1, p0, p1, v2}, Lnpl;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v0, v1}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object p1

    new-instance v1, Lnpl;

    const/16 v2, 0x1b

    invoke-direct {v1, p0, p2, v2}, Lnpl;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v0, v1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    invoke-virtual {p1, p0}, Lnml;->b(Lnml;)V

    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Lnml;->a(Ljava/lang/Object;)Loml;

    :cond_51
    return-void
.end method

.method public final h(Lknf;)V
    .registers 3

    iget-object p0, p0, Lami;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/BrowserFragment;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {p1}, Lknf;->getView()Lcom/opera/android/browser/OperaPageRootView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object p0, p0, Lcom/opera/android/browser/BrowserFragment;->l:Landroid/widget/FrameLayout;

    if-ne v0, p0, :cond_1a

    invoke-interface {p1}, Lknf;->getView()Lcom/opera/android/browser/OperaPageRootView;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_1a
    invoke-interface {p1}, Lknf;->e()V

    return-void
.end method

.method public final i(I)Z
    .registers 5

    div-int/lit16 v0, p1, 0x3e8

    mul-int/lit16 v0, v0, 0x3e8

    iget-object v1, p0, Lami;->g:Ljava/lang/Object;

    check-cast v1, Ljava/util/Set;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    xor-int/lit8 v2, v1, 0x1

    if-ne p1, v0, :cond_15

    return v2

    :cond_15
    if-nez v1, :cond_27

    iget-object p0, p0, Lami;->g:Ljava/lang/Object;

    check-cast p0, Ljava/util/Set;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_27

    const/4 p0, 0x1

    return p0

    :cond_27
    const/4 p0, 0x0

    return p0
.end method

.method public final j()V
    .registers 1

    invoke-virtual {p0}, Lami;->E()V

    return-void
.end method

.method public final k(Ljava/lang/String;ILcom/opera/api/Callback;)V
    .registers 9

    const-string v0, "THEME_WALLPAPER"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    sget-object p0, Lami;->l:Lill;

    invoke-interface {p3, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_e
    const-string v0, "NETWORK_529"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    sget-object p0, Lami;->m:Lby6;

    invoke-interface {p3, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_1c
    iget-object v0, p0, Lami;->e:Ljava/lang/Object;

    check-cast v0, Lvq8;

    iget-object v1, p0, Lami;->d:Ljava/lang/Object;

    check-cast v1, Ls14;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v2, "FILE_"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_32

    move-object v0, v1

    goto :goto_42

    :cond_32
    and-int/lit8 v1, p2, 0x2

    if-nez v1, :cond_41

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v1, "NETWORK_"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_42

    :cond_41
    move-object v0, v3

    :cond_42
    :goto_42
    if-nez v0, :cond_48

    invoke-interface {p3, v3}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_48
    invoke-interface {v0, p1}, Lbln;->f(Ljava/lang/String;)Laln;

    move-result-object v1

    if-eqz v1, :cond_59

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_55

    invoke-virtual {p0, v1}, Lami;->D(Laln;)V

    :cond_55
    invoke-interface {p3, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_59
    and-int/lit8 v1, p2, 0x1

    if-eqz v1, :cond_8b

    iget-object v1, p0, Lami;->b:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    invoke-static {v1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v2

    iget-object v2, v2, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v4, "wallpaper.item_data.id"

    invoke-interface {v2, v4, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v1

    iget-object v1, v1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v4, "wallpaper.item_data.content"

    invoke-interface {v1, v4, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_85

    if-eqz v1, :cond_85

    invoke-interface {v0, v1}, Lbln;->b(Ljava/lang/String;)Laln;

    move-result-object v3

    :cond_85
    if-eqz v3, :cond_8b

    invoke-interface {p3, v3}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_8b
    new-instance v1, Llt2;

    const/4 v2, 0x6

    invoke-direct {v1, p0, p2, p3, v2}, Llt2;-><init>(Ljava/lang/Object;ILjava/lang/Object;B)V

    invoke-interface {v0, p1, v1}, Lbln;->k(Ljava/lang/String;Llt2;)V

    return-void
.end method

.method public final l()Ljava/util/List;
    .registers 13

    iget-object v0, p0, Lami;->g:Ljava/lang/Object;

    check-cast v0, Lgqg;

    iget-object v1, p0, Lami;->f:Ljava/lang/Object;

    check-cast v1, Lgqg;

    iget-object v2, p0, Lami;->d:Ljava/lang/Object;

    check-cast v2, Lgqg;

    iget-object v3, p0, Lami;->e:Ljava/lang/Object;

    check-cast v3, Lgqg;

    iget-object v4, p0, Lami;->c:Ljava/lang/Object;

    check-cast v4, Lgqg;

    iget-object v5, p0, Lami;->b:Ljava/lang/Object;

    check-cast v5, Lgqg;

    iget-object p0, p0, Lami;->h:Ljava/lang/Object;

    check-cast p0, Lw14;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const/4 v6, 0x5

    const/4 v7, 0x4

    const/4 v8, 0x3

    const/4 v9, 0x0

    const/4 v10, 0x2

    const/4 v11, 0x1

    if-eqz p0, :cond_75

    if-eq p0, v11, :cond_31

    if-eq p0, v10, :cond_75

    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :cond_31
    filled-new-array {v5}, [Lgqg;

    move-result-object p0

    invoke-static {p0}, Lami;->o([Lgqg;)Ljava/util/ArrayList;

    move-result-object p0

    filled-new-array {v4}, [Lgqg;

    move-result-object v4

    invoke-static {v4}, Lami;->o([Lgqg;)Ljava/util/ArrayList;

    move-result-object v4

    filled-new-array {v3}, [Lgqg;

    move-result-object v3

    invoke-static {v3}, Lami;->o([Lgqg;)Ljava/util/ArrayList;

    move-result-object v3

    filled-new-array {v2}, [Lgqg;

    move-result-object v2

    invoke-static {v2}, Lami;->o([Lgqg;)Ljava/util/ArrayList;

    move-result-object v2

    filled-new-array {v1}, [Lgqg;

    move-result-object v1

    invoke-static {v1}, Lami;->o([Lgqg;)Ljava/util/ArrayList;

    move-result-object v1

    filled-new-array {v0}, [Lgqg;

    move-result-object v0

    invoke-static {v0}, Lami;->o([Lgqg;)Ljava/util/ArrayList;

    move-result-object v0

    const/4 v5, 0x6

    new-array v5, v5, [Ljava/util/List;

    aput-object p0, v5, v9

    aput-object v4, v5, v11

    aput-object v3, v5, v10

    aput-object v2, v5, v8

    aput-object v1, v5, v7

    aput-object v0, v5, v6

    invoke-static {v5}, Le82;->p([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_75
    filled-new-array {v4, v5}, [Lgqg;

    move-result-object p0

    invoke-static {p0}, Lami;->o([Lgqg;)Ljava/util/ArrayList;

    move-result-object p0

    filled-new-array {v3}, [Lgqg;

    move-result-object v3

    invoke-static {v3}, Lami;->o([Lgqg;)Ljava/util/ArrayList;

    move-result-object v3

    filled-new-array {v2}, [Lgqg;

    move-result-object v2

    invoke-static {v2}, Lami;->o([Lgqg;)Ljava/util/ArrayList;

    move-result-object v2

    filled-new-array {v1}, [Lgqg;

    move-result-object v1

    invoke-static {v1}, Lami;->o([Lgqg;)Ljava/util/ArrayList;

    move-result-object v1

    filled-new-array {v0}, [Lgqg;

    move-result-object v0

    invoke-static {v0}, Lami;->o([Lgqg;)Ljava/util/ArrayList;

    move-result-object v0

    new-array v4, v6, [Ljava/util/List;

    aput-object p0, v4, v9

    aput-object v3, v4, v11

    aput-object v2, v4, v10

    aput-object v1, v4, v8

    aput-object v0, v4, v7

    invoke-static {v4}, Le82;->p([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public final m(Lkze;)V
    .registers 5

    iget-object v0, p0, Lami;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    new-instance v1, Ls9;

    const/4 v2, 0x6

    invoke-direct {v1, p0, v2}, Ls9;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, p1, v1}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    return-void
.end method

.method public final n()Ljava/util/List;
    .registers 8

    iget-object v0, p0, Lami;->f:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lgqg;

    iget-object v0, p0, Lami;->e:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lgqg;

    iget-object v0, p0, Lami;->d:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lgqg;

    iget-object v0, p0, Lami;->c:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Lgqg;

    iget-object v0, p0, Lami;->b:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lgqg;

    iget-object p0, p0, Lami;->g:Ljava/lang/Object;

    move-object v6, p0

    check-cast v6, Lgqg;

    filled-new-array/range {v1 .. v6}, [Lgqg;

    move-result-object p0

    invoke-static {p0}, Lami;->o([Lgqg;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-static {p0}, Lj95;->i(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public final p(I)Lddf;
    .registers 5

    iget-object v0, p0, Lami;->h:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne p1, v0, :cond_f

    sget-object p0, Lddf;->a:Lddf;

    return-object p0

    :cond_f
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lami;->h:Ljava/lang/Object;

    iget-object p0, p0, Lami;->c:Ljava/lang/Object;

    check-cast p0, Lei;

    iget-object p0, p0, Lei;->i:Landroid/view/View;

    check-cast p0, Landroid/widget/TextView;

    const/4 v0, 0x1

    if-le p1, v0, :cond_24

    const v1, 0x800003

    goto :goto_25

    :cond_24
    move v1, v0

    :goto_25
    invoke-virtual {p0}, Landroid/widget/TextView;->getGravity()I

    move-result v2

    and-int/lit8 v2, v2, 0x70

    or-int/2addr v2, v1

    invoke-virtual {p0}, Landroid/widget/TextView;->getGravity()I

    move-result v1

    if-eq v2, v1, :cond_35

    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setGravity(I)V

    :cond_35
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    if-le p1, v0, :cond_3f

    const p1, 0x7f08094a

    goto :goto_42

    :cond_3f
    const p1, 0x7f08094b

    :goto_42
    invoke-static {p1, v1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    sget-object p0, Lddf;->b:Lddf;

    return-object p0
.end method

.method public final q()V
    .registers 9

    iget-object v0, p0, Lami;->d:Ljava/lang/Object;

    check-cast v0, Lh42;

    iget-object v1, p0, Lami;->e:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    :cond_12
    :goto_12
    if-ge v4, v3, :cond_2d

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    move-object v6, v5

    check-cast v6, Ll6j;

    iget-boolean v7, v6, Ll6j;->g:Z

    if-eqz v7, :cond_12

    iget v6, v6, Ll6j;->a:I

    invoke-virtual {p0, v6}, Lami;->i(I)Z

    move-result v6

    if-eqz v6, :cond_12

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_12

    :cond_2d
    invoke-virtual {v0, v2}, Lekc;->n(Ljava/lang/Object;)V

    return-void
.end method

.method public final r(Ljava/lang/Runnable;)V
    .registers 4

    new-instance v0, Lvr9;

    const/4 v1, 0x2

    invoke-direct {v0, p1, v1}, Lvr9;-><init>(Ljava/lang/Runnable;I)V

    iget-object p1, p0, Lami;->d:Ljava/lang/Object;

    check-cast p1, Ls14;

    invoke-virtual {p1, v0}, Ls14;->G(Ljava/lang/Runnable;)V

    iget-object p0, p0, Lami;->e:Ljava/lang/Object;

    check-cast p0, Lvq8;

    invoke-virtual {p0, v0}, Lvq8;->p(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final t(Lro9;)V
    .registers 7

    iget-object v0, p0, Lami;->f:Ljava/lang/Object;

    check-cast v0, Lvx;

    iget-object v1, p0, Lami;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/browser/BrowserFragment;

    iget-object v2, p0, Lami;->g:Ljava/lang/Object;

    check-cast v2, Lro9;

    iget v2, v2, Lro9;->b:I

    iput-object p1, p0, Lami;->g:Ljava/lang/Object;

    new-instance v3, La03;

    iget p1, p1, Lro9;->b:I

    invoke-direct {v3, p1}, La03;-><init>(I)V

    invoke-static {v3}, Lac8;->a(Ljava/lang/Object;)V

    const/4 v3, 0x3

    const/4 v4, 0x1

    if-eq v2, v3, :cond_22

    if-ne p1, v4, :cond_2b

    if-eq v2, v4, :cond_2b

    :cond_22
    iget-object p0, p0, Lami;->e:Ljava/lang/Object;

    check-cast p0, Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    invoke-virtual {v1, p0, p1}, Lcom/opera/android/browser/BrowserFragment;->j0(Lb2l;I)V

    :cond_2b
    if-ne p1, v4, :cond_5e

    invoke-virtual {v0}, Lvx;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_5e

    iget-object p0, v1, Lcom/opera/android/browser/BrowserFragment;->p:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    iget-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->d:Lyy4;

    if-eqz p1, :cond_44

    iget-object v1, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->e:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p1, v1}, Lyy4;->M(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    :cond_44
    iget-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->e:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz p1, :cond_5e

    invoke-virtual {p1}, Lcom/opera/android/browser/chromium/ChromiumContent;->u()Z

    move-result p1

    if-eqz p1, :cond_52

    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    return-void

    :cond_52
    new-instance p1, Lyy4;

    invoke-direct {p1, p0, v0}, Lyy4;-><init>(Lcom/opera/android/browser/chromium/ChromiumContainerView;Lvx;)V

    iput-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->d:Lyy4;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->e:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0, p1}, Lcom/opera/android/browser/chromium/ChromiumContent;->k(Liz4;)V

    :cond_5e
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    iget-byte v0, p0, Lami;->a:B

    packed-switch v0, :pswitch_data_2e

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "HttpRequestData(url="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lami;->b:Ljava/lang/Object;

    check-cast v1, Lgpm;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", method="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lami;->c:Ljava/lang/Object;

    check-cast p0, Lapa;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p0, 0x29

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_2e
    .packed-switch 0x7
        :pswitch_a
    .end packed-switch
.end method

.method public final u()V
    .registers 2

    iget-object v0, p0, Lami;->c:Ljava/lang/Object;

    check-cast v0, Lgtj;

    if-nez v0, :cond_13

    new-instance v0, Lqt;

    invoke-direct {v0, p0}, Lqt;-><init>(Lami;)V

    iget-object p0, p0, Lami;->b:Ljava/lang/Object;

    check-cast p0, Lvwh;

    invoke-interface {p0, v0}, Lvwh;->f(Lo93;)V

    return-void

    :cond_13
    invoke-virtual {p0, v0}, Lami;->A(Lgtj;)V

    iget-object p0, p0, Lami;->c:Ljava/lang/Object;

    check-cast p0, Lgtj;

    invoke-virtual {p0}, Lgtj;->j()V

    return-void
.end method

.method public final v(Lknf;)V
    .registers 4

    iget-object p0, p0, Lami;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/BrowserFragment;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {p1}, Lknf;->getView()Lcom/opera/android/browser/OperaPageRootView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_1a

    iget-object v0, p0, Lcom/opera/android/browser/BrowserFragment;->l:Landroid/widget/FrameLayout;

    invoke-interface {p1}, Lknf;->getView()Lcom/opera/android/browser/OperaPageRootView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_1a
    invoke-interface {p1}, Lknf;->d()V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/opera/android/browser/BrowserFragment;->i0(Z)V

    return-void
.end method

.method public final w(Lro9;Z)V
    .registers 16

    iget-object v0, p1, Lro9;->d:Ljava/lang/Object;

    check-cast v0, Lknf;

    iget v1, p1, Lro9;->b:I

    iget-object v2, p0, Lami;->h:Ljava/lang/Object;

    check-cast v2, Lzz2;

    const/4 v3, 0x1

    if-eqz v2, :cond_22

    iget-object v4, v2, Lzz2;->b:Ljava/lang/Object;

    check-cast v4, Lro9;

    iget v5, v4, Lro9;->b:I

    if-ne v5, v1, :cond_1c

    iget-object v4, v4, Lro9;->d:Ljava/lang/Object;

    check-cast v4, Lknf;

    if-ne v4, v0, :cond_1c

    return-void

    :cond_1c
    invoke-virtual {v2, v3}, Lzz2;->a(Z)V

    const/4 v2, 0x0

    iput-object v2, p0, Lami;->h:Ljava/lang/Object;

    :cond_22
    iget-object v2, p0, Lami;->g:Ljava/lang/Object;

    check-cast v2, Lro9;

    iget v4, v2, Lro9;->b:I

    const/4 v5, 0x2

    if-ne v4, v1, :cond_3d

    if-ne v1, v5, :cond_39

    iget-object p2, v2, Lro9;->d:Ljava/lang/Object;

    check-cast p2, Lknf;

    if-eq v0, p2, :cond_39

    invoke-virtual {p0, p2}, Lami;->h(Lknf;)V

    invoke-virtual {p0, v0}, Lami;->v(Lknf;)V

    :cond_39
    invoke-virtual {p0, p1}, Lami;->t(Lro9;)V

    return-void

    :cond_3d
    const/4 v6, 0x3

    if-nez p2, :cond_90

    if-ne v1, v3, :cond_90

    if-eq v4, v6, :cond_90

    invoke-virtual {p0, v2, p1}, Lami;->z(Lro9;Lro9;)V

    iget-object p2, p1, Lro9;->c:Ljava/lang/Object;

    check-cast p2, Lb2l;

    check-cast p2, Ld7l;

    iget-object v0, p2, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->c0()Z

    move-result v0

    if-eqz v0, :cond_60

    iget-object p2, p0, Lami;->g:Ljava/lang/Object;

    check-cast p2, Lro9;

    invoke-virtual {p0, p2, p1}, Lami;->y(Lro9;Lro9;)V

    invoke-virtual {p0, p1}, Lami;->t(Lro9;)V

    return-void

    :cond_60
    iget-object v0, p2, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->isLoading()Z

    move-result v0

    if-nez v0, :cond_7c

    invoke-virtual {p2}, Ld7l;->i()Lcom/opera/android/browser/NavigationHistory;

    move-result-object p2

    check-cast p2, Liuh;

    iget-object p2, p2, Liuh;->b:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/browser/NavigationHistory;

    invoke-interface {p2}, Lcom/opera/android/browser/NavigationHistory;->d()I

    move-result p2

    if-eqz p2, :cond_7c

    const/16 p2, 0x3e8

    :goto_7a
    move v3, p2

    goto :goto_7f

    :cond_7c
    const/16 p2, 0x2710

    goto :goto_7a

    :goto_7f
    new-instance v0, Lwz2;

    iget-object p2, p0, Lami;->b:Ljava/lang/Object;

    move-object v2, p2

    check-cast v2, Lumi;

    move-object v5, p1

    move-object v1, p0

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Lwz2;-><init>(Lami;Lumi;ILro9;Lro9;)V

    move-object v7, v1

    iput-object v0, v7, Lami;->h:Ljava/lang/Object;

    return-void

    :cond_90
    move-object v7, p0

    move-object v9, p1

    if-nez p2, :cond_b1

    if-ne v1, v5, :cond_b1

    if-eq v4, v6, :cond_b1

    invoke-virtual {v7, v2, v9}, Lami;->z(Lro9;Lro9;)V

    invoke-interface {v0}, Lknf;->getView()Lcom/opera/android/browser/OperaPageRootView;

    move-result-object v11

    invoke-virtual {v11}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v10

    new-instance v6, Lyz2;

    iget-object p0, v7, Lami;->b:Ljava/lang/Object;

    move-object v8, p0

    check-cast v8, Lumi;

    move-object v12, v9

    invoke-direct/range {v6 .. v12}, Lyz2;-><init>(Lami;Lumi;Lro9;Landroid/view/ViewTreeObserver;Lcom/opera/android/browser/OperaPageRootView;Lro9;)V

    iput-object v6, v7, Lami;->h:Ljava/lang/Object;

    return-void

    :cond_b1
    invoke-virtual {v7, v2, v9}, Lami;->z(Lro9;Lro9;)V

    iget-object p0, v7, Lami;->g:Ljava/lang/Object;

    check-cast p0, Lro9;

    invoke-virtual {v7, p0, v9}, Lami;->y(Lro9;Lro9;)V

    invoke-virtual {v7, v9}, Lami;->t(Lro9;)V

    return-void
.end method

.method public final x(Lro9;Lro9;)V
    .registers 8

    iget-object v0, p0, Lami;->d:Ljava/lang/Object;

    check-cast v0, Lvp5;

    iget v1, p2, Lro9;->b:I

    invoke-static {v1}, Lvep;->A(I)I

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_24

    if-ne v1, v2, :cond_45

    iget-object p2, p2, Lro9;->d:Ljava/lang/Object;

    check-cast p2, Lknf;

    invoke-virtual {p0, p2}, Lami;->h(Lknf;)V

    iget p0, p1, Lro9;->b:I

    if-ne p0, v2, :cond_45

    iget-object p0, v0, Lvp5;->f:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->a:Lckf;

    iget-wide v3, p0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->a:J

    invoke-static {v3, v4}, LJ/N;->MCmjt8Ye(J)V

    goto :goto_45

    :cond_24
    iget-object p0, v0, Lvp5;->a:Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    if-eqz p0, :cond_2f

    check-cast p0, Ld7l;

    invoke-virtual {p0}, Ld7l;->d()V

    :cond_2f
    iget-object p0, v0, Lvp5;->f:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->a:Lckf;

    iget-object p0, p0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->c:Lc5o;

    iget-object p0, p0, Lc5o;->a:Ljava/lang/Object;

    check-cast p0, Landroid/view/SurfaceView;

    const/16 p2, 0x8

    invoke-virtual {p0, p2}, Landroid/view/SurfaceView;->setVisibility(I)V

    iput p2, v0, Lvp5;->c:I

    iget-object p0, v0, Lvp5;->f:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    invoke-virtual {p0, p2}, Landroid/view/View;->setVisibility(I)V

    :cond_45
    :goto_45
    iget p0, p1, Lro9;->b:I

    invoke-static {p0}, Lvep;->A(I)I

    move-result p0

    if-eqz p0, :cond_4e

    return-void

    :cond_4e
    invoke-virtual {v0, v2}, Lvp5;->a(Z)V

    return-void
.end method

.method public final y(Lro9;Lro9;)V
    .registers 8

    iget-object v0, p0, Lami;->d:Ljava/lang/Object;

    check-cast v0, Lvp5;

    iget p2, p2, Lro9;->b:I

    invoke-static {p2}, Lvep;->A(I)I

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1d

    if-ne v1, v2, :cond_2d

    iget v1, p1, Lro9;->b:I

    if-ne v1, v2, :cond_2d

    iget-object v1, v0, Lvp5;->f:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    iget-object v1, v1, Lcom/opera/android/browser/chromium/ChromiumContainerView;->a:Lckf;

    iget-wide v3, v1, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->a:J

    invoke-static {v3, v4}, LJ/N;->MCmjt8Ye(J)V

    goto :goto_2d

    :cond_1d
    const/4 v1, 0x0

    iput v1, v0, Lvp5;->c:I

    iget-boolean v3, v0, Lvp5;->e:Z

    if-eqz v3, :cond_25

    const/4 v1, 0x4

    :cond_25
    iget-object v3, v0, Lvp5;->f:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0, v2}, Lvp5;->a(Z)V

    :cond_2d
    :goto_2d
    const/16 v1, 0x8

    if-eq p2, v2, :cond_49

    iget-object p2, v0, Lvp5;->a:Lk6l;

    iget-object p2, p2, Lk6l;->o:Lb2l;

    if-eqz p2, :cond_3c

    check-cast p2, Ld7l;

    invoke-virtual {p2}, Ld7l;->d()V

    :cond_3c
    iget-object p2, v0, Lvp5;->f:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    iget-object p2, p2, Lcom/opera/android/browser/chromium/ChromiumContainerView;->a:Lckf;

    iget-object p2, p2, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->c:Lc5o;

    iget-object p2, p2, Lc5o;->a:Ljava/lang/Object;

    check-cast p2, Landroid/view/SurfaceView;

    invoke-virtual {p2, v1}, Landroid/view/SurfaceView;->setVisibility(I)V

    :cond_49
    iget p2, p1, Lro9;->b:I

    invoke-static {p2}, Lvep;->A(I)I

    move-result p2

    if-eqz p2, :cond_5c

    if-eq p2, v2, :cond_54

    return-void

    :cond_54
    iget-object p1, p1, Lro9;->d:Ljava/lang/Object;

    check-cast p1, Lknf;

    invoke-virtual {p0, p1}, Lami;->h(Lknf;)V

    return-void

    :cond_5c
    iput v1, v0, Lvp5;->c:I

    iget-object p0, v0, Lvp5;->f:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final z(Lro9;Lro9;)V
    .registers 10

    iget-object v0, p0, Lami;->d:Ljava/lang/Object;

    check-cast v0, Lvp5;

    iget v1, p2, Lro9;->b:I

    invoke-static {v1}, Lvep;->A(I)I

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_27

    const/4 v3, 0x1

    if-ne v1, v3, :cond_47

    iget v1, p1, Lro9;->b:I

    if-ne v1, v3, :cond_1f

    iget-object v1, v0, Lvp5;->f:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    iget-object v1, v1, Lcom/opera/android/browser/chromium/ChromiumContainerView;->a:Lckf;

    iget-wide v3, v1, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->a:J

    const-wide/16 v5, 0x78

    invoke-static {v3, v4, v5, v6}, LJ/N;->MC0LrgA5(JJ)V

    :cond_1f
    iget-object p2, p2, Lro9;->d:Ljava/lang/Object;

    check-cast p2, Lknf;

    invoke-virtual {p0, p2}, Lami;->v(Lknf;)V

    goto :goto_47

    :cond_27
    iget-object p0, v0, Lvp5;->a:Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    if-eqz p0, :cond_32

    check-cast p0, Ld7l;

    invoke-virtual {p0}, Ld7l;->show()V

    :cond_32
    iget-object p0, v0, Lvp5;->f:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->a:Lckf;

    iget-object p0, p0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->c:Lc5o;

    iget-object p0, p0, Lc5o;->a:Ljava/lang/Object;

    check-cast p0, Landroid/view/SurfaceView;

    invoke-virtual {p0, v2}, Landroid/view/SurfaceView;->setVisibility(I)V

    const/4 p0, 0x4

    iput p0, v0, Lvp5;->c:I

    iget-object p2, v0, Lvp5;->f:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    invoke-virtual {p2, p0}, Landroid/view/View;->setVisibility(I)V

    :cond_47
    :goto_47
    iget p0, p1, Lro9;->b:I

    invoke-static {p0}, Lvep;->A(I)I

    move-result p0

    if-eqz p0, :cond_50

    return-void

    :cond_50
    invoke-virtual {v0, v2}, Lvp5;->a(Z)V

    return-void
.end method
