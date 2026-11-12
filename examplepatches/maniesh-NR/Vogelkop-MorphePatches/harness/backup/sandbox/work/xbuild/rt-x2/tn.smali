.class public final Ltn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljs5;
.implements Lycl;
.implements Loeb;
.implements Lgm;
.implements Lxl2;
.implements Lp9g;


# instance fields
.field public a:Z

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 3

    sparse-switch p1, :sswitch_data_4e

    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 143
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Ltn;->c:Ljava/lang/Object;

    .line 144
    new-instance p1, Lole;

    invoke-direct {p1, p0}, Lole;-><init>(Ljava/lang/Object;)V

    const/4 v0, 0x0

    .line 145
    iput-boolean v0, p0, Ltn;->a:Z

    .line 146
    new-instance v0, Lpc3;

    invoke-direct {v0, p1}, Lpc3;-><init>(Lole;)V

    iput-object v0, p0, Ltn;->b:Ljava/lang/Object;

    return-void

    .line 147
    :sswitch_1d
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 148
    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 149
    iput-object p1, p0, Ltn;->b:Ljava/lang/Object;

    .line 150
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Ltn;->c:Ljava/lang/Object;

    .line 151
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Ltn;->d:Ljava/lang/Object;

    const/4 p1, 0x1

    .line 152
    iput-boolean p1, p0, Ltn;->a:Z

    return-void

    .line 153
    :sswitch_39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 p1, 0x10

    .line 154
    new-array v0, p1, [F

    iput-object v0, p0, Ltn;->b:Ljava/lang/Object;

    .line 155
    new-array p1, p1, [F

    iput-object p1, p0, Ltn;->c:Ljava/lang/Object;

    .line 156
    new-instance p1, Li1;

    invoke-direct {p1}, Li1;-><init>()V

    iput-object p1, p0, Ltn;->d:Ljava/lang/Object;

    return-void

    :sswitch_data_4e
    .sparse-switch
        0xd -> :sswitch_39
        0x11 -> :sswitch_1d
    .end sparse-switch
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;Landroid/os/Looper;Lmi8;)V
    .registers 7

    .line 163
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 164
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Ltn;->b:Ljava/lang/Object;

    .line 165
    new-instance p1, Lszk;

    new-instance v0, Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-direct {v0, p2, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    invoke-direct {p1, v0}, Lszk;-><init>(Landroid/os/Handler;)V

    .line 166
    iput-object p1, p0, Ltn;->d:Ljava/lang/Object;

    .line 167
    new-instance p1, Lqf2;

    .line 168
    new-instance p2, Lszk;

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0, p3, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    invoke-direct {p2, v0}, Lszk;-><init>(Landroid/os/Handler;)V

    .line 169
    invoke-direct {p1, p0, p2, p4}, Lqf2;-><init>(Ltn;Lszk;Lmi8;)V

    .line 170
    iput-object p1, p0, Ltn;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/nfc/tech/TagTechnology;Lbwe;[B)V
    .registers 7

    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 172
    iput-object p1, p0, Ltn;->b:Ljava/lang/Object;

    .line 173
    iput-object p2, p0, Ltn;->c:Ljava/lang/Object;

    .line 174
    array-length p1, p3

    if-gez p1, :cond_c

    const/4 p1, 0x0

    goto :goto_3f

    .line 175
    :cond_c
    new-instance p1, Ljava/lang/StringBuilder;

    array-length p2, p3

    mul-int/lit8 p2, p2, 0x3

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 176
    array-length p2, p3

    const/4 v0, 0x0

    :goto_16
    if-ge v0, p2, :cond_3b

    aget-byte v1, p3, v0

    .line 177
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_25

    .line 178
    const-string v2, ":"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_25
    and-int/lit16 v1, v1, 0xff

    .line 179
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "%02x"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_16

    .line 180
    :cond_3b
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 181
    :goto_3f
    iput-object p1, p0, Ltn;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcx7;Z)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltn;->b:Ljava/lang/Object;

    const/4 v0, 0x0

    const/4 v1, 0x0

    if-eqz p2, :cond_6f

    new-instance p2, Lmf2;

    iget-object p1, p1, Lcx7;->g:Lmf2;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    iget-object v2, p2, Lmf2;->b:[Ljava/lang/String;

    if-eqz v2, :cond_22

    move v2, v1

    :goto_15
    iget v3, p2, Lmf2;->a:I

    mul-int/lit8 v3, v3, 0x5

    if-ge v2, v3, :cond_22

    iget-object v3, p2, Lmf2;->b:[Ljava/lang/String;

    aput-object v0, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_15

    :cond_22
    iput v1, p2, Lmf2;->a:I

    invoke-virtual {p1}, Lmf2;->getLength()I

    move-result v2

    iput v2, p2, Lmf2;->a:I

    if-lez v2, :cond_6c

    mul-int/lit8 v2, v2, 0x5

    new-array v2, v2, [Ljava/lang/String;

    iput-object v2, p2, Lmf2;->b:[Ljava/lang/String;

    move v2, v1

    :goto_33
    iget v3, p2, Lmf2;->a:I

    if-ge v2, v3, :cond_6c

    iget-object v3, p2, Lmf2;->b:[Ljava/lang/String;

    mul-int/lit8 v4, v2, 0x5

    invoke-virtual {p1, v2}, Lmf2;->getURI(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    iget-object v3, p2, Lmf2;->b:[Ljava/lang/String;

    add-int/lit8 v5, v4, 0x1

    invoke-virtual {p1, v2}, Lmf2;->getLocalName(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v3, v5

    iget-object v3, p2, Lmf2;->b:[Ljava/lang/String;

    add-int/lit8 v5, v4, 0x2

    invoke-virtual {p1, v2}, Lmf2;->getQName(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v3, v5

    iget-object v3, p2, Lmf2;->b:[Ljava/lang/String;

    add-int/lit8 v5, v4, 0x3

    invoke-virtual {p1, v2}, Lmf2;->getType(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v3, v5

    iget-object v3, p2, Lmf2;->b:[Ljava/lang/String;

    add-int/lit8 v4, v4, 0x4

    invoke-virtual {p1, v2}, Lmf2;->getValue(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_33

    :cond_6c
    iput-object p2, p0, Ltn;->c:Ljava/lang/Object;

    goto :goto_76

    :cond_6f
    new-instance p1, Lmf2;

    invoke-direct {p1}, Lmf2;-><init>()V

    iput-object p1, p0, Ltn;->c:Ljava/lang/Object;

    :goto_76
    iput-object v0, p0, Ltn;->d:Ljava/lang/Object;

    iput-boolean v1, p0, Ltn;->a:Z

    return-void
.end method

.method public constructor <init>(Lea7;Laa7;)V
    .registers 3

    .line 184
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltn;->d:Ljava/lang/Object;

    .line 185
    iput-object p2, p0, Ltn;->b:Ljava/lang/Object;

    .line 186
    iget-boolean p2, p2, Laa7;->e:Z

    if-eqz p2, :cond_d

    const/4 p1, 0x0

    goto :goto_11

    .line 187
    :cond_d
    iget-boolean p1, p1, Lea7;->g:Z

    .line 188
    new-array p1, p1, [Z

    :goto_11
    iput-object p1, p0, Ltn;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lfa7;Lba7;)V
    .registers 3

    .line 182
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltn;->d:Ljava/lang/Object;

    iput-object p2, p0, Ltn;->b:Ljava/lang/Object;

    const/4 p1, 0x2

    .line 183
    new-array p1, p1, [Z

    iput-object p1, p0, Ltn;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;)V
    .registers 37

    move-object/from16 v0, p0

    .line 157
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 158
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Ltn;->b:Ljava/lang/Object;

    .line 159
    new-instance v2, Lh5o;

    iget-object v1, v0, Ltn;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/UUID;

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    const/16 v17, 0x0

    const/16 v27, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-wide/16 v9, 0x0

    const-wide/16 v11, 0x0

    const-wide/16 v13, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const-wide/16 v18, 0x0

    const-wide/16 v20, 0x0

    const-wide/16 v22, 0x0

    const-wide/16 v24, 0x0

    const/16 v26, 0x0

    const/16 v28, 0x0

    const-wide/16 v29, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v33, 0x0

    const v34, 0xfffffa

    .line 160
    invoke-direct/range {v2 .. v34}, Lh5o;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lib6;Lib6;JJJLxo5;IIJJJJZIIJIILjava/lang/String;I)V

    .line 161
    iput-object v2, v0, Ltn;->c:Ljava/lang/Object;

    .line 162
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, La5j;->b([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    iput-object v1, v0, Ltn;->d:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4

    .line 133
    iput-object p2, p0, Ltn;->b:Ljava/lang/Object;

    iput-object p3, p0, Ltn;->c:Ljava/lang/Object;

    iput-object p1, p0, Ltn;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Runnable;)V
    .registers 4

    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 135
    new-instance v0, Ls03;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Ls03;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Ltn;->b:Ljava/lang/Object;

    .line 136
    iput-object p1, p0, Ltn;->d:Ljava/lang/Object;

    .line 137
    iget-object p1, p0, Ltn;->c:Ljava/lang/Object;

    check-cast p1, Ls03;

    if-nez p1, :cond_1a

    .line 138
    iput-object v0, p0, Ltn;->c:Ljava/lang/Object;

    const-wide/16 p0, 0x4e20

    .line 139
    invoke-static {v0, p0, p1}, Lvml;->d(Ljava/lang/Runnable;J)V

    .line 140
    :cond_1a
    sget-object p0, Lcak;->d:Lavj;

    const/4 p0, 0x4

    .line 141
    invoke-static {p0, v0}, Lavj;->g(ILjava/lang/Runnable;)V

    return-void
.end method

.method public constructor <init>(Lkze;Lt1;Lumi;Lndc;)V
    .registers 5

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 125
    iput-object p2, p0, Ltn;->b:Ljava/lang/Object;

    .line 126
    iput-object p3, p0, Ltn;->c:Ljava/lang/Object;

    .line 127
    new-instance p2, Ly73;

    .line 128
    invoke-direct {p2}, Ly73;-><init>()V

    .line 129
    invoke-interface {p4}, Lndc;->getLifecycle()Ltcc;

    move-result-object p3

    invoke-virtual {p3, p2}, Ltcc;->a(Lmdc;)V

    .line 130
    iput-object p2, p0, Ltn;->d:Ljava/lang/Object;

    .line 131
    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    iput-boolean p2, p0, Ltn;->a:Z

    .line 132
    new-instance p2, Lwg5;

    const/16 p3, 0xe

    invoke-direct {p2, p0, p3}, Lwg5;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lcl4;

    const/16 p3, 0xa

    invoke-direct {p0, p2, p3}, Lcl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p4, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public synthetic constructor <init>(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    .line 123
    iput-object p2, p0, Ltn;->b:Ljava/lang/Object;

    iput-object p3, p0, Ltn;->c:Ljava/lang/Object;

    iput-object p4, p0, Ltn;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static r([F[F)V
    .registers 8

    const/4 v0, 0x0

    invoke-static {p0, v0}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    const/16 v1, 0xa

    aget v2, p1, v1

    mul-float/2addr v2, v2

    const/16 v3, 0x8

    aget v4, p1, v3

    mul-float/2addr v4, v4

    add-float/2addr v4, v2

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    double-to-float v2, v4

    aget v4, p1, v1

    div-float/2addr v4, v2

    aput v4, p0, v0

    aget p1, p1, v3

    div-float v0, p1, v2

    const/4 v5, 0x2

    aput v0, p0, v5

    neg-float p1, p1

    div-float/2addr p1, v2

    aput p1, p0, v3

    aput v4, p0, v1

    return-void
.end method


# virtual methods
.method public final declared-synchronized A()V
    .registers 4

    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Ltn;->a:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_27

    if-eqz v0, :cond_7

    monitor-exit p0

    return-void

    :cond_7
    :try_start_7
    invoke-virtual {p0}, Ltn;->E()Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Ltn;->c:Ljava/lang/Object;

    if-nez v0, :cond_20

    new-instance v0, Ls49;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ls49;-><init>(B)V

    iget-object v1, p0, Ltn;->b:Ljava/lang/Object;

    check-cast v1, Lwkk;

    check-cast v1, Lkb8;

    iget-object v2, v1, Lkb8;->c:Ljava/util/concurrent/Executor;

    invoke-virtual {v1, v2, v0}, Lkb8;->a(Ljava/util/concurrent/Executor;Lec8;)V

    :cond_20
    const/4 v0, 0x1

    iput-boolean v0, p0, Ltn;->a:Z
    :try_end_23
    .catchall {:try_start_7 .. :try_end_23} :catchall_27

    monitor-exit p0

    return-void

    :goto_25
    :try_start_25
    monitor-exit p0
    :try_end_26
    .catchall {:try_start_25 .. :try_end_26} :catchall_27

    throw v0

    :catchall_27
    move-exception v0

    goto :goto_25
.end method

.method public final declared-synchronized B()Z
    .registers 3

    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Ltn;->A()V

    iget-object v0, p0, Ltn;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_25

    :cond_f
    iget-object v0, p0, Ltn;->d:Ljava/lang/Object;

    check-cast v0, Lcom/google/firebase/messaging/FirebaseMessaging;

    iget-object v0, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->a:Lr49;

    invoke-virtual {v0}, Lr49;->a()V

    iget-object v0, v0, Lr49;->g:Lm4c;

    invoke-virtual {v0}, Lm4c;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmb6;

    monitor-enter v0
    :try_end_21
    .catchall {:try_start_1 .. :try_end_21} :catchall_2d

    :try_start_21
    iget-boolean v1, v0, Lmb6;->b:Z
    :try_end_23
    .catchall {:try_start_21 .. :try_end_23} :catchall_29

    :try_start_23
    monitor-exit v0
    :try_end_24
    .catchall {:try_start_23 .. :try_end_24} :catchall_2d

    move v0, v1

    :goto_25
    monitor-exit p0

    return v0

    :goto_27
    :try_start_27
    monitor-exit v0
    :try_end_28
    .catchall {:try_start_27 .. :try_end_28} :catchall_29

    :try_start_28
    throw v1

    :catchall_29
    move-exception v1

    goto :goto_27

    :goto_2b
    monitor-exit p0
    :try_end_2c
    .catchall {:try_start_28 .. :try_end_2c} :catchall_2d

    throw v0

    :catchall_2d
    move-exception v0

    goto :goto_2b
.end method

.method public final C()V
    .registers 7

    iget-object v0, p0, Ltn;->b:Ljava/lang/Object;

    check-cast v0, Lwci;

    iget-object v0, v0, Lwci;->b:Ljava/lang/Object;

    check-cast v0, Lnw3;

    iget-object v0, v0, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "tab_gallery.tabui2_selection_menu_hint_bubble_shown"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_44

    iget-object v0, p0, Ltn;->c:Ljava/lang/Object;

    check-cast v0, Lc9l;

    invoke-virtual {v0}, Lc9l;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_44

    new-instance v1, Ltjf;

    new-instance v3, Llr2;

    const/4 v4, 0x2

    invoke-direct {v3, v4}, Llr2;-><init>(B)V

    new-instance v4, Ltji;

    const/16 v5, 0x9

    invoke-direct {v4, p0, v5}, Ltji;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v1, v0, v3, v4}, Ltjf;-><init>(Landroid/view/View;Lx1p;Lkotlin/jvm/functions/Function1;)V

    iput-boolean v2, p0, Ltn;->a:Z

    iget-object p0, p0, Ltn;->d:Ljava/lang/Object;

    check-cast p0, Lc9l;

    iget-object p0, p0, Lc9l;->b:Lr9l;

    iget-object p0, p0, Lr9l;->p:Li03;

    invoke-virtual {v1, p0}, Ltjf;->j(Landroid/view/ViewGroup;)V

    :cond_44
    return-void
.end method

.method public final D(Landroid/content/Context;Ltc2;Ljava/lang/Runnable;)V
    .registers 8

    iget-boolean v0, p0, Ltn;->a:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_87

    sget-object p0, Lhqc;->b:Lhqc;

    invoke-virtual {p2, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_10

    sget-object p0, Lcrc;->a:Lcrc;

    goto :goto_59

    :cond_10
    instance-of p0, p2, Lkqc;

    if-eqz p0, :cond_20

    new-instance p0, Lfrc;

    check-cast p2, Lkqc;

    iget-wide v2, p2, Lkqc;->b:J

    iget-boolean p2, p2, Lkqc;->c:Z

    invoke-direct {p0, v2, v3, p2}, Lfrc;-><init>(JZ)V

    goto :goto_59

    :cond_20
    instance-of p0, p2, Liqc;

    if-eqz p0, :cond_2e

    new-instance p0, Ldrc;

    check-cast p2, Liqc;

    iget-wide v2, p2, Liqc;->b:J

    invoke-direct {p0, v2, v3}, Ldrc;-><init>(J)V

    goto :goto_59

    :cond_2e
    instance-of p0, p2, Ljqc;

    if-eqz p0, :cond_3e

    new-instance p0, Lerc;

    check-cast p2, Ljqc;

    iget-wide v2, p2, Ljqc;->b:J

    iget-object p2, p2, Ljqc;->c:Ljava/lang/String;

    invoke-direct {p0, v2, v3, p2}, Lerc;-><init>(JLjava/lang/String;)V

    goto :goto_59

    :cond_3e
    instance-of p0, p2, Lmqc;

    if-eqz p0, :cond_4c

    new-instance p0, Lgrc;

    check-cast p2, Lmqc;

    iget-object p2, p2, Lmqc;->b:Ljava/lang/Long;

    invoke-direct {p0, p2}, Lgrc;-><init>(Ljava/lang/Long;)V

    goto :goto_59

    :cond_4c
    instance-of p0, p2, Llqc;

    if-eqz p0, :cond_83

    new-instance p0, Lhrc;

    check-cast p2, Llqc;

    iget-wide v2, p2, Llqc;->b:J

    invoke-direct {p0, v2, v3}, Lhrc;-><init>(J)V

    :goto_59
    invoke-static {p1}, Lq9n;->p(Landroid/content/Context;)Ldx3;

    move-result-object p1

    if-eqz p1, :cond_72

    invoke-virtual {p1}, Ldx3;->N()Lex3;

    move-result-object p1

    if-eqz p1, :cond_72

    invoke-interface {p1}, Lijf;->b()Lcom/opera/android/Lazy;

    move-result-object p1

    if-eqz p1, :cond_72

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Lgjm;

    :cond_72
    if-eqz v1, :cond_7d

    new-instance p1, Lmrc;

    invoke-direct {p1, p0}, Lmrc;-><init>(Lirc;)V

    const/4 p0, 0x0

    invoke-virtual {v1, p1, p0}, Lgjm;->e(Ln37;Z)V

    :cond_7d
    if-eqz p3, :cond_af

    invoke-interface {p3}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_83
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_87
    iget-boolean p1, p2, Ltc2;->a:Z

    if-nez p1, :cond_af

    new-instance p1, Lsu;

    const/16 v0, 0x14

    invoke-direct {p1, p0, p2, p3, v0}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p2, p0, Ltn;->c:Ljava/lang/Object;

    check-cast p2, Lumi;

    new-instance p3, Luk6;

    const/4 v0, 0x4

    invoke-direct {p3, p0, v0}, Luk6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p3}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p0

    new-instance p3, Lxm5;

    invoke-direct {p3, p1}, Lxm5;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p2, p3}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnml;->b(Lnml;)V

    invoke-virtual {p0, v1}, Lnml;->a(Ljava/lang/Object;)Loml;

    :cond_af
    return-void
.end method

.method public final E()Ljava/lang/Boolean;
    .registers 6

    const-string v0, "firebase_messaging_auto_init_enabled"

    iget-object p0, p0, Ltn;->d:Ljava/lang/Object;

    check-cast p0, Lcom/google/firebase/messaging/FirebaseMessaging;

    iget-object p0, p0, Lcom/google/firebase/messaging/FirebaseMessaging;->a:Lr49;

    invoke-virtual {p0}, Lr49;->a()V

    iget-object p0, p0, Lr49;->a:Landroid/content/Context;

    const-string v1, "com.google.firebase.messaging"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v3, "auto_init"

    invoke-interface {v1, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_25

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :cond_25
    :try_start_25
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    if-eqz v1, :cond_4c

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const/16 v2, 0x80

    invoke-virtual {v1, p0, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object p0

    if-eqz p0, :cond_4c

    iget-object v1, p0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    if-eqz v1, :cond_4c

    invoke-virtual {v1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4c

    iget-object p0, p0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0
    :try_end_4b
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_25 .. :try_end_4b} :catch_4c

    return-object p0

    :catch_4c
    :cond_4c
    const/4 p0, 0x0

    return-object p0
.end method

.method public final F(Lorb;)V
    .registers 5

    iget-boolean v0, p0, Ltn;->a:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Ltn;->a:Z

    iget-object v0, p0, Ltn;->b:Ljava/lang/Object;

    check-cast v0, Lumi;

    new-instance v1, Ljl4;

    const/16 v2, 0x1c

    invoke-direct {v1, p0, v2}, Ljl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lumi;->g(Ln5o;)Lnml;

    move-result-object p0

    iget-object p1, p1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final G()V
    .registers 8

    const/4 v0, 0x1

    iput-boolean v0, p0, Ltn;->a:Z

    iget-object p0, p0, Ltn;->c:Ljava/lang/Object;

    check-cast p0, Lh5o;

    iput v0, p0, Lh5o;->l:I

    const-wide/16 v3, 0x2710

    const-wide/32 v5, 0x112a880

    const-wide/16 v1, 0x2710

    invoke-static/range {v1 .. v6}, Ldjh;->d(JJJ)J

    move-result-wide v0

    iput-wide v0, p0, Lh5o;->m:J

    return-void
.end method

.method public final H()V
    .registers 4

    iget-boolean v0, p0, Ltn;->a:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Ltn;->d:Ljava/lang/Object;

    check-cast v0, Lszk;

    new-instance v1, Lq02;

    const/16 v2, 0xd

    invoke-direct {v1, p0, v2}, Lq02;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lszk;->c(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Ltn;->a:Z

    return-void
.end method

.method public final I(IIIIIIIII)V
    .registers 14

    iget-object v0, p0, Ltn;->d:Ljava/lang/Object;

    check-cast v0, Lga6;

    iget-boolean v1, p0, Ltn;->a:Z

    if-eqz v1, :cond_9

    return-void

    :cond_9
    const/4 v1, 0x1

    iput-boolean v1, p0, Ltn;->a:Z

    const/16 p0, 0xb

    const/16 v2, 0xc

    if-ne p1, p0, :cond_1b

    add-int/lit16 p2, p2, -0x7b2

    mul-int/2addr p2, v2

    add-int/2addr p2, p3

    int-to-double p0, p2

    invoke-virtual {v0, p0, p1}, Lga6;->q(D)V

    return-void

    :cond_1b
    const/16 v3, 0xd

    if-ne p1, v3, :cond_2c

    invoke-static {p2, p9}, Lpzn;->j(II)Ljava/util/Calendar;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p0

    long-to-double p0, p0

    invoke-virtual {v0, p0, p1}, Lga6;->q(D)V

    return-void

    :cond_2c
    if-ne p1, v2, :cond_4c

    sget-object p0, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    int-to-long p1, p5

    invoke-virtual {p0, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide p0

    sget-object p2, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    int-to-long p3, p6

    invoke-virtual {p2, p3, p4}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide p2

    add-long/2addr p2, p0

    sget-object p0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long p4, p7

    invoke-virtual {p0, p4, p5}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide p0

    add-long/2addr p0, p2

    int-to-long p2, p8

    add-long/2addr p0, p2

    long-to-double p0, p0

    invoke-virtual {v0, p0, p1}, Lga6;->q(D)V

    return-void

    :cond_4c
    const-string p1, "UTC"

    invoke-static {p1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/Calendar;->clear()V

    invoke-virtual {p1, v1, p2}, Ljava/util/Calendar;->set(II)V

    const/4 p2, 0x2

    invoke-virtual {p1, p2, p3}, Ljava/util/Calendar;->set(II)V

    const/4 p2, 0x5

    invoke-virtual {p1, p2, p4}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {p1, p0, p5}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {p1, v2, p6}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {p1, v3, p7}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xe

    invoke-virtual {p1, p0, p8}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p0

    long-to-double p0, p0

    invoke-virtual {v0, p0, p1}, Lga6;->q(D)V

    return-void
.end method

.method public final J(IDDDD)V
    .registers 27

    move/from16 v1, p1

    move-wide/from16 v2, p2

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    const/4 v4, 0x4

    const/4 v5, 0x0

    const/16 v6, 0xe

    const/16 v7, 0xd

    const/4 v8, 0x2

    const/16 v9, 0xb

    if-eqz v0, :cond_1b

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0, v6, v5}, Ljava/util/Calendar;->set(II)V

    goto :goto_56

    :cond_1b
    if-ne v1, v9, :cond_22

    invoke-static {v2, v3}, Lp9e;->j(D)Ljava/util/Calendar;

    move-result-object v0

    goto :goto_56

    :cond_22
    const-string v0, "UTC"

    if-ne v1, v7, :cond_3e

    sget v10, Lpzn;->g:I

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->clear()V

    invoke-virtual {v0, v8}, Ljava/util/Calendar;->setFirstDayOfWeek(I)V

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->setMinimalDaysInFirstWeek(I)V

    double-to-long v2, v2

    invoke-virtual {v0, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    goto :goto_56

    :cond_3e
    new-instance v10, Ljava/util/GregorianCalendar;

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    invoke-direct {v10, v0}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;)V

    new-instance v0, Ljava/util/Date;

    const-wide/high16 v11, -0x8000000000000000L

    invoke-direct {v0, v11, v12}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v10, v0}, Ljava/util/GregorianCalendar;->setGregorianChange(Ljava/util/Date;)V

    double-to-long v2, v2

    invoke-virtual {v10, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    move-object v0, v10

    :goto_56
    const/16 v2, 0x8

    const/4 v3, 0x5

    const/4 v10, 0x1

    if-ne v1, v2, :cond_81

    invoke-virtual {v0, v10}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {v0, v8}, Ljava/util/Calendar;->get(I)I

    move-result v4

    move v6, v4

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v4

    const/4 v8, 0x0

    const/4 v9, 0x0

    move v0, v5

    const/4 v5, 0x0

    move v3, v6

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-wide/from16 v10, p4

    move-wide/from16 v12, p6

    move-wide/from16 v14, p8

    move/from16 v16, v0

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v15}, Ltn;->K(IIIIIIIIIDDD)V

    invoke-static/range {v16 .. v16}, Lwxe;->V(I)V

    return-void

    :cond_81
    const/16 v2, 0xc

    if-ne v1, v2, :cond_a4

    invoke-virtual {v0, v9}, Ljava/util/Calendar;->get(I)I

    move-result v5

    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v6

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v7, 0x0

    move-object/from16 v0, p0

    move-wide/from16 v12, p6

    move-wide/from16 v14, p8

    move/from16 p2, v10

    move-wide/from16 v10, p4

    invoke-virtual/range {v0 .. v15}, Ltn;->K(IIIIIIIIIDDD)V

    invoke-static/range {p2 .. p2}, Lwxe;->V(I)V

    return-void

    :cond_a4
    move/from16 p2, v10

    const/16 v5, 0x9

    if-eq v1, v5, :cond_fb

    const/16 v5, 0xa

    if-eq v1, v5, :cond_fb

    const/4 v2, 0x3

    if-ne v1, v9, :cond_d5

    move/from16 v5, p2

    move v3, v2

    invoke-virtual {v0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v2

    move v4, v3

    invoke-virtual {v0, v8}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/4 v8, 0x0

    const/4 v9, 0x0

    move v0, v4

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-wide/from16 v10, p4

    move-wide/from16 v12, p6

    move-wide/from16 v14, p8

    move/from16 p2, v0

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v15}, Ltn;->K(IIIIIIIIIDDD)V

    invoke-static/range {p2 .. p2}, Lwxe;->V(I)V

    return-void

    :cond_d5
    move/from16 p2, v2

    if-ne v1, v7, :cond_fa

    invoke-static {v0}, Lpzn;->k(Ljava/util/Calendar;)I

    move-result v2

    move/from16 v3, p2

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v9

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v3, 0x0

    move v0, v4

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-wide/from16 v10, p4

    move-wide/from16 v12, p6

    move-wide/from16 v14, p8

    move/from16 v16, v0

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v15}, Ltn;->K(IIIIIIIIIDDD)V

    invoke-static/range {v16 .. v16}, Lwxe;->V(I)V

    :cond_fa
    return-void

    :cond_fb
    move/from16 v5, p2

    invoke-virtual {v0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-virtual {v0, v8}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    invoke-virtual {v0, v9}, Ljava/util/Calendar;->get(I)I

    move-result v5

    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {v0, v7}, Ljava/util/Calendar;->get(I)I

    move-result v7

    invoke-virtual {v0, v6}, Ljava/util/Calendar;->get(I)I

    move-result v0

    const/4 v9, 0x0

    move v6, v4

    move v4, v3

    move v3, v6

    move-wide/from16 v10, p4

    move-wide/from16 v12, p6

    move-wide/from16 v14, p8

    move v6, v2

    move/from16 v16, v8

    move v8, v0

    move v2, v1

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-virtual/range {v0 .. v15}, Ltn;->K(IIIIIIIIIDDD)V

    invoke-static/range {v16 .. v16}, Lwxe;->V(I)V

    return-void
.end method

.method public final K(IIIIIIIIIDDD)V
    .registers 32

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-wide/from16 v6, p10

    move-wide/from16 v8, p12

    iget-object v2, v0, Ltn;->b:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    invoke-virtual {v0}, Ltn;->v()V

    move-wide/from16 v3, p14

    double-to-int v11, v3

    const/16 v3, 0x8

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-ne v1, v3, :cond_88

    invoke-static {}, Ltgk;->l()Ltgk;

    move-result-object v3

    :try_start_1c
    new-array v10, v4, [Lrdd;

    invoke-static {v10}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10
    :try_end_26
    .catchall {:try_start_1c .. :try_end_26} :catchall_72

    :try_start_26
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_31

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10
    :try_end_30
    .catchall {:try_start_26 .. :try_end_30} :catchall_7d

    goto :goto_32

    :cond_31
    move-object v10, v5

    :goto_32
    invoke-virtual {v3}, Ltgk;->close()V

    if-nez v10, :cond_6e

    new-instance v10, Lzg6;

    new-instance v12, Ls8b;

    invoke-direct {v12, v0, v1}, Ls8b;-><init>(Ltn;I)V

    move/from16 v13, p2

    move/from16 v14, p3

    move/from16 v15, p4

    move-object v11, v2

    invoke-direct/range {v10 .. v15}, Lzg6;-><init>(Landroid/content/Context;Ls8b;III)V

    invoke-virtual {v10}, Landroid/app/DatePickerDialog;->getDatePicker()Landroid/widget/DatePicker;

    move-result-object v1

    double-to-long v6, v6

    double-to-long v8, v8

    move/from16 p7, p2

    move/from16 p8, p3

    move/from16 p9, p4

    move-object/from16 p5, v1

    move-wide/from16 p10, v6

    move-wide/from16 p12, v8

    move-object/from16 p6, v10

    invoke-static/range {p5 .. p13}, Lscd;->Z(Landroid/widget/DatePicker;Landroid/widget/DatePicker$OnDateChangedListener;IIIJJ)V

    const v1, 0x7f140550

    invoke-virtual {v2, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v10, v1}, Lzg6;->setTitle(Ljava/lang/CharSequence;)V

    move v15, v4

    move-object v14, v5

    move-object v5, v10

    goto/16 :goto_13a

    :cond_6e
    invoke-static {}, Lh9o;->t()V

    return-void

    :catchall_72
    move-exception v0

    :try_start_73
    new-instance v1, Ljava/util/ServiceConfigurationError;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/util/ServiceConfigurationError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_7d
    .catchall {:try_start_73 .. :try_end_7d} :catchall_7d

    :catchall_7d
    move-exception v0

    move-object v1, v0

    :try_start_7f
    invoke-virtual {v3}, Ltgk;->close()V
    :try_end_82
    .catchall {:try_start_7f .. :try_end_82} :catchall_83

    goto :goto_87

    :catchall_83
    move-exception v0

    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_87
    throw v1

    :cond_88
    const/16 v3, 0xc

    if-ne v1, v3, :cond_d2

    if-ltz v11, :cond_b2

    const v3, 0xea60

    if-ge v11, v3, :cond_b2

    new-instance v3, Lpbe;

    double-to-int v6, v6

    double-to-int v10, v8

    invoke-static {v2}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v12

    new-instance v13, Lt8b;

    invoke-direct {v13, v0, v1}, Lt8b;-><init>(Ltn;I)V

    move/from16 v7, p7

    move/from16 v8, p8

    move v15, v4

    move-object v14, v5

    move v9, v6

    move/from16 v5, p5

    move/from16 v6, p6

    move-object v4, v2

    invoke-direct/range {v3 .. v13}, Lpbe;-><init>(Landroid/content/Context;IIIIIIIZLt8b;)V

    move-object v5, v3

    goto/16 :goto_13a

    :cond_b2
    move v15, v4

    move-object v14, v5

    new-instance v3, Landroid/app/TimePickerDialog;

    new-instance v4, Lu8b;

    invoke-direct {v4, v0, v1}, Lu8b;-><init>(Ltn;I)V

    invoke-static {v2}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v1

    move/from16 p10, p5

    move/from16 p11, p6

    move/from16 p12, v1

    move-object/from16 p8, v2

    move-object/from16 p7, v3

    move-object/from16 p9, v4

    invoke-direct/range {p7 .. p12}, Landroid/app/TimePickerDialog;-><init>(Landroid/content/Context;Landroid/app/TimePickerDialog$OnTimeSetListener;IIZ)V

    move-object/from16 v5, p7

    goto/16 :goto_13a

    :cond_d2
    move v15, v4

    move-object v14, v5

    const/16 v3, 0x9

    if-eq v1, v3, :cond_11b

    const/16 v3, 0xa

    if-eq v1, v3, :cond_11b

    const/16 v3, 0xb

    if-ne v1, v3, :cond_f9

    new-instance v3, Lq9e;

    move-object v4, v3

    new-instance v3, Lt8b;

    invoke-direct {v3, v0, v1}, Lt8b;-><init>(Ltn;I)V

    const/4 v10, 0x0

    move/from16 v5, p3

    move-object v1, v4

    move/from16 v4, p2

    invoke-direct/range {v1 .. v10}, Lq9e;-><init>(Landroid/content/Context;Lt8b;IIDDB)V

    const v3, 0x7f140a58

    invoke-virtual {v1, v3}, Landroid/app/Dialog;->setTitle(I)V

    :goto_f7
    move-object v5, v1

    goto :goto_13a

    :cond_f9
    const/16 v3, 0xd

    if-ne v1, v3, :cond_119

    new-instance v3, Lq9e;

    move-object v4, v3

    new-instance v3, Lt8b;

    invoke-direct {v3, v0, v1}, Lt8b;-><init>(Ltn;I)V

    const/4 v10, 0x1

    move/from16 v5, p9

    move-wide/from16 v6, p10

    move-wide/from16 v8, p12

    move-object v1, v4

    move/from16 v4, p2

    invoke-direct/range {v1 .. v10}, Lq9e;-><init>(Landroid/content/Context;Lt8b;IIDDB)V

    const v3, 0x7f1415a2

    invoke-virtual {v1, v3}, Landroid/app/Dialog;->setTitle(I)V

    goto :goto_f7

    :cond_119
    move-object v5, v14

    goto :goto_13a

    :cond_11b
    new-instance v3, Lsh6;

    move-object v4, v3

    new-instance v3, Lt8b;

    invoke-direct {v3, v0, v1}, Lt8b;-><init>(Ltn;I)V

    invoke-static {v2}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v9

    move/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move-wide/from16 v10, p10

    move-wide/from16 v12, p12

    move-object v1, v4

    move/from16 v4, p2

    invoke-direct/range {v1 .. v13}, Lsh6;-><init>(Landroid/content/Context;Lt8b;IIIIIZDD)V

    goto :goto_f7

    :goto_13a
    const v1, 0x7f14054f

    invoke-virtual {v2, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    const/4 v3, -0x1

    invoke-virtual {v5, v3, v1, v5}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    const/high16 v1, 0x1040000

    invoke-virtual {v2, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    const/4 v3, -0x2

    invoke-virtual {v5, v3, v1, v14}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    const v1, 0x7f14054d

    invoke-virtual {v2, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    new-instance v2, Lq8b;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v3}, Lq8b;-><init>(Ltn;B)V

    const/4 v4, -0x3

    invoke-virtual {v5, v4, v1, v2}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    new-instance v1, Lr8b;

    invoke-direct {v1, v0, v3}, Lr8b;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v5, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    iput-object v5, v0, Ltn;->c:Ljava/lang/Object;

    iput-boolean v15, v0, Ltn;->a:Z

    invoke-virtual {v5}, Landroid/app/Dialog;->show()V

    return-void
.end method

.method public final L(Ljava/util/List;)V
    .registers 15

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Ltn;->d:Ljava/lang/Object;

    check-cast v1, Lwsi;

    iget-object v2, p0, Ltn;->b:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object v3, v1, Lwsi;->e:Leu3;

    iget-boolean v1, v1, Lwsi;->f:Z

    const/4 v4, 0x0

    if-eqz v1, :cond_66

    new-instance v1, Lvr3;

    invoke-virtual {v3}, Leu3;->getAsBoolean()Z

    move-result v3

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-boolean v3, v1, Lvr3;->b:Z

    iput v2, v1, Lvr3;->a:I

    new-instance v2, Landroid/util/SparseArray;

    invoke-direct {v2}, Landroid/util/SparseArray;-><init>()V

    iput-object v2, v1, Lvr3;->c:Ljava/lang/Object;

    new-instance v3, Landroid/util/SparseIntArray;

    invoke-direct {v3}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v3, v1, Lvr3;->d:Ljava/lang/Object;

    new-instance v5, Lqri;

    const/16 v9, 0x23

    const/4 v10, 0x1

    const v6, 0x7fffffff

    const/4 v7, 0x0

    const/16 v8, 0x19

    invoke-direct/range {v5 .. v10}, Lqri;-><init>(IIIIZ)V

    invoke-virtual {v2, v4, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    new-instance v6, Lqri;

    const v10, 0x7fffffff

    const/4 v11, 0x0

    const/4 v7, 0x2

    const/4 v8, 0x3

    const v9, 0x7fffffff

    invoke-direct/range {v6 .. v11}, Lqri;-><init>(IIIIZ)V

    const/4 v3, 0x1

    invoke-virtual {v2, v3, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    new-instance v7, Lqri;

    const v11, 0x7fffffff

    const/4 v12, 0x1

    const/4 v8, 0x5

    const/4 v9, 0x0

    invoke-direct/range {v7 .. v12}, Lqri;-><init>(IIIIZ)V

    const/4 v3, 0x2

    invoke-virtual {v2, v3, v7}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_6f

    :cond_66
    new-instance v1, Lsri;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-direct {v1, v3, v2}, Lsri;-><init>(Leu3;I)V

    :goto_6f
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v4, v2, :cond_9e

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/16 v3, 0xa

    if-ge v2, v3, :cond_9e

    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ldri;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    iget-boolean v5, p0, Ltn;->a:Z

    if-nez v5, :cond_8e

    const/16 v5, 0x4b0

    goto :goto_90

    :cond_8e
    const/16 v5, 0x514

    :goto_90
    sub-int/2addr v3, v4

    add-int/2addr v3, v5

    invoke-interface {v1, v2, v3}, Lpri;->a(Ldri;I)Lcom/opera/android/suggestion/Suggestion;

    move-result-object v2

    if-eqz v2, :cond_9b

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_9b
    add-int/lit8 v4, v4, 0x1

    goto :goto_6f

    :cond_9e
    iget-object p0, p0, Ltn;->c:Ljava/lang/Object;

    check-cast p0, Lyv4;

    invoke-virtual {p0, v0}, Lyv4;->d(Ljava/util/List;)V

    return-void
.end method

.method public final a(Lqs5;Z)Z
    .registers 3

    iget-boolean p0, p1, Lqs5;->t:Z

    return p0
.end method

.method public final b(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    invoke-virtual {p0}, Ltn;->u()Lorb;

    move-result-object v0

    const-string v1, "problemType"

    const-string v2, "Unsupported parameter"

    invoke-virtual {v0, v2, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 p1, 0x3d

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "details"

    invoke-virtual {v0, p1, p2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ltn;->F(Lorb;)V

    return-void
.end method

.method public final c(Landroid/graphics/drawable/Drawable;)V
    .registers 9

    if-eqz p1, :cond_3a

    iget-boolean v0, p0, Ltn;->a:Z

    if-eqz v0, :cond_1f

    iget-object p0, p0, Ltn;->b:Ljava/lang/Object;

    check-cast p0, Lev7;

    iget-object p0, p0, Lev7;->o:Ljava/lang/Object;

    check-cast p0, Lknl;

    iget-object p1, p0, Lknl;->c:Loml;

    if-nez p1, :cond_3a

    iget-object p1, p0, Lknl;->a:Lumi;

    iget-wide v0, p0, Lknl;->b:J

    iget-object v2, p0, Lknl;->d:Lp7l;

    invoke-static {p1, v0, v1, v2}, Lfac;->B(Lumi;JLkotlin/jvm/functions/Function0;)Loml;

    move-result-object p1

    iput-object p1, p0, Lknl;->c:Loml;

    return-void

    :cond_1f
    iget-object v0, p0, Ltn;->c:Ljava/lang/Object;

    check-cast v0, Lpqh;

    new-instance v1, Lcv7;

    sget-object v3, Lfri;->a:Lfri;

    iget-object p0, p0, Ltn;->d:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    const v2, 0x7f141471

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object v2, p1

    invoke-direct/range {v1 .. v6}, Lcv7;-><init>(Landroid/graphics/drawable/Drawable;Lfri;ZLjava/lang/String;Lcv2;)V

    iput-object v1, v0, Lpqh;->a:Ljava/lang/Object;

    :cond_3a
    return-void
.end method

.method public final d()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Ltn;->a:Z

    return-void
.end method

.method public final e(Lqs5;Lk73;)V
    .registers 14

    iget-object v0, p0, Ltn;->b:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lp12;

    iget-object v0, p1, Lqs5;->i:Ljava/lang/String;

    invoke-static {v0}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_14

    new-instance v1, Lqxh;

    invoke-direct {v1, v0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    :goto_12
    move-object v0, v1

    goto :goto_2c

    :cond_14
    iget-object v0, v2, Lp12;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    const v1, 0x7f140110

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    new-instance v1, Lsxh;

    const v3, 0x7f1401c7

    invoke-direct {v1, v3, v0}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    goto :goto_12

    :goto_2c
    iget-object v1, v2, Lp12;->c:Ljava/lang/Object;

    check-cast v1, Lyv3;

    invoke-virtual {v1}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Lz77;

    new-instance v9, Ls12;

    iget-boolean v10, p0, Ltn;->a:Z

    iget-object v1, p0, Ltn;->c:Ljava/lang/Object;

    move-object v5, v1

    check-cast v5, Lcom/opera/android/browser/WebContentsWrapper;

    iget-object p0, p0, Ltn;->d:Ljava/lang/Object;

    move-object v6, p0

    check-cast v6, Lu59;

    new-instance v1, Ln12;

    const/4 v7, 0x0

    move-object v3, p1

    move-object v4, p2

    invoke-direct/range {v1 .. v7}, Ln12;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v9, v10, v0, v1}, Ls12;-><init>(ZLpxh;Lkotlin/jvm/functions/Function0;)V

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v8, v9, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final f(Ljava/util/HashSet;)V
    .registers 6

    invoke-virtual {p1}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    invoke-virtual {p0}, Ltn;->u()Lorb;

    move-result-object v0

    const-string v1, "problemType"

    const-string v2, "Unsupported configurations"

    invoke-virtual {v0, v2, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lr40;

    const/4 v2, 0x3

    const-string v3, ", "

    invoke-direct {v1, v3, v2}, Lr40;-><init>(Ljava/lang/String;B)V

    invoke-virtual {v1, p1}, Lr40;->b(Ljava/util/Collection;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "details"

    invoke-virtual {v0, p1, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ltn;->F(Lorb;)V

    return-void
.end method

.method public final g()V
    .registers 3

    iget-object v0, p0, Ltn;->d:Ljava/lang/Object;

    check-cast v0, Lea7;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lea7;->k(Ltn;Z)V

    return-void
.end method

.method public final h(Ljava/util/HashSet;)V
    .registers 5

    invoke-virtual {p1}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    invoke-virtual {p0}, Ltn;->u()Lorb;

    move-result-object v0

    const-string v1, "problemType"

    const-string v2, "Unsupported provider"

    invoke-virtual {v0, v2, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "details"

    const-string v2, ""

    invoke-virtual {v0, v2, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lvpb;

    invoke-direct {v1}, Lvpb;-><init>()V

    invoke-virtual {p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_22
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_32

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1, v2}, Lvpb;->a(Ljava/lang/Object;)V

    goto :goto_22

    :cond_32
    const-string p1, "unsupportedProviders"

    invoke-virtual {v0, v1, p1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ltn;->F(Lorb;)V

    return-void
.end method

.method public final i()Llf3;
    .registers 7

    iget-object v0, p0, Ltn;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    if-eqz v0, :cond_90

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_90

    iget-object v0, p0, Ltn;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    const/4 v2, 0x0

    if-eqz v0, :cond_2b

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v4, v2

    :cond_19
    if-ge v4, v3, :cond_2b

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lkf3;

    if-nez v5, :cond_19

    const-string p0, "ProductDetailsParams cannot be null."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v1

    :cond_2b
    new-instance v0, Llf3;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iget-object v3, p0, Ltn;->c:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkf3;

    iget-object v2, v2, Lkf3;->b:Lh2h;

    iget-object v2, v2, Lh2h;->b:Lorg/json/JSONObject;

    const-string v3, "packageName"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    iput-boolean v2, v0, Llf3;->a:Z

    iget-object v2, p0, Ltn;->b:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iput-object v2, v0, Llf3;->b:Ljava/lang/String;

    iget-object v2, p0, Ltn;->d:Ljava/lang/Object;

    check-cast v2, Lei2;

    iget-object v3, v2, Lei2;->a:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    iget-boolean v4, v2, Lei2;->b:Z

    if-nez v4, :cond_68

    if-eqz v3, :cond_68

    const-string v2, "Old SKU purchase information(token/id) or original external transaction id must be provided."

    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    goto :goto_71

    :cond_68
    new-instance v1, Lr40;

    invoke-direct {v1}, Lr40;-><init>()V

    iget-object v2, v2, Lei2;->a:Ljava/lang/String;

    iput-object v2, v1, Lr40;->b:Ljava/lang/String;

    :goto_71
    iput-object v1, v0, Llf3;->c:Lr40;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Llf3;->e:Ljava/util/ArrayList;

    iget-boolean v1, p0, Ltn;->a:Z

    iput-boolean v1, v0, Llf3;->f:Z

    iget-object p0, p0, Ltn;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    if-eqz p0, :cond_89

    invoke-static {p0}, Lcom/google/android/gms/internal/play_billing/zzca;->zzj(Ljava/util/Collection;)Lcom/google/android/gms/internal/play_billing/zzca;

    move-result-object p0

    goto :goto_8d

    :cond_89
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/zzca;->zzk()Lcom/google/android/gms/internal/play_billing/zzca;

    move-result-object p0

    :goto_8d
    iput-object p0, v0, Llf3;->d:Lcom/google/android/gms/internal/play_billing/zzca;

    return-object v0

    :cond_90
    const-string p0, "Details of the products must be provided."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v1
.end method

.method public final j()Loff;
    .registers 40

    move-object/from16 v0, p0

    iget-boolean v1, v0, Ltn;->a:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_17

    iget-object v1, v0, Ltn;->c:Ljava/lang/Object;

    check-cast v1, Lh5o;

    iget-object v1, v1, Lh5o;->j:Lxo5;

    iget-boolean v1, v1, Lxo5;->d:Z

    if-eqz v1, :cond_17

    const-string v0, "Cannot set backoff criteria on an idle mode job"

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v2

    :cond_17
    new-instance v1, Loff;

    iget-object v3, v0, Ltn;->b:Ljava/lang/Object;

    check-cast v3, Ljava/util/UUID;

    iget-object v4, v0, Ltn;->c:Ljava/lang/Object;

    check-cast v4, Lh5o;

    iget-object v5, v0, Ltn;->d:Ljava/lang/Object;

    check-cast v5, Ljava/util/Set;

    invoke-direct {v1, v3, v4, v5}, Loff;-><init>(Ljava/util/UUID;Lh5o;Ljava/util/Set;)V

    iget-object v3, v4, Lh5o;->j:Lxo5;

    iget-object v4, v3, Lxo5;->i:Ljava/util/Set;

    check-cast v4, Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v4, :cond_44

    iget-boolean v4, v3, Lxo5;->e:Z

    if-nez v4, :cond_44

    iget-boolean v4, v3, Lxo5;->c:Z

    if-nez v4, :cond_44

    iget-boolean v3, v3, Lxo5;->d:Z

    if-nez v3, :cond_44

    move v3, v6

    goto :goto_45

    :cond_44
    move v3, v5

    :goto_45
    iget-object v4, v0, Ltn;->c:Ljava/lang/Object;

    check-cast v4, Lh5o;

    iget-boolean v7, v4, Lh5o;->q:Z

    if-eqz v7, :cond_63

    if-nez v3, :cond_5d

    iget-wide v7, v4, Lh5o;->g:J

    const-wide/16 v9, 0x0

    cmp-long v3, v7, v9

    if-lez v3, :cond_63

    const-string v0, "Expedited jobs cannot be delayed"

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v2

    :cond_5d
    const-string v0, "Expedited jobs only support network and storage constraints"

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v2

    :cond_63
    iget-object v2, v4, Lh5o;->x:Ljava/lang/String;

    if-nez v2, :cond_95

    iget-object v2, v4, Lh5o;->c:Ljava/lang/String;

    const-string v3, "."

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    const/4 v7, 0x6

    invoke-static {v2, v3, v6, v7}, Lkotlin/text/StringsKt;->Y(Ljava/lang/CharSequence;[Ljava/lang/String;II)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-ne v3, v5, :cond_81

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    goto :goto_87

    :cond_81
    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->Q(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    :goto_87
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v5, 0x7f

    if-le v3, v5, :cond_93

    invoke-static {v5, v2}, Lpik;->D(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_93
    iput-object v2, v4, Lh5o;->x:Ljava/lang/String;

    :cond_95
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    iput-object v2, v0, Ltn;->b:Ljava/lang/Object;

    new-instance v3, Lh5o;

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v2, v0, Ltn;->c:Ljava/lang/Object;

    check-cast v2, Lh5o;

    iget-object v6, v2, Lh5o;->c:Ljava/lang/String;

    iget v5, v2, Lh5o;->b:I

    iget-object v7, v2, Lh5o;->d:Ljava/lang/String;

    new-instance v8, Lib6;

    iget-object v9, v2, Lh5o;->e:Lib6;

    invoke-direct {v8, v9}, Lib6;-><init>(Lib6;)V

    new-instance v9, Lib6;

    iget-object v10, v2, Lh5o;->f:Lib6;

    invoke-direct {v9, v10}, Lib6;-><init>(Lib6;)V

    iget-wide v10, v2, Lh5o;->g:J

    iget-wide v12, v2, Lh5o;->h:J

    iget-wide v14, v2, Lh5o;->i:J

    move-object/from16 v36, v1

    new-instance v1, Lxo5;

    move-object/from16 v16, v3

    iget-object v3, v2, Lh5o;->j:Lxo5;

    invoke-direct {v1, v3}, Lxo5;-><init>(Lxo5;)V

    iget v3, v2, Lh5o;->k:I

    move-object/from16 v17, v1

    iget v1, v2, Lh5o;->l:I

    move/from16 v19, v3

    move-object/from16 v18, v4

    iget-wide v3, v2, Lh5o;->m:J

    move-wide/from16 v20, v3

    iget-wide v3, v2, Lh5o;->n:J

    move-wide/from16 v22, v3

    iget-wide v3, v2, Lh5o;->o:J

    move-wide/from16 v24, v3

    iget-wide v3, v2, Lh5o;->p:J

    move/from16 v26, v1

    iget-boolean v1, v2, Lh5o;->q:Z

    move/from16 v27, v1

    iget v1, v2, Lh5o;->r:I

    move/from16 v28, v1

    iget v1, v2, Lh5o;->s:I

    move-wide/from16 v29, v3

    iget-wide v3, v2, Lh5o;->u:J

    move/from16 v31, v1

    iget v1, v2, Lh5o;->v:I

    move/from16 v32, v1

    iget v1, v2, Lh5o;->w:I

    iget-object v2, v2, Lh5o;->x:Ljava/lang/String;

    const/high16 v35, 0x80000

    move/from16 v33, v1

    move-object/from16 v34, v2

    move-wide/from16 v37, v3

    move-object/from16 v3, v16

    move-object/from16 v16, v17

    move-object/from16 v4, v18

    move/from16 v17, v19

    move-wide/from16 v19, v20

    move-wide/from16 v21, v22

    move-wide/from16 v23, v24

    move/from16 v18, v26

    move-wide/from16 v25, v29

    move/from16 v29, v31

    move-wide/from16 v30, v37

    invoke-direct/range {v3 .. v35}, Lh5o;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lib6;Lib6;JJJLxo5;IIJJJJZIIJIILjava/lang/String;I)V

    iput-object v3, v0, Ltn;->c:Ljava/lang/Object;

    return-object v36
.end method

.method public final k([I[Ljava/lang/String;)V
    .registers 12

    iget-object p1, p0, Ltn;->d:Ljava/lang/Object;

    check-cast p1, Lbag;

    iget-object p2, p0, Ltn;->b:Ljava/lang/Object;

    check-cast p2, Lorg/chromium/ui/base/WindowAndroid;

    iget-object v0, p0, Ltn;->c:Ljava/lang/Object;

    check-cast v0, [Ljava/lang/String;

    invoke-static {p2, v0}, Lf03;->A(Lorg/chromium/ui/base/WindowAndroid;[Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    invoke-interface {p1}, Lbag;->t()V

    return-void

    :cond_1d
    iget-boolean p0, p0, Ltn;->a:Z

    if-eqz p0, :cond_ef

    invoke-virtual {p2}, Lorg/chromium/ui/base/WindowAndroid;->m()Lb2b;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x0

    move v3, v2

    :cond_31
    if-ge v3, v0, :cond_ef

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Ljava/lang/String;

    invoke-static {p0, v4}, Lnb6;->S(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_31

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {p2}, Lorg/chromium/ui/base/WindowAndroid;->m()Lb2b;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, La32;

    const/16 v3, 0x18

    invoke-direct {v1, p2, p0, p1, v3}, La32;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p2, Laag;

    invoke-direct {p2, p1, p0}, Laag;-><init>(Lbag;Ljava/util/List;)V

    new-instance v3, Laag;

    invoke-direct {v3, p1, p0}, Laag;-><init>(Lbag;Ljava/util/List;)V

    new-instance v4, Lvdf;

    const/16 v5, 0x16

    invoke-direct {v4, v1, v5}, Lvdf;-><init>(Ljava/lang/Object;B)V

    new-instance v5, Lvdf;

    const/16 v6, 0x14

    invoke-direct {v5, p2, v6}, Lvdf;-><init>(Ljava/lang/Object;B)V

    new-instance v6, Lo8f;

    const/16 v7, 0x11

    invoke-direct {v6, v3, v7}, Lo8f;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1, v0, v4, v5, v6}, Lbag;->o(Landroid/app/Activity;Lvdf;Lvdf;Lo8f;)Lb87;

    move-result-object v4

    sget-object v5, Lijm;->b:Lijm;

    if-eqz v4, :cond_88

    invoke-static {v0}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v4, v5}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_88
    invoke-interface {p1, v0, p0}, Lbag;->g(Landroid/app/Activity;Ljava/util/List;)Lv9g;

    move-result-object p0

    if-eqz p0, :cond_eb

    iget-object p1, p0, Lv9g;->c:Ljava/lang/Object;

    check-cast p1, Landroid/content/res/Resources;

    iget v4, p0, Lv9g;->a:I

    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object v6, p0

    check-cast v6, Lt9g;

    iget-object v6, v6, Lt9g;->l:Ljava/lang/String;

    const/4 v7, 0x0

    if-eqz v6, :cond_a6

    new-instance v8, Lqxh;

    invoke-direct {v8, v6}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_a7

    :cond_a6
    move-object v8, v7

    :goto_a7
    iget p0, p0, Lv9g;->b:I

    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object p0

    const v6, 0x7f1403bf

    invoke-virtual {p1, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object v0

    new-instance v6, Lgkj;

    invoke-direct {v6, v2, v2}, Lnz0;-><init>(ZZ)V

    iput-object p0, v6, Lgkj;->a:Ljava/lang/String;

    iput-object p1, v6, Lgkj;->b:Ljava/lang/String;

    iput-object v7, v6, Lgkj;->c:Ljava/lang/String;

    iput-object v4, v6, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v3, v6, Lgkj;->e:Lekj;

    iput-object v7, v6, Lgkj;->f:Lfkj;

    iput-object v7, v6, Lgkj;->g:Lqp2;

    iput-object v1, v6, Lgkj;->h:Ldkj;

    iput-object p2, v6, Lgkj;->i:Ldkj;

    iput-object v7, v6, Lgkj;->j:Lql;

    iput v2, v6, Lgkj;->k:I

    iput v2, v6, Lgkj;->l:I

    iput v2, v6, Lgkj;->m:I

    const/4 p0, 0x1

    iput-boolean p0, v6, Lgkj;->n:Z

    iput-object v8, v6, Lgkj;->o:Lpxh;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v6, v5}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_eb
    invoke-interface {p1}, Lbag;->s()V

    return-void

    :cond_ef
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    invoke-interface {p1}, Lbag;->s()V

    return-void
.end method

.method public final l(Lorg/chromium/components/background_task_scheduler/b;)V
    .registers 4

    iget-object p1, p0, Ltn;->d:Ljava/lang/Object;

    check-cast p1, Lu03;

    iget-object p1, p1, Lu03;->a:Lv03;

    iget-object v0, p0, Ltn;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object v1, p0, Ltn;->c:Ljava/lang/Object;

    check-cast v1, Lorg/chromium/components/background_task_scheduler/TaskInfo;

    invoke-virtual {p1, v0, v1}, Lv03;->b(Landroid/content/Context;Lorg/chromium/components/background_task_scheduler/TaskInfo;)Z

    move-result p1

    iput-boolean p1, p0, Ltn;->a:Z

    return-void
.end method

.method public final m(Lorg/chromium/components/background_task_scheduler/c;)V
    .registers 4

    iget-object p1, p0, Ltn;->d:Ljava/lang/Object;

    check-cast p1, Lu03;

    iget-object p1, p1, Lu03;->a:Lv03;

    iget-object v0, p0, Ltn;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object v1, p0, Ltn;->c:Ljava/lang/Object;

    check-cast v1, Lorg/chromium/components/background_task_scheduler/TaskInfo;

    invoke-virtual {p1, v0, v1}, Lv03;->b(Landroid/content/Context;Lorg/chromium/components/background_task_scheduler/TaskInfo;)Z

    move-result p1

    iput-boolean p1, p0, Ltn;->a:Z

    return-void
.end method

.method public final n(Ljava/lang/String;)V
    .registers 5

    invoke-virtual {p0}, Ltn;->u()Lorb;

    move-result-object v0

    const-string v1, "problemType"

    const-string v2, "Invalid config"

    invoke-virtual {v0, v2, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "details"

    invoke-virtual {v0, p1, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ltn;->F(Lorb;)V

    return-void
.end method

.method public final o(Ltn;)Z
    .registers 2

    iget-object p0, p0, Ltn;->b:Ljava/lang/Object;

    check-cast p0, Lcx7;

    iget-object p1, p1, Ltn;->b:Ljava/lang/Object;

    check-cast p1, Lcx7;

    iget p0, p0, Lcx7;->d:I

    iget p1, p1, Lcx7;->e:I

    and-int/2addr p0, p1

    if-eqz p0, :cond_11

    const/4 p0, 0x1

    return p0

    :cond_11
    const/4 p0, 0x0

    return p0
.end method

.method public final p(Z)V
    .registers 5

    iget-object v0, p0, Ltn;->d:Ljava/lang/Object;

    check-cast v0, Lfa7;

    iget-object v1, v0, Lfa7;->h:Ljava/lang/Object;

    monitor-enter v1

    :try_start_7
    iget-boolean v2, p0, Ltn;->a:Z

    if-nez v2, :cond_1f

    iget-object v2, p0, Ltn;->b:Ljava/lang/Object;

    check-cast v2, Lba7;

    iget-object v2, v2, Lba7;->g:Ltn;

    invoke-static {v2, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-virtual {v0, p0, p1}, Lfa7;->h(Ltn;Z)V

    :cond_1a
    const/4 p1, 0x1

    iput-boolean p1, p0, Ltn;->a:Z
    :try_end_1d
    .catchall {:try_start_7 .. :try_end_1d} :catchall_27

    monitor-exit v1

    return-void

    :cond_1f
    :try_start_1f
    const-string p0, "editor is closed"

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_27
    .catchall {:try_start_1f .. :try_end_27} :catchall_27

    :catchall_27
    move-exception p0

    monitor-exit v1

    throw p0
.end method

.method public final q()Lneb;
    .registers 8

    iget-object v0, p0, Ltn;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_40

    iget-object v1, p0, Ltn;->b:Ljava/lang/Object;

    check-cast v1, Lpc3;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v4, "BatteryStatusManagerBroadcastReceiverInBackground"

    sget-object v5, Li8;->h:Li8;

    invoke-virtual {v5, v4}, Llt8;->f(Ljava/lang/String;)Z

    move-result v4

    iget-boolean v5, v1, Lpc3;->e:Z

    if-eqz v4, :cond_30

    if-nez v5, :cond_40

    sget-object v4, Lpc3;->f:Lr1j;

    new-instance v5, Loc3;

    invoke-direct {v5, v1, v2}, Loc3;-><init>(Lpc3;B)V

    check-cast v4, Lorg/chromium/base/task/TaskRunnerImpl;

    invoke-virtual {v4, v5}, Lorg/chromium/base/task/TaskRunnerImpl;->r(Ljava/lang/Runnable;)V

    iput-boolean v3, v1, Lpc3;->e:Z

    goto :goto_40

    :cond_30
    if-nez v5, :cond_40

    sget-object v4, Lt8;->a:Landroid/content/Context;

    iget-object v5, v1, Lpc3;->c:Lup1;

    iget-object v6, v1, Lpc3;->b:Landroid/content/IntentFilter;

    invoke-static {v4, v5, v6}, Lt8;->Q(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v4

    if-eqz v4, :cond_40

    iput-boolean v3, v1, Lpc3;->e:Z

    :cond_40
    :goto_40
    new-instance v1, Lhc3;

    invoke-direct {v1, p0}, Lhc3;-><init>(Ltn;)V

    iget-boolean v4, p0, Ltn;->a:Z

    if-eqz v4, :cond_5d

    iget-object p0, p0, Ltn;->d:Ljava/lang/Object;

    check-cast p0, Lnc3;

    iput-object p0, v1, Lhc3;->c:Lnc3;

    iput-boolean v3, v1, Lhc3;->d:Z

    iget-object v3, v1, Lhc3;->b:Ln61;

    if-eqz v3, :cond_5d

    invoke-virtual {v3, p0}, Ln61;->c(Lnc3;)V

    const/4 p0, 0x0

    iput-object p0, v1, Lhc3;->b:Ln61;

    iput-boolean v2, v1, Lhc3;->d:Z

    :cond_5d
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-object v1
.end method

.method public final s()V
    .registers 3

    iget-object v0, p0, Ltn;->b:Ljava/lang/Object;

    check-cast v0, Landroid/nfc/tech/TagTechnology;

    invoke-interface {v0}, Landroid/nfc/tech/TagTechnology;->isConnected()Z

    move-result v1

    if-nez v1, :cond_10

    invoke-interface {v0}, Landroid/nfc/tech/TagTechnology;->connect()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Ltn;->a:Z

    :cond_10
    return-void
.end method

.method public final t(Llrf;Z)V
    .registers 11

    iget-object v0, p0, Ltn;->d:Ljava/lang/Object;

    check-cast v0, Lyrf;

    iget-object v1, v0, Ldej;->b:Lmej;

    iget-object v2, p0, Ltn;->c:Ljava/lang/Object;

    check-cast v2, Landroid/widget/LinearLayout;

    iget-object v3, p0, Ltn;->b:Ljava/lang/Object;

    check-cast v3, Landroid/view/LayoutInflater;

    iget-boolean v4, p0, Ltn;->a:Z

    if-eqz v4, :cond_16

    const v5, 0x7f0d0390

    goto :goto_19

    :cond_16
    const v5, 0x7f0d038f

    :goto_19
    const/4 v6, 0x0

    invoke-virtual {v3, v5, v2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v2, 0x7f0a0322

    invoke-virtual {v3, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    invoke-interface {p1}, Llrf;->getIcon()I

    move-result v5

    if-eqz v5, :cond_34

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_39

    :cond_34
    const/16 v5, 0x8

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    :goto_39
    const v2, 0x7f0a06c5

    invoke-virtual {v3, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    if-eqz v4, :cond_6c

    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-interface {p1}, Llrf;->getDescription()I

    move-result v5

    if-nez v5, :cond_57

    invoke-interface {p1, v4}, Llrf;->d(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v1

    goto :goto_74

    :cond_57
    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-interface {p1, v4}, Llrf;->d(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {p1}, Llrf;->getDescription()I

    move-result v7

    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v5, v4}, Lm5h;->h(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    move-result-object v1

    goto :goto_74

    :cond_6c
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-interface {p1, v1}, Llrf;->d(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v1

    :goto_74
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v1, 0x7f0a0201

    invoke-virtual {v3, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, p1}, Lyrf;->e(Llrf;)Z

    move-result v0

    if-nez v0, :cond_85

    const/4 v6, 0x4

    :cond_85
    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v3, p2}, Landroid/view/View;->setEnabled(Z)V

    new-instance p2, Ljf7;

    const/16 v0, 0x1c

    invoke-direct {p2, p0, p1, v0}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lks8;

    const/4 p1, 0x2

    invoke-direct {p0, p2, p1}, Lks8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final u()Lorb;
    .registers 5

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    iget-object p0, p0, Ltn;->d:Ljava/lang/Object;

    check-cast p0, Lcy;

    iget-object v1, p0, Lcy;->e:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_1f

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1f

    iget-object v1, p0, Lcy;->e:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    const-string v2, "country"

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_1f
    iget-object v1, p0, Lcy;->f:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_2a

    const-string v2, "ipCountry"

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_2a
    iget-object v1, p0, Lcy;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    const-string v2, "pkgver"

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p0, Lcy;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    const-string v2, "pkgname"

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p0, Lcy;->g:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_47

    const-string v2, "gaid"

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_47
    iget-object v1, p0, Lcy;->d:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    const-string v2, "opid"

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-boolean v1, p0, Lcy;->a:Z

    const-string v2, "configType"

    if-eqz v1, :cond_6a

    const/4 v3, 0x1

    if-ne v1, v3, :cond_69

    const-string v1, "fetch"

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Lcy;->h:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_69

    const-string v1, "pid"

    invoke-virtual {v0, p0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_69
    return-object v0

    :cond_6a
    const-string p0, "config"

    invoke-virtual {v0, p0, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method

.method public final v()V
    .registers 2

    iget-object v0, p0, Ltn;->c:Ljava/lang/Object;

    check-cast v0, Landroid/app/AlertDialog;

    if-eqz v0, :cond_13

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_13

    :try_start_c
    iget-object p0, p0, Ltn;->c:Ljava/lang/Object;

    check-cast p0, Landroid/app/AlertDialog;

    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V
    :try_end_13
    .catch Ljava/lang/IllegalArgumentException; {:try_start_c .. :try_end_13} :catch_13

    :catch_13
    :cond_13
    return-void
.end method

.method public final w(Ljava/util/UUID;Lwh8;)Lxid;
    .registers 15

    iget-object v0, p2, Lwh8;->b:Ljava/lang/String;

    iget-boolean v1, p0, Ltn;->a:Z

    if-nez v1, :cond_c

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_10

    :cond_c
    iget-object v0, p0, Ltn;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    :cond_10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_66

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    sget-object v2, Lq54;->e:Ljava/util/UUID;

    invoke-virtual {v2, p1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_26

    const-string v3, "text/xml"

    goto :goto_33

    :cond_26
    sget-object v3, Lq54;->c:Ljava/util/UUID;

    invoke-virtual {v3, p1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_31

    const-string v3, "application/json"

    goto :goto_33

    :cond_31
    const-string v3, "application/octet-stream"

    :goto_33
    const-string v4, "Content-Type"

    invoke-virtual {v1, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2, p1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_45

    const-string p1, "SOAPAction"

    const-string v2, "http://schemas.microsoft.com/DRM/2007/03/protocols/AcquireLicense"

    invoke-virtual {v1, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_45
    iget-object p1, p0, Ltn;->d:Ljava/lang/Object;

    check-cast p1, Ljava/util/HashMap;

    monitor-enter p1

    :try_start_4a
    iget-object v2, p0, Ltn;->d:Ljava/lang/Object;

    check-cast v2, Ljava/util/HashMap;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    monitor-exit p1
    :try_end_52
    .catchall {:try_start_4a .. :try_end_52} :catchall_63

    iget-object p0, p0, Ltn;->b:Ljava/lang/Object;

    check-cast p0, Lesg;

    invoke-virtual {p0}, Lesg;->createDataSource()Led6;

    move-result-object p0

    iget-object p1, p2, Lwh8;->a:[B

    invoke-static {p0, v0, p1, v1}, Lyi4;->q(Led6;Ljava/lang/String;[BLjava/util/Map;)Lxid;

    move-result-object p0

    return-object p0

    :goto_61
    :try_start_61
    monitor-exit p1
    :try_end_62
    .catchall {:try_start_61 .. :try_end_62} :catchall_63

    throw p0

    :catchall_63
    move-exception v0

    move-object p0, v0

    goto :goto_61

    :cond_66
    new-instance v0, Lyid;

    sget-object v5, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    sget-object v2, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    const-string p0, "The uri must be set."

    invoke-static {v2, p0}, Lz4o;->D(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lnd6;

    const/4 v3, 0x1

    const/4 v4, 0x0

    const-wide/16 v6, 0x0

    const-wide/16 v8, -0x1

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct/range {v1 .. v11}, Lnd6;-><init>(Landroid/net/Uri;I[BLjava/util/Map;JJLjava/lang/String;I)V

    sget-object v3, Lhsh;->d:Lhsh;

    new-instance v6, Ljava/lang/IllegalStateException;

    const-string p0, "No license URL"

    invoke-direct {v6, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    const-wide/16 v4, 0x0

    invoke-direct/range {v0 .. v6}, Lyid;-><init>(Lnd6;Landroid/net/Uri;Ljava/util/Map;JLjava/lang/Exception;)V

    throw v0
.end method

.method public final x(Lxh8;)Lxid;
    .registers 11

    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    const-string v1, "{\"signedRequest\":\""

    invoke-virtual {v1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    iget-object v2, p1, Lxh8;->a:[B

    const-string v3, "\"}"

    invoke-virtual {v3, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    filled-new-array {v1, v2, v0}, [[B

    move-result-object v0

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    move v4, v3

    :goto_18
    const/4 v5, 0x3

    if-ge v4, v5, :cond_23

    aget-object v5, v0, v4

    array-length v5, v5

    int-to-long v5, v5

    add-long/2addr v1, v5

    add-int/lit8 v4, v4, 0x1

    goto :goto_18

    :cond_23
    long-to-int v4, v1

    int-to-long v6, v4

    cmp-long v6, v1, v6

    if-nez v6, :cond_2b

    const/4 v6, 0x1

    goto :goto_2c

    :cond_2b
    move v6, v3

    :goto_2c
    const-string v7, "the total number of elements (%s) in the arrays must fit in an int"

    invoke-static {v1, v2, v6, v7}, Lz4o;->u(JZLjava/lang/String;)V

    new-array v1, v4, [B

    move v2, v3

    move v6, v2

    :goto_35
    if-ge v2, v5, :cond_42

    aget-object v7, v0, v2

    array-length v8, v7

    invoke-static {v7, v3, v1, v6, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v7, v7

    add-int/2addr v6, v7

    add-int/lit8 v2, v2, 0x1

    goto :goto_35

    :cond_42
    iget-object p0, p0, Ltn;->b:Ljava/lang/Object;

    check-cast p0, Lesg;

    invoke-virtual {p0}, Lesg;->createDataSource()Led6;

    move-result-object p0

    iget-object p1, p1, Lxh8;->b:Ljava/lang/String;

    sget-object v0, Lfsd;->i:Lfsd;

    invoke-virtual {v0}, Lfsd;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "Content-Length"

    invoke-static {v3, v2}, Lscd;->p(Ljava/lang/Object;Ljava/lang/Object;)V

    const-string v4, "Content-Type"

    filled-new-array {v4, v0, v3, v2}, [Ljava/lang/Object;

    move-result-object v0

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-static {v3, v0, v2}, Lhsh;->m(I[Ljava/lang/Object;Lk1b;)Lhsh;

    move-result-object v0

    invoke-static {p0, p1, v1, v0}, Lyi4;->q(Led6;Ljava/lang/String;[BLjava/util/Map;)Lxid;

    move-result-object p0

    return-object p0
.end method

.method public final y(I)Lw6g;
    .registers 6

    iget-object v0, p0, Ltn;->d:Ljava/lang/Object;

    check-cast v0, Lfa7;

    iget-object v1, v0, Lfa7;->h:Ljava/lang/Object;

    monitor-enter v1

    :try_start_7
    iget-boolean v2, p0, Ltn;->a:Z

    if-nez v2, :cond_28

    iget-object v2, p0, Ltn;->c:Ljava/lang/Object;

    check-cast v2, [Z

    const/4 v3, 0x1

    aput-boolean v3, v2, p1

    iget-object p0, p0, Ltn;->b:Ljava/lang/Object;

    check-cast p0, Lba7;

    iget-object p0, p0, Lba7;->d:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    iget-object p1, v0, Lfa7;->q:Lda7;

    move-object v0, p0

    check-cast v0, Lw6g;

    invoke-static {p1, v0}, Lphj;->K(Lg29;Lw6g;)V

    check-cast p0, Lw6g;
    :try_end_26
    .catchall {:try_start_7 .. :try_end_26} :catchall_30

    monitor-exit v1

    return-object p0

    :cond_28
    :try_start_28
    const-string p0, "editor is closed"

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_30
    .catchall {:try_start_28 .. :try_end_30} :catchall_30

    :catchall_30
    move-exception p0

    monitor-exit v1

    throw p0
.end method

.method public final z()Ljava/io/File;
    .registers 6

    iget-object v0, p0, Ltn;->d:Ljava/lang/Object;

    check-cast v0, Lea7;

    monitor-enter v0

    :try_start_5
    iget-object v1, p0, Ltn;->b:Ljava/lang/Object;

    check-cast v1, Laa7;

    iget-object v2, v1, Laa7;->f:Ltn;

    if-ne v2, p0, :cond_34

    iget-boolean v2, v1, Laa7;->e:Z

    const/4 v3, 0x0

    if-nez v2, :cond_19

    iget-object v2, p0, Ltn;->c:Ljava/lang/Object;

    check-cast v2, [Z

    const/4 v4, 0x1

    aput-boolean v4, v2, v3

    :cond_19
    iget-object v1, v1, Laa7;->d:[Ljava/io/File;

    aget-object v1, v1, v3

    iget-object v2, p0, Ltn;->d:Ljava/lang/Object;

    check-cast v2, Lea7;

    iget-object v2, v2, Lea7;->a:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_32

    iget-object p0, p0, Ltn;->d:Ljava/lang/Object;

    check-cast p0, Lea7;

    iget-object p0, p0, Lea7;->a:Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    :cond_32
    monitor-exit v0

    return-object v1

    :cond_34
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    throw p0

    :goto_3a
    monitor-exit v0
    :try_end_3b
    .catchall {:try_start_5 .. :try_end_3b} :catchall_3c

    throw p0

    :catchall_3c
    move-exception p0

    goto :goto_3a
.end method
