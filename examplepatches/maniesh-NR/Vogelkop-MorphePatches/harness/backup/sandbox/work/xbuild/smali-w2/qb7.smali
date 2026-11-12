.class public final Lqb7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lob7;
.implements Lxsc;
.implements Lwm;
.implements Lbnj;


# static fields
.field public static final d:[Ljava/lang/String;

.field public static final e:Lpsc;

.field public static final f:Lpsc;

.field public static final g:Lpsc;

.field public static final h:Ltmj;

.field public static volatile i:Lqb7;


# instance fields
.field public a:Ljava/lang/Object;

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 7

    const-string v5, "origin"

    const-string v6, "selected_state"

    const-string v0, "city_index"

    const-string v1, "city_id"

    const-string v2, "name"

    const-string v3, "state"

    const-string v4, "zip_code"

    filled-new-array/range {v0 .. v6}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lqb7;->d:[Ljava/lang/String;

    new-instance v0, Lpsc;

    const/4 v1, 0x0

    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    invoke-direct {v0, v1, v2, v3}, Lpsc;-><init>(IJ)V

    sput-object v0, Lqb7;->e:Lpsc;

    new-instance v0, Lpsc;

    const/4 v1, 0x2

    invoke-direct {v0, v1, v2, v3}, Lpsc;-><init>(IJ)V

    sput-object v0, Lqb7;->f:Lpsc;

    new-instance v0, Lpsc;

    const/4 v1, 0x3

    invoke-direct {v0, v1, v2, v3}, Lpsc;-><init>(IJ)V

    sput-object v0, Lqb7;->g:Lpsc;

    new-instance v0, Ltmj;

    const/16 v1, 0xd

    invoke-direct {v0, v1}, Ltmj;-><init>(B)V

    sput-object v0, Lqb7;->h:Ltmj;

    return-void
.end method

.method public constructor <init>(B)V
    .registers 2

    packed-switch p1, :pswitch_data_30

    .line 187
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 188
    invoke-static {}, Lzch;->a()Lcsk;

    move-result-object p1

    invoke-static {p1}, Lsgb;->b(Lkotlin/coroutines/CoroutineContext;)La64;

    move-result-object p1

    iput-object p1, p0, Lqb7;->a:Ljava/lang/Object;

    .line 189
    new-instance p1, Lpfe;

    invoke-direct {p1}, Lpfe;-><init>()V

    .line 190
    iput-object p1, p0, Lqb7;->b:Ljava/lang/Object;

    .line 191
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Lqb7;->c:Ljava/lang/Object;

    .line 192
    sget-object p1, Lnyh;->a:Ljava/util/ArrayList;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    .line 193
    :pswitch_24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 194
    new-instance p1, Lms2;

    invoke-direct {p1, p0}, Lms2;-><init>(Lqb7;)V

    iput-object p1, p0, Lqb7;->b:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_30
    .packed-switch 0xd
        :pswitch_24
    .end packed-switch
.end method

.method public constructor <init>(Laf3;Lskm;)V
    .registers 4

    .line 232
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 233
    sget-object v0, Llh4;->c:Llh4;

    iput-object v0, p0, Lqb7;->c:Ljava/lang/Object;

    .line 234
    iput-object p1, p0, Lqb7;->a:Ljava/lang/Object;

    .line 235
    iput-object p2, p0, Lqb7;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;B)V
    .registers 7

    const/4 v0, 0x4

    sparse-switch p2, :sswitch_data_ba

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p2, Lyjo;

    sget-object v0, Lwjh;->i:Lcpj;

    invoke-virtual {v0, p1}, Lcpj;->b(Landroid/content/Context;)Lwjh;

    move-result-object v1

    iget-object v1, v1, Lwjh;->d:Ljava/lang/Object;

    check-cast v1, Ljava/io/File;

    const-string v2, "omsdk.js"

    const-string v3, "https://res.adx.opera.com/om/omjs/Service/omsdk-v3.js"

    invoke-direct {p2, v1, v2, v3}, Lyjo;-><init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    iput-object p2, p0, Lqb7;->a:Ljava/lang/Object;

    new-instance p2, Lyjo;

    invoke-virtual {v0, p1}, Lcpj;->b(Landroid/content/Context;)Lwjh;

    move-result-object p1

    iget-object p1, p1, Lwjh;->d:Ljava/lang/Object;

    check-cast p1, Ljava/io/File;

    const-string v0, "omsdk-session-client.js"

    const-string v1, "https://res.adx.opera.com/om/omjs/Service/omid-session-client-v3.js"

    invoke-direct {p2, p1, v0, v1}, Lyjo;-><init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    iput-object p2, p0, Lqb7;->b:Ljava/lang/Object;

    return-void

    :sswitch_30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p2, Lvy;

    invoke-direct {p2, p0, v0}, Lvy;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lqb7;->a:Ljava/lang/Object;

    invoke-static {p1}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object p1

    iput-object p1, p0, Lqb7;->b:Ljava/lang/Object;

    invoke-virtual {p1, p2}, Lno7;->g(Lmo7;)V

    return-void

    :sswitch_49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-class p2, Lldd;

    invoke-virtual {p2}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object p2

    const v1, 0x7f040696

    invoke-static {p1, v1, p2}, Lf03;->e0(Landroid/content/Context;ILjava/lang/String;)Landroid/util/TypedValue;

    move-result-object p2

    iget p2, p2, Landroid/util/TypedValue;->data:I

    sget-object v1, Lihh;->z:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object p2

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    invoke-static {v0, p1}, Lpjn;->c(ILandroid/content/Context;)Lpjn;

    move-result-object v0

    iput-object v0, p0, Lqb7;->a:Ljava/lang/Object;

    const/4 v0, 0x2

    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    invoke-static {v0, p1}, Lpjn;->c(ILandroid/content/Context;)Lpjn;

    const/4 v0, 0x3

    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    invoke-static {v0, p1}, Lpjn;->c(ILandroid/content/Context;)Lpjn;

    const/4 v0, 0x5

    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    invoke-static {v0, p1}, Lpjn;->c(ILandroid/content/Context;)Lpjn;

    const/4 v0, 0x7

    invoke-static {p1, p2, v0}, Lj14;->L(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    const/16 v2, 0x9

    invoke-virtual {p2, v2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    invoke-static {v2, p1}, Lpjn;->c(ILandroid/content/Context;)Lpjn;

    move-result-object v2

    iput-object v2, p0, Lqb7;->b:Ljava/lang/Object;

    const/16 v2, 0x8

    invoke-virtual {p2, v2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    invoke-static {v2, p1}, Lpjn;->c(ILandroid/content/Context;)Lpjn;

    const/16 v2, 0xa

    invoke-virtual {p2, v2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    invoke-static {v1, p1}, Lpjn;->c(ILandroid/content/Context;)Lpjn;

    move-result-object p1

    iput-object p1, p0, Lqb7;->c:Ljava/lang/Object;

    new-instance p0, Landroid/graphics/Paint;

    invoke-direct {p0}, Landroid/graphics/Paint;-><init>()V

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    :sswitch_data_ba
    .sparse-switch
        0x14 -> :sswitch_49
        0x1b -> :sswitch_30
    .end sparse-switch
.end method

.method public constructor <init>(Lasa;Lt66;Landroid/content/ComponentName;)V
    .registers 4

    .line 236
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 237
    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqb7;->a:Ljava/lang/Object;

    .line 238
    iput-object p2, p0, Lqb7;->b:Ljava/lang/Object;

    .line 239
    iput-object p3, p0, Lqb7;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lc37;Lzy9;Lqii;)V
    .registers 4

    .line 199
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 200
    iput-object p1, p0, Lqb7;->a:Ljava/lang/Object;

    .line 201
    iput-object p2, p0, Lqb7;->b:Ljava/lang/Object;

    .line 202
    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lqb7;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lenb;)V
    .registers 2

    .line 246
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 247
    iput-object p1, p0, Lqb7;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Likc;Landroid/widget/ImageView;Landroid/widget/ImageView;Lfd;)V
    .registers 6

    .line 203
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 204
    iput-object p2, p0, Lqb7;->a:Ljava/lang/Object;

    .line 205
    iput-object p3, p0, Lqb7;->b:Ljava/lang/Object;

    .line 206
    iput-object p4, p0, Lqb7;->c:Ljava/lang/Object;

    .line 207
    new-instance p2, Lyc;

    const/4 p3, 0x2

    invoke-direct {p2, p0, p3}, Lyc;-><init>(Ljava/lang/Object;B)V

    .line 208
    new-instance p3, Loc2;

    const/16 v0, 0x1d

    invoke-direct {p3, p0, v0}, Loc2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p4, p1, p2, p3}, La26;->U(Lw6f;Likc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4

    .line 186
    iput-object p1, p0, Lqb7;->a:Ljava/lang/Object;

    iput-object p2, p0, Lqb7;->b:Ljava/lang/Object;

    iput-object p3, p0, Lqb7;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4

    .line 240
    const-string v0, "ExoPlayer:Loader:"

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 241
    sget-object v0, Ltym;->a:Ljava/lang/String;

    .line 242
    new-instance v0, Lkj5;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lkj5;-><init>(Ljava/lang/String;B)V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object p1

    .line 243
    new-instance v0, Luac;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Luac;-><init>(B)V

    .line 244
    new-instance v1, Lenb;

    invoke-direct {v1, p1, v0}, Lenb;-><init>(Ljava/util/concurrent/ExecutorService;Luac;)V

    .line 245
    invoke-direct {p0, v1}, Lqb7;-><init>(Lenb;)V

    return-void
.end method

.method public constructor <init>(Lnr8;Lu59;)V
    .registers 3

    .line 195
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 196
    iput-object p1, p0, Lqb7;->a:Ljava/lang/Object;

    .line 197
    iput-object p2, p0, Lqb7;->b:Ljava/lang/Object;

    .line 198
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lqb7;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lnx5;Lt3e;)V
    .registers 6

    .line 222
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 223
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lqb7;->a:Ljava/lang/Object;

    const/4 v0, 0x0

    .line 224
    invoke-static {v0}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object v1

    iput-object v1, p0, Lqb7;->b:Ljava/lang/Object;

    .line 225
    invoke-static {v1}, La26;->j(Lnak;)Lrlh;

    move-result-object v1

    .line 226
    iput-object v1, p0, Lqb7;->c:Ljava/lang/Object;

    .line 227
    check-cast p2, Lh5e;

    .line 228
    iget-object p2, p2, Lh5e;->r:Ljdj;

    .line 229
    new-instance v1, Lfg6;

    const/16 v2, 0xa

    invoke-direct {v1, v2, v0, p0}, Lfg6;-><init>(BLmt5;Ljava/lang/Object;)V

    .line 230
    new-instance p0, Lz99;

    const/4 v0, 0x2

    invoke-direct {p0, p2, v1, v0}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    .line 231
    invoke-static {p0, p1}, Lj14;->Y(Lf99;Lnx5;)Ld3k;

    return-void
.end method

.method public constructor <init>(Lvk6;Lwth;)V
    .registers 6

    .line 209
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 210
    iput-object p1, p0, Lqb7;->a:Ljava/lang/Object;

    .line 211
    iput-object p2, p0, Lqb7;->b:Ljava/lang/Object;

    .line 212
    new-instance p2, Lkze;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 213
    invoke-direct {p2, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 214
    iput-object p2, p0, Lqb7;->c:Ljava/lang/Object;

    .line 215
    new-instance p2, Lr62;

    .line 216
    iget-object p1, p1, Lvk6;->a:Lrv0;

    .line 217
    iget-object p1, p1, Lrv0;->a:Ly5i;

    .line 218
    iget-object p1, p1, Ly5i;->f:Lpjb;

    if-nez p1, :cond_1b

    const/4 p1, 0x0

    .line 219
    :cond_1b
    const-string v0, "chat"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ly2;

    const/16 v2, 0x10

    invoke-direct {v1, v2}, Ly2;-><init>(B)V

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Lpjb;->a([Ljava/lang/String;ZLkotlin/jvm/functions/Function1;)Lb6i;

    move-result-object p1

    .line 220
    new-instance v0, Liu2;

    const/16 v1, 0xa

    invoke-direct {v0, p0, v1}, Liu2;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x1

    .line 221
    invoke-direct {p2, p1, v0, p0}, Lr62;-><init>(Lekc;Lcom/opera/api/Callback;B)V

    return-void
.end method


# virtual methods
.method public final A(Landroid/widget/ImageView;Lpc;)V
    .registers 6

    iget-object p0, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast p0, Lfd;

    invoke-virtual {p0, p2}, Lfd;->e(Lpc;)Ljf;

    move-result-object v0

    if-eqz v0, :cond_41

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0, p2}, Lfd;->e(Lpc;)Ljf;

    move-result-object p0

    if-nez p0, :cond_16

    sget-object p0, Lfd;->e:Ljf;

    :cond_16
    iget-object v1, p0, Ljf;->c:Lxc;

    if-nez v1, :cond_1c

    iget-object v1, p2, Lpc;->a:Lxc;

    :cond_1c
    iget p2, v1, Lxc;->a:I

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object p2, v1, Lxc;->b:Lrxh;

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {p2, v2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p2

    iget v1, v1, Lxc;->e:I

    invoke-virtual {p1, p2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-static {p1, p2, v1}, Ln1h;->o(Landroid/view/View;Ljava/lang/CharSequence;I)V

    new-instance p2, La24;

    invoke-direct {p2, p0, v0}, La24;-><init>(Ljf;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-boolean p0, p0, Ljf;->d:Z

    invoke-virtual {p1, p0}, Landroid/view/View;->setEnabled(Z)V

    return-void

    :cond_41
    const/16 p0, 0x8

    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final B()V
    .registers 9

    iget-object v0, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast v0, Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object p0, p0, Lqb7;->b:Ljava/lang/Object;

    check-cast p0, Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_27
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8a

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lot3;

    new-instance v3, Lorb;

    invoke-direct {v3}, Lorb;-><init>()V

    iget-object v4, v2, Lot3;->a:Lnt3;

    new-instance v5, Lorb;

    invoke-direct {v5}, Lorb;-><init>()V

    const-string v6, "y"

    iget v7, v4, Lnt3;->a:I

    invoke-virtual {v5, v7, v6}, Lorb;->n(ILjava/lang/String;)V

    const-string v6, "m"

    iget v7, v4, Lnt3;->b:I

    invoke-virtual {v5, v7, v6}, Lorb;->n(ILjava/lang/String;)V

    const-string v6, "d"

    iget v4, v4, Lnt3;->c:I

    invoke-virtual {v5, v4, v6}, Lorb;->n(ILjava/lang/String;)V

    const-string v4, "day"

    invoke-virtual {v3, v5, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v2, v2, Lot3;->b:Ljava/util/LinkedHashSet;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_64
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lpc;

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_64

    :cond_7c
    new-instance v2, Lvpb;

    invoke-direct {v2, v4}, Lvpb;-><init>(Ljava/util/Collection;)V

    const-string v4, "a"

    invoke-virtual {v3, v2, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_27

    :cond_8a
    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_94
    if-ge v3, v2, :cond_a4

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_94

    :cond_a4
    invoke-virtual {p0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "active_interactions"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public final C(Lrsc;Losc;I)V
    .registers 12

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    iput-object v0, p0, Lqb7;->c:Ljava/lang/Object;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    new-instance v0, Lqsc;

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v7}, Lqsc;-><init>(Lqb7;Landroid/os/Looper;Lrsc;Losc;IJ)V

    iget-object p0, v1, Lqb7;->b:Ljava/lang/Object;

    check-cast p0, Lqsc;

    if-nez p0, :cond_1f

    const/4 p0, 0x1

    goto :goto_20

    :cond_1f
    const/4 p0, 0x0

    :goto_20
    invoke-static {p0}, Lz4o;->H(Z)V

    iput-object v0, v1, Lqb7;->b:Ljava/lang/Object;

    invoke-virtual {v0}, Lqsc;->b()V

    return-void
.end method

.method public final D()V
    .registers 3

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    iget-object v0, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_1c

    if-ltz v0, :cond_14

    monitor-exit p0

    return-void

    :cond_14
    :try_start_14
    const-string v0, "Unbalanced call to unblock() detected."

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1c
    .catchall {:try_start_14 .. :try_end_1c} :catchall_1c

    :catchall_1c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final E([Lst;)[Lst;
    .registers 7

    const/4 v0, 0x0

    if-nez p1, :cond_6

    new-array p0, v0, [Lst;

    return-object p0

    :cond_6
    array-length v1, p1

    :goto_7
    if-ge v0, v1, :cond_28

    aget-object v2, p1, v0

    iget-object v3, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast v3, Ljava/util/HashMap;

    iget-object v4, v2, Lst;->j:Lrt;

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    iget-object v4, v2, Lst;->i:Ljava/lang/Long;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_25

    invoke-static {v2, v3}, Lst;->a(Lst;Ljava/lang/Long;)Lst;

    move-result-object v2

    aput-object v2, p1, v0

    :cond_25
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_28
    return-object p1
.end method

.method public final F(Landroid/graphics/Bitmap;)V
    .registers 4

    iget-object v0, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast v0, Lct1;

    iget-object v0, v0, Lct1;->b:Lbt1;

    iget-object v0, v0, Lbt1;->d:Lcom/opera/android/custom_views/StylingImageView;

    iget-object p0, p0, Lqb7;->b:Ljava/lang/Object;

    check-cast p0, Ldt1;

    iget-object p0, p0, Ldt1;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    new-instance v1, Lgcd;

    invoke-static {p0}, Lgjf;->a(Landroid/content/Context;)Lgjf;

    move-result-object p0

    invoke-direct {v1, p1, p0}, Lgcd;-><init>(Landroid/graphics/Bitmap;Lgjf;)V

    invoke-virtual {v0, v1}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final a(Ln1p;)V
    .registers 7

    iget-object v0, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast v0, Lyjo;

    iget-object v1, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_23

    invoke-virtual {v0}, Lyjo;->a()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_23

    sget-object p0, Lt0i;->b:Lp0i;

    invoke-virtual {v0}, Lyjo;->a()Ljava/io/File;

    move-result-object p0

    new-instance v0, Lt0i;

    invoke-direct {v0, p0}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Ln1p;->invoke(Ljava/lang/Object;)V

    return-void

    :cond_23
    sget-object v1, Ll1p;->a:Lsa7;

    iget-object v1, v0, Lyjo;->b:Ljava/lang/String;

    invoke-virtual {v0}, Lyjo;->a()Ljava/io/File;

    move-result-object v0

    new-instance v2, Ll5b;

    const/16 v3, 0xe

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Ll5b;-><init>(BZ)V

    new-instance v3, Leto;

    invoke-direct {v3, p0, p1}, Leto;-><init>(Lqb7;Ln1p;)V

    const/4 p0, 0x0

    invoke-static {v1, v0, v2, p0, v3}, Ll1p;->a(Ljava/lang/String;Ljava/io/File;Ll5b;Ljava/util/Set;Ln1p;)V

    return-void
.end method

.method public final b(IILandroid/view/View$OnClickListener;)V
    .registers 10

    iget-object v0, p0, Lqb7;->b:Ljava/lang/Object;

    check-cast v0, Landroid/view/LayoutInflater;

    iget-object v1, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast v1, Landroid/widget/LinearLayout;

    const v2, 0x7f0d0065

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a0322

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v2, :cond_5a

    move-object v1, v0

    check-cast v1, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    const v4, 0x7f0a06c5

    invoke-static {v4, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v5, :cond_59

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {p1, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {v2, p1}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v5, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance p1, Lnf;

    const/4 p2, 0x7

    invoke-direct {p1, p3, p0, p2}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lks8;

    const/4 p2, 0x2

    invoke-direct {p0, p1, p2}, Lks8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_59
    move v1, v4

    :cond_5a
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final c(Ln1p;)V
    .registers 7

    iget-object v0, p0, Lqb7;->b:Ljava/lang/Object;

    check-cast v0, Lyjo;

    invoke-virtual {v0}, Lyjo;->a()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1d

    sget-object p0, Lt0i;->b:Lp0i;

    invoke-virtual {v0}, Lyjo;->a()Ljava/io/File;

    move-result-object p0

    new-instance v0, Lt0i;

    invoke-direct {v0, p0}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Ln1p;->invoke(Ljava/lang/Object;)V

    return-void

    :cond_1d
    sget-object v1, Ll1p;->a:Lsa7;

    iget-object v1, v0, Lyjo;->b:Ljava/lang/String;

    invoke-virtual {v0}, Lyjo;->a()Ljava/io/File;

    move-result-object v0

    new-instance v2, Ll5b;

    const/16 v3, 0xe

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Ll5b;-><init>(BZ)V

    new-instance v3, Leto;

    invoke-direct {v3, p1, p0}, Leto;-><init>(Ln1p;Lqb7;)V

    const/4 p0, 0x0

    invoke-static {v1, v0, v2, p0, v3}, Ll1p;->a(Ljava/lang/String;Ljava/io/File;Ll5b;Ljava/util/Set;Ln1p;)V

    return-void
.end method

.method public final d(Lbm;)V
    .registers 2

    return-void
.end method

.method public final e()Z
    .registers 2

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lqb7;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_18

    if-eqz v0, :cond_e

    monitor-exit p0

    const/4 p0, 0x0

    return p0

    :cond_e
    :try_start_e
    iget-object v0, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I
    :try_end_15
    .catchall {:try_start_e .. :try_end_15} :catchall_18

    monitor-exit p0

    const/4 p0, 0x1

    return p0

    :catchall_18
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final f(Z)V
    .registers 10

    iget-object p1, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast p1, Lct1;

    iget-object p1, p1, Lct1;->b:Lbt1;

    iget-object p1, p1, Lbt1;->d:Lcom/opera/android/custom_views/StylingImageView;

    iget-object v0, p0, Lqb7;->b:Ljava/lang/Object;

    check-cast v0, Ldt1;

    iget-object v0, v0, Ldt1;->b:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Landroid/content/Context;

    iget-object p0, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    if-nez p0, :cond_19

    const-string p0, ""

    :cond_19
    move-object v2, p0

    sget p0, Lvmj;->g:I

    invoke-static {v1}, Ltmj;->i(Landroid/content/Context;)I

    move-result v4

    const/high16 p0, 0x42200000    # 40.0f

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {p0, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v5

    sget-object v6, Lna5;->b:Lna5;

    const/4 v7, 0x1

    sget-object v3, Lumj;->d:Lumj;

    invoke-static/range {v1 .. v7}, Ltmj;->l(Landroid/content/Context;Ljava/lang/String;Lumj;IILna5;Z)Lvmj;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final g()V
    .registers 1

    iget-object p0, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast p0, Lh10;

    iget-object p0, p0, Lh10;->w:Lp00;

    invoke-virtual {p0}, Lbp;->W()V

    return-void
.end method

.method public final h()Lq30;
    .registers 5

    iget-object v0, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast v0, Lv30;

    const/4 v1, 0x0

    if-eqz v0, :cond_92

    iget-object v2, p0, Lqb7;->b:Ljava/lang/Object;

    check-cast v2, Li4d;

    if-eqz v2, :cond_92

    iget v3, v0, Lv30;->a:I

    iget-object v2, v2, Li4d;->b:Ljava/lang/Object;

    check-cast v2, Lm54;

    iget-object v2, v2, Lm54;->a:[B

    array-length v2, v2

    if-ne v3, v2, :cond_8c

    invoke-virtual {v0}, Lv30;->a()Z

    move-result v0

    if-eqz v0, :cond_2a

    iget-object v0, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    if-nez v0, :cond_2a

    const-string p0, "Cannot create key without ID requirement with parameters with ID requirement"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_2a
    iget-object v0, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast v0, Lv30;

    invoke-virtual {v0}, Lv30;->a()Z

    move-result v0

    if-nez v0, :cond_40

    iget-object v0, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_40

    const-string p0, "Cannot create key with ID requirement with parameters without ID requirement"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_40
    iget-object v0, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast v0, Lv30;

    iget-object v0, v0, Lv30;->d:Lu30;

    sget-object v2, Lu30;->e:Lu30;

    if-ne v0, v2, :cond_4d

    sget-object v0, Ljuf;->a:Lm54;

    goto :goto_6e

    :cond_4d
    sget-object v2, Lu30;->d:Lu30;

    if-ne v0, v2, :cond_5e

    iget-object v0, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0}, Ljuf;->a(I)Lm54;

    move-result-object v0

    goto :goto_6e

    :cond_5e
    sget-object v2, Lu30;->c:Lu30;

    if-ne v0, v2, :cond_80

    iget-object v0, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0}, Ljuf;->b(I)Lm54;

    move-result-object v0

    :goto_6e
    new-instance v1, Lq30;

    iget-object v2, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast v2, Lv30;

    iget-object v3, p0, Lqb7;->b:Ljava/lang/Object;

    check-cast v3, Li4d;

    iget-object p0, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Integer;

    invoke-direct {v1, v2, v3, v0, p0}, Lq30;-><init>(Lv30;Li4d;Lm54;Ljava/lang/Integer;)V

    return-object v1

    :cond_80
    iget-object p0, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast p0, Lv30;

    iget-object p0, p0, Lv30;->d:Lu30;

    const-string v0, "Unknown AesEaxParameters.Variant: "

    invoke-static {p0, v0}, Lj9h;->u(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v1

    :cond_8c
    const-string p0, "Key size mismatch"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_92
    const-string p0, "Cannot build without parameters and/or key material"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1
.end method

.method public final i()V
    .registers 2

    iget-object p0, p0, Lqb7;->b:Ljava/lang/Object;

    check-cast p0, Lqsc;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lqsc;->a(Z)V

    return-void
.end method

.method public final j(Landroid/graphics/drawable/Drawable;ZLjava/lang/String;Landroid/view/View$OnClickListener;IZ)Landroid/view/View;
    .registers 10

    iget-object v0, p0, Lqb7;->b:Ljava/lang/Object;

    check-cast v0, Landroid/view/LayoutInflater;

    iget-object v1, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast v1, Landroid/widget/LinearLayout;

    const/4 v2, 0x0

    invoke-virtual {v0, p5, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p5

    invoke-virtual {v1, p5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v0, 0x7f0a0322

    invoke-virtual {p5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    const/16 v1, 0x8

    if-eqz p1, :cond_37

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0, p1}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    if-nez p2, :cond_3a

    new-instance p1, Lp73;

    invoke-direct {p1, v0, v2}, Lp73;-><init>(Lcom/opera/android/custom_views/StylingImageView;B)V

    invoke-static {v0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p2

    if-eqz p2, :cond_33

    invoke-static {p2, v0, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_33
    invoke-virtual {p1, v0}, Lp73;->a(Landroid/view/View;)V

    goto :goto_3a

    :cond_37
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_3a
    :goto_3a
    const p1, 0x7f0a06c5

    invoke-virtual {p5, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast p0, Lq73;

    new-instance p1, Lnf;

    const/16 p2, 0xd

    invoke-direct {p1, p4, p0, p2}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lks8;

    const/4 p2, 0x2

    invoke-direct {p0, p1, p2}, Lks8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p5, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p0, 0x7f0a0149

    invoke-virtual {p5, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_69

    if-nez p6, :cond_66

    move v2, v1

    :cond_66
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_69
    return-object p5
.end method

.method public final k(IILandroid/view/View$OnClickListener;)V
    .registers 13

    iget-object v0, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast v0, Lq73;

    iget-object v0, v0, Ldej;->b:Lmej;

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {p1, v1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    const v7, 0x7f0d039d

    const/4 v4, 0x1

    const/4 v8, 0x0

    move-object v2, p0

    move-object v6, p3

    invoke-virtual/range {v2 .. v8}, Lqb7;->j(Landroid/graphics/drawable/Drawable;ZLjava/lang/String;Landroid/view/View$OnClickListener;IZ)Landroid/view/View;

    return-void
.end method

.method public final l(ILandroid/view/View$OnClickListener;)V
    .registers 11

    iget-object v0, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast v0, Lq73;

    iget-object v0, v0, Ldej;->b:Lmej;

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v3, 0x1

    const/4 v7, 0x0

    const/4 v2, 0x0

    const v6, 0x7f0d039d

    move-object v1, p0

    move-object v5, p2

    invoke-virtual/range {v1 .. v7}, Lqb7;->j(Landroid/graphics/drawable/Drawable;ZLjava/lang/String;Landroid/view/View$OnClickListener;IZ)Landroid/view/View;

    return-void
.end method

.method public final m(ILandroid/view/View$OnClickListener;)Landroid/view/View;
    .registers 13

    iget-object v0, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast v0, Lq73;

    iget-object v0, v0, Ldej;->b:Lmej;

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0805f4

    invoke-static {v2, v1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v5, 0x1

    const/4 v9, 0x0

    const v8, 0x7f0d039f

    move-object v3, p0

    move-object v7, p2

    invoke-virtual/range {v3 .. v9}, Lqb7;->j(Landroid/graphics/drawable/Drawable;ZLjava/lang/String;Landroid/view/View$OnClickListener;IZ)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public final maybeThrowError()V
    .registers 3

    iget-object v0, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast v0, Ljava/io/IOException;

    if-nez v0, :cond_18

    iget-object p0, p0, Lqb7;->b:Ljava/lang/Object;

    check-cast p0, Lqsc;

    if-eqz p0, :cond_17

    iget v0, p0, Lqsc;->a:I

    iget-object v1, p0, Lqsc;->e:Ljava/io/IOException;

    if-eqz v1, :cond_17

    iget p0, p0, Lqsc;->f:I

    if-le p0, v0, :cond_17

    throw v1

    :cond_17
    return-void

    :cond_18
    throw v0
.end method

.method public final n(Ljava/lang/Object;Lkotlin/jvm/functions/Function1;Lnt5;)Ljava/lang/Object;
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    iget-object v2, v0, Lqb7;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/LinkedHashMap;

    iget-object v3, v0, Lqb7;->b:Ljava/lang/Object;

    check-cast v3, Lpfe;

    instance-of v4, v1, Lvc2;

    if-eqz v4, :cond_1f

    move-object v4, v1

    check-cast v4, Lvc2;

    iget v5, v4, Lvc2;->A:I

    const/high16 v6, -0x80000000

    and-int v7, v5, v6

    if-eqz v7, :cond_1f

    sub-int/2addr v5, v6

    iput v5, v4, Lvc2;->A:I

    goto :goto_24

    :cond_1f
    new-instance v4, Lvc2;

    invoke-direct {v4, v0, v1}, Lvc2;-><init>(Lqb7;Lnt5;)V

    :goto_24
    iget-object v1, v4, Lvc2;->y:Ljava/lang/Object;

    sget-object v5, Lpx5;->a:Lpx5;

    iget v6, v4, Lvc2;->A:I

    const/4 v7, 0x4

    const/4 v8, 0x3

    const/4 v9, 0x2

    const/4 v10, 0x1

    const/4 v11, 0x0

    if-eqz v6, :cond_76

    if-eq v6, v10, :cond_68

    if-eq v6, v9, :cond_5b

    if-eq v6, v8, :cond_4e

    if-ne v6, v7, :cond_48

    iget-object v3, v4, Lvc2;->x:Lpfe;

    iget-object v0, v4, Lvc2;->w:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Throwable;

    iget-object v2, v4, Lvc2;->v:Ljava/lang/Object;

    check-cast v2, Luc2;

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_110

    :cond_48
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v11

    :cond_4e
    iget-object v3, v4, Lvc2;->x:Lpfe;

    iget-object v0, v4, Lvc2;->w:Ljava/lang/Object;

    iget-object v2, v4, Lvc2;->v:Ljava/lang/Object;

    check-cast v2, Luc2;

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_e4

    :cond_5b
    iget-object v0, v4, Lvc2;->v:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Luc2;

    :try_start_60
    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_63
    .catchall {:try_start_60 .. :try_end_63} :catchall_65

    goto/16 :goto_d1

    :catchall_65
    move-exception v0

    goto/16 :goto_fd

    :cond_68
    iget-object v6, v4, Lvc2;->v:Ljava/lang/Object;

    check-cast v6, Lpfe;

    iget-object v12, v4, Lvc2;->u:Lkuk;

    check-cast v12, Lkotlin/jvm/functions/Function1;

    iget-object v13, v4, Lvc2;->t:Ljava/lang/Object;

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_91

    :cond_76
    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v1, p1

    iput-object v1, v4, Lvc2;->t:Ljava/lang/Object;

    move-object/from16 v6, p2

    check-cast v6, Lkuk;

    iput-object v6, v4, Lvc2;->u:Lkuk;

    iput-object v3, v4, Lvc2;->v:Ljava/lang/Object;

    iput v10, v4, Lvc2;->A:I

    invoke-virtual {v3, v4}, Lpfe;->i(Lmt5;)Ljava/lang/Object;

    move-result-object v6

    if-eq v6, v5, :cond_10f

    move-object/from16 v12, p2

    move-object v13, v1

    move-object v6, v3

    :goto_91
    :try_start_91
    invoke-virtual {v2, v13}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Luc2;

    if-eqz v1, :cond_a1

    iget-object v14, v1, Luc2;->a:Li07;

    invoke-virtual {v14}, Lxob;->isCancelled()Z

    move-result v14

    if-eqz v14, :cond_b7

    :cond_a1
    new-instance v1, Luc2;

    iget-object v0, v0, Lqb7;->a:Ljava/lang/Object;

    check-cast v0, La64;

    new-instance v14, Lwc2;

    const/4 v15, 0x0

    invoke-direct {v14, v12, v11, v15}, Lwc2;-><init>(Lkotlin/jvm/functions/Function1;Lmt5;B)V

    invoke-static {v0, v11, v11, v14, v8}, Lna2;->g(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Li07;

    move-result-object v0

    invoke-direct {v1, v0}, Luc2;-><init>(Li07;)V

    invoke-interface {v2, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_b7
    iget v0, v1, Luc2;->b:I

    add-int/2addr v0, v10

    iput v0, v1, Luc2;->b:I
    :try_end_bc
    .catchall {:try_start_91 .. :try_end_bc} :catchall_12e

    invoke-virtual {v6, v11}, Lpfe;->l(Ljava/lang/Object;)V

    :try_start_bf
    iget-object v0, v1, Luc2;->a:Li07;

    iput-object v11, v4, Lvc2;->t:Ljava/lang/Object;

    iput-object v11, v4, Lvc2;->u:Lkuk;

    iput-object v1, v4, Lvc2;->v:Ljava/lang/Object;

    iput v9, v4, Lvc2;->A:I

    invoke-virtual {v0, v4}, Lxob;->A(Lmt5;)Ljava/lang/Object;

    move-result-object v0
    :try_end_cd
    .catchall {:try_start_bf .. :try_end_cd} :catchall_fb

    if-eq v0, v5, :cond_10f

    move-object v2, v1

    move-object v1, v0

    :goto_d1
    iput-object v11, v4, Lvc2;->t:Ljava/lang/Object;

    iput-object v11, v4, Lvc2;->u:Lkuk;

    iput-object v2, v4, Lvc2;->v:Ljava/lang/Object;

    iput-object v1, v4, Lvc2;->w:Ljava/lang/Object;

    iput-object v3, v4, Lvc2;->x:Lpfe;

    iput v8, v4, Lvc2;->A:I

    invoke-virtual {v3, v4}, Lpfe;->i(Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, v5, :cond_10f

    move-object v0, v1

    :goto_e4
    :try_start_e4
    iget v1, v2, Luc2;->b:I

    iget-object v4, v2, Luc2;->a:Li07;

    add-int/lit8 v1, v1, -0x1

    iput v1, v2, Luc2;->b:I

    if-nez v1, :cond_f7

    invoke-virtual {v4}, Lxob;->isActive()Z

    move-result v1

    if-eqz v1, :cond_f7

    invoke-interface {v4, v11}, Lunb;->k(Ljava/util/concurrent/CancellationException;)V
    :try_end_f7
    .catchall {:try_start_e4 .. :try_end_f7} :catchall_129

    :cond_f7
    invoke-virtual {v3, v11}, Lpfe;->l(Ljava/lang/Object;)V

    return-object v0

    :catchall_fb
    move-exception v0

    move-object v2, v1

    :goto_fd
    iput-object v11, v4, Lvc2;->t:Ljava/lang/Object;

    iput-object v11, v4, Lvc2;->u:Lkuk;

    iput-object v2, v4, Lvc2;->v:Ljava/lang/Object;

    iput-object v0, v4, Lvc2;->w:Ljava/lang/Object;

    iput-object v3, v4, Lvc2;->x:Lpfe;

    iput v7, v4, Lvc2;->A:I

    invoke-virtual {v3, v4}, Lpfe;->i(Lmt5;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v5, :cond_110

    :cond_10f
    return-object v5

    :cond_110
    :goto_110
    :try_start_110
    iget v1, v2, Luc2;->b:I

    add-int/lit8 v1, v1, -0x1

    iput v1, v2, Luc2;->b:I

    if-nez v1, :cond_125

    iget-object v1, v2, Luc2;->a:Li07;

    invoke-virtual {v1}, Lxob;->isActive()Z

    move-result v1

    if-eqz v1, :cond_125

    iget-object v1, v2, Luc2;->a:Li07;

    invoke-interface {v1, v11}, Lunb;->k(Ljava/util/concurrent/CancellationException;)V
    :try_end_125
    .catchall {:try_start_110 .. :try_end_125} :catchall_129

    :cond_125
    invoke-virtual {v3, v11}, Lpfe;->l(Ljava/lang/Object;)V

    throw v0

    :catchall_129
    move-exception v0

    invoke-virtual {v3, v11}, Lpfe;->l(Ljava/lang/Object;)V

    throw v0

    :catchall_12e
    move-exception v0

    invoke-virtual {v6, v11}, Lpfe;->l(Ljava/lang/Object;)V

    throw v0
.end method

.method public final o(Ljava/lang/String;Ljava/util/List;Ljava/util/Map;Lnt5;)Ljava/lang/Object;
    .registers 18

    move-object/from16 v0, p4

    instance-of v1, v0, Li50;

    if-eqz v1, :cond_15

    move-object v1, v0

    check-cast v1, Li50;

    iget v2, v1, Li50;->w:I

    const/high16 v3, -0x80000000

    and-int v4, v2, v3

    if-eqz v4, :cond_15

    sub-int/2addr v2, v3

    iput v2, v1, Li50;->w:I

    goto :goto_1a

    :cond_15
    new-instance v1, Li50;

    invoke-direct {v1, p0, v0}, Li50;-><init>(Lqb7;Lnt5;)V

    :goto_1a
    iget-object v0, v1, Li50;->u:Ljava/lang/Object;

    sget-object v2, Lpx5;->a:Lpx5;

    iget v3, v1, Li50;->w:I

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v3, :cond_32

    if-ne v3, v5, :cond_2c

    iget-object p0, v1, Li50;->t:Lqb7;

    :try_start_28
    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_2b} :catch_95

    return-object v0

    :cond_2c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_32
    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    move-object v6, p2

    check-cast v6, Ljava/lang/Iterable;

    sget-object v11, Lh50;->j:Lh50;

    const/16 v12, 0x1e

    const-string v7, ","

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-static/range {v6 .. v12}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object v0

    iget-object v3, p0, Lqb7;->b:Ljava/lang/Object;

    check-cast v3, Lu7d;

    iget-object v6, v3, Lu7d;->b:Lcom/usercentrics/sdk/UsercentricsDomains;

    invoke-virtual {v6}, Lcom/usercentrics/sdk/UsercentricsDomains;->a()Z

    move-result v7

    if-eqz v7, :cond_54

    iget-object v3, v6, Lcom/usercentrics/sdk/UsercentricsDomains;->a:Ljava/lang/String;

    goto :goto_67

    :cond_54
    iget-object v3, v3, Lu7d;->a:Leoe;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eqz v3, :cond_65

    if-ne v3, v5, :cond_61

    const-string v3, "https://aggregator.eu.usercentrics.eu"

    goto :goto_67

    :cond_61
    invoke-static {}, Lh9o;->p()V

    return-object v4

    :cond_65
    const-string v3, "https://aggregator.service.usercentrics.eu"

    :goto_67
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/aggregate/"

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "?templates="

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :try_start_83
    iget-object v0, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast v0, Leqa;

    iput-object p0, v1, Li50;->t:Lqb7;

    iput v5, v1, Li50;->w:I

    move-object/from16 v3, p3

    invoke-virtual {v0, p1, v3, v1}, Leqa;->b(Ljava/lang/String;Ljava/util/Map;Lmt5;)Ljava/lang/Object;

    move-result-object p0
    :try_end_91
    .catch Ljava/lang/Exception; {:try_start_83 .. :try_end_91} :catch_95

    if-ne p0, v2, :cond_94

    return-object v2

    :cond_94
    return-object p0

    :catch_95
    move-exception v0

    move-object p1, v0

    iget-object p0, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast p0, Lowm;

    const-string v0, "Failed while fetching services"

    invoke-interface {p0, v0, p1}, Lowm;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance p0, Lhwm;

    const-string v0, "Unable to initialise due to poor or no network connection while fetching the processing services."

    invoke-direct {p0, v0, p1}, Lhwm;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0
.end method

.method public final onAdClicked()V
    .registers 1

    iget-object p0, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast p0, Lh10;

    iget-object p0, p0, Lh10;->w:Lp00;

    invoke-virtual {p0}, Lbp;->V()V

    return-void
.end method

.method public final p()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast p0, Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    return-object p0
.end method

.method public final q()Z
    .registers 1

    iget-object p0, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast p0, Ljava/io/IOException;

    if-eqz p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final r(Ljava/util/LinkedHashMap;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Llt6;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Llt6;

    iget v1, v0, Llt6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Llt6;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Llt6;

    invoke-direct {v0, p0, p2}, Llt6;-><init>(Lqb7;Lnt5;)V

    :goto_18
    iget-object p2, v0, Llt6;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Llt6;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_32

    if-ne v2, v4, :cond_2c

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p2, Lt0i;

    iget-object p0, p2, Lt0i;->a:Ljava/lang/Object;

    return-object p0

    :cond_2c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_32
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p2, Ls23;

    const/4 v2, 0x4

    invoke-direct {p2, p1, p0, v3, v2}, Ls23;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput v4, v0, Llt6;->v:I

    invoke-static {p2, v0}, Lzch;->A(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_44

    return-object v1

    :cond_44
    return-object p0
.end method

.method public final s()Z
    .registers 1

    iget-object p0, p0, Lqb7;->b:Ljava/lang/Object;

    check-cast p0, Lqsc;

    if-eqz p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final t(Lamk;Ljava/lang/String;Lcom/opera/api/Callback;)V
    .registers 13

    iget-object v0, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast v0, Llh4;

    iget-object v0, v0, Llh4;->b:Lcom/opera/api/Callback;

    if-eqz v0, :cond_18

    new-instance p0, Lff3;

    new-instance p1, Lef3;

    invoke-direct {p1}, Lef3;-><init>()V

    sget-object p2, Ljf3;->b:Ljf3;

    invoke-direct {p0, p1, p2}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {p3, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_18
    new-instance v2, Llh4;

    new-instance v3, Lxx1;

    const/4 v8, 0x1

    move-object v4, p0

    move-object v6, p1

    move-object v5, p2

    move-object v7, p3

    invoke-direct/range {v3 .. v8}, Lxx1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 p0, 0x0

    invoke-direct {v2, v3, p0}, Llh4;-><init>(Lcom/opera/api/Callback;B)V

    iput-object v2, v4, Lqb7;->c:Ljava/lang/Object;

    iget-object p0, v4, Lqb7;->a:Ljava/lang/Object;

    move-object v1, p0

    check-cast v1, Laf3;

    iget-object v3, v6, Lamk;->b:Lnsh;

    iget-object p0, v6, Lamk;->c:Lxlk;

    iget-object p1, p0, Lxlk;->d:Ljava/lang/String;

    iget-boolean p0, p0, Lxlk;->f:Z

    iget-boolean p2, v1, Laf3;->h:Z

    if-nez p2, :cond_4b

    new-instance p0, Lff3;

    new-instance p1, Lgf3;

    invoke-direct {p1}, Lgf3;-><init>()V

    sget-object p2, Ljf3;->c:Ljf3;

    invoke-direct {p0, p1, p2}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v2, p0}, Llh4;->run(Ljava/lang/Object;)V

    return-void

    :cond_4b
    new-instance v4, Ltn;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    new-instance p2, Lei2;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    const/4 p3, 0x1

    iput-boolean p3, p2, Lei2;->b:Z

    iput-object p2, v4, Ltn;->d:Ljava/lang/Object;

    const/4 p2, 0x0

    invoke-static {v4, v3, p1, p0, p2}, Lwyh;->V(Ltn;Lnsh;Ljava/lang/String;ZLjava/lang/String;)V

    if-eqz v5, :cond_62

    iput-object v5, v4, Ltn;->b:Ljava/lang/Object;

    :cond_62
    new-instance v0, Lue3;

    const/4 v5, 0x1

    invoke-direct/range {v0 .. v5}, Lue3;-><init>(Laf3;Llh4;Lnsh;Ltn;B)V

    invoke-virtual {v1, v0}, Laf3;->e(Lbg1;)V

    return-void
.end method

.method public final u(Landroid/content/res/Resources;Lst;)Lst;
    .registers 10

    iget-object v0, p0, Lqb7;->b:Ljava/lang/Object;

    check-cast v0, Lu59;

    iget-object v1, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast v1, Lnr8;

    iget-object v2, p2, Lst;->j:Lrt;

    iget-object p0, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    invoke-virtual {p0, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    if-eqz v3, :cond_3f

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lhp2;

    invoke-direct {v2, v1, p0, p1}, Lhp2;-><init>(Lnr8;J)V

    check-cast v1, Lcom/opera/android/favorites/e;

    iget-object p0, v1, Lcom/opera/android/favorites/e;->g:Lcom/opera/android/favorites/b;

    invoke-static {v2, p0}, Lnr8;->g(Lmr8;Ltq8;)Lhq8;

    move-result-object p0

    invoke-virtual {p0}, Lhq8;->e()J

    move-result-wide p0

    sget-object v1, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    invoke-static {p0, p1}, LJ/N;->Mw8yLl_M(J)V

    const p0, 0x7f141172

    invoke-virtual {v0, p0}, Lu59;->N(I)V

    const/4 p0, 0x0

    invoke-static {p2, p0}, Lst;->a(Lst;Ljava/lang/Long;)Lst;

    move-result-object p0

    return-object p0

    :cond_3f
    iget-object v3, p2, Lst;->h:Ljava/lang/String;

    if-nez v3, :cond_4d

    iget-object v3, p2, Lst;->a:Lpxh;

    invoke-virtual {v3, p1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_4d
    new-instance p1, Lmzj;

    iget-object v4, p2, Lst;->g:Ljava/lang/String;

    iget-object v5, p2, Lst;->l:Landroid/graphics/Bitmap;

    const/4 v6, 0x0

    invoke-direct {p1, v3, v4, v5, v6}, Lmzj;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Z)V

    invoke-virtual {v1, p1}, Lnr8;->a(Lmzj;)J

    move-result-wide v3

    const p1, 0x7f141162    # 1.96816E38f

    invoke-virtual {v0, p1}, Lu59;->N(I)V

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p0, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-static {p2, p0}, Lst;->a(Lst;Ljava/lang/Long;)Lst;

    move-result-object p0

    return-object p0
.end method

.method public final v([Lst;)Z
    .registers 9

    iget-object p0, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    array-length v0, p1

    const/4 v1, 0x0

    move v2, v1

    :goto_7
    if-ge v1, v0, :cond_30

    aget-object v3, p1, v1

    iget-object v4, v3, Lst;->j:Lrt;

    iget-object v3, v3, Lst;->i:Ljava/lang/Long;

    invoke-virtual {p0, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    const/4 v6, 0x1

    if-eqz v5, :cond_21

    if-nez v3, :cond_1c

    invoke-virtual {p0, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    :cond_1c
    invoke-virtual {p0, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1f
    move v2, v6

    goto :goto_2d

    :cond_21
    invoke-virtual {p0, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2d

    if-eqz v3, :cond_2d

    invoke-virtual {p0, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    :cond_2d
    :goto_2d
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_30
    return v2
.end method

.method public final w(Lnt5;)Ljava/lang/Object;
    .registers 13

    iget-object v0, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lqb7;->b:Ljava/lang/Object;

    check-cast v1, Lnak;

    instance-of v2, p1, Lpb7;

    if-eqz v2, :cond_1b

    move-object v2, p1

    check-cast v2, Lpb7;

    iget v3, v2, Lpb7;->x:I

    const/high16 v4, -0x80000000

    and-int v5, v3, v4

    if-eqz v5, :cond_1b

    sub-int/2addr v3, v4

    iput v3, v2, Lpb7;->x:I

    goto :goto_20

    :cond_1b
    new-instance v2, Lpb7;

    invoke-direct {v2, p0, p1}, Lpb7;-><init>(Lqb7;Lnt5;)V

    :goto_20
    iget-object p1, v2, Lpb7;->v:Ljava/lang/Object;

    sget-object v3, Lpx5;->a:Lpx5;

    iget v4, v2, Lpb7;->x:I

    const/4 v5, 0x4

    const/4 v6, 0x3

    const/4 v7, 0x2

    const/4 v8, 0x1

    const/4 v9, 0x0

    if-eqz v4, :cond_4f

    if-eq v4, v8, :cond_47

    if-eq v4, v7, :cond_43

    if-eq v4, v6, :cond_3f

    if-ne v4, v5, :cond_39

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    return-object p1

    :cond_39
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v9

    :cond_3f
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_a3

    :cond_43
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_94

    :cond_47
    iget-object v0, v2, Lpb7;->u:Lnak;

    iget-object v4, v2, Lpb7;->t:Llrl;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_75

    :cond_4f
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_af

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_af

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object p1

    move-object v4, p1

    check-cast v4, Llrl;

    iget-object p1, v4, Llrl;->a:Lsdk;

    iput-object v4, v2, Lpb7;->t:Llrl;

    iput-object v1, v2, Lpb7;->u:Lnak;

    iput v8, v2, Lpb7;->x:I

    invoke-interface {p1, v2}, Lsdk;->a(Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v3, :cond_ad

    move-object v0, v1

    :goto_75
    check-cast p1, Ljava/lang/String;

    iget-object v8, v4, Llrl;->b:Lerl;

    iget-object v4, v4, Llrl;->c:Lkotlin/jvm/functions/Function0;

    new-instance v10, Lnb7;

    invoke-direct {v10, p1, v8, v4}, Lnb7;-><init>(Ljava/lang/String;Lerl;Lkotlin/jvm/functions/Function0;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v9, v10}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    iput-object v9, v2, Lpb7;->t:Llrl;

    iput-object v9, v2, Lpb7;->u:Lnak;

    iput v7, v2, Lpb7;->x:I

    const-wide/16 v7, 0xfa0

    invoke-static {v7, v8, v2}, Lnb6;->p(JLmt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v3, :cond_ad

    :goto_94
    invoke-virtual {v1, v9}, Lnak;->j(Ljava/lang/Object;)V

    iput-object v9, v2, Lpb7;->t:Llrl;

    iput v6, v2, Lpb7;->x:I

    const-wide/16 v0, 0x1f4

    invoke-static {v0, v1, v2}, Lnb6;->p(JLmt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v3, :cond_ad

    :goto_a3
    iput-object v9, v2, Lpb7;->t:Llrl;

    iput v5, v2, Lpb7;->x:I

    invoke-virtual {p0, v2}, Lqb7;->w(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v3, :cond_ae

    :cond_ad
    return-object v3

    :cond_ae
    return-object p0

    :cond_af
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final x(Lnt3;)V
    .registers 8

    invoke-virtual {p0}, Lqb7;->p()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    return-void

    :cond_b
    invoke-virtual {p0}, Lqb7;->p()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lqb7;->p()Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Ln95;->q(Ljava/util/List;)V

    invoke-virtual {p0}, Lqb7;->p()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    const/16 v0, 0x1e

    const/4 v1, 0x0

    if-le p1, v0, :cond_43

    invoke-virtual {p0}, Lqb7;->p()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lnt3;

    iget-object v0, p0, Lqb7;->b:Ljava/lang/Object;

    check-cast v0, Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_43

    invoke-virtual {p0}, Lqb7;->B()V

    :cond_43
    iget-object p1, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast p1, Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-virtual {p0}, Lqb7;->p()Ljava/util/List;

    move-result-object p0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_60
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8a

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnt3;

    new-instance v3, Lorb;

    invoke-direct {v3}, Lorb;-><init>()V

    const-string v4, "y"

    iget v5, v2, Lnt3;->a:I

    invoke-virtual {v3, v5, v4}, Lorb;->n(ILjava/lang/String;)V

    const-string v4, "m"

    iget v5, v2, Lnt3;->b:I

    invoke-virtual {v3, v5, v4}, Lorb;->n(ILjava/lang/String;)V

    const-string v4, "d"

    iget v2, v2, Lnt3;->c:I

    invoke-virtual {v3, v2, v4}, Lorb;->n(ILjava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_60

    :cond_8a
    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_93
    if-ge v1, v2, :cond_a3

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v1, v1, 0x1

    invoke-static {v3}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_93

    :cond_a3
    invoke-virtual {p0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "active_days"

    invoke-interface {p1, v0, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public final y(Lusc;)V
    .registers 4

    iget-object v0, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast v0, Lenb;

    iget-object p0, p0, Lqb7;->b:Ljava/lang/Object;

    check-cast p0, Lqsc;

    if-eqz p0, :cond_e

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lqsc;->a(Z)V

    :cond_e
    if-eqz p1, :cond_1a

    new-instance p0, Lvl9;

    const/16 v1, 0xb

    invoke-direct {p0, p1, v1}, Lvl9;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p0}, Lenb;->execute(Ljava/lang/Runnable;)V

    :cond_1a
    iget-object p0, v0, Lenb;->c:Ljava/lang/Object;

    iget-object p0, v0, Lenb;->b:Ljava/util/concurrent/Executor;

    check-cast p0, Ljava/util/concurrent/ExecutorService;

    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    return-void
.end method

.method public final z()V
    .registers 12

    iget-object v0, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    const-string v1, "toolbar_bottom_actions"

    iget-object v2, v0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-interface {v2, v1}, Ly9j;->contains(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_11

    sget-object v1, Lop0;->d:Lop0;

    goto :goto_13

    :cond_11
    sget-object v1, Lop0;->b:Lop0;

    :goto_13
    new-instance v2, Landroid/util/SparseArray;

    invoke-direct {v2}, Landroid/util/SparseArray;-><init>()V

    iget-object v3, p0, Lqb7;->b:Ljava/lang/Object;

    check-cast v3, Lfw3;

    invoke-static {v0, v3}, Lvtp;->I(Lcom/opera/android/settings/SettingsManager;Lfw3;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v3, 0x0

    move v4, v3

    :goto_28
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_44

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v6, v4, 0x1

    if-ltz v4, :cond_3f

    check-cast v5, Lpc;

    iget-object v5, v5, Lpc;->c:Lhs0;

    invoke-virtual {v2, v4, v5}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    move v4, v6

    goto :goto_28

    :cond_3f
    invoke-static {}, Lj95;->n()V

    const/4 p0, 0x0

    throw p0

    :cond_44
    iget-object p0, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast p0, Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_4d

    return-void

    :cond_4d
    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    invoke-virtual {v4, v0}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v0

    const/16 v5, 0x50

    invoke-virtual {v0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lis0;

    const/16 v7, 0x98b

    const/4 v8, 0x1

    if-nez v6, :cond_74

    new-instance v6, Lis0;

    const/4 v9, 0x2

    invoke-direct {v6, v7, v8, v9}, Ljf0;-><init>(III)V

    invoke-virtual {v0, v5, v8, v6}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lis0;

    :cond_74
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v6, v3, v8, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v0

    move v1, v3

    :goto_7f
    if-ge v1, v0, :cond_c5

    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lhs0;

    new-instance v9, Lgs0;

    const/4 v10, -0x1

    invoke-direct {v9, v7, v10, v8}, Ljf0;-><init>(III)V

    if-nez v5, :cond_91

    move v10, v3

    goto :goto_92

    :cond_91
    move v10, v8

    :goto_92
    invoke-virtual {v9, v3, v10, v5}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v6, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    if-eqz v5, :cond_a9

    invoke-interface {v5}, Ljava/util/Map;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_a9

    new-instance v10, Lif0;

    invoke-direct {v10, v6, v8, v5}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_b6

    :cond_a9
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v6, v8, v8, v5}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v10, Lif0;

    invoke-direct {v10, v6, v8, v5}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_b6
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v5

    add-int/2addr v5, v8

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v10, v5, v9}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_7f

    :cond_c5
    invoke-virtual {p0, v4}, Lx5f;->U0(Lx56;)V

    return-void
.end method
