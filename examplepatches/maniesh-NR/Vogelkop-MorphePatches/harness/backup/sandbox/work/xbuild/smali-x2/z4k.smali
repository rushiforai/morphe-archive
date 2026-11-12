.class public final Lz4k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvlf;
.implements Lrba;
.implements Lkjm;
.implements Lkrf;
.implements Lffn;
.implements Lll7;
.implements Ljrp;
.implements Lcom/google/android/gms/tasks/OnCompleteListener;
.implements Lcpp;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 4

    iput-byte p1, p0, Lz4k;->a:B

    sparse-switch p1, :sswitch_data_34

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 115
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Lz4k;->b:Ljava/lang/Object;

    return-void

    .line 116
    :sswitch_10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lz4k;->b:Ljava/lang/Object;

    return-void

    .line 117
    :sswitch_1b
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lezh;

    const/high16 v0, 0x1400000

    const/4 v1, 0x1

    .line 118
    invoke-direct {p1, v1, v0}, Lezh;-><init>(BI)V

    .line 119
    iput-object p1, p0, Lz4k;->b:Ljava/lang/Object;

    return-void

    .line 120
    :sswitch_29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x4

    .line 121
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    iput-object p1, p0, Lz4k;->b:Ljava/lang/Object;

    return-void

    :sswitch_data_34
    .sparse-switch
        0xb -> :sswitch_29
        0x15 -> :sswitch_1b
        0x1a -> :sswitch_10
    .end sparse-switch
.end method

.method public synthetic constructor <init>(BZ)V
    .registers 3

    .line 113
    iput-byte p1, p0, Lz4k;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lh61;)V
    .registers 7

    const/16 v0, 0x18

    iput-byte v0, p0, Lz4k;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lz4k;

    const/16 v1, 0x16

    invoke-direct {v0, p1, v1}, Lz4k;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lbxk;

    const/16 v2, 0x14

    invoke-direct {v1, v0, v2}, Lbxk;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Larp;->b(Ljrp;)Ljrp;

    move-result-object v1

    new-instance v2, Ltvk;

    invoke-direct {v2, p1}, Ltvk;-><init>(Ljava/lang/Object;)V

    invoke-static {v2}, Larp;->b(Ljrp;)Ljrp;

    move-result-object p1

    new-instance v2, Lnqp;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v3}, Lnqp;-><init>(Lz4k;B)V

    invoke-static {v2}, Larp;->b(Ljrp;)Ljrp;

    move-result-object v2

    new-instance v3, Lnqp;

    const/4 v4, 0x0

    invoke-direct {v3, v0, v4}, Lnqp;-><init>(Lz4k;B)V

    invoke-static {v3}, Larp;->b(Ljrp;)Ljrp;

    move-result-object v3

    new-instance v4, Lw7j;

    invoke-direct {v4, v1, p1, v2, v3}, Lw7j;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {v4}, Larp;->b(Ljrp;)Ljrp;

    move-result-object p1

    new-instance v1, Luto;

    const/4 v3, 0x3

    invoke-direct {v1, v0, v3}, Luto;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Larp;->b(Ljrp;)Ljrp;

    move-result-object v1

    new-instance v3, Lrii;

    const/16 v4, 0x1d

    invoke-direct {v3, v1, v4}, Lrii;-><init>(Ljava/lang/Object;B)V

    new-instance v4, Lt9l;

    invoke-direct {v4, v0, v1, v2, v3}, Lt9l;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {v4}, Larp;->b(Ljrp;)Ljrp;

    move-result-object v0

    new-instance v2, Lagm;

    const/16 v3, 0xe

    invoke-direct {v2, p1, v0, v1, v3}, Lagm;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2}, Larp;->b(Ljrp;)Ljrp;

    move-result-object p1

    new-instance v0, Ldcl;

    invoke-direct {v0, p1}, Ldcl;-><init>(Ljava/lang/Object;)V

    invoke-static {v0}, Larp;->b(Ljrp;)Ljrp;

    move-result-object p1

    iput-object p1, p0, Lz4k;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 112
    iput-byte p2, p0, Lz4k;->a:B

    iput-object p1, p0, Lz4k;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static h(Lcom/opera/android/browser/chromium/ChromiumContent;IZ)V
    .registers 7

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    const/4 v0, 0x1

    if-eqz p1, :cond_17

    const/4 v1, 0x2

    if-eq p1, v0, :cond_19

    const/4 v2, 0x3

    if-eq p1, v1, :cond_16

    if-eq p1, v2, :cond_14

    const/4 v0, 0x4

    if-ne p1, v0, :cond_16

    :goto_12
    move v0, v2

    goto :goto_1a

    :cond_14
    move v1, v0

    goto :goto_12

    :cond_16
    move v0, v2

    :cond_17
    move v1, v0

    goto :goto_1a

    :cond_19
    move v0, v1

    :goto_1a
    iget-wide p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    const-wide/16 v2, 0x0

    cmp-long v2, p0, v2

    if-nez v2, :cond_23

    return-void

    :cond_23
    invoke-static {p0, p1, v0, v1, p2}, LJ/N;->Mp3QsSyD(JIIZ)V

    return-void
.end method


# virtual methods
.method public final a([BLjava/lang/Object;Ljava/security/MessageDigest;)V
    .registers 6

    check-cast p2, Ljava/lang/Integer;

    if-nez p2, :cond_5

    return-void

    :cond_5
    invoke-virtual {p3, p1}, Ljava/security/MessageDigest;->update([B)V

    iget-object p1, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p1, Ljava/nio/ByteBuffer;

    monitor-enter p1

    :try_start_d
    iget-object v0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast v0, Ljava/nio/ByteBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-virtual {p0, p2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p0

    invoke-virtual {p3, p0}, Ljava/security/MessageDigest;->update([B)V

    monitor-exit p1

    return-void

    :goto_2a
    monitor-exit p1
    :try_end_2b
    .catchall {:try_start_d .. :try_end_2b} :catchall_2c

    throw p0

    :catchall_2c
    move-exception p0

    goto :goto_2a
.end method

.method public final b(I)Z
    .registers 3

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Lqkn;

    iget-object v0, p0, Lqkn;->j:Lujn;

    iget-object p0, p0, Lqkn;->b:Lqln;

    invoke-virtual {p0}, Lqln;->i()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lujn;->P(Ljava/lang/String;)I

    move-result p0

    if-ne p0, p1, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public final c(Lwhp;)Lxhp;
    .registers 3

    iget-object v0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast v0, Lezh;

    monitor-enter v0

    :try_start_5
    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Lezh;

    invoke-virtual {p0, p1}, Ly3d;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lxhp;

    monitor-exit v0

    return-object p0

    :goto_11
    monitor-exit v0
    :try_end_12
    .catchall {:try_start_5 .. :try_end_12} :catchall_13

    throw p0

    :catchall_13
    move-exception p0

    goto :goto_11
.end method

.method public final d()V
    .registers 4

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Lkt3;

    iget-object p0, p0, Lkt3;->d:Ljava/lang/Object;

    check-cast p0, Lala;

    iget-object p0, p0, Lala;->g:Ljava/lang/Object;

    check-cast p0, Lr4m;

    iget-object p0, p0, Lr4m;->b:Ly4m;

    iget-object p0, p0, Ly4m;->c:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object v0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const-string v1, "translate_web_pages.tap_to_select_language_hint.shown"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    return-void
.end method

.method public final e(Lnt5;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p1, Laon;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Laon;

    iget v1, v0, Laon;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Laon;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Laon;

    invoke-direct {v0, p0, p1}, Laon;-><init>(Lz4k;Lnt5;)V

    :goto_18
    iget-object p1, v0, Laon;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Laon;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v4, :cond_28

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_3e

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_2e
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Le3j;

    iput v4, v0, Laon;->v:I

    invoke-static {p0, v0}, La26;->k(Lno7;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_3e

    return-object v1

    :cond_3e
    :goto_3e
    check-cast p1, Ld3j;

    const/16 p0, 0x29

    const/4 v0, 0x0

    invoke-virtual {p1, p0, v0}, Ld3j;->d(IZ)Lc3j;

    move-result-object p0

    if-eqz p0, :cond_56

    iget-object p0, p0, Lc3j;->d:Ljava/lang/Comparable;

    check-cast p0, Ljava/lang/String;

    invoke-static {p0}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_54

    move-object v3, p0

    :cond_54
    if-nez v3, :cond_58

    :cond_56
    const-string v3, "mobile-weather.opera-api.com"

    :cond_58
    const-string p0, "https://"

    invoke-virtual {p0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final f(Lcom/opera/android/browser/chromium/ChromiumContent;)Z
    .registers 2

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    if-ne p0, p1, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final g(Lifn;Z)V
    .registers 10

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Lydn;

    iget-object v0, p0, Lydn;->E:Ljava/util/EnumSet;

    iget v1, p0, Lydn;->S:I

    const/4 v2, 0x6

    const/4 v3, 0x0

    if-ne v1, v2, :cond_1f

    const/4 p2, 0x3

    iput p2, p0, Lydn;->G:I

    new-instance p2, Lifn;

    sget-object v0, Lhfn;->g:Lhfn;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p2, v0, p1, v3}, Lifn;-><init>(Lhfn;Ljava/lang/Throwable;Z)V

    move-object p1, p2

    goto :goto_5a

    :cond_1f
    if-eqz p2, :cond_46

    iget-object p2, p0, Lydn;->A:Lxdn;

    iget-wide v1, p2, Lxdn;->d:J

    iget-wide v4, p2, Lxdn;->c:J

    cmp-long v1, v1, v4

    if-eqz v1, :cond_46

    iput-wide v4, p2, Lxdn;->d:J

    iget-object v1, p2, Lxdn;->f:Lydn;

    iget-object v1, v1, Lydn;->c:Lgfn;

    iget-object v2, p2, Lxdn;->a:Ljava/lang/String;

    sget-object v6, Laik;->a:[Ljava/lang/String;

    const-string v6, ""

    if-nez v2, :cond_3a

    move-object v2, v6

    :cond_3a
    iget-object p2, p2, Lxdn;->b:Ljava/lang/String;

    if-eqz p2, :cond_3f

    move-object v6, p2

    :cond_3f
    invoke-interface {v1, v4, v5, v2, v6}, Lgfn;->a(JLjava/lang/String;Ljava/lang/String;)Lgfn;

    move-result-object p2

    invoke-interface {p2}, Lgfn;->d()V

    :cond_46
    iput v3, p0, Lydn;->G:I

    iget-boolean p2, p1, Lifn;->b:Z

    iget-object v1, p1, Lifn;->a:Lhfn;

    if-eqz p2, :cond_5a

    invoke-virtual {v0, v1}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_5a

    invoke-virtual {v0, v1}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    invoke-static {p1}, Lks3;->D(Ljava/lang/Throwable;)V

    :cond_5a
    :goto_5a
    iget-object p2, p0, Lydn;->d:Lvdn;

    iget-boolean v0, p2, Lvdn;->a:Z

    invoke-virtual {p2}, Lvdn;->b()Z

    move-result p2

    iget-object p1, p1, Lifn;->a:Lhfn;

    invoke-virtual {p0}, Lydn;->p()Lwdn;

    move-result-object v1

    iget-boolean v1, v1, Lwdn;->a:Z

    if-eqz v1, :cond_70

    if-eqz v0, :cond_70

    const/4 v0, 0x1

    goto :goto_71

    :cond_70
    move v0, v3

    :goto_71
    iget-object v1, p0, Lydn;->c:Lgfn;

    invoke-interface {v1}, Lgfn;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_7a

    move v3, p2

    :cond_7a
    new-instance p2, Lvdn;

    const/4 v1, 0x0

    invoke-direct {p2, v0, v3, v1, p1}, Lvdn;-><init>(ZZLefn;Lhfn;)V

    invoke-virtual {p0, p2}, Lydn;->I(Lvdn;)V

    iget-object p1, p0, Lydn;->e:Lsgi;

    iget-object p2, p0, Lydn;->d:Lvdn;

    iget-boolean p2, p2, Lvdn;->a:Z

    invoke-virtual {p0}, Lydn;->m()I

    move-result v0

    invoke-virtual {p1, v0, p2}, Lsgi;->I(IZ)V

    invoke-virtual {p0}, Lydn;->v()V

    return-void
.end method

.method public final declared-synchronized i(Ljava/lang/Object;)V
    .registers 4

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_19

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzak;

    invoke-interface {v1, p1}, Lzak;->a(Ljava/lang/Object;)V
    :try_end_18
    .catchall {:try_start_1 .. :try_end_18} :catchall_1d

    goto :goto_9

    :cond_19
    monitor-exit p0

    return-void

    :goto_1b
    :try_start_1b
    monitor-exit p0
    :try_end_1c
    .catchall {:try_start_1b .. :try_end_1c} :catchall_1d

    throw p1

    :catchall_1d
    move-exception p1

    goto :goto_1b
.end method

.method public final l(I)Z
    .registers 2

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Lqkn;

    iget-object p0, p0, Lqkn;->j:Lujn;

    iget-object p0, p0, Ldt1;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    instance-of p0, p0, Lhkb;

    return p0
.end method

.method public final o(Ljjm;Lhjm;)V
    .registers 9

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Lr22;

    iget-object p2, p0, Lr22;->a:Ljava/lang/Object;

    check-cast p2, Ljava/util/ArrayDeque;

    invoke-virtual {p2, p1}, Ljava/util/ArrayDeque;->remove(Ljava/lang/Object;)Z

    iget-object p2, p0, Lr22;->b:Ljava/lang/Object;

    check-cast p2, Ljava/util/ArrayDeque;

    invoke-virtual {p2, p1}, Ljava/util/ArrayDeque;->remove(Ljava/lang/Object;)Z

    iget-object p0, p0, Lr22;->c:Ljava/lang/Object;

    check-cast p0, Lqim;

    iget-object p2, p0, Lqim;->j:Lisj;

    iget-object v0, p0, Lqim;->i:Lqie;

    iget-object v1, p0, Lqim;->h:Lp77;

    instance-of v2, p1, Lb87;

    const/4 v3, 0x1

    if-eqz v2, :cond_29

    move-object p2, p1

    check-cast p2, Lb87;

    invoke-virtual {v1, p2}, Lp77;->c(Lb87;)V

    goto/16 :goto_bf

    :cond_29
    instance-of v2, p1, Lcej;

    if-eqz v2, :cond_3f

    move-object p2, p1

    check-cast p2, Lcej;

    iget-object v1, v0, Lqie;->b:Ljava/lang/Object;

    check-cast v1, Landroid/util/Pair;

    if-eqz v1, :cond_bf

    iget-object v1, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    if-ne v1, p2, :cond_bf

    invoke-virtual {v0}, Lqie;->h()V

    goto/16 :goto_bf

    :cond_3f
    instance-of v2, p1, Lo93;

    if-eqz v2, :cond_56

    move-object v0, p1

    check-cast v0, Lo93;

    invoke-virtual {p2, v0}, Lisj;->a(Lo93;)V

    iget-object p2, p0, Lqim;->k:Lbpd;

    invoke-virtual {p2}, Lbpd;->B()Lisj;

    move-result-object p2

    if-eqz p2, :cond_bf

    invoke-virtual {p2, v0}, Lisj;->a(Lo93;)V

    goto/16 :goto_bf

    :cond_56
    instance-of v2, p1, Lz9l;

    sget-object v4, Lhjm;->b:Lhjm;

    if-eqz v2, :cond_a3

    move-object v2, p1

    check-cast v2, Lz9l;

    iget v5, v2, Lz9l;->b:I

    iget-object v2, v2, Lz9l;->c:Ljjm;

    invoke-static {v5}, Lvep;->A(I)I

    move-result v5

    if-eqz v5, :cond_9d

    if-eq v5, v3, :cond_8d

    const/4 v0, 0x2

    if-eq v5, v0, :cond_87

    const/4 p2, 0x3

    if-ne v5, p2, :cond_bf

    iget-object p2, p0, Lqim;->l:Luwf;

    if-eqz p2, :cond_bf

    check-cast v2, Ls2f;

    iget-object p2, p2, Luwf;->a:Landroid/util/Pair;

    if-eqz p2, :cond_bf

    iget-object v0, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    if-ne v0, v2, :cond_bf

    iget-object p2, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p2, Lq2f;

    invoke-virtual {p2, v4}, Lq2f;->f(Lhjm;)V

    goto :goto_bf

    :cond_87
    check-cast v2, Lo93;

    invoke-virtual {p2, v2}, Lisj;->a(Lo93;)V

    goto :goto_bf

    :cond_8d
    check-cast v2, Lcej;

    iget-object p2, v0, Lqie;->b:Ljava/lang/Object;

    check-cast p2, Landroid/util/Pair;

    if-eqz p2, :cond_bf

    iget-object p2, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    if-ne p2, v2, :cond_bf

    invoke-virtual {v0}, Lqie;->h()V

    goto :goto_bf

    :cond_9d
    check-cast v2, Lb87;

    invoke-virtual {v1, v2}, Lp77;->c(Lb87;)V

    goto :goto_bf

    :cond_a3
    iget-object p2, p0, Lqim;->m:Lz8b;

    if-eqz p2, :cond_bf

    instance-of v0, p1, Lpz3;

    if-eqz v0, :cond_bf

    move-object v0, p1

    check-cast v0, Lpz3;

    iget-object p2, p2, Lz8b;->a:Ljava/lang/Object;

    check-cast p2, Landroid/util/Pair;

    if-eqz p2, :cond_bf

    iget-object v1, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    if-ne v1, v0, :cond_bf

    iget-object p2, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p2, Llz3;

    invoke-virtual {p2, v4}, Llz3;->b(Lhjm;)Z

    :cond_bf
    :goto_bf
    iget-object p2, p0, Lqim;->n:Lu7k;

    if-eqz p2, :cond_cc

    iget-object p2, p2, Lu7k;->a:Ljava/lang/Object;

    check-cast p2, Lz9l;

    if-ne p2, p1, :cond_cc

    const/4 p1, 0x0

    iput-object p1, p0, Lqim;->n:Lu7k;

    :cond_cc
    new-instance p1, Lmim;

    invoke-direct {p1, p0, v3}, Lmim;-><init>(Lqim;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .registers 3

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_14

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Lopp;

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lopp;->setImageBitmap(Landroid/graphics/Bitmap;)V

    return-void

    :cond_14
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    return-void
.end method

.method public final s()V
    .registers 1

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Lkt3;

    iget-object p0, p0, Lkt3;->d:Ljava/lang/Object;

    check-cast p0, Lala;

    iget-object p0, p0, Lala;->a:Ljava/lang/Object;

    check-cast p0, Lpt1;

    iget-object p0, p0, Lpt1;->c:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/BottomIndicatorButton;

    invoke-virtual {p0}, Landroid/view/View;->callOnClick()Z

    return-void
.end method

.method public final t()V
    .registers 1

    return-void
.end method

.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 3

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Lv7k;

    invoke-virtual {p0}, Lv7k;->I0()Lc8k;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public final z()V
    .registers 1

    return-void
.end method

.method public final zza()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lz4k;->a:B

    packed-switch v0, :pswitch_data_20

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Lcpp;

    invoke-interface {p0}, Lcpp;->zza()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lrsp;

    if-nez p0, :cond_17

    const-string p0, "Cannot return null from a non-@Nullable @Provides method"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    :cond_17
    return-object p0

    :pswitch_18
    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Lh61;

    iget-object p0, p0, Lh61;->a:Landroid/content/Context;

    return-object p0

    nop

    :pswitch_data_20
    .packed-switch 0x16
        :pswitch_18
    .end packed-switch
.end method
