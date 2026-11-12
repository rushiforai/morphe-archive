.class public final Lta7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public final f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;

.field public h:Ljava/lang/Object;

.field public i:Ljava/lang/Object;

.field public j:Ljava/lang/Object;

.field public k:Ljava/lang/Object;

.field public final l:Ljava/lang/Object;

.field public m:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lt7f;Lceg;Lisd;Lnv6;Lsbk;)V
    .registers 13

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lma7;

    const-string v1, "Picasso-Dispatcher"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    sget-object v2, Lzym;->a:Ljava/lang/StringBuilder;

    new-instance v2, Lceg;

    const/4 v3, 0x3

    invoke-direct {v2, v1, v3}, Lceg;-><init>(Landroid/os/Looper;B)V

    invoke-virtual {v2}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    const-wide/16 v4, 0x3e8

    invoke-virtual {v2, v1, v4, v5}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    iput-object p1, p0, Lta7;->b:Ljava/lang/Object;

    iput-object p2, p0, Lta7;->c:Ljava/lang/Object;

    new-instance p2, Ljava/util/LinkedHashMap;

    invoke-direct {p2}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p2, p0, Lta7;->e:Ljava/lang/Object;

    new-instance p2, Ljava/util/WeakHashMap;

    invoke-direct {p2}, Ljava/util/WeakHashMap;-><init>()V

    iput-object p2, p0, Lta7;->f:Ljava/lang/Object;

    new-instance p2, Ljava/util/WeakHashMap;

    invoke-direct {p2}, Ljava/util/WeakHashMap;-><init>()V

    iput-object p2, p0, Lta7;->g:Ljava/lang/Object;

    new-instance p2, Ljava/util/LinkedHashSet;

    invoke-direct {p2}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p2, p0, Lta7;->h:Ljava/lang/Object;

    new-instance p2, Lue2;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p2, v0, p0, v3}, Lue2;-><init>(Landroid/os/Looper;Ljava/lang/Object;B)V

    iput-object p2, p0, Lta7;->i:Ljava/lang/Object;

    iput-object p4, p0, Lta7;->d:Ljava/lang/Object;

    iput-object p3, p0, Lta7;->j:Ljava/lang/Object;

    iput-object p5, p0, Lta7;->k:Ljava/lang/Object;

    iput-object p6, p0, Lta7;->l:Ljava/lang/Object;

    new-instance p2, Ljava/util/ArrayList;

    const/4 p3, 0x4

    invoke-direct {p2, p3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p2, p0, Lta7;->m:Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    const/4 p3, 0x0

    :try_start_64
    const-string p4, "airplane_mode_on"

    invoke-static {p2, p4, p3}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    :try_end_69
    .catch Ljava/lang/NullPointerException; {:try_start_64 .. :try_end_69} :catch_69
    .catch Ljava/lang/SecurityException; {:try_start_64 .. :try_end_69} :catch_69

    :catch_69
    const-string p2, "android.permission.ACCESS_NETWORK_STATE"

    invoke-virtual {p1, p2}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_73

    const/4 p1, 0x1

    goto :goto_74

    :cond_73
    move p1, p3

    :goto_74
    iput-boolean p1, p0, Lta7;->a:Z

    new-instance p1, Lup1;

    const/16 p2, 0x8

    invoke-direct {p1, p2, p0, p3}, Lup1;-><init>(BLjava/lang/Object;Z)V

    new-instance p0, Landroid/content/IntentFilter;

    invoke-direct {p0}, Landroid/content/IntentFilter;-><init>()V

    const-string p2, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {p0, p2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object p2, p1, Lup1;->b:Ljava/lang/Object;

    check-cast p2, Lta7;

    iget-boolean p3, p2, Lta7;->a:Z

    if-eqz p3, :cond_94

    const-string p3, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {p0, p3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    :cond_94
    iget-object p2, p2, Lta7;->b:Ljava/lang/Object;

    check-cast p2, Landroid/content/Context;

    invoke-virtual {p2, p1, p0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 6

    .line 169
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 170
    new-instance v0, Lnrl;

    const/16 v1, 0x1a

    invoke-direct {v0, v1}, Lnrl;-><init>(B)V

    iput-object v0, p0, Lta7;->l:Ljava/lang/Object;

    .line 171
    new-instance v0, Li16;

    invoke-direct {v0, p1, p2}, Li16;-><init>(Landroid/content/Context;Lumi;)V

    iput-object v0, p0, Lta7;->b:Ljava/lang/Object;

    .line 172
    new-instance v0, Lqb7;

    .line 173
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 174
    new-instance v1, Li32;

    invoke-direct {v1, v0, p1, p2}, Li32;-><init>(Lqb7;Landroid/content/Context;Lumi;)V

    iput-object v1, v0, Lqb7;->a:Ljava/lang/Object;

    .line 175
    invoke-virtual {v1}, Lldk;->h()V

    .line 176
    iput-object v0, p0, Lta7;->c:Ljava/lang/Object;

    .line 177
    new-instance v0, Lyqa;

    invoke-direct {v0, p1, p2}, Lyqa;-><init>(Landroid/content/Context;Lumi;)V

    iput-object v0, p0, Lta7;->d:Ljava/lang/Object;

    .line 178
    new-instance v0, Ls6h;

    .line 179
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 180
    new-instance v1, Li32;

    invoke-direct {v1, v0, p1, p2}, Li32;-><init>(Ls6h;Landroid/content/Context;Lumi;)V

    iput-object v1, v0, Ls6h;->a:Ljava/lang/Object;

    .line 181
    invoke-virtual {v1}, Lldk;->h()V

    .line 182
    iput-object v0, p0, Lta7;->e:Ljava/lang/Object;

    .line 183
    new-instance v0, La00;

    const/16 v1, 0x8

    invoke-direct {v0, p0, v1}, La00;-><init>(Ljava/lang/Object;B)V

    const/4 v1, 0x1

    new-array v1, v1, [Lbg1;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const-string v0, "newsfeed"

    invoke-static {p1, p2, v0, v1}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lta7;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lu02;Ly0a;Lj4c;Lorm;Lwyn;Lvx;ZLcom/opera/android/settings/SettingsManager;Lcs6;Lxoc;Ldw3;Ldw3;)V
    .registers 13

    .line 156
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 157
    iput-object p1, p0, Lta7;->b:Ljava/lang/Object;

    .line 158
    iput-object p2, p0, Lta7;->c:Ljava/lang/Object;

    .line 159
    iput-object p3, p0, Lta7;->d:Ljava/lang/Object;

    .line 160
    iput-object p4, p0, Lta7;->e:Ljava/lang/Object;

    .line 161
    iput-object p5, p0, Lta7;->f:Ljava/lang/Object;

    .line 162
    iput-object p6, p0, Lta7;->g:Ljava/lang/Object;

    .line 163
    iput-boolean p7, p0, Lta7;->a:Z

    .line 164
    iput-object p8, p0, Lta7;->h:Ljava/lang/Object;

    .line 165
    iput-object p9, p0, Lta7;->i:Ljava/lang/Object;

    .line 166
    iput-object p10, p0, Lta7;->j:Ljava/lang/Object;

    .line 167
    iput-object p11, p0, Lta7;->k:Ljava/lang/Object;

    .line 168
    iput-object p12, p0, Lta7;->l:Ljava/lang/Object;

    return-void
.end method

.method public static E(Lqcd;)Lapc;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_11

    const/4 v0, 0x1

    if-ne p0, v0, :cond_c

    sget-object p0, Lapc;->d:Lapc;

    return-object p0

    :cond_c
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :cond_11
    sget-object p0, Lapc;->c:Lapc;

    return-object p0
.end method

.method public static q(Ljava/net/URL;)Ljava/lang/String;
    .registers 4

    invoke-virtual {p0}, Ljava/net/URL;->getAuthority()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1b

    const-string v1, "/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1b

    invoke-static {v0, v1, p0}, Lsko;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1b
    return-object v0
.end method


# virtual methods
.method public final A(Lyla;)V
    .registers 9

    const-string v0, ""

    if-nez p1, :cond_8

    const/4 v1, 0x0

    move-object v2, v0

    move-object v3, v2

    goto :goto_1e

    :cond_8
    iget-object v1, p1, Lyla;->a:Ljava/net/URL;

    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p1, Lyla;->b:Ljava/net/URL;

    invoke-virtual {v2}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v2

    iget v3, p1, Lyla;->c:I

    invoke-static {v3}, Lo18;->e(I)B

    move-result v3

    move-object v6, v2

    move-object v2, v1

    move v1, v3

    move-object v3, v6

    :goto_1e
    if-eqz p1, :cond_28

    iget-object v4, p1, Lyla;->e:Ll0c;

    if-eqz v4, :cond_28

    invoke-virtual {v4}, Ll0c;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_28
    invoke-virtual {p0}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v5, "hosts_news_feed"

    invoke-interface {v4, v5, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v4, "hosts_article_detail"

    invoke-interface {v2, v4, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "hosts_origin"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "hosts_language_region"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "hosts_timestamp"

    invoke-static {v0, v1}, Lam2;->x(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;)V

    iput-object p1, p0, Lta7;->g:Ljava/lang/Object;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lta7;->a:Z

    return-void
.end method

.method public final B(Ljava/lang/String;Ldka;)V
    .registers 4

    :try_start_0
    iget-object p0, p0, Lta7;->g:Ljava/lang/Object;

    check-cast p0, Lvx;

    invoke-virtual {p0}, Lvx;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsqc;

    iget-object p0, p0, Lsqc;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const/4 v0, 0x0

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_1e

    new-instance v0, Lska;

    invoke-direct {v0, p0}, Lska;-><init>(Ljava/lang/String;)V

    :cond_1e
    new-instance p0, Lsw7;

    invoke-direct {p0, v0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p2, p0}, Ldka;->n(Ltw7;)V
    :try_end_26
    .catchall {:try_start_0 .. :try_end_26} :catchall_27

    return-void

    :catchall_27
    move-exception p0

    new-instance p1, Ldqb;

    invoke-direct {p1, p0}, Ldqb;-><init>(Ljava/lang/Throwable;)V

    new-instance p0, Lrw7;

    invoke-direct {p0, p1}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p2, p0}, Ldka;->n(Ltw7;)V

    return-void
.end method

.method public final C(Ljava/lang/String;Ldka;)V
    .registers 3

    :try_start_0
    iget-object p0, p0, Lta7;->g:Ljava/lang/Object;

    check-cast p0, Lvx;

    invoke-virtual {p0}, Lvx;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsqc;

    iget-object p0, p0, Lsqc;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance p1, Lsw7;

    invoke-direct {p1, p0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p2, p1}, Ldka;->n(Ltw7;)V
    :try_end_26
    .catchall {:try_start_0 .. :try_end_26} :catchall_27

    return-void

    :catchall_27
    move-exception p0

    new-instance p1, Ldqb;

    invoke-direct {p1, p0}, Ldqb;-><init>(Ljava/lang/Throwable;)V

    new-instance p0, Lrw7;

    invoke-direct {p0, p1}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p2, p0}, Ldka;->n(Ltw7;)V

    return-void
.end method

.method public final D(Ljava/lang/String;Ljava/lang/String;Ldka;)V
    .registers 4

    :try_start_0
    iget-object p0, p0, Lta7;->g:Ljava/lang/Object;

    check-cast p0, Lvx;

    invoke-virtual {p0}, Lvx;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsqc;

    iget-object p0, p0, Lsqc;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance p1, Lsw7;

    invoke-direct {p1, p0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p3, p1}, Ldka;->n(Ltw7;)V
    :try_end_26
    .catchall {:try_start_0 .. :try_end_26} :catchall_27

    return-void

    :catchall_27
    move-exception p0

    new-instance p1, Ldqb;

    invoke-direct {p1, p0}, Ldqb;-><init>(Ljava/lang/Throwable;)V

    new-instance p0, Lrw7;

    invoke-direct {p0, p1}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p3, p0}, Ldka;->n(Ltw7;)V

    return-void
.end method

.method public final F(Lcre;Z)V
    .registers 9

    iget-object v0, p0, Lta7;->d:Ljava/lang/Object;

    check-cast v0, Lyqa;

    iget-object v1, v0, Lyqa;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    iget-object v2, v0, Lyqa;->b:Ljava/lang/Object;

    check-cast v2, Li32;

    if-nez v1, :cond_11

    invoke-virtual {v2}, Lldk;->i()V

    :cond_11
    iget-object v1, v0, Lyqa;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    if-eqz v1, :cond_3c

    new-instance v3, Lf15;

    const/4 v4, 0x0

    invoke-direct {v3, p1, v4}, Lf15;-><init>(Ljava/lang/Object;B)V

    new-instance v5, Lzlb;

    invoke-direct {v5, v1, v3, v4}, Lzlb;-><init>(Ljava/lang/Iterable;Ljava/lang/Object;B)V

    invoke-static {v5}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v1

    iget-object v3, p1, Lcre;->a:Lbre;

    if-eqz v3, :cond_37

    new-instance v3, Lg15;

    if-eqz p2, :cond_30

    const/4 p2, 0x3

    goto :goto_31

    :cond_30
    const/4 p2, 0x2

    :goto_31
    invoke-direct {v3, p1, p2}, Lg15;-><init>(Lcre;I)V

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_37
    iput-object v1, v0, Lyqa;->c:Ljava/lang/Object;

    invoke-virtual {v2, v1}, Lldk;->g(Ljava/lang/Object;)V

    :cond_3c
    const/4 p1, 0x0

    iput-object p1, p0, Lta7;->k:Ljava/lang/Object;

    return-void
.end method

.method public final a(Lmka;)V
    .registers 10

    iget-object p0, p0, Lta7;->d:Ljava/lang/Object;

    check-cast p0, Lj4c;

    instance-of v0, p1, Loha;

    if-eqz v0, :cond_22

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v0, p0

    check-cast v0, Lvs6;

    check-cast p1, Loha;

    iget-object p0, p1, Loha;->a:Lpcd;

    iget-wide v1, p0, Lpcd;->a:J

    iget-object p0, p0, Lpcd;->b:Lqcd;

    invoke-static {p0}, Lta7;->E(Lqcd;)Lapc;

    move-result-object v3

    const/4 v4, 0x1

    sget-object v5, Lch9;->a:Lch9;

    invoke-virtual/range {v0 .. v5}, Lvs6;->b(JLapc;ILch9;)V

    return-void

    :cond_22
    instance-of v0, p1, Lpha;

    const/4 v1, 0x1

    if-eqz v0, :cond_50

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v2, p0

    check-cast v2, Lvs6;

    check-cast p1, Lpha;

    iget-object p0, p1, Lpha;->a:Lgdl;

    iget-wide v3, p0, Lgdl;->a:J

    iget-object p0, p0, Lgdl;->b:Lhdl;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_46

    if-ne p0, v1, :cond_42

    sget-object p0, Lapc;->d:Lapc;

    :goto_40
    move-object v5, p0

    goto :goto_49

    :cond_42
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_46
    sget-object p0, Lapc;->c:Lapc;

    goto :goto_40

    :goto_49
    const/4 v6, 0x2

    sget-object v7, Lch9;->a:Lch9;

    invoke-virtual/range {v2 .. v7}, Lvs6;->b(JLapc;ILch9;)V

    return-void

    :cond_50
    instance-of v0, p1, Lqha;

    if-eqz v0, :cond_7d

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v2, p0

    check-cast v2, Lvs6;

    check-cast p1, Lqha;

    iget-object p0, p1, Lqha;->a:Loxl;

    iget-wide v3, p0, Loxl;->a:J

    iget-object p0, p0, Loxl;->b:Lpxl;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_73

    if-ne p0, v1, :cond_6f

    sget-object p0, Lapc;->d:Lapc;

    :goto_6d
    move-object v5, p0

    goto :goto_76

    :cond_6f
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_73
    sget-object p0, Lapc;->c:Lapc;

    goto :goto_6d

    :goto_76
    const/4 v6, 0x3

    sget-object v7, Lch9;->a:Lch9;

    invoke-virtual/range {v2 .. v7}, Lvs6;->b(JLapc;ILch9;)V

    return-void

    :cond_7d
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public final b()Lrha;
    .registers 6

    iget-object p0, p0, Lta7;->k:Ljava/lang/Object;

    check-cast p0, Ldw3;

    invoke-virtual {p0}, Ldw3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf3j;

    new-instance v0, Lrha;

    iget-object v1, p0, Lf3j;->b:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "/"

    invoke-static {v1, v2}, Lkotlin/text/StringsKt;->U(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v3, p0, Lf3j;->c:Landroid/net/Uri;

    if-eqz v3, :cond_25

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Lkotlin/text/StringsKt;->U(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_26

    :cond_25
    const/4 v3, 0x0

    :goto_26
    iget-object v4, p0, Lf3j;->d:Landroid/net/Uri;

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v2}, Lkotlin/text/StringsKt;->U(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object p0, p0, Lf3j;->e:Landroid/net/Uri;

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v2}, Lkotlin/text/StringsKt;->U(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, v1, v3, v4, p0}, Lrha;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public final c(Ljava/lang/String;Ldka;)V
    .registers 5

    :try_start_0
    sget-object v0, Llqm;->A:Llqm;

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lvx3;->c(Z)V

    iput-boolean v0, p1, Lvx3;->f:Z

    iget-boolean p0, p0, Lta7;->a:Z

    if-eqz p0, :cond_13

    const/4 p0, 0x2

    goto :goto_14

    :cond_13
    const/4 p0, 0x3

    :goto_14
    iput p0, p1, Lvx3;->c:I

    new-instance p0, Lay3;

    invoke-direct {p0, p1}, Lay3;-><init>(Lvx3;)V

    invoke-static {p0}, Lac8;->a(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance p1, Lsw7;

    invoke-direct {p1, p0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p2, p1}, Ldka;->n(Ltw7;)V
    :try_end_28
    .catchall {:try_start_0 .. :try_end_28} :catchall_29

    return-void

    :catchall_29
    move-exception p0

    new-instance p1, Ldqb;

    invoke-direct {p1, p0}, Ldqb;-><init>(Ljava/lang/Throwable;)V

    new-instance p0, Lrw7;

    invoke-direct {p0, p1}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p2, p0}, Ldka;->n(Ltw7;)V

    return-void
.end method

.method public final d(Ljava/lang/String;Ldka;)V
    .registers 8

    iget-object p0, p0, Lta7;->i:Ljava/lang/Object;

    check-cast p0, Lcs6;

    iget-object v0, p0, Lcs6;->b:Lrlh;

    iget-object v1, p0, Lcs6;->b:Lrlh;

    iget-object v0, v0, Lrlh;->a:Lnak;

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lakc;

    sget-object v2, Lxjc;->a:Lxjc;

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a3

    instance-of v2, v0, Lwjc;

    if-eqz v2, :cond_3d

    check-cast v0, Lwjc;

    iget-object p0, v0, Lwjc;->a:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_a3

    new-instance p0, Lcia;

    new-instance p1, Ldia;

    const-wide/16 v1, 0x0

    iget-object v0, v0, Lwjc;->b:Ljava/lang/String;

    invoke-direct {p1, v1, v2, v0}, Ldia;-><init>(JLjava/lang/String;)V

    invoke-direct {p0, p1}, Lcia;-><init>(Ldia;)V

    new-instance p1, Lsw7;

    invoke-direct {p1, p0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p2, p1}, Ldka;->n(Ltw7;)V

    return-void

    :cond_3d
    instance-of v2, v0, Lyjc;

    if-eqz v2, :cond_55

    check-cast v0, Lyjc;

    iget-object p0, v0, Lyjc;->a:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_a3

    new-instance p0, Lsw7;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p2, p0}, Ldka;->n(Ltw7;)V

    return-void

    :cond_55
    instance-of v2, v0, Lzjc;

    if-eqz v2, :cond_9f

    check-cast v0, Lzjc;

    iget-object v0, v0, Lzjc;->a:Ljava/lang/String;

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_a3

    new-instance p1, Lq4b;

    const/16 v0, 0x14

    invoke-direct {p1, p2, v0}, Lq4b;-><init>(Ljava/lang/Object;B)V

    new-instance v0, La7b;

    const/4 v2, 0x4

    invoke-direct {v0, p2, v2}, La7b;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lrkc;

    const/4 v3, 0x6

    invoke-direct {v2, p2, v3}, Lrkc;-><init>(Ljava/lang/Object;B)V

    iget-object p2, v1, Lrlh;->a:Lnak;

    invoke-virtual {p2}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lakc;

    invoke-static {v1}, Lxf8;->u(Lf99;)Lhx5;

    move-result-object v1

    new-instance v3, Lve9;

    const/4 v4, 0x0

    invoke-direct {v3, v4, v2, p1, v0}, Lve9;-><init>(ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function2;)V

    new-instance p1, Lwqc;

    invoke-direct {p1, p2, v1, v3}, Lwqc;-><init>(Lakc;Lhx5;Lve9;)V

    new-instance p1, Landroid/content/Intent;

    iget-object p0, p0, Lcs6;->a:Landroid/content/Context;

    const-class p2, Lcom/opera/android/live_score/LiveCommentaryService;

    invoke-direct {p1, p0, p2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p2, "com.opera.android.live_score.ACTION_PAUSE"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void

    :cond_9f
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_a3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, ""

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    new-instance p1, Ldqb;

    invoke-direct {p1, p0}, Ldqb;-><init>(Ljava/lang/Throwable;)V

    new-instance p0, Lrw7;

    invoke-direct {p0, p1}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p2, p0}, Ldka;->n(Ltw7;)V

    return-void
.end method

.method public final e(Llf;Ldka;)V
    .registers 10

    iget-object p0, p0, Lta7;->i:Ljava/lang/Object;

    check-cast p0, Lcs6;

    instance-of v0, p1, Lmf;

    const-class v1, Lcom/opera/android/live_score/LiveCommentaryService;

    const/4 v2, 0x1

    if-eqz v0, :cond_c5

    iget-object v0, p0, Lcs6;->b:Lrlh;

    iget-object v3, p0, Lcs6;->b:Lrlh;

    iget-object v0, v0, Lrlh;->a:Lnak;

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lakc;

    sget-object v4, Lxjc;->a:Lxjc;

    invoke-static {v0, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_b0

    instance-of v4, v0, Lwjc;

    if-eqz v4, :cond_48

    check-cast v0, Lwjc;

    iget-object p0, v0, Lwjc;->a:Ljava/lang/String;

    check-cast p1, Lmf;

    iget-object p1, p1, Lmf;->a:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b0

    new-instance p0, Leia;

    new-instance p1, Lfia;

    const-wide/16 v1, 0x0

    iget-object v0, v0, Lwjc;->b:Ljava/lang/String;

    invoke-direct {p1, v1, v2, v0}, Lfia;-><init>(JLjava/lang/String;)V

    invoke-direct {p0, p1}, Leia;-><init>(Lfia;)V

    new-instance p1, Lsw7;

    invoke-direct {p1, p0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p2, p1}, Ldka;->n(Ltw7;)V

    return-void

    :cond_48
    instance-of v4, v0, Lyjc;

    if-eqz v4, :cond_90

    check-cast v0, Lyjc;

    iget-object v0, v0, Lyjc;->a:Ljava/lang/String;

    check-cast p1, Lmf;

    iget-object p1, p1, Lmf;->a:Ljava/lang/String;

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b0

    new-instance p1, Ltqc;

    const/4 v0, 0x0

    invoke-direct {p1, p2, v0}, Ltqc;-><init>(Ldka;B)V

    new-instance v4, Luqc;

    invoke-direct {v4, p2, v0}, Luqc;-><init>(Ldka;B)V

    new-instance v5, Lvqc;

    invoke-direct {v5, p2, v0}, Lvqc;-><init>(Ldka;B)V

    iget-object p2, v3, Lrlh;->a:Lnak;

    invoke-virtual {p2}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lakc;

    invoke-static {v3}, Lxf8;->u(Lf99;)Lhx5;

    move-result-object v0

    new-instance v3, Lve9;

    invoke-direct {v3, v2, v5, p1, v4}, Lve9;-><init>(ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function2;)V

    new-instance p1, Lwqc;

    invoke-direct {p1, p2, v0, v3}, Lwqc;-><init>(Lakc;Lhx5;Lve9;)V

    new-instance p1, Landroid/content/Intent;

    iget-object p0, p0, Lcs6;->a:Landroid/content/Context;

    invoke-direct {p1, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p2, "com.opera.android.live_score.ACTION_RESUME"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void

    :cond_90
    instance-of p0, v0, Lzjc;

    if-eqz p0, :cond_ac

    check-cast v0, Lzjc;

    iget-object p0, v0, Lzjc;->a:Ljava/lang/String;

    check-cast p1, Lmf;

    iget-object p1, p1, Lmf;->a:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b0

    new-instance p0, Lsw7;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p2, p0}, Ldka;->n(Ltw7;)V

    return-void

    :cond_ac
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_b0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, ""

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    new-instance p1, Ldqb;

    invoke-direct {p1, p0}, Ldqb;-><init>(Ljava/lang/Throwable;)V

    new-instance p0, Lrw7;

    invoke-direct {p0, p1}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p2, p0}, Ldka;->n(Ltw7;)V

    return-void

    :cond_c5
    instance-of v0, p1, Lj7b;

    if-eqz v0, :cond_129

    new-instance v0, Ltqc;

    invoke-direct {v0, p2, v2}, Ltqc;-><init>(Ldka;B)V

    new-instance v3, Luqc;

    invoke-direct {v3, p2, v2}, Luqc;-><init>(Ldka;B)V

    new-instance v4, Lvqc;

    invoke-direct {v4, p2, v2}, Lvqc;-><init>(Ldka;B)V

    iget-object p2, p0, Lcs6;->b:Lrlh;

    iget-object p2, p2, Lrlh;->a:Lnak;

    invoke-virtual {p2}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lakc;

    iget-object v5, p0, Lcs6;->b:Lrlh;

    invoke-static {v5}, Lxf8;->u(Lf99;)Lhx5;

    move-result-object v5

    new-instance v6, Lve9;

    invoke-direct {v6, v2, v4, v0, v3}, Lve9;-><init>(ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function2;)V

    new-instance v0, Lwqc;

    invoke-direct {v0, p2, v5, v6}, Lwqc;-><init>(Lakc;Lhx5;Lve9;)V

    check-cast p1, Lj7b;

    iget-object p2, p1, Lj7b;->a:Ljava/lang/String;

    iget-object v0, p1, Lj7b;->b:Ljava/lang/String;

    iget-object v2, p1, Lj7b;->d:Ljava/lang/String;

    iget-object v3, p1, Lj7b;->e:Ljava/lang/String;

    iget-object p1, p1, Lj7b;->c:Ljava/lang/String;

    new-instance v4, Landroid/content/Intent;

    iget-object p0, p0, Lcs6;->a:Landroid/content/Context;

    invoke-direct {v4, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "com.opera.android.live_score.ACTION_PLAY"

    invoke-virtual {v4, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "extra_id"

    invoke-virtual {v4, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "extra_url"

    invoke-virtual {v4, p2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "extra_title"

    invoke-virtual {v4, p2, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "extra_description"

    invoke-virtual {v4, p2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    if-eqz p1, :cond_125

    const-string p2, "extra_image_url"

    invoke-virtual {v4, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_125
    invoke-virtual {p0, v4}, Landroid/content/Context;->startForegroundService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void

    :cond_129
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public final f(Ljava/lang/String;Ldka;)V
    .registers 5

    :try_start_0
    iget-object p0, p0, Lta7;->m:Ljava/lang/Object;

    check-cast p0, Leq6;

    if-eqz p0, :cond_23

    new-instance v0, Lqxh;

    invoke-direct {v0, p1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Leq6;->a:Ljava/lang/Object;

    check-cast p0, Lew3;

    invoke-virtual {p0}, Lew3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lysj;

    new-instance p1, Lqt;

    const/4 v1, 0x2

    invoke-direct {p1, v0, v1}, Lqt;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    :cond_23
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance p1, Lsw7;

    invoke-direct {p1, p0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p2, p1}, Ldka;->n(Ltw7;)V
    :try_end_2d
    .catchall {:try_start_0 .. :try_end_2d} :catchall_2e

    return-void

    :catchall_2e
    move-exception p0

    new-instance p1, Ldqb;

    invoke-direct {p1, p0}, Ldqb;-><init>(Ljava/lang/Throwable;)V

    new-instance p0, Lrw7;

    invoke-direct {p0, p1}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p2, p0}, Ldka;->n(Ltw7;)V

    return-void
.end method

.method public final g(Ljava/lang/String;Ldka;)V
    .registers 8

    iget-object p0, p0, Lta7;->i:Ljava/lang/Object;

    check-cast p0, Lcs6;

    iget-object v0, p0, Lcs6;->b:Lrlh;

    iget-object v1, p0, Lcs6;->b:Lrlh;

    iget-object v0, v0, Lrlh;->a:Lnak;

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lakc;

    sget-object v2, Lxjc;->a:Lxjc;

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_22

    new-instance p0, Lsw7;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p2, p0}, Ldka;->n(Ltw7;)V

    return-void

    :cond_22
    instance-of v2, v0, Lwjc;

    if-eqz v2, :cond_2f

    check-cast v0, Lwjc;

    iget-object v0, v0, Lwjc;->a:Ljava/lang/String;

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    goto :goto_48

    :cond_2f
    instance-of v2, v0, Lyjc;

    if-eqz v2, :cond_3c

    check-cast v0, Lyjc;

    iget-object v0, v0, Lyjc;->a:Ljava/lang/String;

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    goto :goto_48

    :cond_3c
    instance-of v2, v0, Lzjc;

    if-eqz v2, :cond_9b

    check-cast v0, Lzjc;

    iget-object v0, v0, Lzjc;->a:Ljava/lang/String;

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    :goto_48
    if-eqz p1, :cond_86

    new-instance p1, Lq4b;

    const/16 v0, 0x15

    invoke-direct {p1, p2, v0}, Lq4b;-><init>(Ljava/lang/Object;B)V

    new-instance v0, La7b;

    const/4 v2, 0x5

    invoke-direct {v0, p2, v2}, La7b;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lrkc;

    const/4 v3, 0x7

    invoke-direct {v2, p2, v3}, Lrkc;-><init>(Ljava/lang/Object;B)V

    iget-object p2, v1, Lrlh;->a:Lnak;

    invoke-virtual {p2}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lakc;

    invoke-static {v1}, Lxf8;->u(Lf99;)Lhx5;

    move-result-object v1

    new-instance v3, Lve9;

    const/4 v4, 0x0

    invoke-direct {v3, v4, v2, p1, v0}, Lve9;-><init>(ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function2;)V

    new-instance p1, Lwqc;

    invoke-direct {p1, p2, v1, v3}, Lwqc;-><init>(Lakc;Lhx5;Lve9;)V

    new-instance p1, Landroid/content/Intent;

    iget-object p0, p0, Lcs6;->a:Landroid/content/Context;

    const-class p2, Lcom/opera/android/live_score/LiveCommentaryService;

    invoke-direct {p1, p0, p2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p2, "com.opera.android.live_score.ACTION_STOP"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void

    :cond_86
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, ""

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    new-instance p1, Ldqb;

    invoke-direct {p1, p0}, Ldqb;-><init>(Ljava/lang/Throwable;)V

    new-instance p0, Lrw7;

    invoke-direct {p0, p1}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p2, p0}, Ldka;->n(Ltw7;)V

    return-void

    :cond_9b
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public final h(Lmka;)V
    .registers 6

    iget-object p0, p0, Lta7;->d:Ljava/lang/Object;

    check-cast p0, Lj4c;

    instance-of v0, p1, Loha;

    const/4 v1, 0x1

    if-eqz v0, :cond_21

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvs6;

    check-cast p1, Loha;

    iget-object p1, p1, Loha;->a:Lpcd;

    iget-wide v2, p1, Lpcd;->a:J

    iget-object p1, p1, Lpcd;->b:Lqcd;

    invoke-static {p1}, Lta7;->E(Lqcd;)Lapc;

    move-result-object p1

    sget-object v0, Lch9;->a:Lch9;

    invoke-virtual {p0, v2, v3, p1, v1}, Lvs6;->d(JLapc;I)V

    return-void

    :cond_21
    instance-of v0, p1, Lpha;

    if-eqz v0, :cond_4b

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvs6;

    check-cast p1, Lpha;

    iget-object p1, p1, Lpha;->a:Lgdl;

    iget-wide v2, p1, Lgdl;->a:J

    iget-object p1, p1, Lgdl;->b:Lhdl;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_42

    if-ne p1, v1, :cond_3e

    sget-object p1, Lapc;->d:Lapc;

    goto :goto_44

    :cond_3e
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_42
    sget-object p1, Lapc;->c:Lapc;

    :goto_44
    sget-object v0, Lch9;->a:Lch9;

    const/4 v0, 0x2

    invoke-virtual {p0, v2, v3, p1, v0}, Lvs6;->d(JLapc;I)V

    return-void

    :cond_4b
    instance-of v0, p1, Lqha;

    if-eqz v0, :cond_75

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvs6;

    check-cast p1, Lqha;

    iget-object p1, p1, Lqha;->a:Loxl;

    iget-wide v2, p1, Loxl;->a:J

    iget-object p1, p1, Loxl;->b:Lpxl;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_6c

    if-ne p1, v1, :cond_68

    sget-object p1, Lapc;->d:Lapc;

    goto :goto_6e

    :cond_68
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_6c
    sget-object p1, Lapc;->c:Lapc;

    :goto_6e
    sget-object v0, Lch9;->a:Lch9;

    const/4 v0, 0x3

    invoke-virtual {p0, v2, v3, p1, v0}, Lvs6;->d(JLapc;I)V

    return-void

    :cond_75
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public final i(Lwuh;Ljava/lang/String;)V
    .registers 12

    iget-object v0, p0, Lta7;->j:Ljava/lang/Object;

    check-cast v0, Lxoc;

    iget-object p0, p0, Lta7;->e:Ljava/lang/Object;

    check-cast p0, Lorm;

    instance-of v1, p1, Lp7f;

    const/4 v2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v1, :cond_a5

    check-cast p1, Lp7f;

    iget-object v0, p1, Lp7f;->c:Ljava/lang/String;

    iget-object v1, p1, Lp7f;->b:Ljava/lang/String;

    iget-object p1, p1, Lp7f;->a:Lq7f;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    const-string v6, "bottom_sheet_"

    if-eqz p1, :cond_7c

    if-eq p1, v5, :cond_53

    if-eq p1, v3, :cond_29f

    if-ne p1, v2, :cond_4f

    invoke-virtual {v6, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    check-cast p0, Lx5f;

    iget-boolean p2, p0, Lx5f;->h:Z

    if-eqz p2, :cond_29f

    iget-object p2, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    new-instance v4, Lck0;

    invoke-direct {v4, p2, v2}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v4}, Lck0;->e()Lhi0;

    move-result-object p2

    invoke-virtual {p2}, Lhi0;->a()Lvg0;

    move-result-object p2

    new-instance v4, Le5f;

    invoke-direct {v4, v1, v0, v3}, Le5f;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    invoke-virtual {p2, p1, v4}, Lvg0;->b(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, v2}, Lx5f;->U0(Lx56;)V

    return-void

    :cond_4f
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_53
    invoke-virtual {v6, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    check-cast p0, Lx5f;

    iget-boolean p2, p0, Lx5f;->h:Z

    if-eqz p2, :cond_29f

    iget-object p2, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    new-instance v3, Lck0;

    invoke-direct {v3, p2, v2}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v3}, Lck0;->e()Lhi0;

    move-result-object p2

    invoke-virtual {p2}, Lhi0;->a()Lvg0;

    move-result-object p2

    new-instance v3, Le5f;

    invoke-direct {v3, v1, v0, v4}, Le5f;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    invoke-virtual {p2, p1, v3}, Lvg0;->b(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, v2}, Lx5f;->U0(Lx56;)V

    return-void

    :cond_7c
    invoke-virtual {v6, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    check-cast p0, Lx5f;

    iget-boolean p2, p0, Lx5f;->h:Z

    if-eqz p2, :cond_29f

    iget-object p2, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    new-instance v3, Lck0;

    invoke-direct {v3, p2, v2}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v3}, Lck0;->e()Lhi0;

    move-result-object p2

    invoke-virtual {p2}, Lhi0;->a()Lvg0;

    move-result-object p2

    new-instance v3, Le5f;

    invoke-direct {v3, v1, v0, v5}, Le5f;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    invoke-virtual {p2, p1, v3}, Lvg0;->b(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, v2}, Lx5f;->U0(Lx56;)V

    return-void

    :cond_a5
    instance-of v1, p1, Lelj;

    const/16 v6, 0x9

    const/16 v7, 0x8

    if-eqz v1, :cond_121

    check-cast p1, Lelj;

    iget-object p1, p1, Lelj;->a:Lflj;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    sget-object v0, Lop0;->d:Lop0;

    packed-switch p1, :pswitch_data_2be

    invoke-static {}, Lh9o;->p()V

    return-void

    :pswitch_be
    check-cast p0, Lx5f;

    iget-boolean p1, p0, Lx5f;->h:Z

    if-eqz p1, :cond_29f

    invoke-virtual {p0, v6, p2}, Lx5f;->a0(ILjava/lang/String;)V

    return-void

    :pswitch_c8
    check-cast p0, Lx5f;

    invoke-virtual {p0, v6, v0, v4}, Lx5f;->M0(ILop0;Z)V

    return-void

    :pswitch_ce
    check-cast p0, Lx5f;

    invoke-virtual {p0, v6, v0, v5}, Lx5f;->M0(ILop0;Z)V

    return-void

    :pswitch_d4
    check-cast p0, Lx5f;

    invoke-virtual {p0, v7, v0, v4}, Lx5f;->M0(ILop0;Z)V

    return-void

    :pswitch_da
    check-cast p0, Lx5f;

    invoke-virtual {p0, v7, v0, v5}, Lx5f;->M0(ILop0;Z)V

    return-void

    :pswitch_e0
    check-cast p0, Lx5f;

    iget-boolean p1, p0, Lx5f;->h:Z

    if-eqz p1, :cond_29f

    const/4 p1, 0x4

    invoke-virtual {p0, p1, p2}, Lx5f;->a0(ILjava/lang/String;)V

    return-void

    :pswitch_eb
    check-cast p0, Lx5f;

    iget-boolean p1, p0, Lx5f;->h:Z

    if-eqz p1, :cond_29f

    invoke-virtual {p0, v5, p2}, Lx5f;->a0(ILjava/lang/String;)V

    return-void

    :pswitch_f5
    check-cast p0, Lx5f;

    iget-boolean p1, p0, Lx5f;->h:Z

    if-eqz p1, :cond_29f

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lqg0;

    const/4 v2, -0x1

    const/16 v3, 0xd

    const/16 v5, 0x98b

    invoke-direct {v1, v5, v2, v3}, Ljf0;-><init>(III)V

    invoke-virtual {v1, v4}, Ljf0;->e(I)V

    invoke-virtual {v0, p1}, Lx56;->E(Lzpa;)Lfi0;

    move-result-object v2

    invoke-virtual {v2, p1}, Lfi0;->y(Lzpa;)Lug0;

    move-result-object p1

    invoke-virtual {p1}, Lug0;->x()Lif0;

    move-result-object p1

    invoke-virtual {p1, p2, v1}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void

    :cond_121
    instance-of v1, p1, Lr7f;

    sget-object v8, Lop0;->b:Lop0;

    if-eqz v1, :cond_135

    check-cast p1, Lr7f;

    iget-boolean p2, p1, Lr7f;->a:Z

    iget-boolean p1, p1, Lr7f;->b:Z

    if-eq p2, p1, :cond_29f

    check-cast p0, Lx5f;

    invoke-virtual {p0, v7, v8, p1}, Lx5f;->M0(ILop0;Z)V

    return-void

    :cond_135
    instance-of v1, p1, Le1h;

    if-eqz v1, :cond_147

    check-cast p1, Le1h;

    iget-boolean p2, p1, Le1h;->a:Z

    iget-boolean p1, p1, Le1h;->b:Z

    if-eq p2, p1, :cond_29f

    check-cast p0, Lx5f;

    invoke-virtual {p0, v6, v8, p1}, Lx5f;->M0(ILop0;Z)V

    return-void

    :cond_147
    instance-of p0, p1, Ldh9;

    if-eqz p0, :cond_26a

    check-cast p1, Ldh9;

    iget-object p0, p1, Ldh9;->b:Lvua;

    iget-object p1, p1, Ldh9;->a:Leh9;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_1e3

    if-ne p1, v5, :cond_1df

    instance-of p1, p0, Lsua;

    if-eqz p1, :cond_184

    check-cast p0, Lsua;

    iget-object p0, p0, Lsua;->a:Lpcd;

    invoke-virtual {p0}, Lpcd;->toString()Ljava/lang/String;

    move-result-object p0

    iget-object p1, v0, Lxoc;->a:Lx5f;

    iget-boolean v1, p1, Lx5f;->h:Z

    if-eqz v1, :cond_16e

    invoke-virtual {p1, v2, p2}, Lx5f;->a0(ILjava/lang/String;)V

    :cond_16e
    iget-object p1, v0, Lxoc;->b:Ljava/util/HashMap;

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_17e

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_17e
    check-cast v0, Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void

    :cond_184
    instance-of p1, p0, Ltua;

    if-eqz p1, :cond_1af

    check-cast p0, Ltua;

    iget-object p0, p0, Ltua;->a:Lgdl;

    invoke-virtual {p0}, Lgdl;->toString()Ljava/lang/String;

    move-result-object p0

    iget-object p1, v0, Lxoc;->a:Lx5f;

    iget-boolean v1, p1, Lx5f;->h:Z

    if-eqz v1, :cond_199

    invoke-virtual {p1, v7, p2}, Lx5f;->a0(ILjava/lang/String;)V

    :cond_199
    iget-object p1, v0, Lxoc;->c:Ljava/util/HashMap;

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1a9

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1a9
    check-cast v0, Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void

    :cond_1af
    instance-of p1, p0, Luua;

    if-eqz p1, :cond_1db

    check-cast p0, Luua;

    iget-object p0, p0, Luua;->a:Loxl;

    invoke-virtual {p0}, Loxl;->toString()Ljava/lang/String;

    move-result-object p0

    iget-object p1, v0, Lxoc;->a:Lx5f;

    iget-boolean v1, p1, Lx5f;->h:Z

    if-eqz v1, :cond_1c5

    const/4 v1, 0x6

    invoke-virtual {p1, v1, p2}, Lx5f;->a0(ILjava/lang/String;)V

    :cond_1c5
    iget-object p1, v0, Lxoc;->d:Ljava/util/HashMap;

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1d5

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1d5
    check-cast v0, Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void

    :cond_1db
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_1df
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_1e3
    instance-of p1, p0, Lsua;

    if-eqz p1, :cond_20e

    check-cast p0, Lsua;

    iget-object p0, p0, Lsua;->a:Lpcd;

    invoke-virtual {p0}, Lpcd;->toString()Ljava/lang/String;

    move-result-object p0

    iget-object p1, v0, Lxoc;->a:Lx5f;

    iget-boolean v1, p1, Lx5f;->h:Z

    if-eqz v1, :cond_1f8

    invoke-virtual {p1, v3, p2}, Lx5f;->a0(ILjava/lang/String;)V

    :cond_1f8
    iget-object p1, v0, Lxoc;->b:Ljava/util/HashMap;

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_208

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_208
    check-cast v0, Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void

    :cond_20e
    instance-of p1, p0, Ltua;

    if-eqz p1, :cond_23a

    check-cast p0, Ltua;

    iget-object p0, p0, Ltua;->a:Lgdl;

    invoke-virtual {p0}, Lgdl;->toString()Ljava/lang/String;

    move-result-object p0

    iget-object p1, v0, Lxoc;->a:Lx5f;

    iget-boolean v1, p1, Lx5f;->h:Z

    if-eqz v1, :cond_224

    const/4 v1, 0x7

    invoke-virtual {p1, v1, p2}, Lx5f;->a0(ILjava/lang/String;)V

    :cond_224
    iget-object p1, v0, Lxoc;->c:Ljava/util/HashMap;

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_234

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_234
    check-cast v0, Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void

    :cond_23a
    instance-of p1, p0, Luua;

    if-eqz p1, :cond_266

    check-cast p0, Luua;

    iget-object p0, p0, Luua;->a:Loxl;

    invoke-virtual {p0}, Loxl;->toString()Ljava/lang/String;

    move-result-object p0

    iget-object p1, v0, Lxoc;->a:Lx5f;

    iget-boolean v1, p1, Lx5f;->h:Z

    if-eqz v1, :cond_250

    const/4 v1, 0x5

    invoke-virtual {p1, v1, p2}, Lx5f;->a0(ILjava/lang/String;)V

    :cond_250
    iget-object p1, v0, Lxoc;->d:Ljava/util/HashMap;

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_260

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_260
    check-cast v0, Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void

    :cond_266
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_26a
    instance-of p0, p1, Lwdf;

    if-eqz p0, :cond_2b9

    check-cast p1, Lwdf;

    iget-object p0, p1, Lwdf;->a:Lxdf;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    sget-object p1, Lxg0;->c:Lxg0;

    sget-object p2, Lxg0;->e:Lxg0;

    if-eqz p0, :cond_28e

    if-eq p0, v5, :cond_28b

    if-eq p0, v3, :cond_288

    if-ne p0, v2, :cond_284

    move-object p0, p2

    goto :goto_28f

    :cond_284
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_288
    sget-object p0, Lxg0;->d:Lxg0;

    goto :goto_28f

    :cond_28b
    sget-object p0, Lxg0;->b:Lxg0;

    goto :goto_28f

    :cond_28e
    move-object p0, p1

    :goto_28f
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eq p0, p1, :cond_297

    if-eq p0, p2, :cond_297

    move v4, v5

    :cond_297
    iput-boolean v4, v0, Lxoc;->e:Z

    iget-object p1, v0, Lxoc;->a:Lx5f;

    iget-boolean p2, p1, Lx5f;->h:Z

    if-nez p2, :cond_2a0

    :cond_29f
    return-void

    :cond_2a0
    iget-object p2, p1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lck0;

    invoke-direct {v1, p2, v0}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance p2, Lrkc;

    const/16 v2, 0x19

    invoke-direct {p2, p0, v2}, Lrkc;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, p2}, Lck0;->b(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p1, v0}, Lx5f;->U0(Lx56;)V

    return-void

    :cond_2b9
    invoke-static {}, Lh9o;->p()V

    return-void

    nop

    :pswitch_data_2be
    .packed-switch 0x0
        :pswitch_f5
        :pswitch_eb
        :pswitch_e0
        :pswitch_da
        :pswitch_d4
        :pswitch_ce
        :pswitch_c8
        :pswitch_be
    .end packed-switch
.end method

.method public final j(Ljava/lang/String;)V
    .registers 7

    iget-object p0, p0, Lta7;->e:Ljava/lang/Object;

    check-cast p0, Lorm;

    check-cast p0, Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_b

    return-void

    :cond_b
    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-virtual {v1, v0}, Lx56;->E(Lzpa;)Lfi0;

    move-result-object v2

    invoke-virtual {v2, v0}, Lfi0;->y(Lzpa;)Lug0;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    if-eqz v3, :cond_2e

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2e

    new-instance v4, Lif0;

    invoke-direct {v4, v0, v2, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_3b

    :cond_2e
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v0, v2, v2, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v4, Lif0;

    invoke-direct {v4, v0, v2, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_3b
    const-wide/16 v2, 0x1

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v4, p1, v0}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final k(Lsg3;)V
    .registers 5

    iget-object v0, p0, Lta7;->i:Ljava/lang/Object;

    check-cast v0, Lue2;

    iget-object v1, p1, Lsg3;->m:Ljava/util/concurrent/Future;

    if-eqz v1, :cond_f

    invoke-interface {v1}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_f

    return-void

    :cond_f
    iget-object v1, p1, Lsg3;->l:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_16

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->prepareToDraw()V

    :cond_16
    iget-object p0, p0, Lta7;->m:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 p0, 0x7

    invoke-virtual {v0, p0}, Landroid/os/Handler;->hasMessages(I)Z

    move-result p1

    if-nez p1, :cond_29

    const-wide/16 v1, 0x0

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :cond_29
    return-void
.end method

.method public final l(Lsg3;)V
    .registers 3

    iget-object p0, p0, Lta7;->i:Ljava/lang/Object;

    check-cast p0, Lue2;

    const/4 v0, 0x4

    invoke-virtual {p0, v0, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public final m(Lsg3;)V
    .registers 3

    iget-object p0, p0, Lta7;->i:Ljava/lang/Object;

    check-cast p0, Lue2;

    const/4 v0, 0x6

    invoke-virtual {p0, v0, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public final n()Ljava/util/List;
    .registers 5

    iget-object v0, p0, Lta7;->i:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_32

    iget-object v0, p0, Lta7;->c:Ljava/lang/Object;

    check-cast v0, Lqb7;

    iget-object v1, v0, Lqb7;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    if-nez v1, :cond_17

    iget-object v1, v0, Lqb7;->a:Ljava/lang/Object;

    check-cast v1, Li32;

    invoke-virtual {v1}, Lldk;->i()V

    :cond_17
    iget-object v0, v0, Lqb7;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_20

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto :goto_30

    :cond_20
    new-instance v1, Lb10;

    const/4 v2, 0x5

    invoke-direct {v1, v2}, Lb10;-><init>(B)V

    new-instance v2, Lzlb;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v1, v3}, Lzlb;-><init>(Ljava/lang/Iterable;Ljava/lang/Object;B)V

    invoke-static {v2}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v0

    :goto_30
    iput-object v0, p0, Lta7;->i:Ljava/lang/Object;

    :cond_32
    return-object v0
.end method

.method public final o(Ljava/lang/String;Ljava/lang/String;)Lcre;
    .registers 7

    iget-object v0, p0, Lta7;->k:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_32

    iget-object v0, p0, Lta7;->d:Ljava/lang/Object;

    check-cast v0, Lyqa;

    iget-object v1, v0, Lyqa;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    if-nez v1, :cond_17

    iget-object v1, v0, Lyqa;->b:Ljava/lang/Object;

    check-cast v1, Li32;

    invoke-virtual {v1}, Lldk;->i()V

    :cond_17
    iget-object v0, v0, Lyqa;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_20

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto :goto_30

    :cond_20
    new-instance v1, Lb10;

    const/4 v2, 0x6

    invoke-direct {v1, v2}, Lb10;-><init>(B)V

    new-instance v2, Lzlb;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v1, v3}, Lzlb;-><init>(Ljava/lang/Iterable;Ljava/lang/Object;B)V

    invoke-static {v2}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v0

    :goto_30
    iput-object v0, p0, Lta7;->k:Ljava/lang/Object;

    :cond_32
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_36
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_53

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcre;

    iget-object v1, v0, Lcre;->c:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_36

    iget-object v1, v0, Lcre;->d:Ljava/lang/String;

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_36

    return-object v0

    :cond_53
    const/4 p0, 0x0

    return-object p0
.end method

.method public final p()Lpu8;
    .registers 15

    invoke-virtual {p0}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "duration_threshold"

    const/4 v2, -0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    const-string v3, "percent_threshold"

    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    iget-object p0, p0, Lta7;->e:Ljava/lang/Object;

    check-cast p0, Ls6h;

    iget-object v4, p0, Ls6h;->b:Ljava/lang/Object;

    check-cast v4, Lux8;

    iget-object v5, p0, Ls6h;->a:Ljava/lang/Object;

    check-cast v5, Li32;

    if-nez v4, :cond_22

    invoke-virtual {v5}, Lldk;->i()V

    :cond_22
    iget-object v4, p0, Ls6h;->b:Ljava/lang/Object;

    check-cast v4, Lux8;

    iget-object v9, v4, Lux8;->a:Ljava/util/Map;

    if-nez v4, :cond_2d

    invoke-virtual {v5}, Lldk;->i()V

    :cond_2d
    iget-object p0, p0, Ls6h;->b:Ljava/lang/Object;

    check-cast p0, Lux8;

    iget-object v10, p0, Lux8;->b:Ljava/util/Map;

    const-string p0, "enable_video_theater"

    const-string v4, "enable_native_push"

    const-string v5, "enable_local_push"

    const/4 v6, 0x0

    if-ne v1, v2, :cond_55

    if-ne v3, v2, :cond_55

    if-nez v9, :cond_55

    if-nez v10, :cond_55

    invoke-interface {v0, v5}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_55

    invoke-interface {v0, v4}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_55

    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_55

    return-object v6

    :cond_55
    const/4 v7, 0x0

    invoke-interface {v0, v5, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v11

    invoke-interface {v0, v4, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    invoke-interface {v0, p0, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v13

    const-string p0, "enable_insta_clips"

    invoke-interface {v0, p0, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-object p0, v6

    new-instance v6, Lpu8;

    if-ne v1, v2, :cond_6e

    move-object v7, p0

    goto :goto_73

    :cond_6e
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    move-object v7, v0

    :goto_73
    if-ne v3, v2, :cond_77

    :goto_75
    move-object v8, p0

    goto :goto_7c

    :cond_77
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    goto :goto_75

    :goto_7c
    invoke-direct/range {v6 .. v13}, Lpu8;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/util/Map;Ljava/util/Map;ZZZ)V

    return-object v6
.end method

.method public final r()Lyla;
    .registers 21

    move-object/from16 v0, p0

    iget-boolean v1, v0, Lta7;->a:Z

    if-eqz v1, :cond_b

    iget-object v0, v0, Lta7;->g:Ljava/lang/Object;

    check-cast v0, Lyla;

    return-object v0

    :cond_b
    invoke-virtual {v0}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "hosts_origin"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-nez v2, :cond_1f

    iput-object v5, v0, Lta7;->g:Ljava/lang/Object;

    iput-boolean v4, v0, Lta7;->a:Z

    return-object v5

    :cond_1f
    const-string v6, "hosts_news_feed"

    const-string v7, ""

    invoke-interface {v1, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v8, "hosts_article_detail"

    invoke-interface {v1, v8, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    const-string v11, "hosts_timestamp"

    const-wide/16 v12, 0x0

    invoke-interface {v1, v11, v12, v13}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v11

    sub-long/2addr v9, v11

    invoke-static {v9, v10}, Ljava/lang/Math;->abs(J)J

    move-result-wide v9

    const/4 v11, 0x3

    :try_start_3f
    invoke-static {v11}, Lvep;->B(I)[I

    move-result-object v11

    array-length v12, v11

    move v13, v3

    :goto_45
    if-ge v13, v12, :cond_9b

    aget v17, v11, v13

    invoke-static/range {v17 .. v17}, Lo18;->e(I)B

    move-result v14

    if-ne v14, v2, :cond_98

    new-instance v15, Ljava/net/URL;

    invoke-direct {v15, v6}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v8}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    const-string v6, "hosts_language_region"

    invoke-interface {v1, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v6, -0x1

    if-eqz v1, :cond_69

    const/16 v7, 0x3a

    invoke-virtual {v1, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    goto :goto_6a

    :cond_69
    move v7, v6

    :goto_6a
    if-eq v7, v6, :cond_7d

    new-instance v6, Ll0c;

    invoke-virtual {v1, v3, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    add-int/2addr v7, v4

    invoke-virtual {v1, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v6, v8, v1}, Ll0c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v18, v6

    goto :goto_7f

    :cond_7d
    move-object/from16 v18, v5

    :goto_7f
    new-instance v14, Lyla;

    const-wide/32 v6, 0x5265c00

    cmp-long v1, v9, v6

    if-ltz v1, :cond_8d

    move/from16 v19, v4

    :goto_8a
    move-object/from16 v16, v2

    goto :goto_90

    :cond_8d
    move/from16 v19, v3

    goto :goto_8a

    :goto_90
    invoke-direct/range {v14 .. v19}, Lyla;-><init>(Ljava/net/URL;Ljava/net/URL;ILl0c;Z)V

    iput-object v14, v0, Lta7;->g:Ljava/lang/Object;

    iput-boolean v4, v0, Lta7;->a:Z

    goto :goto_a6

    :cond_98
    add-int/lit8 v13, v13, 0x1

    goto :goto_45

    :cond_9b
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Unknown value"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_a3
    .catch Ljava/net/MalformedURLException; {:try_start_3f .. :try_end_a3} :catch_a3

    :catch_a3
    invoke-virtual {v0, v5}, Lta7;->A(Lyla;)V

    :goto_a6
    iget-object v0, v0, Lta7;->g:Ljava/lang/Object;

    check-cast v0, Lyla;

    return-object v0
.end method

.method public final s()Landroid/content/SharedPreferences;
    .registers 1

    iget-object p0, p0, Lta7;->f:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    return-object p0
.end method

.method public final t()Lbre;
    .registers 3

    iget-object v0, p0, Lta7;->j:Ljava/lang/Object;

    check-cast v0, Lbre;

    if-nez v0, :cond_26

    iget-object v0, p0, Lta7;->c:Ljava/lang/Object;

    check-cast v0, Lqb7;

    iget-object v1, v0, Lqb7;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    if-nez v1, :cond_17

    iget-object v1, v0, Lqb7;->a:Ljava/lang/Object;

    check-cast v1, Li32;

    invoke-virtual {v1}, Lldk;->i()V

    :cond_17
    iget-object v0, v0, Lqb7;->c:Ljava/lang/Object;

    check-cast v0, Ld15;

    const/4 v1, 0x0

    if-nez v0, :cond_1f

    move-object v0, v1

    :cond_1f
    if-eqz v0, :cond_23

    iget-object v1, v0, Ld15;->b:Lbre;

    :cond_23
    iput-object v1, p0, Lta7;->j:Ljava/lang/Object;

    return-object v1

    :cond_26
    return-object v0
.end method

.method public final u()Z
    .registers 2

    iget-object p0, p0, Lta7;->c:Ljava/lang/Object;

    check-cast p0, Lqb7;

    iget-object v0, p0, Lqb7;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_11

    iget-object v0, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast v0, Li32;

    invoke-virtual {v0}, Lldk;->i()V

    :cond_11
    iget-object p0, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast p0, Ld15;

    if-nez p0, :cond_18

    const/4 p0, 0x0

    :cond_18
    if-eqz p0, :cond_21

    iget p0, p0, Ld15;->c:I

    const/4 v0, 0x3

    if-ne p0, v0, :cond_21

    const/4 p0, 0x1

    return p0

    :cond_21
    const/4 p0, 0x0

    return p0
.end method

.method public final v(Lfp4;)Z
    .registers 10

    const-string v0, "cities_features"

    const/4 v1, 0x0

    :try_start_3
    invoke-virtual {p0}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v2

    const-wide/16 v3, 0x0

    invoke-interface {v2, v0, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2
    :try_end_d
    .catch Ljava/lang/ClassCastException; {:try_start_3 .. :try_end_d} :catch_e

    goto :goto_17

    :catch_e
    invoke-virtual {p0}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    int-to-long v2, v0

    :goto_17
    invoke-virtual {p0}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v4, "cities_config_bundle"

    const/4 v5, 0x0

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lta7;->n()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_58

    iget-wide v6, p1, Ld93;->b:J

    cmp-long v2, v2, v6

    if-nez v2, :cond_58

    iget-object v2, p1, Ld93;->c:Ljava/lang/String;

    invoke-static {v0, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object p1, p1, Ld93;->a:Lyla;

    iget-object p1, p1, Lyla;->a:Ljava/net/URL;

    invoke-virtual {p0}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "cities_host"

    invoke-interface {p0, v0, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x1

    if-nez p0, :cond_4d

    move p0, v0

    goto :goto_55

    :cond_4d
    invoke-static {p1}, Lta7;->q(Ljava/net/URL;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    :goto_55
    if-eqz p0, :cond_58

    move v1, v0

    :cond_58
    return v1
.end method

.method public final w(Lsg3;Z)V
    .registers 4

    iget-object p2, p1, Lsg3;->a:Ldeg;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p2, p0, Lta7;->e:Ljava/lang/Object;

    check-cast p2, Ljava/util/LinkedHashMap;

    iget-object v0, p1, Lsg3;->e:Ljava/lang/String;

    invoke-interface {p2, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lta7;->k(Lsg3;)V

    return-void
.end method

.method public final x(Ldc;Z)V
    .registers 16

    iget-object v0, p0, Lta7;->c:Ljava/lang/Object;

    check-cast v0, Lt7f;

    iget-object v1, p0, Lta7;->e:Ljava/lang/Object;

    check-cast v1, Ljava/util/LinkedHashMap;

    iget-object v2, p0, Lta7;->h:Ljava/lang/Object;

    check-cast v2, Ljava/util/LinkedHashSet;

    iget-object v3, p1, Ldc;->i:Ldc;

    iget-object v4, p1, Ldc;->b:Ljvh;

    iget-object v5, p1, Ldc;->h:Ljava/lang/String;

    iget-object v7, p1, Ldc;->a:Ldeg;

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_29

    iget-object p0, p0, Lta7;->g:Ljava/lang/Object;

    check-cast p0, Ljava/util/WeakHashMap;

    invoke-virtual {p1}, Ldc;->d()Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p0, p2, p1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void

    :cond_29
    invoke-virtual {v1, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lsg3;

    if-eqz v2, :cond_5d

    iget-object p0, v2, Lsg3;->a:Ldeg;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, v2, Lsg3;->j:Ldc;

    if-nez p0, :cond_3d

    iput-object p1, v2, Lsg3;->j:Ldc;

    return-void

    :cond_3d
    iget-object p0, v2, Lsg3;->k:Ljava/util/ArrayList;

    if-nez p0, :cond_49

    new-instance p0, Ljava/util/ArrayList;

    const/4 p2, 0x3

    invoke-direct {p0, p2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p0, v2, Lsg3;->k:Ljava/util/ArrayList;

    :cond_49
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget p0, v4, Ljvh;->n:I

    invoke-static {p0}, Lvep;->A(I)I

    move-result p1

    iget p2, v2, Lsg3;->q:I

    invoke-static {p2}, Lvep;->A(I)I

    move-result p2

    if-le p1, p2, :cond_5c

    iput p0, v2, Lsg3;->q:I

    :cond_5c
    return-void

    :cond_5d
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, p0, Lta7;->k:Ljava/lang/Object;

    move-object v9, v2

    check-cast v9, Lnv6;

    iget-object v2, p0, Lta7;->l:Ljava/lang/Object;

    move-object v10, v2

    check-cast v10, Lsbk;

    sget-object v2, Lsg3;->r:Ljava/lang/Object;

    iget-object v2, v7, Ldeg;->b:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    const/4 v6, 0x0

    :goto_73
    if-ge v6, v3, :cond_8d

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object v12, v8

    check-cast v12, Ljwh;

    invoke-virtual {v12, v4}, Ljwh;->b(Ljvh;)Z

    move-result v8

    if-eqz v8, :cond_8a

    new-instance v6, Lsg3;

    move-object v8, p0

    move-object v11, p1

    invoke-direct/range {v6 .. v12}, Lsg3;-><init>(Ldeg;Lta7;Lnv6;Lsbk;Ldc;Ljwh;)V

    goto :goto_96

    :cond_8a
    add-int/lit8 v6, v6, 0x1

    goto :goto_73

    :cond_8d
    move-object v8, p0

    move-object v11, p1

    new-instance v6, Lsg3;

    sget-object v12, Lsg3;->u:Lpg3;

    invoke-direct/range {v6 .. v12}, Lsg3;-><init>(Ldeg;Lta7;Lnv6;Lsbk;Ldc;Ljwh;)V

    :goto_96
    invoke-virtual {v0, v6}, Ljava/util/concurrent/AbstractExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object p0

    iput-object p0, v6, Lsg3;->m:Ljava/util/concurrent/Future;

    invoke-interface {v1, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p2, :cond_ac

    iget-object p0, v8, Lta7;->f:Ljava/lang/Object;

    check-cast p0, Ljava/util/WeakHashMap;

    invoke-virtual {v11}, Ldc;->d()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_ac
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public final y(Ljava/util/List;Lbre;Z)V
    .registers 14

    const/4 v0, -0x1

    if-eqz p2, :cond_12

    invoke-interface {p1, p2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    if-ne v1, v0, :cond_11

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_12

    :cond_11
    move v0, v1

    :cond_12
    :goto_12
    iget-object p2, p0, Lta7;->c:Ljava/lang/Object;

    check-cast p2, Lqb7;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v5, v2

    move v4, v3

    :goto_26
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    if-ge v4, v6, :cond_4d

    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lbre;

    const/4 v7, 0x1

    if-ne v4, v0, :cond_37

    move v8, v7

    goto :goto_38

    :cond_37
    move v8, v3

    :goto_38
    if-eqz v8, :cond_3f

    if-eqz p3, :cond_3e

    const/4 v7, 0x3

    goto :goto_3f

    :cond_3e
    const/4 v7, 0x2

    :cond_3f
    :goto_3f
    new-instance v9, Ld15;

    invoke-direct {v9, v4, v6, v7}, Ld15;-><init>(ILbre;I)V

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-eqz v8, :cond_4a

    move-object v5, v9

    :cond_4a
    add-int/lit8 v4, v4, 0x1

    goto :goto_26

    :cond_4d
    iput-object v1, p2, Lqb7;->b:Ljava/lang/Object;

    iput-object v5, p2, Lqb7;->c:Ljava/lang/Object;

    iget-object p1, p2, Lqb7;->a:Ljava/lang/Object;

    check-cast p1, Li32;

    invoke-virtual {p1, v1}, Lldk;->g(Ljava/lang/Object;)V

    iput-object v2, p0, Lta7;->i:Ljava/lang/Object;

    iput-object v2, p0, Lta7;->j:Ljava/lang/Object;

    return-void
.end method

.method public final z(JLjava/lang/String;Ljava/net/URL;Ljava/util/List;Lbre;Z)V
    .registers 10

    invoke-virtual {p0}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "cities_features"

    invoke-interface {v0, v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "cities_config_bundle"

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "cities_host"

    invoke-static {p4}, Lta7;->q(Ljava/net/URL;)Ljava/lang/String;

    move-result-object p3

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0, p5, p6, p7}, Lta7;->y(Ljava/util/List;Lbre;Z)V

    return-void
.end method
