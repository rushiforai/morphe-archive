.class public final Lc37;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfua;
.implements Lgm8;
.implements Lvx4;
.implements Ldkg;
.implements Lo7h;
.implements Lqo3;
.implements Lox8;


# static fields
.field public static final c:Ljava/lang/Object;

.field public static final d:Lrhk;

.field public static e:Lc37;

.field public static f:Lc37;


# instance fields
.field public a:Ljava/lang/Object;

.field public b:Ljava/lang/Object;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 2

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lc37;->c:Ljava/lang/Object;

    new-instance v0, Lrhk;

    const-string v1, "_root_"

    invoke-direct {v0, v1}, Lrhk;-><init>(Ljava/lang/String;)V

    sput-object v0, Lc37;->d:Lrhk;

    return-void
.end method

.method public constructor <init>(B)V
    .registers 3

    sparse-switch p1, :sswitch_data_50

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object p1

    iput-object p1, p0, Lc37;->a:Ljava/lang/Object;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object p1

    iput-object p1, p0, Lc37;->b:Ljava/lang/Object;

    return-void

    :sswitch_13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lc37;->a:Ljava/lang/Object;

    return-void

    :sswitch_1e
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lc37;->a:Ljava/lang/Object;

    new-instance p1, Li7f;

    invoke-direct {p1}, Li7f;-><init>()V

    iput-object p1, p0, Lc37;->b:Ljava/lang/Object;

    return-void

    :sswitch_30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/io/ByteArrayOutputStream;

    const/16 v0, 0x200

    invoke-direct {p1, v0}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    iput-object p1, p0, Lc37;->a:Ljava/lang/Object;

    new-instance v0, Ljava/io/DataOutputStream;

    invoke-direct {v0, p1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lc37;->b:Ljava/lang/Object;

    return-void

    :sswitch_44
    sget-object p1, Lv08;->a:Lv08;

    sget-object v0, Ln08;->a:Ln08;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc37;->a:Ljava/lang/Object;

    iput-object v0, p0, Lc37;->b:Ljava/lang/Object;

    return-void

    :sswitch_data_50
    .sparse-switch
        0x8 -> :sswitch_44
        0x10 -> :sswitch_30
        0x13 -> :sswitch_1e
        0x14 -> :sswitch_13
    .end sparse-switch
.end method

.method public constructor <init>(Ljava/lang/Boolean;)V
    .registers 2

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    invoke-static {p1}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object p1

    iput-object p1, p0, Lc37;->a:Ljava/lang/Object;

    .line 88
    iput-object p1, p0, Lc37;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3

    .line 95
    iput-object p1, p0, Lc37;->a:Ljava/lang/Object;

    iput-object p2, p0, Lc37;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;B)V
    .registers 3

    packed-switch p2, :pswitch_data_1a

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    new-instance p2, Ljava/util/LinkedHashMap;

    invoke-direct {p2}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p2, p0, Lc37;->a:Ljava/lang/Object;

    .line 91
    iput-object p1, p0, Lc37;->b:Ljava/lang/Object;

    return-void

    .line 92
    :pswitch_10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p2, 0x0

    .line 93
    iput-object p2, p0, Lc37;->b:Ljava/lang/Object;

    .line 94
    iput-object p1, p0, Lc37;->a:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_1a
    .packed-switch 0x11
        :pswitch_10
    .end packed-switch
.end method

.method public constructor <init>(Lkze;Lk6l;Landroid/view/MenuItem;)V
    .registers 6

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    iput-object p2, p0, Lc37;->a:Ljava/lang/Object;

    .line 82
    iput-object p3, p0, Lc37;->b:Ljava/lang/Object;

    .line 83
    iget-object p2, p2, Lk6l;->w:Lxg;

    .line 84
    new-instance p3, Lq6l;

    new-instance v0, Ldg7;

    const/16 v1, 0x1b

    invoke-direct {v0, p0, v1}, Ldg7;-><init>(Ljava/lang/Object;B)V

    const/4 v1, 0x0

    invoke-direct {p3, v0, v1}, Lq6l;-><init>(Ljava/lang/Object;B)V

    .line 85
    new-instance v0, Lal7;

    const/16 v1, 0xa

    invoke-direct {v0, p0, v1}, Lal7;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2, p1, p3, v0}, La26;->U(Lw6f;Likc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method

.method public static g(Lorb;Ljava/util/ArrayList;Ljava/lang/Object;I)Z
    .registers 8

    iget-object v0, p0, Lorb;->a:Lorg/json/JSONObject;

    add-int/lit8 v1, p3, 0x1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    if-lt v1, v2, :cond_3c

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    sget-object p3, Lc37;->c:Ljava/lang/Object;

    if-eq p3, p2, :cond_30

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p3

    sget-object v0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    const/4 v1, 0x0

    if-eq p3, v0, :cond_24

    if-eqz p3, :cond_24

    invoke-static {p3}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    :cond_24
    invoke-virtual {p0, p2, p1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz v1, :cond_3a

    invoke-virtual {v1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5d

    goto :goto_3a

    :cond_30
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_5d

    :cond_3a
    :goto_3a
    const/4 p0, 0x1

    return p0

    :cond_3c
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, v2}, Lorb;->i(Ljava/lang/String;)Lorb;

    move-result-object v2

    if-nez v2, :cond_5e

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-virtual {v0, p2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_5d

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lorb;->c(Ljava/lang/String;)Lorb;

    :cond_5d
    return v3

    :cond_5e
    invoke-static {v2, p1, p2, v1}, Lc37;->g(Lorb;Ljava/util/ArrayList;Ljava/lang/Object;I)Z

    move-result p0

    return p0
.end method

.method public static r()Lc37;
    .registers 2

    sget-object v0, Lc37;->e:Lc37;

    if-nez v0, :cond_d

    new-instance v0, Lc37;

    const/16 v1, 0x13

    invoke-direct {v0, v1}, Lc37;-><init>(B)V

    sput-object v0, Lc37;->e:Lc37;

    :cond_d
    return-object v0
.end method

.method public static s()Lc37;
    .registers 3

    sget-object v0, Lc37;->f:Lc37;

    if-nez v0, :cond_14

    new-instance v0, Lc37;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const/4 v1, 0x6

    const-string v2, "Sdk initialization error."

    invoke-static {v1, v2}, Lrm5;->q(ILjava/lang/String;)Lcom/google/android/gms/ads/AdError;

    move-result-object v1

    iput-object v1, v0, Lc37;->b:Ljava/lang/Object;

    sput-object v0, Lc37;->f:Lc37;

    :cond_14
    return-object v0
.end method

.method public static y(Lqhf;Ljava/lang/String;)V
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lqhf;->a()V

    return-void
.end method


# virtual methods
.method public final A(Ljava/lang/String;)Lz0c;
    .registers 6

    const-string v0, "{userId}"

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lkotlin/text/StringsKt;->E(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v0

    if-eqz v0, :cond_33

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iget-object v2, p0, Lc37;->a:Ljava/lang/Object;

    check-cast v2, Lt1;

    iget-object v2, v2, Lt1;->b:Landroid/content/Context;

    invoke-static {v2}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object v2

    invoke-virtual {v2}, Lno7;->i()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ld3j;

    const/16 v3, 0x26

    invoke-virtual {v2, v3, v1}, Ld3j;->d(IZ)Lc3j;

    move-result-object v1

    if-eqz v1, :cond_33

    iget-object v1, v1, Lc3j;->d:Ljava/lang/Comparable;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_35

    :cond_33
    const/4 p0, 0x0

    return-object p0

    :cond_35
    new-instance v0, Lz0c;

    const/16 v1, 0x1c

    invoke-direct {v0, p0, p1, v1}, Lz0c;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v0
.end method

.method public final B(I)V
    .registers 3

    const/16 v0, 0x10

    if-eq p1, v0, :cond_1c

    const/16 v0, 0x20

    if-eq p1, v0, :cond_1c

    new-instance p0, Ljava/security/InvalidAlgorithmParameterException;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "Invalid key size %d; only 16-byte and 32-byte AES keys are supported"

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1c
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lc37;->a:Ljava/lang/Object;

    return-void
.end method

.method public final C(Ljava/lang/annotation/Annotation;)V
    .registers 3

    iget-object v0, p0, Lc37;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    if-nez v0, :cond_d

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lc37;->b:Ljava/lang/Object;

    :cond_d
    invoke-interface {p1}, Ljava/lang/annotation/Annotation;->annotationType()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final a(Lcom/google/android/material/chip/ChipGroup;)V
    .registers 6

    iget-object p1, p0, Lc37;->b:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/material/chip/ChipGroup;

    iget-object p1, p1, Lcom/google/android/material/chip/ChipGroup;->h:Lev4;

    iget-boolean v0, p1, Lev4;->b:Z

    if-nez v0, :cond_b

    return-void

    :cond_b
    iget-object p0, p0, Lc37;->a:Ljava/lang/Object;

    check-cast p0, Ligi;

    invoke-virtual {p1}, Lev4;->e()I

    move-result p1

    iget-object v0, p0, Ligi;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkg7;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/material/chip/Chip;

    if-eqz v3, :cond_1f

    invoke-virtual {v3}, Landroid/view/View;->getId()I

    move-result v3

    if-ne p1, v3, :cond_1f

    goto :goto_3b

    :cond_3a
    const/4 v2, 0x0

    :goto_3b
    iput-object v2, p0, Ligi;->g:Ljava/lang/Object;

    iget-object p1, p0, Ligi;->c:Ljava/lang/Object;

    check-cast p1, Lze7;

    iput-object v2, p1, Lze7;->k:Lkg7;

    iget-object v0, p1, Lze7;->j:Lvvj;

    if-eqz v0, :cond_53

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p1, Lze7;->a:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object v1, p1, Lze7;->j:Lvvj;

    invoke-virtual {p1, v0, v1}, Lze7;->J(Ljava/util/List;Lvvj;)V

    :cond_53
    invoke-virtual {p0}, Ligi;->I0()V

    return-void
.end method

.method public final b(Ljava/util/List;)Lmil;
    .registers 11

    const/4 v0, 0x0

    :try_start_1
    move-object v1, p1

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v1
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_8} :catch_75

    const/4 v2, 0x0

    move-object v3, v0

    :goto_a
    if-ge v2, v1, :cond_22

    :try_start_c
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lus7;
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_12} :catch_20

    :try_start_12
    iget-object v3, p0, Lc37;->b:Ljava/lang/Object;

    check-cast v3, Lpw7;

    invoke-interface {v4, v3}, Lus7;->a(Lpw7;)V
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_19} :catch_1d

    add-int/lit8 v2, v2, 0x1

    move-object v3, v4

    goto :goto_a

    :catch_1d
    move-exception v0

    move-object v3, v4

    goto :goto_78

    :catch_20
    move-exception v0

    goto :goto_78

    :cond_22
    iget-object p1, p0, Lc37;->b:Ljava/lang/Object;

    check-cast p1, Lpw7;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lsf1;

    iget-object p1, p1, Lpw7;->f:Ljava/lang/Object;

    check-cast p1, Li1;

    invoke-virtual {p1}, Li1;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Lsf1;-><init>(Ljava/lang/String;)V

    iget-object p1, p0, Lc37;->b:Ljava/lang/Object;

    check-cast p1, Lpw7;

    iget v2, p1, Lpw7;->b:I

    iget p1, p1, Lpw7;->c:I

    invoke-static {v2, p1}, Lupj;->c(II)J

    move-result-wide v2

    new-instance p1, Lxjl;

    invoke-direct {p1, v2, v3}, Lxjl;-><init>(J)V

    iget-object v4, p0, Lc37;->a:Ljava/lang/Object;

    check-cast v4, Lmil;

    iget-wide v4, v4, Lmil;->b:J

    invoke-static {v4, v5}, Lxjl;->g(J)Z

    move-result v4

    if-nez v4, :cond_54

    move-object v0, p1

    :cond_54
    if-eqz v0, :cond_59

    iget-wide v2, v0, Lxjl;->a:J

    goto :goto_65

    :cond_59
    invoke-static {v2, v3}, Lxjl;->e(J)I

    move-result p1

    invoke-static {v2, v3}, Lxjl;->f(J)I

    move-result v0

    invoke-static {p1, v0}, Lupj;->c(II)J

    move-result-wide v2

    :goto_65
    iget-object p1, p0, Lc37;->b:Ljava/lang/Object;

    check-cast p1, Lpw7;

    invoke-virtual {p1}, Lpw7;->c()Lxjl;

    move-result-object p1

    new-instance v0, Lmil;

    invoke-direct {v0, v1, v2, v3, p1}, Lmil;-><init>(Lsf1;JLxjl;)V

    iput-object v0, p0, Lc37;->a:Ljava/lang/Object;

    return-object v0

    :catch_75
    move-exception v1

    move-object v3, v0

    move-object v0, v1

    :goto_78
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lc37;->b:Ljava/lang/Object;

    check-cast v4, Lpw7;

    iget-object v4, v4, Lpw7;->f:Ljava/lang/Object;

    check-cast v4, Li1;

    invoke-virtual {v4}, Li1;->t()I

    move-result v4

    iget-object v5, p0, Lc37;->b:Ljava/lang/Object;

    check-cast v5, Lpw7;

    invoke-virtual {v5}, Lpw7;->c()Lxjl;

    move-result-object v5

    iget-object v6, p0, Lc37;->b:Ljava/lang/Object;

    check-cast v6, Lpw7;

    iget v7, v6, Lpw7;->b:I

    iget v6, v6, Lpw7;->c:I

    invoke-static {v7, v6}, Lupj;->c(II)J

    move-result-wide v6

    invoke-static {v6, v7}, Lxjl;->h(J)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Error while applying EditCommand batch to buffer (length="

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", composition="

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, ", selection="

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "):"

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v4, 0xa

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    check-cast p1, Ljava/lang/Iterable;

    new-instance v4, Ltu7;

    invoke-direct {v4, v3, p0}, Ltu7;-><init>(Lus7;Lc37;)V

    const/16 p0, 0x3c

    const-string v3, "\n"

    invoke-static {p1, v2, v3, v4, p0}, Lkotlin/collections/CollectionsKt;->O(Ljava/lang/Iterable;Ljava/lang/StringBuilder;Ljava/lang/String;Lkotlin/jvm/functions/Function1;I)V

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public final c(Ljava/io/File;)V
    .registers 12

    iget-object v0, p0, Lc37;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object p0, p0, Lc37;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashMap;

    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_90

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const/4 v2, 0x0

    :try_start_14
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_19
    .catch Ljava/io/FileNotFoundException; {:try_start_14 .. :try_end_19} :catch_9b
    .catch Lorg/json/JSONException; {:try_start_14 .. :try_end_19} :catch_9b
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_19} :catch_9b
    .catchall {:try_start_14 .. :try_end_19} :catchall_96

    :try_start_19
    new-instance v4, Lorb;

    invoke-static {v3}, Lxvg;->z(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorb;-><init>(Ljava/lang/String;)V
    :try_end_22
    .catch Ljava/io/FileNotFoundException; {:try_start_19 .. :try_end_22} :catch_94
    .catch Lorg/json/JSONException; {:try_start_19 .. :try_end_22} :catch_94
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_22} :catch_94
    .catchall {:try_start_19 .. :try_end_22} :catchall_91

    invoke-static {v3}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v3, 0x0

    move v5, v3

    :catch_2f
    :cond_2f
    :goto_2f
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_54

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    :try_start_3b
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    const/16 v8, 0x2e

    const/4 v9, 0x1

    invoke-static {v9, v7, v8}, Laik;->r(ZLjava/lang/String;C)Ljava/util/ArrayList;

    move-result-object v7

    invoke-static {v4, v7, v6, v3}, Lc37;->g(Lorb;Ljava/util/ArrayList;Ljava/lang/Object;I)Z

    move-result v6
    :try_end_50
    .catch Lorg/json/JSONException; {:try_start_3b .. :try_end_50} :catch_2f

    if-eqz v6, :cond_2f

    move v5, v9

    goto :goto_2f

    :cond_54
    if-eqz v5, :cond_90

    new-instance p0, Ljava/io/File;

    const-string v3, ".~"

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :try_start_61
    new-instance p1, Ljava/io/OutputStreamWriter;

    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    sget-object v3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {p1, v0, v3}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V
    :try_end_6d
    .catch Ljava/io/IOException; {:try_start_61 .. :try_end_6d} :catch_8d
    .catchall {:try_start_61 .. :try_end_6d} :catchall_88

    :try_start_6d
    iget-object v0, v4, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/Writer;->close()V
    :try_end_79
    .catch Ljava/io/IOException; {:try_start_6d .. :try_end_79} :catch_86
    .catchall {:try_start_6d .. :try_end_79} :catchall_83

    invoke-virtual {p0, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p1

    if-nez p1, :cond_90

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    goto :goto_90

    :catchall_83
    move-exception p0

    move-object v2, p1

    goto :goto_89

    :catch_86
    move-object v2, p1

    goto :goto_8d

    :catchall_88
    move-exception p0

    :goto_89
    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0

    :catch_8d
    :goto_8d
    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    :cond_90
    :goto_90
    return-void

    :catchall_91
    move-exception p0

    move-object v2, v3

    goto :goto_97

    :catch_94
    move-object v2, v3

    goto :goto_9b

    :catchall_96
    move-exception p0

    :goto_97
    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0

    :catch_9b
    :goto_9b
    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    return-void
.end method

.method public final d()V
    .registers 3

    iget-object v0, p0, Lc37;->a:Ljava/lang/Object;

    check-cast v0, Lv6d;

    sget-object v1, Lt6d;->c:Lt6d;

    invoke-virtual {v0, v1}, Lv6d;->b(Lt6d;)V

    iget-object p0, p0, Lc37;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->z:Lz43;

    if-nez p0, :cond_12

    const/4 p0, 0x0

    :cond_12
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lz43;->B(Z)V

    return-void
.end method

.method public final e()V
    .registers 3

    iget-object v0, p0, Lc37;->a:Ljava/lang/Object;

    check-cast v0, Lv6d;

    sget-object v1, Lt6d;->a:Lt6d;

    invoke-virtual {v0, v1}, Lv6d;->b(Lt6d;)V

    iget-object p0, p0, Lc37;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->z:Lz43;

    if-nez p0, :cond_12

    const/4 p0, 0x0

    :cond_12
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lz43;->B(Z)V

    return-void
.end method

.method public final f(Ljava/util/List;)V
    .registers 5

    iget-object v0, p0, Lc37;->a:Ljava/lang/Object;

    check-cast v0, Luqe;

    iget-object p0, p0, Lc37;->b:Ljava/lang/Object;

    check-cast p0, Lmsh;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, p0, p1, v1, v2}, Luqe;->j(Lmsh;Ljava/util/List;ZZ)V

    return-void
.end method

.method public final get()Ljava/lang/Object;
    .registers 3

    iget-object v0, p0, Lc37;->a:Ljava/lang/Object;

    check-cast v0, Lqh;

    iget-object v0, v0, Lqh;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object p0, p0, Lc37;->b:Ljava/lang/Object;

    check-cast p0, Ld06;

    invoke-virtual {p0}, Ld06;->get()Ljava/lang/Object;

    move-result-object p0

    new-instance v1, Lpxd;

    check-cast p0, Lqb7;

    invoke-direct {v1, v0, p0}, Lpxd;-><init>(Landroid/content/Context;Lqb7;)V

    return-object v1
.end method

.method public final h()Ls40;
    .registers 4

    iget-object v0, p0, Lc37;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    const/4 v1, 0x0

    if-eqz v0, :cond_21

    iget-object v2, p0, Lc37;->b:Ljava/lang/Object;

    check-cast v2, Lr40;

    if-eqz v2, :cond_1b

    new-instance v1, Ls40;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object p0, p0, Lc37;->b:Ljava/lang/Object;

    check-cast p0, Lr40;

    invoke-direct {v1, v0, p0}, Ls40;-><init>(ILr40;)V

    return-object v1

    :cond_1b
    const-string p0, "Variant is not set"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_21
    const-string p0, "Key size is not set"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1
.end method

.method public final i()Landroid/graphics/drawable/Drawable;
    .registers 3

    iget-object v0, p0, Lc37;->b:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Bitmap;

    iget-object p0, p0, Lc37;->a:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v1, p0, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    return-object v1
.end method

.method public final j()Lxz8;
    .registers 4

    new-instance v0, Lxz8;

    iget-object v1, p0, Lc37;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lc37;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/HashMap;

    if-nez v2, :cond_f

    sget-object p0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    goto :goto_1c

    :cond_f
    new-instance v2, Ljava/util/HashMap;

    iget-object p0, p0, Lc37;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    invoke-direct {v2, p0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    :goto_1c
    invoke-direct {v0, v1, p0}, Lxz8;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    return-object v0
.end method

.method public final k(Lgk9;)Landroid/app/PendingIntent;
    .registers 6

    invoke-interface {p1}, Lgig;->q0()Lvjd;

    move-result-object p1

    iget-object p1, p1, Lvjd;->I:Landroid/os/Bundle;

    iget-object p0, p0, Lc37;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/live_score/LiveCommentaryService;

    const/4 v0, 0x0

    if-eqz p1, :cond_67

    const-string v1, "extra_id"

    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_67

    invoke-static {p1}, Lkotlin/text/StringsKt;->k0(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p1

    if-eqz p1, :cond_67

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    sget-object p1, Lcom/opera/android/live_score/LiveCommentaryService;->o:Lix5;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    instance-of v3, p1, Lhmc;

    if-eqz v3, :cond_2c

    check-cast p1, Lhmc;

    goto :goto_2d

    :cond_2c
    move-object p1, v0

    :goto_2d
    if-eqz p1, :cond_3c

    check-cast p1, Lcom/opera/android/OperaApplication;

    iget-object p1, p1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p1, p1, Lxv1;->X:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lvv1;

    goto :goto_3d

    :cond_3c
    move-object p1, v0

    :goto_3d
    if-eqz p1, :cond_67

    long-to-int v0, v1

    iget-object p1, p1, Lvv1;->a:Lxv1;

    iget-object p1, p1, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {p1}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p1

    const-string v3, "com.opera.android.action.SHOW_LIVE_SCORE_MATCH"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string v3, "action_show_match_id"

    invoke-virtual {p1, v3, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object p1

    sget-object v1, Lapc;->c:Lapc;

    invoke-static {v1}, Lzi4;->Z(Lapc;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "action_show_match_type"

    invoke-virtual {p1, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const/high16 v1, 0xc000000

    invoke-static {p0, v0, p1, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    return-object p0

    :cond_67
    return-object v0
.end method

.method public final l(ILandroid/view/KeyEvent;)Z
    .registers 11

    iget-object v0, p0, Lc37;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_9c

    const/4 v1, 0x0

    invoke-static {v1, p2}, Lfr3;->H(ILandroid/view/KeyEvent;)Z

    move-result v3

    const/4 v4, 0x0

    if-nez v3, :cond_5e

    iget-object p0, p0, Lc37;->b:Ljava/lang/Object;

    check-cast p0, Li7f;

    new-instance v3, Lg7f;

    invoke-direct {v3, p0}, Lg7f;-><init>(Li7f;)V

    :cond_1c
    invoke-virtual {v3}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_5e

    invoke-virtual {v3}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmv3;

    iget-object p0, p0, Lmv3;->a:Lcom/opera/android/BrowserActivity;

    iget-object v5, p0, Lcom/opera/android/BrowserActivity;->q1:Lvvb;

    invoke-virtual {v5, p2}, Lvvb;->a(Landroid/view/KeyEvent;)Ldnb;

    move-result-object v5

    if-nez v5, :cond_5b

    packed-switch p1, :pswitch_data_bc

    move v5, v1

    goto :goto_38

    :pswitch_37
    move v5, v2

    :goto_38
    iget-object v6, p0, Lt5d;->u:Lpad;

    iget-object v6, v6, Lpad;->c:Ljava/lang/Object;

    check-cast v6, Ll24;

    if-eqz v6, :cond_4b

    invoke-interface {v6}, Ll24;->b()Lvvb;

    move-result-object v6

    if-eqz v6, :cond_4b

    invoke-virtual {v6, p2}, Lvvb;->a(Landroid/view/KeyEvent;)Ldnb;

    move-result-object v6

    goto :goto_4c

    :cond_4b
    move-object v6, v4

    :goto_4c
    if-eqz v6, :cond_58

    if-eqz v5, :cond_58

    new-instance v5, Lbi2;

    const/16 v7, 0x13

    invoke-direct {v5, p0, v6, v7}, Lbi2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    goto :goto_5b

    :cond_58
    move-object v5, v6

    goto :goto_5b

    :pswitch_5a
    move-object v5, v4

    :cond_5b
    :goto_5b
    if-eqz v5, :cond_1c

    move-object v4, v5

    :cond_5e
    if-eqz v4, :cond_64

    invoke-static {v4}, Lvml;->c(Ljava/lang/Runnable;)V

    goto :goto_8f

    :cond_64
    invoke-static {}, Li0l;->g()Z

    move-result p0

    if-eqz p0, :cond_9b

    const/4 p0, 0x2

    invoke-static {p0, p2}, Lfr3;->H(ILandroid/view/KeyEvent;)Z

    move-result p0

    const/16 p1, 0x2a

    if-eqz p0, :cond_82

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p0

    if-eq p0, p1, :cond_8f

    const/16 p1, 0x30

    if-eq p0, p1, :cond_8f

    const/16 p1, 0x33

    if-eq p0, p1, :cond_8f

    goto :goto_9b

    :cond_82
    const/4 p0, 0x6

    invoke-static {p0, p2}, Lfr3;->H(ILandroid/view/KeyEvent;)Z

    move-result p0

    if-eqz p0, :cond_9b

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p0

    if-ne p0, p1, :cond_9b

    :cond_8f
    :goto_8f
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return v2

    :cond_9b
    :goto_9b
    return v1

    :cond_9c
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result p0

    if-ne p0, v2, :cond_af

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_af
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_data_bc
    .packed-switch 0x1
        :pswitch_5a
        :pswitch_37
        :pswitch_5a
        :pswitch_5a
        :pswitch_5a
        :pswitch_5a
    .end packed-switch
.end method

.method public final m()Llak;
    .registers 1

    iget-object p0, p0, Lc37;->b:Ljava/lang/Object;

    check-cast p0, Lnak;

    return-object p0
.end method

.method public final n(Luc8;)[B
    .registers 5

    iget-object v0, p0, Lc37;->b:Ljava/lang/Object;

    check-cast v0, Ljava/io/DataOutputStream;

    iget-object p0, p0, Lc37;->a:Ljava/lang/Object;

    check-cast p0, Ljava/io/ByteArrayOutputStream;

    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->reset()V

    :try_start_b
    iget-object v1, p1, Luc8;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeByte(I)V

    iget-object v2, p1, Luc8;->b:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeByte(I)V

    iget-wide v1, p1, Luc8;->c:J

    invoke-virtual {v0, v1, v2}, Ljava/io/DataOutputStream;->writeLong(J)V

    iget-wide v1, p1, Luc8;->d:J

    invoke-virtual {v0, v1, v2}, Ljava/io/DataOutputStream;->writeLong(J)V

    iget-object p1, p1, Luc8;->e:[B

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {v0}, Ljava/io/DataOutputStream;->flush()V

    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0
    :try_end_32
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_32} :catch_33

    return-object p0

    :catch_33
    move-exception p0

    invoke-static {p0}, Lrqd;->p(Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final o(Lgk9;)Ljava/lang/CharSequence;
    .registers 2

    iget-object p0, p0, Lc37;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/live_score/LiveCommentaryService;

    iget-object p0, p0, Lcom/opera/android/live_score/LiveCommentaryService;->h:Ljava/lang/String;

    return-object p0
.end method

.method public final p(Ljava/lang/String;)Ljava/util/ArrayList;
    .registers 4

    sget-object v0, Le6i;->i:Ljava/util/TreeMap;

    const/4 v0, 0x1

    const-string v1, "SELECT work_spec_id FROM dependency WHERE prerequisite_id=?"

    invoke-static {v0, v1}, Laoh;->e(ILjava/lang/String;)Le6i;

    move-result-object v1

    invoke-virtual {v1, v0, p1}, Le6i;->w(ILjava/lang/String;)V

    iget-object p0, p0, Lc37;->a:Ljava/lang/Object;

    check-cast p0, Landroidx/work/impl/WorkDatabase_Impl;

    invoke-virtual {p0}, Ly5i;->b()V

    invoke-virtual {p0, v1}, Ly5i;->s(Lssk;)Landroid/database/Cursor;

    move-result-object p0

    :try_start_17
    new-instance p1, Ljava/util/ArrayList;

    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    :goto_20
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_2f

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2e
    .catchall {:try_start_17 .. :try_end_2e} :catchall_36

    goto :goto_20

    :cond_2f
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    invoke-virtual {v1}, Le6i;->release()V

    return-object p1

    :catchall_36
    move-exception p1

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    invoke-virtual {v1}, Le6i;->release()V

    throw p1
.end method

.method public final q(Lgk9;)Ljava/lang/CharSequence;
    .registers 2

    iget-object p0, p0, Lc37;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/live_score/LiveCommentaryService;

    iget-object p0, p0, Lcom/opera/android/live_score/LiveCommentaryService;->g:Ljava/lang/String;

    return-object p0
.end method

.method public final t(Lgk9;)Landroid/graphics/Bitmap;
    .registers 2

    iget-object p1, p0, Lc37;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/live_score/LiveCommentaryService;

    iget-object p1, p1, Lcom/opera/android/live_score/LiveCommentaryService;->e:Landroid/graphics/Bitmap;

    if-nez p1, :cond_13

    iget-object p0, p0, Lc37;->a:Ljava/lang/Object;

    check-cast p0, Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/graphics/Bitmap;

    return-object p0

    :cond_13
    return-object p1
.end method

.method public final u()Ltfd;
    .registers 1

    iget-object p0, p0, Lc37;->b:Ljava/lang/Object;

    check-cast p0, Lt0g;

    invoke-virtual {p0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltfd;

    return-object p0
.end method

.method public final v(I)Ljava/lang/String;
    .registers 5

    iget-object p0, p0, Lc37;->b:Ljava/lang/Object;

    check-cast p0, Li7f;

    new-instance v0, Lg7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Li7f;)V

    :cond_9
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    const/4 v1, 0x0

    if-eqz p0, :cond_36

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmv3;

    iget-object p0, p0, Lmv3;->a:Lcom/opera/android/BrowserActivity;

    iget-object v2, p0, Lcom/opera/android/BrowserActivity;->q1:Lvvb;

    invoke-virtual {v2, p1}, Lvvb;->b(I)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_22

    move-object v1, v2

    goto :goto_34

    :cond_22
    iget-object p0, p0, Lt5d;->u:Lpad;

    iget-object p0, p0, Lpad;->c:Ljava/lang/Object;

    check-cast p0, Ll24;

    if-eqz p0, :cond_34

    invoke-interface {p0}, Ll24;->b()Lvvb;

    move-result-object p0

    if-eqz p0, :cond_34

    invoke-virtual {p0, p1}, Lvvb;->b(I)Ljava/lang/String;

    move-result-object v1

    :cond_34
    :goto_34
    if-eqz v1, :cond_9

    :cond_36
    return-object v1
.end method

.method public final declared-synchronized w()Ljava/util/Map;
    .registers 3

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lc37;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/Map;

    if-nez v0, :cond_16

    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p0, Lc37;->a:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lc37;->b:Ljava/lang/Object;
    :try_end_16
    .catchall {:try_start_1 .. :try_end_16} :catchall_1a

    :cond_16
    monitor-exit p0

    return-object v0

    :goto_18
    :try_start_18
    monitor-exit p0
    :try_end_19
    .catchall {:try_start_18 .. :try_end_19} :catchall_1a

    throw v0

    :catchall_1a
    move-exception v0

    goto :goto_18
.end method

.method public final x(Landroid/content/Context;Ljava/lang/String;Lzkf;Lqhf;)V
    .registers 10

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v1, p0, Lc37;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-interface {p3}, Lzkf;->e()V

    return-void

    :cond_10
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iget-object v1, p0, Lc37;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    iget-object p0, p0, Lc37;->b:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/gms/ads/AdError;

    invoke-interface {p3, p0}, Lzkf;->d(Lcom/google/android/gms/ads/AdError;)V

    return-void

    :cond_24
    const-string v0, "initialize: Opera Ads SDK..."

    invoke-static {p4, v0}, Lc37;->y(Lqhf;Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/ads/MobileAds;->getVersion()Lcom/google/android/gms/ads/VersionInfo;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    invoke-static {}, Lqhf;->a()V

    invoke-static {}, Lcom/google/android/gms/ads/MobileAds;->getRequestConfiguration()Lcom/google/android/gms/ads/RequestConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/RequestConfiguration;->getTagForChildDirectedTreatment()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_48

    const/4 v2, 0x1

    if-eq v0, v2, :cond_43

    move-object v0, v1

    goto :goto_4d

    :cond_43
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_4d

    :cond_48
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    :goto_4d
    new-instance v2, Lc30;

    sget-object v3, Lkn;->a:[Lkn;

    invoke-static {}, Lcom/google/android/gms/ads/MobileAds;->getVersion()Lcom/google/android/gms/ads/VersionInfo;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/ads/VersionInfo;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x4

    invoke-direct {v2, v3, v4}, Lc30;-><init>(Ljava/lang/String;B)V

    new-instance v3, Lypi;

    invoke-direct {v3, p2, v1, v2, v0}, Lypi;-><init>(Ljava/lang/String;Ljava/lang/String;Lc30;Ljava/lang/Integer;)V

    new-instance p2, Lykf;

    invoke-direct {p2, p0, p4, p3}, Lykf;-><init>(Lc37;Lqhf;Lzkf;)V

    new-instance p0, Ljbd;

    const/16 p3, 0x9

    invoke-direct {p0, p1, v3, p2, p3}, Ljbd;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p0}, Lpfp;->c(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final z(Ljava/lang/String;)V
    .registers 3

    iget-object p0, p0, Lc37;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashMap;

    sget-object v0, Lc37;->c:Ljava/lang/Object;

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
