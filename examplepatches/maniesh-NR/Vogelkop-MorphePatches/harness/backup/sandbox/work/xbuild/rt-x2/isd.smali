.class public final Lisd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhsd;
.implements Lrcc;
.implements Ldn;
.implements Lbwe;
.implements Lf94;
.implements Lvwf;
.implements Ljak;
.implements Ld94;
.implements Lw7e;
.implements Lzqb;
.implements Ltri;
.implements Ln2k;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 4

    iput-byte p1, p0, Lisd;->a:B

    packed-switch p1, :pswitch_data_34

    .line 170
    :pswitch_5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 171
    new-instance p1, Lp7e;

    const-wide/16 v0, 0x1f4

    .line 172
    invoke-direct {p1, v0, v1}, Lt59;-><init>(J)V

    .line 173
    iput-object p1, p0, Lisd;->b:Ljava/lang/Object;

    return-void

    .line 174
    :pswitch_12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 175
    new-instance p1, Ldrj;

    const/4 v0, 0x1

    .line 176
    invoke-direct {p1, v0}, Ldrj;-><init>(B)V

    .line 177
    iput-object p1, p0, Lisd;->b:Ljava/lang/Object;

    return-void

    .line 178
    :pswitch_1e
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 179
    new-instance p1, Landroid/util/SparseIntArray;

    invoke-direct {p1}, Landroid/util/SparseIntArray;-><init>()V

    iput-object p1, p0, Lisd;->b:Ljava/lang/Object;

    return-void

    .line 180
    :pswitch_29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 181
    new-instance p1, Landroid/graphics/Region;

    invoke-direct {p1}, Landroid/graphics/Region;-><init>()V

    iput-object p1, p0, Lisd;->b:Ljava/lang/Object;

    return-void

    :pswitch_data_34
    .packed-switch 0x17
        :pswitch_29
        :pswitch_5
        :pswitch_5
        :pswitch_1e
        :pswitch_12
    .end packed-switch
.end method

.method public synthetic constructor <init>(BZ)V
    .registers 3

    .line 182
    iput-byte p1, p0, Lisd;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(I)V
    .registers 6

    const/16 v0, 0xd

    iput-byte v0, p0, Lisd;->a:B

    .line 136
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-array v0, p1, [Lqfb;

    iput-object v0, p0, Lisd;->b:Ljava/lang/Object;

    const/4 v0, 0x0

    :goto_c
    if-ge v0, p1, :cond_1e

    iget-object v1, p0, Lisd;->b:Ljava/lang/Object;

    check-cast v1, [Lqfb;

    new-instance v2, Lqfb;

    const/16 v3, 0x16

    invoke-direct {v2, v3}, Lqfb;-><init>(B)V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    :cond_1e
    return-void
.end method

.method public constructor <init>(Landroid/os/Bundle;)V
    .registers 3

    const/4 v0, 0x6

    iput-byte v0, p0, Lisd;->a:B

    .line 183
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_10

    .line 184
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0, p1}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    iput-object v0, p0, Lisd;->b:Ljava/lang/Object;

    return-void

    .line 185
    :cond_10
    const-string p0, "data"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(Lcie;Lbn;)V
    .registers 3

    const/4 p1, 0x3

    iput-byte p1, p0, Lisd;->a:B

    .line 137
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lisd;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 138
    iput-byte p2, p0, Lisd;->a:B

    iput-object p1, p0, Lisd;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Leof;)V
    .registers 6

    const/16 v0, 0x12

    iput-byte v0, p0, Lisd;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lisd;->b:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_15

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p2, p0}, Leof;->run(Ljava/lang/Object;)V

    goto :goto_87

    :cond_15
    sget-object p2, Lxne;->b:Lii;

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lt9f;

    new-instance v0, Lfvh;

    invoke-direct {v0}, Lfvh;-><init>()V

    const-string v1, "application/json"

    sget-object v2, Lesd;->e:Lkotlin/text/Regex;

    :try_start_26
    invoke-static {v1}, Lwyh;->x(Ljava/lang/String;)Lesd;

    move-result-object v1
    :try_end_2a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_26 .. :try_end_2a} :catch_2b

    goto :goto_2c

    :catch_2b
    const/4 v1, 0x0

    :goto_2c
    const-string v2, "{}"

    invoke-static {v2, v1}, Lrvh;->create(Ljava/lang/String;Lesd;)Lrvh;

    move-result-object v1

    const-string v2, "POST"

    invoke-virtual {v0, v2, v1}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    invoke-static {}, LJ/N;->MKuJ$OHt()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "reset_passwords/"

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lfvh;->h(Ljava/lang/String;)V

    const-string v1, "Bearer "

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "Authorization"

    invoke-virtual {v0, v1, p1}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Lc74;

    invoke-direct {p1}, Lc74;-><init>()V

    invoke-static {p1}, Lokhttp3/internal/_CacheControlCommonKt;->commonNoCache(Lc74;)Lc74;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Lokhttp3/internal/_CacheControlCommonKt;->commonNoStore(Lc74;)Lc74;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Lokhttp3/internal/_CacheControlCommonKt;->commonBuild(Lc74;)Le74;

    move-result-object p1

    invoke-virtual {v0, p1}, Lfvh;->b(Le74;)V

    new-instance p1, Lkvh;

    invoke-direct {p1, v0}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {p2, p1}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p1

    invoke-interface {p1, p0}, Lv84;->enqueue(Lf94;)V

    :goto_87
    return-void
.end method

.method public constructor <init>(Lmig;)V
    .registers 4

    const/16 v0, 0xc

    iput-byte v0, p0, Lisd;->a:B

    .line 189
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 190
    new-instance v0, Lvdf;

    const/16 v1, 0x1c

    invoke-direct {v0, p1, v1}, Lvdf;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lisd;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lrcc;Lrcc;)V
    .registers 12

    const/4 v0, 0x1

    iput-byte v0, p0, Lisd;->a:B

    .line 139
    sget-object v1, Lpcc;->b:Lpcc;

    .line 140
    new-instance v2, Lrdc;

    .line 141
    invoke-direct {v2}, Lrdc;-><init>()V

    .line 142
    sget-object v3, Lv08;->a:Lv08;

    .line 143
    iput-object v3, v2, Lrdc;->b:Ljava/lang/Object;

    .line 144
    iput-object v1, v2, Lrdc;->c:Ljava/lang/Object;

    .line 145
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 146
    iput-object v2, p0, Lisd;->b:Ljava/lang/Object;

    .line 147
    new-instance v3, Lpqh;

    .line 148
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 149
    invoke-interface {p1}, Lrcc;->getState()Lpcc;

    move-result-object v4

    sget-object v5, Lpcc;->a:Lpcc;

    if-ne v4, v5, :cond_24

    move-object v4, v5

    goto :goto_25

    :cond_24
    move-object v4, v1

    :goto_25
    iput-object v4, v3, Lpqh;->a:Ljava/lang/Object;

    .line 150
    new-instance v4, Lpqh;

    .line 151
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 152
    invoke-interface {p2}, Lrcc;->getState()Lpcc;

    move-result-object v6

    if-ne v6, v5, :cond_33

    move-object v1, v5

    :cond_33
    iput-object v1, v4, Lpqh;->a:Ljava/lang/Object;

    .line 153
    iget-object v6, v3, Lpqh;->a:Ljava/lang/Object;

    check-cast v6, Ljava/lang/Comparable;

    .line 154
    invoke-interface {v6, v1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v7

    if-gtz v7, :cond_40

    move-object v1, v6

    .line 155
    :cond_40
    check-cast v1, Lpcc;

    invoke-virtual {p0, v1}, Lisd;->D(Lpcc;)V

    .line 156
    iget-object v1, v3, Lpqh;->a:Ljava/lang/Object;

    if-eq v1, v5, :cond_7e

    iget-object v1, v4, Lpqh;->a:Ljava/lang/Object;

    if-eq v1, v5, :cond_7e

    .line 157
    new-instance v1, Ljx4;

    .line 158
    new-instance v6, Lvud;

    const/4 v7, 0x0

    invoke-direct {v6, v3, p0, v4, v7}, Lvud;-><init>(Lpqh;Lisd;Lpqh;B)V

    const/4 v7, 0x2

    .line 159
    invoke-direct {v1, v6, v7}, Ljx4;-><init>(Ljava/lang/Object;B)V

    .line 160
    new-instance v6, Ljx4;

    .line 161
    new-instance v8, Lvud;

    invoke-direct {v8, v4, p0, v3, v0}, Lvud;-><init>(Lpqh;Lisd;Lpqh;B)V

    .line 162
    invoke-direct {v6, v8, v7}, Ljx4;-><init>(Ljava/lang/Object;B)V

    .line 163
    invoke-interface {p1, v1}, Lrcc;->h(Llcc;)V

    .line 164
    invoke-interface {p2, v6}, Lrcc;->h(Llcc;)V

    .line 165
    iget-object p0, v2, Lrdc;->c:Ljava/lang/Object;

    check-cast p0, Lpcc;

    if-ne p0, v5, :cond_76

    .line 166
    invoke-interface {p1, v1}, Lrcc;->g(Llcc;)V

    .line 167
    invoke-interface {p2, v6}, Lrcc;->g(Llcc;)V

    goto :goto_7e

    .line 168
    :cond_76
    new-instance p0, Lwud;

    invoke-direct {p0, p1, v1, p2, v6}, Lwud;-><init>(Lrcc;Ljx4;Lrcc;Ljx4;)V

    .line 169
    invoke-virtual {v2, p0}, Lrdc;->h(Llcc;)V

    :cond_7e
    :goto_7e
    return-void
.end method

.method public constructor <init>(Lt9f;)V
    .registers 3

    const/4 v0, 0x7

    iput-byte v0, p0, Lisd;->a:B

    .line 186
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 187
    iput-object p1, p0, Lisd;->b:Ljava/lang/Object;

    .line 188
    iget-object p0, p1, Lt9f;->k:La74;

    return-void
.end method

.method public static B(Landroid/os/Bundle;)Z
    .registers 5

    const-string v0, "gcm.n.e"

    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "1"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    const-string v1, "gcm.n."

    const-string v3, "gcm.notification."

    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_22

    const/4 p0, 0x0

    return p0

    :cond_22
    const/4 p0, 0x1

    return p0
.end method

.method public static N(Ljava/lang/String;)V
    .registers 2

    const-string v0, "gcm.n."

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    :cond_c
    return-void
.end method


# virtual methods
.method public final A()[J
    .registers 7

    const-string v0, "gcm.n.vibrate_timings"

    invoke-virtual {p0, v0}, Lisd;->r(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    const/4 v0, 0x0

    if-nez p0, :cond_a

    return-object v0

    :cond_a
    :try_start_a
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_24

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v1

    new-array v2, v1, [J

    const/4 v3, 0x0

    :goto_18
    if-ge v3, v1, :cond_23

    invoke-virtual {p0, v3}, Lorg/json/JSONArray;->optLong(I)J

    move-result-wide v4

    aput-wide v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_18

    :cond_23
    return-object v2

    :cond_24
    new-instance v1, Lorg/json/JSONException;

    const-string v2, "vibrateTimings have invalid length"

    invoke-direct {v1, v2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_2c
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_2c} :catch_2c
    .catch Ljava/lang/NumberFormatException; {:try_start_a .. :try_end_2c} :catch_2c

    :catch_2c
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    return-object v0
.end method

.method public final C(Lnt5;)Ljava/lang/Object;
    .registers 8

    iget-object v0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast v0, Llpe;

    instance-of v1, p1, Ljpe;

    if-eqz v1, :cond_17

    move-object v1, p1

    check-cast v1, Ljpe;

    iget v2, v1, Ljpe;->w:I

    const/high16 v3, -0x80000000

    and-int v4, v2, v3

    if-eqz v4, :cond_17

    sub-int/2addr v2, v3

    iput v2, v1, Ljpe;->w:I

    goto :goto_1c

    :cond_17
    new-instance v1, Ljpe;

    invoke-direct {v1, p0, p1}, Ljpe;-><init>(Lisd;Lnt5;)V

    :goto_1c
    iget-object p0, v1, Ljpe;->u:Ljava/lang/Object;

    sget-object p1, Lpx5;->a:Lpx5;

    iget v2, v1, Ljpe;->w:I

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v2, :cond_3b

    if-eq v2, v4, :cond_35

    if-ne v2, v3, :cond_2f

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_6d

    :cond_2f
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v5

    :cond_35
    iget-object v2, v1, Ljpe;->t:Ljava/util/Iterator;

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_49

    :cond_3b
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, v0, Llpe;->z:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    move-object v2, p0

    :cond_49
    :goto_49
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_62

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmtb;

    check-cast p0, Lkotlin/jvm/functions/Function1;

    iput-object v2, v1, Ljpe;->t:Ljava/util/Iterator;

    iput v4, v1, Ljpe;->w:I

    invoke-interface {p0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p1, :cond_49

    goto :goto_6c

    :cond_62
    iput-object v5, v1, Ljpe;->t:Ljava/util/Iterator;

    iput v3, v1, Ljpe;->w:I

    invoke-virtual {v0, v1}, Llpe;->b(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p1, :cond_6d

    :goto_6c
    return-object p1

    :cond_6d
    :goto_6d
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final D(Lpcc;)V
    .registers 6

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lrdc;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    const/4 v0, 0x4

    const/4 v1, 0x3

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eqz p1, :cond_78

    if-eq p1, v3, :cond_98

    if-eq p1, v2, :cond_5a

    if-eq p1, v1, :cond_34

    if-ne p1, v0, :cond_30

    iget-object p1, p0, Lrdc;->c:Ljava/lang/Object;

    check-cast p1, Lpcc;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_98

    if-eq p1, v3, :cond_2c

    if-eq p1, v2, :cond_2c

    if-eq p1, v1, :cond_2c

    if-eq p1, v0, :cond_98

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_2c
    invoke-static {p0}, Lvtp;->T(Lrdc;)V

    return-void

    :cond_30
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_34
    iget-object p1, p0, Lrdc;->c:Ljava/lang/Object;

    check-cast p1, Lpcc;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_98

    if-eq p1, v3, :cond_56

    if-eq p1, v2, :cond_56

    if-eq p1, v1, :cond_98

    if-ne p1, v0, :cond_52

    iget-object p1, p0, Lrdc;->c:Ljava/lang/Object;

    check-cast p1, Lpcc;

    sget-object v0, Lpcc;->e:Lpcc;

    if-ne p1, v0, :cond_98

    invoke-virtual {p0}, Lrdc;->onPause()V

    return-void

    :cond_52
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_56
    invoke-static {p0}, Lvtp;->X(Lrdc;)V

    return-void

    :cond_5a
    iget-object p1, p0, Lrdc;->c:Ljava/lang/Object;

    check-cast p1, Lpcc;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_98

    if-eq p1, v3, :cond_74

    if-eq p1, v2, :cond_98

    if-eq p1, v1, :cond_70

    if-eq p1, v0, :cond_70

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_70
    invoke-static {p0}, Lvtp;->Z(Lrdc;)V

    return-void

    :cond_74
    invoke-static {p0}, Lvtp;->A(Lrdc;)V

    return-void

    :cond_78
    iget-object p1, p0, Lrdc;->c:Ljava/lang/Object;

    check-cast p1, Lpcc;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_98

    if-eq p1, v3, :cond_92

    if-eq p1, v2, :cond_8e

    if-eq p1, v1, :cond_8e

    if-eq p1, v0, :cond_8e

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_8e
    invoke-static {p0}, Lvtp;->B(Lrdc;)V

    return-void

    :cond_92
    invoke-static {p0}, Lvtp;->A(Lrdc;)V

    invoke-static {p0}, Lvtp;->B(Lrdc;)V

    :cond_98
    return-void
.end method

.method public final E(Ljava/lang/Object;Z)V
    .registers 5

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lt7j;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lt7j;->g:Z

    iput-boolean v0, p0, Lt7j;->f:Z

    iput-object p1, p0, Lt7j;->d:Ljava/lang/Object;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lt7j;->a:Z

    iget-object v1, p0, Lt7j;->i:Lfwh;

    if-eqz p2, :cond_18

    iput-boolean v0, v1, Lfwh;->d:Z

    invoke-virtual {v1}, Lfwh;->d()V

    goto :goto_21

    :cond_18
    iget-boolean p2, v1, Lfwh;->d:Z

    if-nez p2, :cond_1e

    iput-boolean p1, v1, Lfwh;->d:Z

    :cond_1e
    invoke-virtual {v1}, Lfwh;->d()V

    :goto_21
    iget-object p1, p0, Lt7j;->c:Ljava/util/HashSet;

    :goto_23
    invoke-virtual {p1}, Ljava/util/HashSet;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_45

    iget-boolean p2, p0, Lt7j;->a:Z

    if-eqz p2, :cond_45

    invoke-virtual {p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lq8j;

    invoke-virtual {p1, p2}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Lt7j;->b:Ljava/util/Set;

    invoke-interface {v0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lt7j;->d:Ljava/lang/Object;

    invoke-interface {p2, v0}, Lq8j;->c(Ljava/lang/Object;)V

    goto :goto_23

    :cond_45
    return-void
.end method

.method public final F()Landroid/os/Bundle;
    .registers 4

    new-instance v0, Landroid/os/Bundle;

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Landroid/os/Bundle;

    invoke-direct {v0, p0}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_11
    :goto_11
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_31

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "google.c.a."

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_11

    const-string v2, "from"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_11

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    goto :goto_11

    :cond_31
    return-object v0
.end method

.method public final G()V
    .registers 5

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lmrk;

    iget-object v0, p0, Lmrk;->d:Lnwf;

    iget-object v0, v0, Lnwf;->b:Lhv3;

    iget-object v0, v0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v1

    check-cast v1, Lqdc;

    iget-object v1, v1, Lqdc;->i:Lqcc;

    sget-object v2, Lqcc;->e:Lqcc;

    invoke-virtual {v1, v2}, Lqcc;->d(Lqcc;)Z

    move-result v1

    if-eqz v1, :cond_2d

    iget-object v1, v0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    const/4 v2, 0x0

    if-nez v1, :cond_20

    move-object v1, v2

    :cond_20
    sget-object v3, Lhbf;->d:Lhbf;

    invoke-virtual {v1, v2, v3}, Lgbf;->l(Lbsi;Lhbf;)V

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->z:Lz43;

    if-eqz v0, :cond_2a

    move-object v2, v0

    :cond_2a
    invoke-virtual {v2}, Lz43;->d()V

    :cond_2d
    iget-object v0, p0, Lmrk;->y:Lw6j;

    iget-object v0, v0, Lw6j;->c:Ljava/lang/Object;

    check-cast v0, Landroid/widget/FrameLayout;

    new-instance v1, Lerk;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lerk;-><init>(Lmrk;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final H()V
    .registers 14

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    iget-object v2, p0, Lisd;->b:Ljava/lang/Object;

    check-cast v2, [Lqfb;

    array-length v3, v2

    if-ge v1, v3, :cond_49

    aget-object v2, v2, v1

    iget-object v3, v2, Lqfb;->b:Ljava/lang/Object;

    check-cast v3, [S

    const/4 v4, 0x1

    const/16 v5, 0x80

    :goto_12
    const/4 v6, 0x2

    if-lt v5, v6, :cond_43

    move v6, v0

    :goto_16
    const/16 v7, 0x100

    if-ge v6, v7, :cond_40

    sget-object v7, Lfsp;->h:[S

    add-int/lit8 v8, v4, 0x1

    aget-short v4, v7, v4

    move v7, v6

    :goto_21
    add-int v9, v6, v5

    if-ge v7, v9, :cond_3c

    aget-short v9, v3, v7

    add-int v10, v7, v5

    aget-short v11, v3, v10

    mul-int/2addr v11, v4

    invoke-static {v11}, Luyg;->m(I)S

    move-result v11

    sub-int v12, v9, v11

    int-to-short v12, v12

    aput-short v12, v3, v10

    add-int/2addr v9, v11

    int-to-short v9, v9

    aput-short v9, v3, v7

    add-int/lit8 v7, v7, 0x1

    goto :goto_21

    :cond_3c
    add-int v6, v7, v5

    move v4, v8

    goto :goto_16

    :cond_40
    shr-int/lit8 v5, v5, 0x1

    goto :goto_12

    :cond_43
    invoke-virtual {v2}, Lqfb;->B()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_49
    return-void
.end method

.method public final I(I)V
    .registers 3

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_10

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->w(Landroid/view/View;)V

    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    :cond_10
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->removeViewAt(I)V

    return-void
.end method

.method public final J(Lor4;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lisd;->b:Ljava/lang/Object;

    check-cast v2, La7f;

    if-nez v2, :cond_f

    const-string v2, "Called runAndWatch on a manager that has been disposed of"

    invoke-static {v2}, Lbpg;->b(Ljava/lang/String;)V

    :cond_f
    iget-object v2, v0, Lisd;->b:Ljava/lang/Object;

    check-cast v2, La7f;

    instance-of v3, v2, Lemj;

    if-eqz v3, :cond_9c

    check-cast v2, Lemj;

    iget-object v3, v2, Lemj;->g:Lor4;

    if-eqz v3, :cond_9c

    invoke-virtual {v3, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_9c

    new-instance v3, Lice;

    invoke-direct {v3}, Lice;-><init>()V

    iget-object v4, v2, Lemj;->g:Lor4;

    if-nez v4, :cond_31

    const-string v5, "promote must only be called when a manager is managing subscriptions for one channel and needs to start managing them for a second"

    invoke-static {v5}, Lbpg;->b(Ljava/lang/String;)V

    :cond_31
    iget-object v5, v2, Lemj;->e:Ltee;

    iget-object v6, v3, Lice;->d:Ljava/util/ArrayList;

    if-nez v5, :cond_42

    iget-object v5, v2, Lemj;->c:Ljava/lang/Object;

    new-instance v7, Lfce;

    invoke-direct {v7, v5, v4}, Lfce;-><init>(Ljava/lang/Object;Lor4;)V

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_94

    :cond_42
    iget-object v7, v5, Ltee;->b:[Ljava/lang/Object;

    iget-object v5, v5, Ltee;->a:[J

    array-length v8, v5

    add-int/lit8 v8, v8, -0x2

    if-ltz v8, :cond_94

    const/4 v10, 0x0

    :goto_4c
    aget-wide v11, v5, v10

    not-long v13, v11

    const/4 v15, 0x7

    shl-long/2addr v13, v15

    and-long/2addr v13, v11

    const-wide v15, -0x7f7f7f7f7f7f7f80L    # -2.937446524422997E-306

    and-long/2addr v13, v15

    cmp-long v13, v13, v15

    if-eqz v13, :cond_8f

    sub-int v13, v10, v8

    not-int v13, v13

    ushr-int/lit8 v13, v13, 0x1f

    const/16 v14, 0x8

    rsub-int/lit8 v13, v13, 0x8

    const/4 v15, 0x0

    :goto_66
    if-ge v15, v13, :cond_8c

    const-wide/16 v16, 0xff

    and-long v16, v11, v16

    const-wide/16 v18, 0x80

    cmp-long v16, v16, v18

    if-gez v16, :cond_83

    shl-int/lit8 v16, v10, 0x3

    add-int v16, v16, v15

    aget-object v9, v7, v16

    move/from16 v16, v14

    new-instance v14, Lfce;

    invoke-direct {v14, v9, v4}, Lfce;-><init>(Ljava/lang/Object;Lor4;)V

    invoke-virtual {v6, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_85

    :cond_83
    move/from16 v16, v14

    :goto_85
    shr-long v11, v11, v16

    add-int/lit8 v15, v15, 0x1

    move/from16 v14, v16

    goto :goto_66

    :cond_8c
    move v9, v14

    if-ne v13, v9, :cond_94

    :cond_8f
    if-eq v10, v8, :cond_94

    add-int/lit8 v10, v10, 0x1

    goto :goto_4c

    :cond_94
    :goto_94
    invoke-virtual {v3}, Lice;->c()V

    invoke-virtual {v2}, Lemj;->d()V

    iput-object v3, v0, Lisd;->b:Ljava/lang/Object;

    :cond_9c
    iget-object v0, v0, Lisd;->b:Ljava/lang/Object;

    check-cast v0, La7f;

    invoke-virtual {v0, v1}, La7f;->e(Lor4;)Lkotlin/jvm/functions/Function1;

    move-result-object v2

    invoke-static {}, Lytj;->h()Lttj;

    move-result-object v3

    invoke-virtual {v3, v2}, Lttj;->u(Lkotlin/jvm/functions/Function1;)Lttj;

    move-result-object v2

    invoke-virtual {v0, v1}, La7f;->b(Lor4;)V

    :try_start_af
    invoke-virtual {v2}, Lttj;->j()Lttj;

    move-result-object v1
    :try_end_b3
    .catchall {:try_start_af .. :try_end_b3} :catchall_c6

    :try_start_b3
    invoke-interface/range {p2 .. p2}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v3
    :try_end_b7
    .catchall {:try_start_b3 .. :try_end_b7} :catchall_c1

    :try_start_b7
    invoke-static {v1}, Lttj;->q(Lttj;)V
    :try_end_ba
    .catchall {:try_start_b7 .. :try_end_ba} :catchall_c6

    invoke-virtual {v2}, Lttj;->c()V

    invoke-virtual {v0}, La7f;->c()V

    return-object v3

    :catchall_c1
    move-exception v0

    :try_start_c2
    invoke-static {v1}, Lttj;->q(Lttj;)V

    throw v0
    :try_end_c6
    .catchall {:try_start_c2 .. :try_end_c6} :catchall_c6

    :catchall_c6
    move-exception v0

    invoke-virtual {v2}, Lttj;->c()V

    throw v0
.end method

.method public final K(Lccb;)V
    .registers 5

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/Region;

    iget v0, p1, Lccb;->a:I

    iget v1, p1, Lccb;->b:I

    iget v2, p1, Lccb;->c:I

    iget p1, p1, Lccb;->d:I

    invoke-virtual {p0, v0, v1, v2, p1}, Landroid/graphics/Region;->set(IIII)Z

    return-void
.end method

.method public final L([B)V
    .registers 12

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    iget-object v2, p0, Lisd;->b:Ljava/lang/Object;

    check-cast v2, [Lqfb;

    array-length v3, v2

    if-ge v1, v3, :cond_50

    aget-object v2, v2, v1

    mul-int/lit16 v3, v1, 0x180

    iget-object v2, v2, Lqfb;->b:Ljava/lang/Object;

    check-cast v2, [S

    move v4, v0

    :goto_12
    const/16 v5, 0x100

    if-ge v4, v5, :cond_26

    aget-short v5, v2, v4

    add-int/lit16 v5, v5, -0xd01

    int-to-short v5, v5

    shr-int/lit8 v6, v5, 0xf

    and-int/lit16 v6, v6, 0xd01

    add-int/2addr v5, v6

    int-to-short v5, v5

    aput-short v5, v2, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_12

    :cond_26
    move v4, v0

    :goto_27
    const/16 v5, 0x80

    if-ge v4, v5, :cond_4d

    shl-int/lit8 v5, v4, 0x1

    aget-short v6, v2, v5

    add-int/lit8 v5, v5, 0x1

    aget-short v5, v2, v5

    mul-int/lit8 v7, v4, 0x3

    add-int/2addr v7, v3

    int-to-byte v8, v6

    aput-byte v8, p1, v7

    add-int/lit8 v8, v7, 0x1

    shr-int/lit8 v6, v6, 0x8

    shl-int/lit8 v9, v5, 0x4

    or-int/2addr v6, v9

    int-to-byte v6, v6

    aput-byte v6, p1, v8

    add-int/lit8 v7, v7, 0x2

    shr-int/lit8 v5, v5, 0x4

    int-to-byte v5, v5

    aput-byte v5, p1, v7

    add-int/lit8 v4, v4, 0x1

    goto :goto_27

    :cond_4d
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_50
    return-void
.end method

.method public final M(Ljava/util/EnumSet;Lnt5;)Ljava/lang/Object;
    .registers 11

    iget-object v0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast v0, Llpe;

    instance-of v1, p2, Lkpe;

    if-eqz v1, :cond_17

    move-object v1, p2

    check-cast v1, Lkpe;

    iget v2, v1, Lkpe;->x:I

    const/high16 v3, -0x80000000

    and-int v4, v2, v3

    if-eqz v4, :cond_17

    sub-int/2addr v2, v3

    iput v2, v1, Lkpe;->x:I

    goto :goto_1c

    :cond_17
    new-instance v1, Lkpe;

    invoke-direct {v1, p0, p2}, Lkpe;-><init>(Lisd;Lnt5;)V

    :goto_1c
    iget-object p0, v1, Lkpe;->v:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v2, v1, Lkpe;->x:I

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v2, :cond_3d

    if-eq v2, v4, :cond_35

    if-ne v2, v3, :cond_2f

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_89

    :cond_2f
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v5

    :cond_35
    iget-object p1, v1, Lkpe;->u:Ljava/util/Iterator;

    iget-object v2, v1, Lkpe;->t:Ljava/util/EnumSet;

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_7a

    :cond_3d
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, v0, Llpe;->z:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    move-object v7, p1

    move-object p1, p0

    move-object p0, v7

    :cond_4d
    :goto_4d
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7c

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcs4;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lmtb;

    invoke-virtual {p0, v6}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4d

    check-cast v2, Lkotlin/jvm/functions/Function1;

    iput-object p0, v1, Lkpe;->t:Ljava/util/EnumSet;

    iput-object p1, v1, Lkpe;->u:Ljava/util/Iterator;

    iput v4, v1, Lkpe;->x:I

    invoke-interface {v2, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, p2, :cond_88

    move-object v2, p0

    :goto_7a
    move-object p0, v2

    goto :goto_4d

    :cond_7c
    iput-object v5, v1, Lkpe;->t:Ljava/util/EnumSet;

    iput-object v5, v1, Lkpe;->u:Ljava/util/Iterator;

    iput v3, v1, Lkpe;->x:I

    invoke-virtual {v0, v1}, Llpe;->b(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p2, :cond_89

    :cond_88
    return-object p2

    :cond_89
    :goto_89
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final a(Ljava/lang/String;)Z
    .registers 2

    invoke-virtual {p0, p1}, Lisd;->x(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "1"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_14

    invoke-static {p0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_14

    const/4 p0, 0x0

    return p0

    :cond_14
    const/4 p0, 0x1

    return p0
.end method

.method public final b()V
    .registers 2

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->s:Z

    invoke-virtual {p0}, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->t()V

    return-void
.end method

.method public final c(Ljava/lang/String;)Ljava/lang/Integer;
    .registers 3

    invoke-virtual {p0, p1}, Lisd;->x(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_16

    :try_start_a
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0
    :try_end_12
    .catch Ljava/lang/NumberFormatException; {:try_start_a .. :try_end_12} :catch_13

    return-object p0

    :catch_13
    invoke-static {p1}, Lisd;->N(Ljava/lang/String;)V

    :cond_16
    const/4 p0, 0x0

    return-object p0
.end method

.method public final d(Landroid/view/View;)V
    .registers 3

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    instance-of v0, p1, Leri;

    if-nez v0, :cond_9

    const/4 p1, 0x0

    :cond_9
    if-eqz p1, :cond_18

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lakg;

    iget-object p0, p0, Lakg;->n:Ljava/lang/Object;

    check-cast p0, Lori;

    check-cast p1, Leri;

    invoke-interface {p0, p1}, Lori;->J(Leri;)V

    :cond_18
    return-void
.end method

.method public final e(Lcie;)V
    .registers 13

    new-instance v0, Lu2p;

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Ljsd;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Laoo;-><init>(Landroid/content/Context;Landroid/view/View;)V

    invoke-virtual {p0, v0}, Ljsd;->a(Laoo;)V

    iget-object v1, p0, Ljsd;->a:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iput-object v0, p1, Lcie;->w0:Laoo;

    invoke-static {v0, p1}, Ljsd;->c(Laoo;Lcie;)V

    iget-object v1, p1, Lcie;->o:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_25

    iget-object v1, p1, Lcie;->p:Ljava/lang/String;

    :cond_25
    iget-object p0, p0, Ljsd;->b:Landroid/widget/ImageView$ScaleType;

    iget-object v3, v0, Lu2p;->u:Landroid/widget/ImageView;

    const/4 v4, 0x2

    if-eqz v3, :cond_3b

    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Lugo;

    invoke-direct {v3, v0, p0, v4}, Lugo;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2, v1, v3}, Lfip;->b(Landroid/content/Context;Ljava/lang/String;Lzhp;)V

    :cond_3b
    iget-object p0, p1, Lbzo;->f:Lfio;

    if-eqz p0, :cond_bd

    iget-byte p1, p0, Lfio;->a:B

    const/4 v1, 0x1

    if-eq p1, v1, :cond_bd

    iget-byte v2, p0, Lfio;->e:B

    and-int/2addr v2, p1

    if-eqz v2, :cond_bd

    iget-object v2, v0, Laoo;->d:Ljava/util/ArrayList;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v2}, Lm5h;->d(Ljava/util/List;)Z

    move-result v5

    const/16 v6, 0x13

    const/4 v7, 0x0

    if-nez v5, :cond_80

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    move v8, v7

    :cond_5e
    :goto_5e
    if-ge v8, v5, :cond_80

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v8, v8, 0x1

    if-eqz v9, :cond_5e

    check-cast v9, Landroid/view/View;

    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-boolean v10, Lg1p;->j:Z

    if-eqz v10, :cond_7c

    if-ne p1, v4, :cond_7c

    new-instance v10, Lpkm;

    invoke-direct {v10, v0, v6}, Lpkm;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v9, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_5e

    :cond_7c
    invoke-virtual {v9, v1}, Landroid/view/View;->setClickable(Z)V

    goto :goto_5e

    :cond_80
    iget-object p1, v0, Lu2p;->u:Landroid/widget/ImageView;

    if-eqz p1, :cond_91

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p1, v0, Lu2p;->u:Landroid/widget/ImageView;

    new-instance v1, Lpkm;

    invoke-direct {v1, v0, v6}, Lpkm;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_91
    iget-object p1, v0, Laoo;->k:Landroid/view/View;

    if-eqz p1, :cond_98

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_98
    new-instance p1, Ldgo;

    const/16 v1, 0x8

    invoke-direct {p1, v0, v1}, Ldgo;-><init>(Ljava/lang/Object;B)V

    iget-object v1, v0, Laoo;->t:Ldrj;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v1

    :cond_a8
    :goto_a8
    if-ge v7, v1, :cond_bd

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v7, v7, 0x1

    if-eqz v2, :cond_a8

    check-cast v2, Landroid/view/View;

    new-instance v4, Lxgo;

    invoke-direct {v4, p1, v0, p0}, Lxgo;-><init>(Lg94;Lu2p;Lfio;)V

    invoke-virtual {v2, v4}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    goto :goto_a8

    :cond_bd
    return-void
.end method

.method public final f()Z
    .registers 1

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Landroid/nfc/tech/Ndef;

    invoke-virtual {p0}, Landroid/nfc/tech/Ndef;->makeReadOnly()Z

    move-result p0

    return p0
.end method

.method public final g(Llcc;)V
    .registers 2

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lrdc;

    invoke-virtual {p0, p1}, Lrdc;->g(Llcc;)V

    return-void
.end method

.method public final getState()Lpcc;
    .registers 1

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lrdc;

    iget-object p0, p0, Lrdc;->c:Ljava/lang/Object;

    check-cast p0, Lpcc;

    return-object p0
.end method

.method public final h(Llcc;)V
    .registers 2

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lrdc;

    invoke-virtual {p0, p1}, Lrdc;->h(Llcc;)V

    return-void
.end method

.method public final i()V
    .registers 1

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lbn;

    invoke-interface {p0}, Lbn;->i()V

    return-void
.end method

.method public final j()Z
    .registers 1

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Landroid/nfc/tech/Ndef;

    invoke-virtual {p0}, Landroid/nfc/tech/Ndef;->getNdefMessage()Landroid/nfc/NdefMessage;

    move-result-object p0

    if-nez p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method

.method public final k()Ls6j;
    .registers 1

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Ld1g;

    return-object p0
.end method

.method public final l(Landroid/view/View;)V
    .registers 5

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lakg;

    invoke-virtual {p0}, Lo73;->f()Lr9i;

    move-result-object p0

    const/4 v0, 0x0

    if-eqz p0, :cond_15

    iget-object v1, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast v1, Lo66;

    invoke-virtual {v1}, Lo66;->j()Z

    move-result v1

    if-nez v1, :cond_16

    :cond_15
    move-object p0, v0

    :cond_16
    if-eqz p0, :cond_32

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lo66;

    iget-object p0, p0, Lo66;->f:Ll56;

    if-eqz p0, :cond_22

    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->c:Lim7;

    :cond_22
    if-eqz v0, :cond_32

    invoke-virtual {v0, p1}, Landroid/widget/AdapterView;->getPositionForView(Landroid/view/View;)I

    move-result p0

    const/4 v1, -0x1

    if-eq p0, v1, :cond_32

    invoke-virtual {v0, p0}, Landroid/widget/AdapterView;->getItemIdAtPosition(I)J

    move-result-wide v1

    invoke-virtual {v0, p1, p0, v1, v2}, Landroid/widget/AdapterView;->performItemClick(Landroid/view/View;IJ)Z

    :cond_32
    return-void
.end method

.method public final m()V
    .registers 5

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lro9;

    iget-object v0, p0, Lro9;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;

    iget v1, p0, Lro9;->b:I

    if-nez v1, :cond_e

    const/4 p0, 0x0

    goto :goto_1f

    :cond_e
    iget-object p0, p0, Lro9;->d:Ljava/lang/Object;

    check-cast p0, Lwwf;

    iget p0, p0, Lwwf;->c:F

    const/high16 v2, 0x3f800000    # 1.0f

    add-float/2addr p0, v2

    int-to-float v1, v1

    cmpl-float v3, p0, v1

    if-lez v3, :cond_1e

    move p0, v2

    goto :goto_1f

    :cond_1e
    div-float/2addr p0, v1

    :goto_1f
    invoke-virtual {v0, p0}, Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;->r(F)V

    return-void
.end method

.method public final n(Landroid/nfc/NdefMessage;)V
    .registers 2

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Landroid/nfc/tech/Ndef;

    invoke-virtual {p0, p1}, Landroid/nfc/tech/Ndef;->writeNdefMessage(Landroid/nfc/NdefMessage;)V

    invoke-virtual {p0}, Landroid/nfc/tech/Ndef;->close()V

    return-void
.end method

.method public final o()V
    .registers 5

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lro9;

    iget-object v0, p0, Lro9;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;

    iget v1, p0, Lro9;->b:I

    if-nez v1, :cond_e

    const/4 p0, 0x0

    goto :goto_1f

    :cond_e
    iget-object p0, p0, Lro9;->d:Ljava/lang/Object;

    check-cast p0, Lwwf;

    iget p0, p0, Lwwf;->c:F

    const/high16 v2, 0x3f800000    # 1.0f

    add-float/2addr p0, v2

    int-to-float v1, v1

    cmpl-float v3, p0, v1

    if-lez v3, :cond_1e

    move p0, v2

    goto :goto_1f

    :cond_1e
    div-float/2addr p0, v1

    :goto_1f
    invoke-virtual {v0, p0}, Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;->r(F)V

    return-void
.end method

.method public final onFailure(Lv84;Ljava/io/IOException;)V
    .registers 5

    iget-byte v0, p0, Lisd;->a:B

    const/4 v1, 0x2

    sparse-switch v0, :sswitch_data_2c

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lb94;

    new-instance p1, Lw3k;

    invoke-direct {p1, p2}, Lw3k;-><init>(Ljava/io/IOException;)V

    invoke-virtual {p0, p1}, Lb94;->run(Ljava/lang/Object;)V

    return-void

    :sswitch_13
    new-instance p1, Lwxh;

    invoke-direct {p1, p0, v1}, Lwxh;-><init>(Lisd;B)V

    invoke-static {p1}, Lvml;->e(Ljava/lang/Runnable;)V

    return-void

    :sswitch_1c
    invoke-interface {p1}, Lv84;->isCanceled()Z

    move-result p1

    if-nez p1, :cond_2a

    new-instance p1, Lqif;

    invoke-direct {p1, p0, v1}, Lqif;-><init>(Lisd;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_2a
    return-void

    nop

    :sswitch_data_2c
    .sparse-switch
        0x8 -> :sswitch_1c
        0x12 -> :sswitch_13
    .end sparse-switch
.end method

.method public final onResponse(Lv84;Lpzh;)V
    .registers 10

    iget-byte p1, p0, Lisd;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x1

    sparse-switch p1, :sswitch_data_176

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lb94;

    :try_start_c
    iget-boolean p1, p2, Lpzh;->q:Z
    :try_end_e
    .catchall {:try_start_c .. :try_end_e} :catchall_83

    iget-object v1, p2, Lpzh;->g:Lvzh;

    if-eqz p1, :cond_49

    :try_start_12
    const-string p1, "Content-Type"

    invoke-static {p2, p1}, Lpzh;->k(Lpzh;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_43

    sget-object v2, Lesd;->e:Lkotlin/text/Regex;
    :try_end_1c
    .catchall {:try_start_12 .. :try_end_1c} :catchall_83

    :try_start_1c
    invoke-static {p1}, Lwyh;->x(Ljava/lang/String;)Lesd;

    move-result-object v0
    :try_end_20
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1c .. :try_end_20} :catch_20
    .catchall {:try_start_1c .. :try_end_20} :catchall_83

    :catch_20
    if-eqz v0, :cond_43

    :try_start_22
    iget-object p1, v0, Lesd;->b:Ljava/lang/String;

    const-string v2, "application"

    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_43

    iget-object p1, v0, Lesd;->c:Ljava/lang/String;

    const-string v0, "json"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_43

    new-instance p1, Ly3k;

    invoke-virtual {v1}, Lvzh;->string()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ly3k;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lb94;->run(Ljava/lang/Object;)V

    goto :goto_7f

    :cond_43
    sget-object p1, Lx3k;->a:Lx3k;

    invoke-virtual {p0, p1}, Lb94;->run(Ljava/lang/Object;)V
    :try_end_48
    .catchall {:try_start_22 .. :try_end_48} :catchall_83

    goto :goto_7f

    :cond_49
    :try_start_49
    sget-object p1, Lt0i;->b:Lp0i;

    sget-object p1, Lrpb;->d:Lqpb;

    invoke-virtual {v1}, Lvzh;->string()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Lyx9;->Companion:Lxx9;

    invoke-virtual {v2}, Lxx9;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v2

    check-cast v2, Lkotlinx/serialization/KSerializer;

    invoke-virtual {p1, v1, v2}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lyx9;
    :try_end_62
    .catchall {:try_start_49 .. :try_end_62} :catchall_63

    goto :goto_6c

    :catchall_63
    move-exception p1

    :try_start_64
    sget-object v1, Lt0i;->b:Lp0i;

    new-instance v1, Lq0i;

    invoke-direct {v1, p1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p1, v1

    :goto_6c
    instance-of v1, p1, Lq0i;

    if-nez v1, :cond_71

    move-object v0, p1

    :cond_71
    check-cast v0, Lyx9;

    new-instance p1, Lv3k;

    iget v1, p2, Lpzh;->d:I

    iget-object v2, p2, Lpzh;->c:Ljava/lang/String;

    invoke-direct {p1, v1, v2, v0}, Lv3k;-><init>(ILjava/lang/String;Lyx9;)V

    invoke-virtual {p0, p1}, Lb94;->run(Ljava/lang/Object;)V
    :try_end_7f
    .catchall {:try_start_64 .. :try_end_7f} :catchall_83

    :goto_7f
    invoke-virtual {p2}, Lpzh;->close()V

    return-void

    :catchall_83
    move-exception p0

    invoke-virtual {p2}, Lpzh;->close()V

    throw p0

    :sswitch_88
    iget-boolean p1, p2, Lpzh;->q:Z

    if-eqz p1, :cond_98

    invoke-virtual {p2}, Lpzh;->close()V

    new-instance p1, Lwxh;

    invoke-direct {p1, p0, v1}, Lwxh;-><init>(Lisd;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    goto :goto_a3

    :cond_98
    invoke-virtual {p2}, Lpzh;->close()V

    new-instance p1, Lwxh;

    invoke-direct {p1, p0, v2}, Lwxh;-><init>(Lisd;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    :goto_a3
    return-void

    :sswitch_a4
    iget-object p1, p2, Lpzh;->f:Le9a;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v3, "Set-Cookie"

    invoke-static {p1, v3}, Lokhttp3/internal/_HeadersCommonKt;->commonValues(Le9a;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_b7

    move-object v3, v0

    goto :goto_c0

    :cond_b7
    new-instance v3, Llv5;

    iget-object v4, p2, Lpzh;->a:Lkvh;

    iget-object v4, v4, Lkvh;->a:Lhra;

    invoke-direct {v3, v4, p1}, Llv5;-><init>(Lhra;Ljava/util/List;)V

    :goto_c0
    iget-object p1, p2, Lpzh;->f:Le9a;

    :try_start_c2
    iget-object v4, p2, Lpzh;->g:Lvzh;

    invoke-virtual {v4}, Lvzh;->contentType()Lesd;

    move-result-object v5

    invoke-virtual {v4}, Lvzh;->string()Ljava/lang/String;

    move-result-object v4

    iget-boolean p2, p2, Lpzh;->q:Z

    if-eqz p2, :cond_110

    iget-object p2, v5, Lesd;->b:Ljava/lang/String;

    const-string v0, "text"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_ee

    iget-object p2, v5, Lesd;->c:Ljava/lang/String;

    const-string v0, "html"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_ee

    new-instance p1, Lqif;

    invoke-direct {p1, p0, v1}, Lqif;-><init>(Lisd;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V
    :try_end_ec
    .catch Ljava/io/IOException; {:try_start_c2 .. :try_end_ec} :catch_16c

    goto/16 :goto_174

    :cond_ee
    :try_start_ee
    new-instance p2, Lorb;

    invoke-direct {p2, v4}, Lorb;-><init>(Ljava/lang/String;)V

    invoke-static {p2}, Lvzk;->Y(Lorb;)Lwjh;

    move-result-object p2

    new-instance v0, Lrif;

    invoke-direct {v0, p0, p2, v3, v1}, Lrif;-><init>(Lisd;Lwjh;Llv5;B)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V
    :try_end_ff
    .catch Lorg/json/JSONException; {:try_start_ee .. :try_end_ff} :catch_101
    .catch Ljava/io/IOException; {:try_start_ee .. :try_end_ff} :catch_16c

    goto/16 :goto_174

    :catch_101
    :try_start_101
    invoke-static {p1}, Lvzk;->X(Le9a;)Lwjh;

    move-result-object p1

    if-eqz p1, :cond_16c

    new-instance p2, Lrif;

    invoke-direct {p2, p0, p1, v3, v2}, Lrif;-><init>(Lisd;Lwjh;Llv5;B)V

    invoke-static {p2}, Lvml;->c(Ljava/lang/Runnable;)V
    :try_end_10f
    .catch Ljava/io/IOException; {:try_start_101 .. :try_end_10f} :catch_16c

    goto :goto_174

    :cond_110
    :try_start_110
    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    new-instance v3, Lcm;

    const-string v4, "error_code"

    invoke-virtual {p2, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    const-string v5, "error_message"

    const-string v6, ""

    invoke-virtual {p2, v5}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    if-eqz p2, :cond_12f

    sget-object v5, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-eq p2, v5, :cond_12f

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    :cond_12f
    invoke-direct {v3, v4, v6, v2}, Lcm;-><init>(ILjava/lang/String;B)V

    new-instance p2, Lsif;

    invoke-direct {p2, p0, v3, v1}, Lsif;-><init>(Lisd;Lcm;B)V

    invoke-static {p2}, Lvml;->c(Ljava/lang/Runnable;)V
    :try_end_13a
    .catch Lorg/json/JSONException; {:try_start_110 .. :try_end_13a} :catch_13b
    .catch Ljava/io/IOException; {:try_start_110 .. :try_end_13a} :catch_16c

    goto :goto_174

    :catch_13b
    :try_start_13b
    const-string p2, "X-Opera-Auth-ErrCode"

    iget-object v1, p1, Le9a;->a:[Ljava/lang/String;

    invoke-static {v1, p2}, Lokhttp3/internal/_HeadersCommonKt;->commonHeadersGet([Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string v1, "X-Opera-Auth-ErrMsg"

    iget-object p1, p1, Le9a;->a:[Ljava/lang/String;

    invoke-static {p1, v1}, Lokhttp3/internal/_HeadersCommonKt;->commonHeadersGet([Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_161

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1
    :try_end_155
    .catch Ljava/io/IOException; {:try_start_13b .. :try_end_155} :catch_16c

    if-nez v1, :cond_161

    :try_start_157
    new-instance v1, Lcm;

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p2

    invoke-direct {v1, p2, p1, v2}, Lcm;-><init>(ILjava/lang/String;B)V
    :try_end_160
    .catch Ljava/lang/NumberFormatException; {:try_start_157 .. :try_end_160} :catch_161
    .catch Ljava/io/IOException; {:try_start_157 .. :try_end_160} :catch_16c

    move-object v0, v1

    :catch_161
    :cond_161
    if-eqz v0, :cond_16c

    :try_start_163
    new-instance p1, Lsif;

    invoke-direct {p1, p0, v0, v2}, Lsif;-><init>(Lisd;Lcm;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V
    :try_end_16b
    .catch Ljava/io/IOException; {:try_start_163 .. :try_end_16b} :catch_16c

    goto :goto_174

    :catch_16c
    :cond_16c
    new-instance p1, Lqif;

    invoke-direct {p1, p0, v2}, Lqif;-><init>(Lisd;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    :goto_174
    return-void

    nop

    :sswitch_data_176
    .sparse-switch
        0x8 -> :sswitch_a4
        0x12 -> :sswitch_88
    .end sparse-switch
.end method

.method public final onSuccess()V
    .registers 2

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->s:Z

    invoke-virtual {p0}, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->t()V

    return-void
.end method

.method public final p(Lbm;)V
    .registers 2

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lbn;

    invoke-interface {p0, p1}, Lbn;->m(Lbm;)V

    return-void
.end method

.method public final q()Lm2k;
    .registers 1

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Ldrj;

    return-object p0
.end method

.method public final r(Ljava/lang/String;)Lorg/json/JSONArray;
    .registers 3

    invoke-virtual {p0, p1}, Lisd;->x(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_13

    :try_start_a
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_f
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_f} :catch_10

    return-object v0

    :catch_10
    invoke-static {p1}, Lisd;->N(Ljava/lang/String;)V

    :cond_13
    const/4 p0, 0x0

    return-object p0
.end method

.method public final read()Landroid/nfc/NdefMessage;
    .registers 1

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Landroid/nfc/tech/Ndef;

    invoke-virtual {p0}, Landroid/nfc/tech/Ndef;->getNdefMessage()Landroid/nfc/NdefMessage;

    move-result-object p0

    return-object p0
.end method

.method public final s()[I
    .registers 6

    const-string v0, "gcm.n.light_settings"

    invoke-virtual {p0, v0}, Lisd;->r(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    const/4 v0, 0x0

    if-nez p0, :cond_a

    return-object v0

    :cond_a
    const/4 v1, 0x3

    new-array v2, v1, [I

    :try_start_d
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ne v3, v1, :cond_39

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    const/high16 v4, -0x1000000

    if-eq v3, v4, :cond_31

    aput v3, v2, v1

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->optInt(I)I

    move-result v3

    aput v3, v2, v1

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->optInt(I)I

    move-result v3

    aput v3, v2, v1

    return-object v2

    :cond_31
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Transparent color is invalid"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_39
    new-instance v1, Lorg/json/JSONException;

    const-string v2, "lightSettings don\'t have all three fields"

    invoke-direct {v1, v2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_41
    .catch Lorg/json/JSONException; {:try_start_d .. :try_end_41} :catch_49
    .catch Ljava/lang/IllegalArgumentException; {:try_start_d .. :try_end_41} :catch_41

    :catch_41
    move-exception v1

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    goto :goto_4c

    :catch_49
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    :goto_4c
    return-object v0
.end method

.method public final t(Ljava/lang/String;)[Ljava/lang/Object;
    .registers 5

    const-string v0, "_loc_args"

    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lisd;->r(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    if-nez p0, :cond_e

    const/4 p0, 0x0

    return-object p0

    :cond_e
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result p1

    new-array v0, p1, [Ljava/lang/String;

    const/4 v1, 0x0

    :goto_15
    if-ge v1, p1, :cond_20

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_15

    :cond_20
    return-object v0
.end method

.method public final u(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    const-string v0, "_loc_key"

    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lisd;->x(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final v(Ljava/lang/String;Landroid/content/res/Resources;Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    invoke-virtual {p0, p3}, Lisd;->x(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_b

    return-object v0

    :cond_b
    invoke-virtual {p0, p3}, Lisd;->u(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_17

    return-object v2

    :cond_17
    const-string v1, "string"

    invoke-virtual {p2, v0, v1, p1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_29

    const-string p0, "_loc_key"

    invoke-virtual {p3, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lisd;->N(Ljava/lang/String;)V

    return-object v2

    :cond_29
    invoke-virtual {p0, p3}, Lisd;->t(Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_34

    invoke-virtual {p2, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_34
    :try_start_34
    invoke-virtual {p2, p1, p0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0
    :try_end_38
    .catch Ljava/util/MissingFormatArgumentException; {:try_start_34 .. :try_end_38} :catch_39

    return-object p0

    :catch_39
    invoke-static {p3}, Lisd;->N(Ljava/lang/String;)V

    invoke-static {p0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    return-object v2
.end method

.method public final w(Ld5o;)Lv7e;
    .registers 3

    new-instance p1, Lfc2;

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/res/Resources;

    sget-object v0, Lwlm;->b:Lwlm;

    invoke-direct {p1, p0, v0}, Lfc2;-><init>(Landroid/content/res/Resources;Lv7e;)V

    return-object p1
.end method

.method public final x(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Landroid/os/Bundle;

    invoke-virtual {p0, p1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_27

    const-string v0, "gcm.n."

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_27

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1a

    move-object v0, p1

    goto :goto_20

    :cond_1a
    const-string v1, "gcm.notification."

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    :goto_20
    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_27

    move-object p1, v0

    :cond_27
    invoke-virtual {p0, p1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final y(Ljava/lang/Object;)V
    .registers 3

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Ld1g;

    iget-char v0, p0, Lv6j;->a:C

    invoke-virtual {p0, v0, p1}, Ld1g;->g(ILjava/lang/Object;)Lr6j;

    move-result-object p1

    iget-boolean v0, p1, Lr6j;->h:Z

    iput-boolean v0, p0, Ld1g;->e:Z

    iget-object p0, p0, Lv6j;->b:Lhx5;

    invoke-virtual {p0, p1}, Lekc;->n(Ljava/lang/Object;)V

    return-void
.end method

.method public final z(Lorb;)V
    .registers 2

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    iget-object p1, p1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    return-void
.end method
