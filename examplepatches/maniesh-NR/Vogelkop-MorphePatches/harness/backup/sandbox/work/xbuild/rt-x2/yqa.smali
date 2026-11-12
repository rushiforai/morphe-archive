.class public final Lyqa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lxc2;
.implements Lmfa;
.implements Lssf;


# static fields
.field public static final d:[Ljava/lang/String;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    const-string v6, "language_code"

    const-string v7, "selected_state"

    const-string v0, "city_id"

    const-string v1, "name"

    const-string v2, "state"

    const-string v3, "zip_code"

    const-string v4, "origin"

    const-string v5, "country_code"

    filled-new-array/range {v0 .. v7}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lyqa;->d:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(B)V
    .registers 3

    iput-byte p1, p0, Lyqa;->a:B

    sparse-switch p1, :sswitch_data_62

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lyqa;->b:Ljava/lang/Object;

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lyqa;->c:Ljava/lang/Object;

    return-void

    :sswitch_17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lyqa;->b:Ljava/lang/Object;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lyqa;->c:Ljava/lang/Object;

    return-void

    :sswitch_29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Landroid/graphics/Point;

    const/high16 v0, -0x80000000

    invoke-direct {p1, v0, v0}, Landroid/graphics/Point;-><init>(II)V

    iput-object p1, p0, Lyqa;->b:Ljava/lang/Object;

    new-instance p1, Landroid/graphics/Point;

    invoke-direct {p1, v0, v0}, Landroid/graphics/Point;-><init>(II)V

    iput-object p1, p0, Lyqa;->c:Ljava/lang/Object;

    return-void

    :sswitch_3d
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

    :sswitch_41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyqa;->c:Ljava/lang/Object;

    return-void

    :sswitch_4c
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lyqa;->b:Ljava/lang/Object;

    return-void

    :sswitch_57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Li7f;

    invoke-direct {p1}, Li7f;-><init>()V

    iput-object p1, p0, Lyqa;->b:Ljava/lang/Object;

    return-void

    :sswitch_data_62
    .sparse-switch
        0xa -> :sswitch_57
        0xc -> :sswitch_4c
        0x12 -> :sswitch_41
        0x15 -> :sswitch_3d
        0x16 -> :sswitch_29
        0x1b -> :sswitch_17
    .end sparse-switch
.end method

.method public constructor <init>(Landroid/animation/Animator;)V
    .registers 3

    const/16 v0, 0x11

    iput-byte v0, p0, Lyqa;->a:B

    .line 164
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 165
    iput-object v0, p0, Lyqa;->b:Ljava/lang/Object;

    .line 166
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v0, p0, Lyqa;->c:Ljava/lang/Object;

    .line 167
    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;B)V
    .registers 3

    iput-byte p2, p0, Lyqa;->a:B

    packed-switch p2, :pswitch_data_2c

    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p1, :cond_c

    const/4 p1, 0x0

    goto :goto_10

    .line 131
    :cond_c
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    :goto_10
    iput-object p1, p0, Lyqa;->b:Ljava/lang/Object;

    return-void

    .line 132
    :pswitch_13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 133
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lyqa;->b:Ljava/lang/Object;

    .line 134
    new-instance p1, Ln9a;

    const/16 p2, 0x14

    .line 135
    invoke-direct {p1, p2}, Ln9a;-><init>(B)V

    .line 136
    new-instance p2, Lxq0;

    invoke-direct {p2, p1}, Lxq0;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lyqa;->c:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_2c
    .packed-switch 0x1d
        :pswitch_13
    .end packed-switch
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lyqa;->a:B

    .line 168
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 169
    new-instance v0, Li32;

    invoke-direct {v0, p0, p1, p2}, Li32;-><init>(Lyqa;Landroid/content/Context;Lumi;)V

    iput-object v0, p0, Lyqa;->b:Ljava/lang/Object;

    .line 170
    invoke-virtual {v0}, Lldk;->h()V

    return-void
.end method

.method public constructor <init>(Landroid/view/animation/Animation;)V
    .registers 3

    const/16 v0, 0x11

    iput-byte v0, p0, Lyqa;->a:B

    .line 161
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 162
    iput-object p1, p0, Lyqa;->b:Ljava/lang/Object;

    const/4 p1, 0x0

    .line 163
    iput-object p1, p0, Lyqa;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/widget/EditText;)V
    .registers 6

    const/16 v0, 0xe

    iput-byte v0, p0, Lyqa;->a:B

    .line 137
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 138
    iput-object p1, p0, Lyqa;->b:Ljava/lang/Object;

    .line 139
    new-instance v0, Ljz7;

    invoke-direct {v0, p1}, Ljz7;-><init>(Landroid/widget/EditText;)V

    iput-object v0, p0, Lyqa;->c:Ljava/lang/Object;

    .line 140
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 141
    sget-object p0, Lcy7;->b:Lcy7;

    if-nez p0, :cond_3a

    .line 142
    sget-object p0, Lcy7;->a:Ljava/lang/Object;

    monitor-enter p0

    .line 143
    :try_start_1a
    sget-object v0, Lcy7;->b:Lcy7;

    if-nez v0, :cond_34

    .line 144
    new-instance v0, Lcy7;

    .line 145
    invoke-direct {v0}, Landroid/text/Editable$Factory;-><init>()V
    :try_end_23
    .catchall {:try_start_1a .. :try_end_23} :catchall_38

    .line 146
    :try_start_23
    const-string v1, "android.text.DynamicLayout$ChangeWatcher"

    .line 147
    const-class v2, Lcy7;

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v1, v3, v2}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lcy7;->c:Ljava/lang/Class;
    :try_end_32
    .catchall {:try_start_23 .. :try_end_32} :catchall_32

    .line 148
    :catchall_32
    :try_start_32
    sput-object v0, Lcy7;->b:Lcy7;

    .line 149
    :cond_34
    monitor-exit p0

    goto :goto_3a

    :goto_36
    monitor-exit p0
    :try_end_37
    .catchall {:try_start_32 .. :try_end_37} :catchall_38

    throw p1

    :catchall_38
    move-exception p1

    goto :goto_36

    .line 150
    :cond_3a
    :goto_3a
    sget-object p0, Lcy7;->b:Lcy7;

    .line 151
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setEditableFactory(Landroid/text/Editable$Factory;)V

    return-void
.end method

.method public constructor <init>(Lb30;Leme;Lzxd;)V
    .registers 6

    const/16 p3, 0x17

    iput-byte p3, p0, Lyqa;->a:B

    .line 115
    new-instance p3, Ll45;

    new-instance v0, Lbpd;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lbpd;-><init>(B)V

    .line 116
    invoke-direct {p3}, Ljava/lang/Object;-><init>()V

    .line 117
    iput-object p2, p3, Ll45;->a:Ljava/lang/Object;

    .line 118
    iput-object v0, p3, Ll45;->b:Ljava/lang/Object;

    .line 119
    new-instance p2, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p2}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object p2, p3, Ll45;->c:Ljava/lang/Object;

    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 121
    iput-object p1, p0, Lyqa;->b:Ljava/lang/Object;

    .line 122
    iput-object p3, p0, Lyqa;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lbyg;)V
    .registers 4

    const/16 v0, 0x1b

    iput-byte v0, p0, Lyqa;->a:B

    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 124
    new-instance v0, Ljava/util/HashMap;

    .line 125
    iget-object v1, p1, Lbyg;->a:Ljava/util/HashMap;

    .line 126
    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lyqa;->b:Ljava/lang/Object;

    .line 127
    new-instance v0, Ljava/util/HashMap;

    .line 128
    iget-object p1, p1, Lbyg;->b:Ljava/util/HashMap;

    .line 129
    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lyqa;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;)V
    .registers 3

    const/4 v0, 0x7

    iput-byte v0, p0, Lyqa;->a:B

    .line 173
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 174
    iput-object p1, p0, Lyqa;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ldb;Landroid/content/Context;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Lyqa;->a:B

    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lyqa;->c:Ljava/lang/Object;

    .line 153
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lyqa;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 175
    iput-byte p3, p0, Lyqa;->a:B

    iput-object p1, p0, Lyqa;->b:Ljava/lang/Object;

    iput-object p2, p0, Lyqa;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 6

    const/16 v0, 0x9

    iput-byte v0, p0, Lyqa;->a:B

    .line 154
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 155
    iput-object p1, p0, Lyqa;->b:Ljava/lang/Object;

    if-nez p4, :cond_d

    const/4 p1, 0x0

    goto :goto_23

    .line 156
    :cond_d
    const-string p4, "pt-PT"

    const/4 v0, 0x1

    invoke-static {p2, p4, v0}, Lkotlin/text/StringsKt;->E(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result p2

    if-nez p2, :cond_21

    .line 157
    invoke-static {p3, p4, v0}, Lkotlin/text/StringsKt;->E(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result p2

    if-nez p2, :cond_21

    .line 158
    invoke-static {v0, p1}, Lszb;->d(ILjava/lang/String;)Lszb;

    move-result-object p1

    goto :goto_23

    .line 159
    :cond_21
    sget-object p1, Lszb;->i:Lszb;

    .line 160
    :goto_23
    iput-object p1, p0, Lyqa;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;Ljava/util/HashSet;)V
    .registers 4

    const/16 v0, 0x1a

    iput-byte v0, p0, Lyqa;->a:B

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lyqa;->b:Ljava/lang/Object;

    .line 114
    invoke-static {p2}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object p1

    iput-object p1, p0, Lyqa;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ln9a;Lqa0;)V
    .registers 4

    const/4 v0, 0x3

    iput-byte v0, p0, Lyqa;->a:B

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    iput-object p1, p0, Lyqa;->b:Ljava/lang/Object;

    .line 100
    iput-object p2, p0, Lyqa;->c:Ljava/lang/Object;

    .line 101
    new-instance p1, Lsa0;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lsa0;-><init>(Lyqa;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    .line 102
    new-instance p1, Lsa0;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lsa0;-><init>(Lyqa;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    .line 103
    new-instance p1, Lsa0;

    const/4 p2, 0x2

    invoke-direct {p1, p0, p2}, Lsa0;-><init>(Lyqa;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    .line 104
    new-instance p1, Lsa0;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p2}, Lsa0;-><init>(Lyqa;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    .line 105
    new-instance p1, Lsa0;

    const/4 p2, 0x4

    invoke-direct {p1, p0, p2}, Lsa0;-><init>(Lyqa;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    .line 106
    new-instance p1, Lsa0;

    const/4 p2, 0x5

    invoke-direct {p1, p0, p2}, Lsa0;-><init>(Lyqa;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    return-void
.end method

.method public constructor <init>(Lq15;Layd;Lesg;)V
    .registers 4

    const/4 p1, 0x6

    iput-byte p1, p0, Lyqa;->a:B

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 110
    iput-object p3, p0, Lyqa;->b:Ljava/lang/Object;

    .line 111
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object p1, p0, Lyqa;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Luqe;Llld;)V
    .registers 4

    const/16 v0, 0x18

    iput-byte v0, p0, Lyqa;->a:B

    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lyqa;->c:Ljava/lang/Object;

    .line 172
    iput-object p2, p0, Lyqa;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ly5i;)V
    .registers 3

    const/16 v0, 0x14

    iput-byte v0, p0, Lyqa;->a:B

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyqa;->b:Ljava/lang/Object;

    .line 108
    new-instance p1, Ljava/util/IdentityHashMap;

    invoke-direct {p1}, Ljava/util/IdentityHashMap;-><init>()V

    invoke-static {p1}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object p1

    iput-object p1, p0, Lyqa;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final H(Ljava/io/ByteArrayOutputStream;Lrsf;)V
    .registers 3

    check-cast p2, Lzwh;

    iget-object p0, p2, Lzwh;->b:Lw56;

    sget p2, Lxq0;->d:I

    new-instance p2, Ljava/io/DataOutputStream;

    invoke-direct {p2, p1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    const/4 p1, 0x2

    :try_start_c
    invoke-virtual {p2, p1}, Ljava/io/DataOutputStream;->writeByte(I)V

    invoke-static {p2, p0}, Lxq0;->f4(Ljava/io/DataOutputStream;Lw56;)V
    :try_end_12
    .catchall {:try_start_c .. :try_end_12} :catchall_16

    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V

    return-void

    :catchall_16
    move-exception p0

    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V

    throw p0
.end method

.method public final a(Lfr6;Ljava/lang/Throwable;Lmt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p3, Luqa;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, Luqa;

    iget v1, v0, Luqa;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Luqa;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Luqa;

    invoke-direct {v0, p0, p3}, Luqa;-><init>(Lyqa;Lmt5;)V

    :goto_18
    iget-object p0, v0, Luqa;->t:Ljava/lang/Object;

    sget-object p3, Lpx5;->a:Lpx5;

    iget v1, v0, Luqa;->v:I

    const/4 v2, 0x1

    if-eqz v1, :cond_2e

    if-ne v1, v2, :cond_27

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_6c

    :cond_27
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_2e
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    invoke-interface {p1}, Lnx5;->l()Lkotlin/coroutines/CoroutineContext;

    move-result-object p0

    invoke-static {p0}, Lo0g;->U(Lkotlin/coroutines/CoroutineContext;)Lunb;

    move-result-object p0

    check-cast p0, Lynb;

    if-nez p2, :cond_43

    sget-object p2, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p2}, Lxob;->j0(Ljava/lang/Object;)Z

    goto :goto_56

    :cond_43
    instance-of v1, p2, Ljava/util/concurrent/CancellationException;

    if-eqz v1, :cond_4d

    check-cast p2, Ljava/util/concurrent/CancellationException;

    invoke-virtual {p0, p2}, Lxob;->B(Ljava/lang/Object;)Z

    goto :goto_56

    :cond_4d
    const-string v1, "Exception occurred during request execution"

    invoke-static {v1, p2}, Lna2;->a(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/util/concurrent/CancellationException;

    move-result-object p2

    invoke-virtual {p0, p2}, Lxob;->B(Ljava/lang/Object;)Z

    :goto_56
    invoke-static {p1}, Lne7;->a(Lfr6;)Z

    move-result p2

    if-nez p2, :cond_63

    :try_start_5c
    invoke-virtual {p1}, Lfr6;->b()Ld44;

    move-result-object p1

    invoke-static {p1}, Lnb6;->g(Ld44;)V
    :try_end_63
    .catchall {:try_start_5c .. :try_end_63} :catchall_63

    :catchall_63
    :cond_63
    iput v2, v0, Luqa;->v:I

    invoke-virtual {p0, v0}, Lxob;->Z(Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p3, :cond_6c

    return-object p3

    :cond_6c
    :goto_6c
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final b()Lrsf;
    .registers 3

    new-instance v0, Lzwh;

    invoke-static {}, Ln9a;->o()Lw56;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lzwh;-><init>(Lyqa;Lw56;)V

    return-object v0
.end method

.method public final c(Lhz1;Lmt5;)Ljava/lang/Object;
    .registers 13

    instance-of v0, p2, Lvqa;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lvqa;

    iget v1, v0, Lvqa;->z:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lvqa;->z:I

    goto :goto_18

    :cond_13
    new-instance v0, Lvqa;

    invoke-direct {v0, p0, p2}, Lvqa;-><init>(Lyqa;Lmt5;)V

    :goto_18
    iget-object p2, v0, Lvqa;->x:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lvqa;->z:I

    const/4 v3, 0x5

    const/4 v4, 0x4

    const/4 v5, 0x3

    const/4 v6, 0x2

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-eqz v2, :cond_55

    if-eq v2, v7, :cond_4f

    if-eq v2, v6, :cond_47

    if-eq v2, v5, :cond_47

    if-eq v2, v4, :cond_41

    if-eq v2, v3, :cond_36

    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v8

    :cond_36
    iget-object p0, v0, Lvqa;->w:Ljava/lang/Throwable;

    iget-object p1, v0, Lvqa;->v:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Throwable;

    :try_start_3c
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_3f
    .catch Ljava/util/concurrent/CancellationException; {:try_start_3c .. :try_end_3f} :catch_bf

    goto/16 :goto_be

    :cond_41
    iget-object p0, v0, Lvqa;->v:Ljava/lang/Object;

    :try_start_43
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_46
    .catch Ljava/util/concurrent/CancellationException; {:try_start_43 .. :try_end_46} :catch_bf

    return-object p0

    :cond_47
    iget-object p1, v0, Lvqa;->u:Lfr6;

    :try_start_49
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_4c
    .catchall {:try_start_49 .. :try_end_4c} :catchall_4d

    goto :goto_97

    :catchall_4d
    move-exception p2

    goto :goto_aa

    :cond_4f
    iget-object p1, v0, Lvqa;->t:Lhz1;

    :try_start_51
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_54
    .catch Ljava/util/concurrent/CancellationException; {:try_start_51 .. :try_end_54} :catch_bf

    goto :goto_62

    :cond_55
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    :try_start_58
    iput-object p1, v0, Lvqa;->t:Lhz1;

    iput v7, v0, Lvqa;->z:I

    invoke-virtual {p0, v0}, Lyqa;->f(Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-eq p2, v1, :cond_bc

    :goto_62
    check-cast p2, Lfr6;
    :try_end_64
    .catch Ljava/util/concurrent/CancellationException; {:try_start_58 .. :try_end_64} :catch_bf

    :try_start_64
    sget-boolean v2, Lya7;->a:Z

    if-eqz v2, :cond_88

    invoke-interface {p2}, Lnx5;->l()Lkotlin/coroutines/CoroutineContext;

    move-result-object v2

    sget-object v5, Lkotlin/coroutines/d;->Hq:Lot5;

    invoke-interface {v2, v5}, Lkotlin/coroutines/CoroutineContext;->get(Lkotlin/coroutines/g;)Lkotlin/coroutines/CoroutineContext$Element;

    move-result-object v2

    check-cast v2, Lkotlin/coroutines/CoroutineContext;

    new-instance v5, Lfg6;

    const/16 v7, 0x19

    invoke-direct {v5, p1, p2, v8, v7}, Lfg6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput-object v8, v0, Lvqa;->t:Lhz1;

    iput-object p2, v0, Lvqa;->u:Lfr6;

    iput v6, v0, Lvqa;->z:I

    invoke-static {v2, v5, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_94

    goto :goto_bc

    :cond_88
    iput-object v8, v0, Lvqa;->t:Lhz1;

    iput-object p2, v0, Lvqa;->u:Lfr6;

    iput v5, v0, Lvqa;->z:I

    invoke-interface {p1, p2, v0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_92
    .catchall {:try_start_64 .. :try_end_92} :catchall_a6

    if-eq p1, v1, :cond_bc

    :cond_94
    move-object v9, p2

    move-object p2, p1

    move-object p1, v9

    :goto_97
    :try_start_97
    iput-object v8, v0, Lvqa;->t:Lhz1;

    iput-object v8, v0, Lvqa;->u:Lfr6;

    iput-object p2, v0, Lvqa;->v:Ljava/lang/Object;

    iput v4, v0, Lvqa;->z:I

    invoke-virtual {p0, p1, v8, v0}, Lyqa;->a(Lfr6;Ljava/lang/Throwable;Lmt5;)Ljava/lang/Object;

    move-result-object p0
    :try_end_a3
    .catch Ljava/util/concurrent/CancellationException; {:try_start_97 .. :try_end_a3} :catch_bf

    if-eq p0, v1, :cond_bc

    return-object p2

    :catchall_a6
    move-exception p1

    move-object v9, p2

    move-object p2, p1

    move-object p1, v9

    :goto_aa
    :try_start_aa
    throw p2
    :try_end_ab
    .catchall {:try_start_aa .. :try_end_ab} :catchall_ab

    :catchall_ab
    move-exception v2

    :try_start_ac
    iput-object v8, v0, Lvqa;->t:Lhz1;

    iput-object v8, v0, Lvqa;->u:Lfr6;

    iput-object v8, v0, Lvqa;->v:Ljava/lang/Object;

    iput-object v2, v0, Lvqa;->w:Ljava/lang/Throwable;

    iput v3, v0, Lvqa;->z:I

    invoke-virtual {p0, p1, p2, v0}, Lyqa;->a(Lfr6;Ljava/lang/Throwable;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_bd

    :cond_bc
    :goto_bc
    return-object v1

    :cond_bd
    move-object p0, v2

    :goto_be
    throw p0
    :try_end_bf
    .catch Ljava/util/concurrent/CancellationException; {:try_start_ac .. :try_end_bf} :catch_bf

    :catch_bf
    move-exception p0

    invoke-static {p0}, Li41;->r0(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object p0

    throw p0
.end method

.method public final call()Lcom/google/common/util/concurrent/ListenableFuture;
    .registers 4

    iget-object v0, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast v0, Lgg8;

    sget v1, Lgg8;->e:I

    sget-object v1, Lfg8;->a:Lfg8;

    sget-object v2, Lfg8;->c:Lfg8;

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b

    sget-object p0, Ln0b;->a:Ln0b;

    if-eqz p0, :cond_15

    return-object p0

    :cond_15
    new-instance p0, Ln0b;

    invoke-direct {p0}, Ln0b;-><init>()V

    return-object p0

    :cond_1b
    iget-object p0, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast p0, Lxc2;

    invoke-interface {p0}, Lxc2;->call()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object p0

    return-object p0
.end method

.method public final d(Lifa;Lefa;)Lv1g;
    .registers 5

    new-instance v0, Lz8b;

    iget-object v1, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast v1, Lhv5;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Llfa;

    invoke-direct {v1, p1, p2}, Llfa;-><init>(Lifa;Lefa;)V

    iget-object p0, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    invoke-direct {v0, v1, p0}, Lz8b;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method public final e(Lmt5;)Ljava/lang/Object;
    .registers 10

    instance-of v0, p1, Lwqa;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lwqa;

    iget v1, v0, Lwqa;->x:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lwqa;->x:I

    goto :goto_18

    :cond_13
    new-instance v0, Lwqa;

    invoke-direct {v0, p0, p1}, Lwqa;-><init>(Lyqa;Lmt5;)V

    :goto_18
    iget-object p1, v0, Lwqa;->v:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lwqa;->x:I

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v2, :cond_40

    if-eq v2, v5, :cond_3c

    if-eq v2, v4, :cond_36

    if-ne v2, v3, :cond_30

    iget-object p0, v0, Lwqa;->u:Lfr6;

    :try_start_2c
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_2f
    .catch Ljava/util/concurrent/CancellationException; {:try_start_2c .. :try_end_2f} :catch_86

    return-object p0

    :cond_30
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v6

    :cond_36
    iget-object v2, v0, Lwqa;->t:Ltna;

    :try_start_38
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_6c

    :cond_3c
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_3f
    .catch Ljava/util/concurrent/CancellationException; {:try_start_38 .. :try_end_3f} :catch_86

    goto :goto_5f

    :cond_40
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    :try_start_43
    new-instance p1, Lspa;

    invoke-direct {p1}, Lspa;-><init>()V

    iget-object v2, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast v2, Lspa;

    iget-object v7, v2, Lspa;->e:Lcsk;

    iput-object v7, p1, Lspa;->e:Lcsk;

    invoke-virtual {p1, v2}, Lspa;->b(Lspa;)V

    iget-object v2, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast v2, Lpna;

    iput v5, v0, Lwqa;->x:I

    invoke-virtual {v2, p1, v0}, Lpna;->h(Lspa;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_84

    :goto_5f
    move-object v2, p1

    check-cast v2, Ltna;

    iput-object v2, v0, Lwqa;->t:Ltna;

    iput v4, v0, Lwqa;->x:I

    invoke-static {v2, v0}, Locp;->o(Ltna;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_84

    :goto_6c
    check-cast p1, Ltna;

    iget-object p1, p1, Ltna;->c:Lfr6;

    if-nez p1, :cond_73

    move-object p1, v6

    :cond_73
    iget-object v2, v2, Ltna;->c:Lfr6;

    if-nez v2, :cond_78

    move-object v2, v6

    :cond_78
    iput-object v6, v0, Lwqa;->t:Ltna;

    iput-object p1, v0, Lwqa;->u:Lfr6;

    iput v3, v0, Lwqa;->x:I

    invoke-virtual {p0, v2, v6, v0}, Lyqa;->a(Lfr6;Ljava/lang/Throwable;Lmt5;)Ljava/lang/Object;

    move-result-object p0
    :try_end_82
    .catch Ljava/util/concurrent/CancellationException; {:try_start_43 .. :try_end_82} :catch_86

    if-ne p0, v1, :cond_85

    :cond_84
    return-object v1

    :cond_85
    return-object p1

    :catch_86
    move-exception p0

    invoke-static {p0}, Li41;->r0(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object p0

    throw p0
.end method

.method public final f(Lmt5;)Ljava/lang/Object;
    .registers 9

    instance-of v0, p1, Lxqa;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lxqa;

    iget v1, v0, Lxqa;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lxqa;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lxqa;

    invoke-direct {v0, p0, p1}, Lxqa;-><init>(Lyqa;Lmt5;)V

    :goto_18
    iget-object p1, v0, Lxqa;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lxqa;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v4, :cond_28

    :try_start_24
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_27
    .catch Ljava/util/concurrent/CancellationException; {:try_start_24 .. :try_end_27} :catch_61

    goto :goto_59

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_2e
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    :try_start_31
    new-instance p1, Lspa;

    invoke-direct {p1}, Lspa;-><init>()V

    iget-object v2, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast v2, Lspa;

    iget-object v5, v2, Lspa;->e:Lcsk;

    iput-object v5, p1, Lspa;->e:Lcsk;

    invoke-virtual {p1, v2}, Lspa;->b(Lspa;)V

    sget-object v2, Lne7;->a:Ljf2;

    iget-object v2, p1, Lspa;->f:Lpj5;

    sget-object v5, Lne7;->a:Ljf2;

    sget-object v6, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v2, v5, v6}, Lpj5;->f(Ljf2;Ljava/lang/Object;)V

    iget-object p0, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast p0, Lpna;

    iput v4, v0, Lxqa;->v:I

    invoke-virtual {p0, p1, v0}, Lpna;->h(Lspa;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_59

    return-object v1

    :cond_59
    :goto_59
    check-cast p1, Ltna;

    iget-object p0, p1, Ltna;->c:Lfr6;
    :try_end_5d
    .catch Ljava/util/concurrent/CancellationException; {:try_start_31 .. :try_end_5d} :catch_61

    if-eqz p0, :cond_60

    return-object p0

    :cond_60
    return-object v3

    :catch_61
    move-exception p0

    invoke-static {p0}, Li41;->r0(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object p0

    throw p0
.end method

.method public final g(Lpf2;Loj9;)Lrg2;
    .registers 8

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p2, Loj9;->G:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_e

    sget-object p0, Lrg2;->d:Lrg2;

    return-object p0

    :cond_e
    iget-object v1, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    iget-object v2, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Boolean;

    const/4 v3, 0x1

    if-eqz v2, :cond_1e

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    goto :goto_46

    :cond_1e
    if-eqz v1, :cond_3e

    invoke-static {v1}, Lscd;->E(Landroid/content/Context;)Landroid/media/AudioManager;

    move-result-object v1

    const-string v2, "offloadVariableRateSupported"

    invoke-virtual {v1, v2}, Landroid/media/AudioManager;->getParameters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_36

    const-string v2, "offloadVariableRateSupported=1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_36

    move v1, v3

    goto :goto_37

    :cond_36
    const/4 v1, 0x0

    :goto_37
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lyqa;->c:Ljava/lang/Object;

    goto :goto_42

    :cond_3e
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v1, p0, Lyqa;->c:Ljava/lang/Object;

    :goto_42
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    :goto_46
    iget-object v1, p2, Loj9;->n:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, p2, Loj9;->k:Ljava/lang/String;

    invoke-static {v1, v2}, Ldzd;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_a6

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v1}, Ltym;->q(I)I

    move-result v4

    if-lt v2, v4, :cond_a6

    iget p2, p2, Loj9;->F:I

    invoke-static {p2}, Ltym;->r(I)I

    move-result p2

    if-nez p2, :cond_66

    sget-object p0, Lrg2;->d:Lrg2;

    return-object p0

    :cond_66
    :try_start_66
    new-instance v4, Landroid/media/AudioFormat$Builder;

    invoke-direct {v4}, Landroid/media/AudioFormat$Builder;-><init>()V

    invoke-virtual {v4, v0}, Landroid/media/AudioFormat$Builder;->setSampleRate(I)Landroid/media/AudioFormat$Builder;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/media/AudioFormat$Builder;->setChannelMask(I)Landroid/media/AudioFormat$Builder;

    move-result-object p2

    invoke-virtual {p2, v1}, Landroid/media/AudioFormat$Builder;->setEncoding(I)Landroid/media/AudioFormat$Builder;

    move-result-object p2

    invoke-virtual {p2}, Landroid/media/AudioFormat$Builder;->build()Landroid/media/AudioFormat;

    move-result-object p2
    :try_end_7b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_66 .. :try_end_7b} :catch_a3

    const/16 v0, 0x1f

    if-lt v2, v0, :cond_88

    invoke-virtual {p1}, Lpf2;->b()Landroid/media/AudioAttributes;

    move-result-object p1

    invoke-static {p2, p1, p0}, Lm41;->r(Landroid/media/AudioFormat;Landroid/media/AudioAttributes;Z)Lrg2;

    move-result-object p0

    return-object p0

    :cond_88
    invoke-virtual {p1}, Lpf2;->b()Landroid/media/AudioAttributes;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/media/AudioManager;->isOffloadedPlaybackSupported(Landroid/media/AudioFormat;Landroid/media/AudioAttributes;)Z

    move-result p1

    if-nez p1, :cond_95

    sget-object p0, Lrg2;->d:Lrg2;

    return-object p0

    :cond_95
    new-instance p1, Lukh;

    invoke-direct {p1, v3}, Lukh;-><init>(B)V

    iput-boolean v3, p1, Lukh;->b:Z

    iput-boolean p0, p1, Lukh;->d:Z

    invoke-virtual {p1}, Lukh;->a()Lrg2;

    move-result-object p0

    return-object p0

    :catch_a3
    sget-object p0, Lrg2;->d:Lrg2;

    return-object p0

    :cond_a6
    sget-object p0, Lrg2;->d:Lrg2;

    return-object p0
.end method

.method public final h(Ljava/lang/String;)Lrxd;
    .registers 8

    const-string v0, "Failed to read file "

    iget-object v1, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6f

    monitor-enter p0

    :try_start_d
    iget-object v1, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1
    :try_end_15
    .catchall {:try_start_d .. :try_end_15} :catchall_6d

    if-eqz v1, :cond_19

    monitor-exit p0

    goto :goto_6f

    :cond_19
    :try_start_19
    invoke-static {p1}, Lq15;->a(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    invoke-static {v1}, Layd;->a(Ljava/io/InputStream;)Ljava/util/List;

    move-result-object v0
    :try_end_21
    .catch Ljava/lang/IllegalArgumentException; {:try_start_19 .. :try_end_21} :catch_60
    .catch Ljava/lang/IllegalStateException; {:try_start_19 .. :try_end_21} :catch_60
    .catchall {:try_start_19 .. :try_end_21} :catchall_6d

    :try_start_21
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_25
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_57

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lvdg;

    iget-object v2, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast v2, Lesg;

    iget-object v3, v2, Lesg;->c:Ljava/lang/Object;

    check-cast v3, Li16;

    iget-object v4, v3, Li16;->c:Ljava/lang/Object;

    check-cast v4, Lp9d;

    invoke-interface {v4, v1}, Lp9d;->t(Lvdg;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string v5, "001"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4f

    invoke-virtual {v3, v1}, Li16;->b(Lvdg;)V

    goto :goto_25

    :cond_4f
    iget-object v2, v2, Lesg;->b:Ljava/lang/Object;

    check-cast v2, Li16;

    invoke-virtual {v2, v1}, Li16;->b(Lvdg;)V

    goto :goto_25

    :cond_57
    iget-object v0, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5e
    .catchall {:try_start_21 .. :try_end_5e} :catchall_6d

    monitor-exit p0

    goto :goto_6f

    :catch_60
    move-exception v1

    :try_start_61
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    :goto_6b
    monitor-exit p0
    :try_end_6c
    .catchall {:try_start_61 .. :try_end_6c} :catchall_6d

    throw p1

    :catchall_6d
    move-exception p1

    goto :goto_6b

    :cond_6f
    :goto_6f
    iget-object p0, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast p0, Lesg;

    return-object p0
.end method

.method public final i(Lqo7;Z)V
    .registers 5

    iget-boolean v0, p1, Lqo7;->g:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    if-eqz p2, :cond_a

    sget-object p2, Lj70;->b:Lj70;

    goto :goto_c

    :cond_a
    sget-object p2, Lj70;->c:Lj70;

    :goto_c
    iget-object p0, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast p0, Lesk;

    invoke-interface {p0}, Lesk;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Losf;

    iget-object p1, p1, Lqo7;->a:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ljkc;

    const/16 v1, 0x1c

    invoke-direct {v0, p1, p2, v1}, Ljkc;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Losf;->a(Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final j(Ldl5;)V
    .registers 4

    iget-object v0, p1, Ldl5;->b:Lva2;

    iget-object v1, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast v1, La4g;

    invoke-virtual {v0, v1}, Lva2;->l(La4g;)V

    iget-object v0, p1, Ldl5;->a:Lndc;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    new-instance v1, Ljp3;

    invoke-direct {v1, p0, v0, p1}, Ljp3;-><init>(Lyqa;Ltcc;Ldl5;)V

    invoke-virtual {v0, v1}, Ltcc;->a(Lmdc;)V

    check-cast v0, Lqdc;

    iget-object v0, v0, Lqdc;->i:Lqcc;

    sget-object v1, Lqcc;->a:Lqcc;

    if-eq v0, v1, :cond_26

    iget-object p0, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast p0, Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    :cond_26
    return-void
.end method

.method public final k()Lv1g;
    .registers 3

    new-instance v0, Lz8b;

    iget-object v1, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast v1, Lhv5;

    invoke-virtual {v1}, Lhv5;->k()Lv1g;

    move-result-object v1

    iget-object p0, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    invoke-direct {v0, v1, p0}, Lz8b;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method public final l(Ljava/lang/Exception;Z)V
    .registers 5

    const/4 v0, 0x0

    iput-object v0, p0, Lyqa;->c:Ljava/lang/Object;

    iget-object p0, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashSet;

    invoke-static {p0}, Lh1b;->s(Ljava/util/Collection;)Lh1b;

    move-result-object v0

    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Lh1b;->u(I)La1b;

    move-result-object p0

    :goto_13
    invoke-virtual {p0}, Lq4;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2b

    invoke-virtual {p0}, Lq4;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltn6;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p2, :cond_26

    const/4 v1, 0x1

    goto :goto_27

    :cond_26
    const/4 v1, 0x3

    :goto_27
    invoke-virtual {v0, v1, p1}, Ltn6;->i(ILjava/lang/Throwable;)V

    goto :goto_13

    :cond_2b
    return-void
.end method

.method public final m()V
    .registers 3

    iget-object v0, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    sget-object v1, Ljh0;->b:Ljh0;

    invoke-virtual {v0, v1}, Lx5f;->b0(Ljh0;)V

    iget-object p0, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast p0, Ldb;

    iget-object v0, p0, Ldb;->e:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_21
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_31

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcb;

    invoke-virtual {v1}, Lcb;->b()V

    goto :goto_21

    :cond_31
    const/4 v0, 0x0

    iput-object v0, p0, Ldb;->d:Ljh0;

    iget-object v1, p0, Ldb;->f:Ln1;

    if-eqz v1, :cond_3f

    iget-object v1, v1, Ln1;->b:Ljava/lang/Object;

    check-cast v1, Lwjh;

    invoke-virtual {v1, v0}, Lwjh;->t(Ljava/lang/CharSequence;)V

    :cond_3f
    iput-object v0, p0, Ldb;->g:Ljava/lang/String;

    return-void
.end method

.method public final n(Ltn6;)V
    .registers 9

    iget-object v0, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast v0, Ltn6;

    if-eqz v0, :cond_e

    return-void

    :cond_e
    iput-object p1, p0, Lyqa;->c:Ljava/lang/Object;

    iget-object p0, p1, Ltn6;->b:Lyh8;

    invoke-interface {p0}, Lyh8;->getProvisionRequest()Lxh8;

    move-result-object v1

    iput-object v1, p1, Ltn6;->z:Lxh8;

    iget-object p0, p1, Ltn6;->s:Lrn6;

    sget-object p1, Ltym;->a:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lsn6;

    sget-object p1, Lbsc;->g:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    move-result-wide v2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    const/4 v6, 0x1

    invoke-direct/range {v0 .. v6}, Lsn6;-><init>(Ljava/lang/Object;JJZ)V

    invoke-virtual {p0, v6, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p0

    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    return-void
.end method

.method public final o(Lvxg;)V
    .registers 5

    iget-object p0, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    if-eqz p1, :cond_2e

    new-instance v0, Layg;

    iget-object v1, p1, Lvxg;->a:Ljava/lang/Class;

    iget-object v2, p1, Lvxg;->b:Ljava/lang/Class;

    invoke-direct {v0, v1, v2}, Layg;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2a

    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvxg;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_24

    if-ne p1, p0, :cond_24

    return-void

    :cond_24
    const-string p0, "Attempt to register non-equal PrimitiveConstructor object for already existing object of type: "

    invoke-static {v0, p0}, Lpza;->n(Ljava/lang/Object;Ljava/lang/String;)V

    return-void

    :cond_2a
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_2e
    const-string p0, "primitive constructor must be non-null"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final p(Le20;)V
    .registers 4

    iget-object p0, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    iget-byte v0, p1, Le20;->a:B

    packed-switch v0, :pswitch_data_3a

    const-class v0, Lk9h;

    goto :goto_17

    :pswitch_c
    const-class v0, Li9h;

    goto :goto_17

    :pswitch_f
    const-class v0, Lhxg;

    goto :goto_17

    :pswitch_12
    const-class v0, Lc05;

    goto :goto_17

    :pswitch_15
    const-class v0, Lz10;

    :goto_17
    invoke-virtual {p0, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_36

    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le20;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_30

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_30

    return-void

    :cond_30
    const-string p0, "Attempt to register non-equal PrimitiveWrapper object or input class object for already existing object of type"

    invoke-static {v0, p0}, Lpza;->n(Ljava/lang/Object;Ljava/lang/String;)V

    return-void

    :cond_36
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_15
        :pswitch_12
        :pswitch_f
        :pswitch_c
    .end packed-switch
.end method

.method public final q(La4g;)V
    .registers 5

    iget-object v0, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast v0, La4g;

    if-eq v0, p1, :cond_39

    iput-object p1, p0, Lyqa;->c:Ljava/lang/Object;

    iget-object p1, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast p1, Li7f;

    new-instance v0, Lg7f;

    invoke-direct {v0, p1}, Lg7f;-><init>(Li7f;)V

    :cond_11
    :goto_11
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_39

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldl5;

    iget-object v1, p1, Ldl5;->a:Lndc;

    invoke-interface {v1}, Lndc;->getLifecycle()Ltcc;

    move-result-object v1

    check-cast v1, Lqdc;

    iget-object v1, v1, Lqdc;->i:Lqcc;

    sget-object v2, Lqcc;->c:Lqcc;

    invoke-virtual {v1, v2}, Lqcc;->d(Lqcc;)Z

    move-result v1

    if-eqz v1, :cond_11

    iget-object p1, p1, Ldl5;->b:Lva2;

    iget-object v1, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast v1, La4g;

    invoke-virtual {p1, v1}, Lva2;->l(La4g;)V

    goto :goto_11

    :cond_39
    return-void
.end method

.method public final r(Landroid/content/Context;)V
    .registers 5

    iget-object v0, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast v0, Lx77;

    if-nez v0, :cond_7

    return-void

    :cond_7
    new-instance v0, Ldvc;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object v1

    iget-object v2, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast v2, Lx77;

    invoke-direct {v0, v1, v2, p0}, Ldvc;-><init>(Lfqe;Lx77;Lyqa;)V

    const/16 p0, 0x1003

    invoke-static {v0, p0}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p0

    const-string v0, "com.opera.android.ui.FRAGMENT_CONTROLLER_SERVICE"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lll9;

    invoke-virtual {p1, p0}, Lll9;->b(Lzhj;)V

    return-void
.end method

.method public final s(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;
    .registers 11

    const-string v0, "sender"

    invoke-virtual {p1, v0, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "subscription"

    invoke-virtual {p1, v0, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "subtype"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_17

    const-string v0, "subtype"

    invoke-virtual {p1, v0, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_17
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    const/4 v1, 0x0

    if-eq p2, v0, :cond_b8

    const-string p2, "com.google.android.gms"

    const/4 v0, 0x0

    invoke-static {p2, v0}, Lcs5;->K(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p2

    if-eqz p2, :cond_b2

    new-instance p2, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {p2}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    new-instance v2, Lue2;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, p0, v3, p2}, Lue2;-><init>(Lyqa;Landroid/os/Looper;Ljava/util/concurrent/LinkedBlockingQueue;)V

    new-instance v3, Landroid/os/Messenger;

    invoke-direct {v3, v2}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    new-instance v2, Landroid/content/Intent;

    const-string v4, "com.google.android.c2dm.intent.REGISTER"

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v4, "com.google.android.gms"

    invoke-virtual {v2, v4}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v4, p0, Lyqa;->c:Ljava/lang/Object;

    monitor-enter v4

    :try_start_4d
    iget-object v5, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast v5, Landroid/app/PendingIntent;

    if-nez v5, :cond_67

    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5}, Landroid/content/Intent;-><init>()V

    const-string v6, "com.google.example.invalidpackage"

    invoke-virtual {v5, v6}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    sget-object v6, Lt8;->a:Landroid/content/Context;

    const/high16 v7, 0x4000000

    invoke-static {v6, v0, v5, v7}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v5

    iput-object v5, p0, Lyqa;->b:Ljava/lang/Object;

    :cond_67
    monitor-exit v4
    :try_end_68
    .catchall {:try_start_4d .. :try_end_68} :catchall_b0

    const-string p0, "app"

    invoke-virtual {v2, p0, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    invoke-virtual {v2, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    const-string p0, "google.messenger"

    invoke-virtual {v2, p0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    sget-object p0, Lt8;->a:Landroid/content/Context;

    invoke-virtual {p0, v2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    :try_start_7a
    sget-object p0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x1388

    invoke-virtual {p2, v2, v3, p0}, Ljava/util/concurrent/LinkedBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/Intent;
    :try_end_84
    .catch Ljava/lang/InterruptedException; {:try_start_7a .. :try_end_84} :catch_a5

    if-eqz p0, :cond_9f

    const-string p1, "registration_id"

    invoke-virtual {p0, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_9e

    const-string p1, "error"

    invoke-virtual {p0, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/io/IOException;

    if-nez p0, :cond_9a

    const-string p0, "SERVICE_NOT_AVAILABLE"

    :cond_9a
    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_9e
    return-object p1

    :cond_9f
    const-string p0, "SERVICE_NOT_AVAILABLE"

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    return-object v1

    :catch_a5
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    return-object v1

    :goto_ae
    :try_start_ae
    monitor-exit v4
    :try_end_af
    .catchall {:try_start_ae .. :try_end_af} :catchall_b0

    throw p0

    :catchall_b0
    move-exception p0

    goto :goto_ae

    :cond_b2
    const-string p0, "Google Play Services missing"

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    return-object v1

    :cond_b8
    const-string p0, "MAIN_THREAD"

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    return-object v1
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    iget-byte v0, p0, Lyqa;->a:B

    sparse-switch v0, :sswitch_data_2e

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_a
    iget-object p0, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast p0, Lxc2;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_13
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "HttpStatement["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast p0, Lspa;

    iget-object p0, p0, Lspa;->a:Ltgm;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p0, 0x5d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :sswitch_data_2e
    .sparse-switch
        0x0 -> :sswitch_13
        0xf -> :sswitch_a
    .end sparse-switch
.end method

.method public final v(Ljava/io/ByteArrayInputStream;)Lrsf;
    .registers 5

    invoke-static {}, Ln9a;->o()Lw56;

    move-result-object v0

    iget-object v1, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast v1, Lxq0;

    new-instance v2, Ljava/io/DataInputStream;

    invoke-direct {v2, p1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    :try_start_d
    invoke-virtual {v1, v2}, Lxq0;->K2(Ljava/io/DataInputStream;)V

    invoke-virtual {v2}, Ljava/io/DataInputStream;->readShort()S

    move-result p1

    invoke-virtual {v1, v2, v0, p1}, Lxq0;->a1(Ljava/io/DataInputStream;Lw56;I)V
    :try_end_17
    .catchall {:try_start_d .. :try_end_17} :catchall_20

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    new-instance p1, Lzwh;

    invoke-direct {p1, p0, v0}, Lzwh;-><init>(Lyqa;Lw56;)V

    return-object p1

    :catchall_20
    move-exception p0

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    throw p0
.end method
