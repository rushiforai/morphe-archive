.class public Lcom/p1/mobile/putong/remote_config/RemoteConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;
    }
.end annotation


# static fields
.field public static final g:[B

.field public static final h:Ll/ra5;

.field public static i:Ll/wyd0;

.field public static j:Ll/wyd0;

.field public static k:Ll/wyd0;

.field public static l:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;",
            ">;"
        }
    .end annotation
.end field

.field public static final m:Ll/zqf0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/zqf0<",
            "Lcom/p1/mobile/putong/remote_config/RemoteConfig;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Landroid/content/Context;

.field public f:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    sput-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->g:[B

    .line 5
    .line 6
    invoke-static {}, Ll/ond;->a()Ll/ra5;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->h:Ll/ra5;

    .line 11
    .line 12
    new-instance v0, Ll/wyd0;

    .line 13
    .line 14
    const-string v1, "saved_device_uid_md5"

    .line 15
    .line 16
    const-string v2, ""

    .line 17
    .line 18
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    sput-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->i:Ll/wyd0;

    .line 22
    .line 23
    new-instance v0, Ll/wyd0;

    .line 24
    .line 25
    const-string v1, "saved_user_md5"

    .line 26
    .line 27
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    sput-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->j:Ll/wyd0;

    .line 31
    .line 32
    new-instance v0, Ll/wyd0;

    .line 33
    .line 34
    const-string v1, "saved_md5_version"

    .line 35
    .line 36
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->k:Ll/wyd0;

    .line 40
    .line 41
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->l:Lrx/subjects/a;

    .line 46
    .line 47
    new-instance v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig$a;

    .line 48
    .line 49
    invoke-direct {v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig$a;-><init>()V

    .line 50
    .line 51
    .line 52
    sput-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->m:Ll/zqf0;

    .line 53
    .line 54
    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->e:Landroid/content/Context;

    .line 13
    .line 14
    const-string v0, "activate"

    .line 15
    .line 16
    const-string v1, "rc"

    .line 17
    .line 18
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v2, "%s_%s.json"

    .line 23
    .line 24
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->a:Ljava/lang/String;

    .line 29
    .line 30
    const-string v0, "activate_device"

    .line 31
    .line 32
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->b:Ljava/lang/String;

    .line 41
    .line 42
    const-string v0, "fetch"

    .line 43
    .line 44
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->c:Ljava/lang/String;

    .line 53
    .line 54
    const-string v0, "fetch_device"

    .line 55
    .line 56
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->d:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->o()V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->e:Landroid/content/Context;

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->a:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    if-eqz v0, :cond_0

    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_0

    .line 84
    .line 85
    invoke-virtual {v0}, Ljava/io/File;->length()J

    .line 86
    .line 87
    .line 88
    move-result-wide v0

    .line 89
    const-wide/16 v2, 0x258

    .line 90
    .line 91
    div-long/2addr v0, v2

    .line 92
    long-to-int v0, v0

    .line 93
    goto :goto_0

    .line 94
    :cond_0
    const/4 v0, 0x0

    .line 95
    :goto_0
    const/16 v1, 0x1e

    .line 96
    .line 97
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    new-instance v1, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    const-string v2, "init lur cache size:"

    .line 104
    .line 105
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    const-string v2, "RemoteConfig"

    .line 116
    .line 117
    invoke-static {v2, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    new-instance v1, Landroid/util/LruCache;

    .line 121
    .line 122
    invoke-direct {v1, v0}, Landroid/util/LruCache;-><init>(I)V

    .line 123
    .line 124
    .line 125
    iput-object v1, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->f:Landroid/util/LruCache;

    .line 126
    .line 127
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->a0()V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public synthetic constructor <init>(Ll/yxc0;)V
    .locals 0

    .line 131
    invoke-direct {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;-><init>()V

    return-void
.end method

.method public static C()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->i:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/String;

    .line 8
    .line 9
    return-object v0
.end method

.method public static D()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->j:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/String;

    .line 8
    .line 9
    return-object v0
.end method

.method public static I(Lcom/p1/mobile/putong/remote_config/a;Lcom/p1/mobile/putong/remote_config/a;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/a;->e()Ljava/util/Date;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/remote_config/a;->e()Ljava/util/Date;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public static X(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static Y()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->l:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Ljava/lang/String;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)Landroid/util/Pair;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->S(Ljava/lang/String;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)Landroid/util/Pair;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/remote_config/RemoteConfig;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->V()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Ll/jni0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->L(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Ll/jni0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static c0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->l:Lrx/subjects/a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Ljava/lang/Boolean;)Ll/jni0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->N(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Ljava/lang/Boolean;)Ll/jni0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->Q(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Landroid/util/Pair;Ljava/lang/Boolean;)Ll/jni0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->T(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Landroid/util/Pair;Ljava/lang/Boolean;)Ll/jni0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Lorg/json/JSONObject;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->O(Lorg/json/JSONObject;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Ll/jni0;)Ll/jni0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->U(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Ll/jni0;)Ll/jni0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->P(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Ll/jni0;Ll/jni0;Ll/bw5;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Ll/jni0;)Ll/jni0;
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->M(Ll/jni0;Ll/jni0;Ll/bw5;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Ll/jni0;)Ll/jni0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->R(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Ll/jni0;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->W(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Ll/jni0;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->m:Ll/zqf0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zqf0;->b()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public A(Ljava/lang/String;)J
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->u()Ll/nw5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/nw5;->q(Ljava/lang/String;)J

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    return-wide p0
.end method

.method public B(Ljava/lang/String;J)J
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->u()Ll/nw5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/nw5;->r(Ljava/lang/String;J)J

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    return-wide p0
.end method

.method public final E(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)Ll/nw5;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig$b;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p1, v0, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->c:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->a:Ljava/lang/String;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->d:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->b:Ljava/lang/String;

    .line 20
    .line 21
    :goto_0
    invoke-static {v0, p1}, Ll/nw5;->g(Ljava/lang/String;Ljava/lang/String;)Ll/nw5;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    if-nez v1, :cond_2

    .line 26
    .line 27
    const-class v1, Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 28
    .line 29
    monitor-enter v1

    .line 30
    :try_start_0
    invoke-static {v0, p1}, Ll/nw5;->g(Ljava/lang/String;Ljava/lang/String;)Ll/nw5;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    if-nez v2, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->t(Ljava/lang/String;)Ll/bw5;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->t(Ljava/lang/String;)Ll/bw5;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {v2, p0}, Ll/nw5;->c(Ll/bw5;Ll/bw5;)Ll/nw5;

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :catchall_0
    move-exception p0

    .line 49
    goto :goto_2

    .line 50
    :cond_1
    :goto_1
    monitor-exit v1

    .line 51
    goto :goto_3

    .line 52
    :goto_2
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    throw p0

    .line 54
    :cond_2
    :goto_3
    invoke-static {v0, p1}, Ll/nw5;->g(Ljava/lang/String;Ljava/lang/String;)Ll/nw5;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0
.end method

.method public F(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->u()Ll/nw5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/nw5;->t(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public G(Ljava/lang/String;)Ll/hyc0;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->u()Ll/nw5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/nw5;->v(Ljava/lang/String;)Ll/hyc0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final H()Z
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->i:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/CharSequence;

    .line 8
    .line 9
    const-string v1, ""

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x1

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    return v1

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->e:Landroid/content/Context;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->b:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/io/File;->length()J

    .line 34
    .line 35
    .line 36
    move-result-wide v2

    .line 37
    const-wide/16 v4, 0x0

    .line 38
    .line 39
    cmp-long p0, v2, v4

    .line 40
    .line 41
    if-nez p0, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const/4 p0, 0x0

    .line 45
    return p0

    .line 46
    :cond_2
    :goto_0
    return v1
.end method

.method public final J()Z
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->j:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/CharSequence;

    .line 8
    .line 9
    const-string v1, ""

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x1

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    return v1

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->e:Landroid/content/Context;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->a:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/io/File;->length()J

    .line 34
    .line 35
    .line 36
    move-result-wide v2

    .line 37
    const-wide/16 v4, 0x0

    .line 38
    .line 39
    cmp-long p0, v2, v4

    .line 40
    .line 41
    if-nez p0, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const/4 p0, 0x0

    .line 45
    return p0

    .line 46
    :cond_2
    :goto_0
    return v1
.end method

.method public K()Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/app/TantanApp;->e:Ll/gxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/app/TantanApp;->d:Ll/kxd0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/bzd0;->b()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;->USER:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;->UID:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;->DEVICE:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    .line 36
    .line 37
    return-object p0
.end method

.method public final synthetic L(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Ll/jni0;)Ljava/lang/Boolean;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->Z(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Ll/jni0;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic M(Ll/jni0;Ll/jni0;Ll/bw5;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Ll/jni0;)Ll/jni0;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/jni0;->i()Z

    .line 2
    .line 3
    .line 4
    move-result p5

    .line 5
    if-eqz p5, :cond_2

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/jni0;->g()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p5

    .line 11
    if-nez p5, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p1}, Ll/jni0;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/p1/mobile/putong/remote_config/a;

    .line 19
    .line 20
    invoke-virtual {p2}, Ll/jni0;->i()Z

    .line 21
    .line 22
    .line 23
    move-result p5

    .line 24
    if-eqz p5, :cond_1

    .line 25
    .line 26
    invoke-virtual {p2}, Ll/jni0;->g()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    check-cast p2, Lcom/p1/mobile/putong/remote_config/a;

    .line 31
    .line 32
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->I(Lcom/p1/mobile/putong/remote_config/a;Lcom/p1/mobile/putong/remote_config/a;)Z

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    if-nez p2, :cond_1

    .line 37
    .line 38
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 39
    .line 40
    invoke-static {p0}, Ll/soi0;->e(Ljava/lang/Object;)Ll/jni0;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0

    .line 45
    :cond_1
    invoke-virtual {p3, p1}, Ll/bw5;->h(Lcom/p1/mobile/putong/remote_config/a;)Ll/jni0;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->e0()Ll/f2e0;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    new-instance p3, Ll/oxc0;

    .line 54
    .line 55
    invoke-direct {p3, p0, p4}, Ll/oxc0;-><init>(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, p2, p3}, Ll/jni0;->d(Ll/f2e0;Ll/t26;)Ll/jni0;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0

    .line 63
    :cond_2
    :goto_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 64
    .line 65
    invoke-static {p0}, Ll/soi0;->e(Ljava/lang/Object;)Ll/jni0;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0
.end method

.method public final synthetic N(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Ljava/lang/Boolean;)Ll/jni0;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->m(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)Ll/jni0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic O(Lorg/json/JSONObject;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)Ljava/lang/Boolean;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/a;->f()Lcom/p1/mobile/putong/remote_config/a$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/remote_config/a$a;->b(Lorg/json/JSONObject;)Lcom/p1/mobile/putong/remote_config/a$a;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ljava/util/Date;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->h:Ll/ra5;

    .line 12
    .line 13
    invoke-interface {v1}, Ll/ra5;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/remote_config/a$a;->c(Ljava/util/Date;)Lcom/p1/mobile/putong/remote_config/a$a;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/remote_config/a$a;->a()Lcom/p1/mobile/putong/remote_config/a;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->E(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)Ll/nw5;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Ll/nw5;->l()Ll/bw5;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0, p1}, Ll/bw5;->h(Lcom/p1/mobile/putong/remote_config/a;)Ll/jni0;

    .line 37
    .line 38
    .line 39
    const-string p0, "RemoteConfig"

    .line 40
    .line 41
    const-string p1, "fetchAndActive"

    .line 42
    .line 43
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 47
    .line 48
    return-object p0
.end method

.method public final synthetic P(Ll/uxj0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->K()Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "ABManager callback : Device: curStatus : "

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "RemoteConfig"

    .line 20
    .line 21
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;->DEVICE:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    .line 25
    .line 26
    if-ne p1, v0, :cond_0

    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->e()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->d0(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public final synthetic Q(Ll/uxj0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->K()Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "ABManager callback : UID: curStatus : "

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "RemoteConfig"

    .line 20
    .line 21
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;->UID:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    .line 25
    .line 26
    if-ne p1, v0, :cond_0

    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->c0()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->d0(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public final synthetic R(Ll/uxj0;)V
    .locals 1

    .line 1
    const-string p1, "RemoteConfig"

    .line 2
    .line 3
    const-string v0, "ABManager callback : USER: "

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p1, Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;->USER:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->b()Ll/wyd0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->d0(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic S(Ljava/lang/String;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)Landroid/util/Pair;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 3
    .line 4
    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    .line 6
    .line 7
    goto :goto_0

    .line 8
    :catch_0
    move-object v1, v0

    .line 9
    :goto_0
    if-nez v1, :cond_0

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    const-string p1, "remoteStrategy"

    .line 13
    .line 14
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const/4 v2, 0x0

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    const-string v3, "md5"

    .line 22
    .line 23
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    const-string v4, "refresh"

    .line 28
    .line 29
    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    const-string v5, "increaseUpdate"

    .line 34
    .line 35
    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    const/4 v4, 0x1

    .line 41
    const-string v3, ""

    .line 42
    .line 43
    move p1, v2

    .line 44
    :goto_1
    new-instance v5, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v6, "newMD5:"

    .line 47
    .line 48
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v6, " needRefreshCache:"

    .line 55
    .line 56
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v6, " increaseUpdate:"

    .line 63
    .line 64
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    const-string v6, "RemoteConfig"

    .line 75
    .line 76
    invoke-static {v6, v5}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    if-eqz v4, :cond_8

    .line 80
    .line 81
    if-eqz p1, :cond_6

    .line 82
    .line 83
    const-string p1, "increaseRemoteConfigs"

    .line 84
    .line 85
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    const-string v4, "increaseDeletedKeys"

    .line 90
    .line 91
    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->E(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)Ll/nw5;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    invoke-virtual {p2}, Ll/nw5;->d()Ll/bw5;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    invoke-virtual {p2}, Ll/bw5;->d()Lcom/p1/mobile/putong/remote_config/a;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    if-nez v4, :cond_3

    .line 108
    .line 109
    const-string p1, "activeConfigContainer == null"

    .line 110
    .line 111
    invoke-static {v6, p1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p2}, Ll/bw5;->g()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    iget-object p2, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->e:Landroid/content/Context;

    .line 119
    .line 120
    invoke-virtual {p2, p1}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    .line 121
    .line 122
    .line 123
    move-result-object p2

    .line 124
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    if-eqz v1, :cond_2

    .line 129
    .line 130
    invoke-virtual {p2}, Ljava/io/File;->length()J

    .line 131
    .line 132
    .line 133
    move-result-wide v1

    .line 134
    :try_start_1
    invoke-static {p2}, Ll/oki;->A(Ljava/io/File;)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 138
    goto :goto_2

    .line 139
    :catchall_0
    move-exception p2

    .line 140
    new-instance v3, Ljava/lang/StringBuilder;

    .line 141
    .line 142
    const-string v4, "error : "

    .line 143
    .line 144
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    invoke-static {p2}, Ll/xtb;->b(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p2

    .line 151
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p2

    .line 158
    :goto_2
    new-instance v3, Ljava/lang/StringBuilder;

    .line 159
    .line 160
    const-string v4, "file exists , fileName="

    .line 161
    .line 162
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    const-string p1, ", length="

    .line 169
    .line 170
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    const-string p1, ", content="

    .line 177
    .line 178
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    invoke-static {v6, p1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    goto :goto_3

    .line 192
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 193
    .line 194
    const-string v1, "file not exists , file="

    .line 195
    .line 196
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object p2

    .line 203
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    invoke-static {v6, p1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    :goto_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->b0()Ll/jni0;

    .line 214
    .line 215
    .line 216
    return-object v0

    .line 217
    :cond_3
    invoke-virtual {v4}, Lcom/p1/mobile/putong/remote_config/a;->c()Ljava/util/Map;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    new-instance p2, Ljava/lang/StringBuilder;

    .line 222
    .line 223
    const-string v0, "increaseUpdate before size:"

    .line 224
    .line 225
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object p2

    .line 239
    invoke-static {v6, p2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    if-eqz p1, :cond_4

    .line 243
    .line 244
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 245
    .line 246
    .line 247
    move-result-object p2

    .line 248
    :goto_4
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 249
    .line 250
    .line 251
    move-result v0

    .line 252
    if-eqz v0, :cond_4

    .line 253
    .line 254
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    check-cast v0, Ljava/lang/String;

    .line 259
    .line 260
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v4

    .line 264
    invoke-interface {p0, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    .line 266
    .line 267
    goto :goto_4

    .line 268
    :cond_4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 269
    .line 270
    const-string p2, "increaseUpdate after increase size:"

    .line 271
    .line 272
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 276
    .line 277
    .line 278
    move-result p2

    .line 279
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object p1

    .line 286
    invoke-static {v6, p1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    if-eqz v1, :cond_5

    .line 290
    .line 291
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    .line 292
    .line 293
    .line 294
    move-result p1

    .line 295
    :goto_5
    if-ge v2, p1, :cond_5

    .line 296
    .line 297
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object p2

    .line 301
    invoke-interface {p0, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    .line 303
    .line 304
    add-int/lit8 v2, v2, 0x1

    .line 305
    .line 306
    goto :goto_5

    .line 307
    :cond_5
    new-instance p1, Ljava/lang/StringBuilder;

    .line 308
    .line 309
    const-string p2, "increaseUpdate after delete size:"

    .line 310
    .line 311
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 312
    .line 313
    .line 314
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 315
    .line 316
    .line 317
    move-result p2

    .line 318
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 319
    .line 320
    .line 321
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object p1

    .line 325
    invoke-static {v6, p1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 326
    .line 327
    .line 328
    new-instance p1, Landroid/util/Pair;

    .line 329
    .line 330
    new-instance p2, Lorg/json/JSONObject;

    .line 331
    .line 332
    invoke-direct {p2, p0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 333
    .line 334
    .line 335
    invoke-direct {p1, p2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 336
    .line 337
    .line 338
    return-object p1

    .line 339
    :cond_6
    const-string p0, "remoteConfigs"

    .line 340
    .line 341
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 342
    .line 343
    .line 344
    move-result-object p0

    .line 345
    if-nez p0, :cond_7

    .line 346
    .line 347
    return-object v0

    .line 348
    :cond_7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 349
    .line 350
    const-string p2, "fullUpdate:"

    .line 351
    .line 352
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 353
    .line 354
    .line 355
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 356
    .line 357
    .line 358
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object p1

    .line 362
    invoke-static {v6, p1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 363
    .line 364
    .line 365
    new-instance p1, Landroid/util/Pair;

    .line 366
    .line 367
    invoke-direct {p1, p0, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 368
    .line 369
    .line 370
    return-object p1

    .line 371
    :cond_8
    return-object v0
.end method

.method public final synthetic T(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Landroid/util/Pair;Ljava/lang/Boolean;)Ll/jni0;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    iget-object p2, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p2, Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, p3, p1, p2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->p(ZLcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Ljava/lang/String;)Ll/jni0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic U(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Ll/jni0;)Ll/jni0;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "update disk data:step:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " data:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2}, Ll/jni0;->g()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "RemoteConfig"

    .line 28
    .line 29
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2}, Ll/jni0;->g()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    invoke-virtual {p2}, Ll/jni0;->g()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    check-cast p2, Landroid/util/Pair;

    .line 43
    .line 44
    iget-object v0, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast v0, Lorg/json/JSONObject;

    .line 47
    .line 48
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->q(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Lorg/json/JSONObject;)Ll/jni0;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->e0()Ll/f2e0;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    new-instance v2, Ll/uxc0;

    .line 57
    .line 58
    invoke-direct {v2, p0, p1, p2}, Ll/uxc0;-><init>(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Landroid/util/Pair;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1, v2}, Ll/jni0;->j(Ll/f2e0;Ll/ydg0;)Ll/jni0;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0

    .line 66
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 67
    .line 68
    invoke-static {p0}, Ll/soi0;->e(Ljava/lang/Object;)Ll/jni0;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0
.end method

.method public final synthetic V()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->r()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/wxc0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/wxc0;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Lcom/google/common/collect/Maps;->D(Ljava/util/Map;Ll/adj;)Ljava/util/Map;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance v0, Lorg/json/JSONObject;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "RemoteConfig"

    .line 24
    .line 25
    invoke-static {v0, p0}, Ll/vu2;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic W(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Ll/jni0;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ll/jni0;->g()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    check-cast p2, Ll/jni0;

    .line 6
    .line 7
    invoke-virtual {p2}, Ll/jni0;->g()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    check-cast p2, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->f:Landroid/util/LruCache;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/util/LruCache;->evictAll()V

    .line 22
    .line 23
    .line 24
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v1, "updateWithAb complete and notify listeners:"

    .line 27
    .line 28
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v1, " result:"

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    const-string v0, "RemoteConfig"

    .line 47
    .line 48
    invoke-static {v0, p2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-static {p2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    sget-object p2, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->l:Lrx/subjects/a;

    .line 62
    .line 63
    invoke-virtual {p2, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    new-instance p1, Ll/vxc0;

    .line 77
    .line 78
    invoke-direct {p1, p0}, Ll/vxc0;-><init>(Lcom/p1/mobile/putong/remote_config/RemoteConfig;)V

    .line 79
    .line 80
    .line 81
    invoke-static {p1}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 82
    .line 83
    .line 84
    const/4 p0, 0x0

    .line 85
    return-object p0
.end method

.method public final Z(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Ll/jni0;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;",
            "Ll/jni0<",
            "Lcom/p1/mobile/putong/remote_config/a;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ll/jni0;->i()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->E(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)Ll/nw5;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ll/nw5;->l()Ll/bw5;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ll/bw5;->b()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->f:Landroid/util/LruCache;

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/util/LruCache;->evictAll()V

    .line 23
    .line 24
    .line 25
    :cond_0
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_1
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public final a0()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->n()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/lxc0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/lxc0;-><init>(Lcom/p1/mobile/putong/remote_config/RemoteConfig;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->p()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/pxc0;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/pxc0;-><init>(Lcom/p1/mobile/putong/remote_config/RemoteConfig;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->r()Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/qxc0;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/qxc0;-><init>(Lcom/p1/mobile/putong/remote_config/RemoteConfig;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public b0()Ll/jni0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/jni0<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "RemoteConfig"

    .line 2
    .line 3
    const-string v1, "reset"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;->USER:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->E(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)Ll/nw5;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ll/nw5;->l()Ll/bw5;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->E(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)Ll/nw5;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ll/nw5;->d()Ll/bw5;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ll/bw5;->b()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ll/bw5;->b()V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->f:Landroid/util/LruCache;

    .line 33
    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/util/LruCache;->evictAll()V

    .line 37
    .line 38
    .line 39
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->j:Ll/wyd0;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/wyd0;->clear()Z

    .line 42
    .line 43
    .line 44
    sget-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->i:Ll/wyd0;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/wyd0;->clear()Z

    .line 47
    .line 48
    .line 49
    sget-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->k:Ll/wyd0;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/wyd0;->clear()Z

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->o()V

    .line 55
    .line 56
    .line 57
    const/4 p0, 0x0

    .line 58
    invoke-static {p0}, Ll/soi0;->e(Ljava/lang/Object;)Ll/jni0;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public d0(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->e0()Ll/f2e0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/rxc0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p2, p1}, Ll/rxc0;-><init>(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Ljava/lang/String;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/soi0;->b(Ll/f2e0;Ljava/util/concurrent/Callable;)Ll/jni0;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->e0()Ll/f2e0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/sxc0;

    .line 19
    .line 20
    invoke-direct {v1, p0, p1}, Ll/sxc0;-><init>(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2, v0, v1}, Ll/jni0;->d(Ll/f2e0;Ll/t26;)Ll/jni0;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->e0()Ll/f2e0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/txc0;

    .line 32
    .line 33
    invoke-direct {v1, p0, p1}, Ll/txc0;-><init>(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2, v0, v1}, Ll/jni0;->d(Ll/f2e0;Ll/t26;)Ll/jni0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final e0()Ll/f2e0;
    .locals 0

    .line 1
    invoke-static {}, Lrx/schedulers/Schedulers;->trampoline()Ll/f2e0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)Ll/jni0;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;",
            ")",
            "Ll/jni0<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->E(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)Ll/nw5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/nw5;->l()Ll/bw5;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->E(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)Ll/nw5;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ll/nw5;->d()Ll/bw5;

    .line 14
    .line 15
    .line 16
    move-result-object v6

    .line 17
    invoke-virtual {v0}, Ll/bw5;->c()Ll/jni0;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    invoke-virtual {v6}, Ll/bw5;->c()Ll/jni0;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    const-string v0, "RemoteConfig"

    .line 26
    .line 27
    const-string v1, " activate"

    .line 28
    .line 29
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->e0()Ll/f2e0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    filled-new-array {v4, v5}, [Ll/jni0;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-static {v0, v1}, Ll/soi0;->i(Ll/f2e0;[Ll/jni0;)Ll/jni0;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->e0()Ll/f2e0;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    new-instance v2, Ll/nxc0;

    .line 49
    .line 50
    move-object v3, p0

    .line 51
    move-object v7, p1

    .line 52
    invoke-direct/range {v2 .. v7}, Ll/nxc0;-><init>(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Ll/jni0;Ll/jni0;Ll/bw5;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1, v2}, Ll/jni0;->e(Ll/f2e0;Ll/t26;)Ll/jni0;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0
.end method

.method public n(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Lorg/json/JSONObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/a;->f()Lcom/p1/mobile/putong/remote_config/a$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/remote_config/a$a;->b(Lorg/json/JSONObject;)Lcom/p1/mobile/putong/remote_config/a$a;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    new-instance v0, Ljava/util/Date;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->h:Ll/ra5;

    .line 12
    .line 13
    invoke-interface {v1}, Ll/ra5;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/remote_config/a$a;->c(Ljava/util/Date;)Lcom/p1/mobile/putong/remote_config/a$a;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p2}, Lcom/p1/mobile/putong/remote_config/a$a;->a()Lcom/p1/mobile/putong/remote_config/a;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->E(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)Ll/nw5;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Ll/nw5;->d()Ll/bw5;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0, p2}, Ll/bw5;->h(Lcom/p1/mobile/putong/remote_config/a;)Ll/jni0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final o()V
    .locals 8

    .line 1
    const-string v0, "activePresetDataIfNeeded"

    .line 2
    .line 3
    const-string v1, "RemoteConfig"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->k:Ll/wyd0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ljava/lang/CharSequence;

    .line 15
    .line 16
    sget-object v2, Ll/uqb0;->s:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v2, 0x1

    .line 23
    const/4 v3, 0x0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->H()Z

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    if-eqz v4, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    move v4, v3

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    :goto_0
    move v4, v2

    .line 36
    :goto_1
    if-eqz v0, :cond_3

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->J()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    goto :goto_2

    .line 45
    :cond_2
    move v2, v3

    .line 46
    :cond_3
    :goto_2
    if-nez v4, :cond_4

    .line 47
    .line 48
    if-eqz v2, :cond_b

    .line 49
    .line 50
    :cond_4
    sget-object v0, Ll/qv5;->a:Ll/wyd0;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Ljava/lang/CharSequence;

    .line 57
    .line 58
    const-string v5, "tantanapp"

    .line 59
    .line 60
    invoke-static {v0, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_5

    .line 65
    .line 66
    const-string v0, "rc_release_default.json"

    .line 67
    .line 68
    goto :goto_3

    .line 69
    :cond_5
    const-string v0, "rc_debug_default.json"

    .line 70
    .line 71
    :goto_3
    const/4 v5, 0x0

    .line 72
    :try_start_0
    iget-object v6, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->e:Landroid/content/Context;

    .line 73
    .line 74
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 75
    .line 76
    .line 77
    move-result-object v6

    .line 78
    invoke-virtual {v6}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    .line 79
    .line 80
    .line 81
    move-result-object v6

    .line 82
    invoke-virtual {v6, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    invoke-virtual {v5}, Ljava/io/InputStream;->available()I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    new-array v6, v0, [B

    .line 91
    .line 92
    invoke-virtual {v5, v6, v3, v0}, Ljava/io/InputStream;->read([BII)I

    .line 93
    .line 94
    .line 95
    new-instance v0, Ljava/lang/String;

    .line 96
    .line 97
    const-string v3, "UTF-8"

    .line 98
    .line 99
    invoke-direct {v0, v6, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 100
    .line 101
    .line 102
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 103
    .line 104
    .line 105
    move-result v3
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 106
    if-eqz v3, :cond_6

    .line 107
    .line 108
    invoke-static {v5}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_6
    :try_start_1
    new-instance v3, Lorg/json/JSONObject;

    .line 113
    .line 114
    invoke-direct {v3, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    const-string v0, "remoteConfigs"

    .line 118
    .line 119
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    const-string v6, "md5"

    .line 124
    .line 125
    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    if-eqz v4, :cond_7

    .line 130
    .line 131
    sget-object v6, Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;->DEVICE:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    .line 132
    .line 133
    invoke-virtual {p0, v6, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->n(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Lorg/json/JSONObject;)V

    .line 134
    .line 135
    .line 136
    sget-object v6, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->i:Ll/wyd0;

    .line 137
    .line 138
    invoke-virtual {v6, v3}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    iget-object v6, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->e:Landroid/content/Context;

    .line 142
    .line 143
    iget-object v7, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->d:Ljava/lang/String;

    .line 144
    .line 145
    invoke-virtual {v6, v7}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z

    .line 146
    .line 147
    .line 148
    goto :goto_4

    .line 149
    :catchall_0
    move-exception p0

    .line 150
    goto :goto_9

    .line 151
    :catch_0
    move-exception p0

    .line 152
    goto :goto_5

    .line 153
    :catch_1
    move-exception v0

    .line 154
    goto :goto_7

    .line 155
    :cond_7
    :goto_4
    if-eqz v2, :cond_8

    .line 156
    .line 157
    sget-object v6, Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;->USER:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    .line 158
    .line 159
    invoke-virtual {p0, v6, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->n(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Lorg/json/JSONObject;)V

    .line 160
    .line 161
    .line 162
    sget-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->j:Ll/wyd0;

    .line 163
    .line 164
    invoke-virtual {v0, v3}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->e:Landroid/content/Context;

    .line 168
    .line 169
    iget-object v3, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->c:Ljava/lang/String;

    .line 170
    .line 171
    invoke-virtual {v0, v3}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z

    .line 172
    .line 173
    .line 174
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->k:Ll/wyd0;

    .line 175
    .line 176
    sget-object v3, Ll/uqb0;->s:Ljava/lang/String;

    .line 177
    .line 178
    invoke-virtual {v0, v3}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    const-string v0, "activePresetDataIfNeeded use assets config"

    .line 182
    .line 183
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->X(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 184
    .line 185
    .line 186
    invoke-static {v5}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 187
    .line 188
    .line 189
    return-void

    .line 190
    :goto_5
    :try_start_2
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 191
    .line 192
    .line 193
    :cond_9
    :goto_6
    invoke-static {v5}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 194
    .line 195
    .line 196
    goto :goto_8

    .line 197
    :goto_7
    :try_start_3
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 198
    .line 199
    .line 200
    if-eqz v4, :cond_a

    .line 201
    .line 202
    sget-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->i:Ll/wyd0;

    .line 203
    .line 204
    invoke-virtual {v0}, Ll/wyd0;->clear()Z

    .line 205
    .line 206
    .line 207
    iget-object v0, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->e:Landroid/content/Context;

    .line 208
    .line 209
    iget-object v1, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->d:Ljava/lang/String;

    .line 210
    .line 211
    invoke-virtual {v0, v1}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z

    .line 212
    .line 213
    .line 214
    :cond_a
    if-eqz v2, :cond_9

    .line 215
    .line 216
    sget-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->j:Ll/wyd0;

    .line 217
    .line 218
    invoke-virtual {v0}, Ll/wyd0;->clear()Z

    .line 219
    .line 220
    .line 221
    iget-object v0, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->e:Landroid/content/Context;

    .line 222
    .line 223
    iget-object p0, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->c:Ljava/lang/String;

    .line 224
    .line 225
    invoke-virtual {v0, p0}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 226
    .line 227
    .line 228
    goto :goto_6

    .line 229
    :cond_b
    :goto_8
    return-void

    .line 230
    :goto_9
    invoke-static {v5}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 231
    .line 232
    .line 233
    throw p0
.end method

.method public final p(ZLcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Ljava/lang/String;)Ll/jni0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;",
            "Ljava/lang/String;",
            ")",
            "Ll/jni0<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "afterActive save md5, result:"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v0, "  step:"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v0, " md5:"

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v0, "RemoteConfig"

    .line 32
    .line 33
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    if-eqz p1, :cond_2

    .line 37
    .line 38
    sget-object p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;->USER:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    .line 39
    .line 40
    if-eq p2, p0, :cond_1

    .line 41
    .line 42
    sget-object p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;->UID:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    .line 43
    .line 44
    if-ne p2, p0, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->i:Ll/wyd0;

    .line 48
    .line 49
    invoke-virtual {p0, p3}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    sget-object p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->k:Ll/wyd0;

    .line 53
    .line 54
    sget-object p1, Ll/uqb0;->s:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_1
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->j:Ll/wyd0;

    .line 61
    .line 62
    invoke-virtual {p0, p3}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    sget-object p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->k:Ll/wyd0;

    .line 66
    .line 67
    sget-object p1, Ll/uqb0;->s:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    :cond_2
    :goto_1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 73
    .line 74
    invoke-static {p0}, Ll/soi0;->e(Ljava/lang/Object;)Ll/jni0;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0
.end method

.method public q(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Lorg/json/JSONObject;)Ll/jni0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;",
            "Lorg/json/JSONObject;",
            ")",
            "Ll/jni0<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->e0()Ll/f2e0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/xxc0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p2, p1}, Ll/xxc0;-><init>(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Lorg/json/JSONObject;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/soi0;->b(Ll/f2e0;Ljava/util/concurrent/Callable;)Ll/jni0;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->e0()Ll/f2e0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/mxc0;

    .line 19
    .line 20
    invoke-direct {v1, p0, p1}, Ll/mxc0;-><init>(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2, v0, v1}, Ll/jni0;->j(Ll/f2e0;Ll/ydg0;)Ll/jni0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public r()Ljava/util/Map;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/hyc0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->u()Ll/nw5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/nw5;->e()Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public s(Ljava/lang/String;)Z
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->u()Ll/nw5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/nw5;->f(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final t(Ljava/lang/String;)Ll/bw5;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->e:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/rw5;->c(Landroid/content/Context;Ljava/lang/String;)Ll/rw5;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/bw5;->f(Ll/rw5;)Ll/bw5;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final u()Ll/nw5;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->K()Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->E(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)Ll/nw5;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantanapp/common/data/JsonAdapter;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/p1/mobile/putong/remote_config/RemoteConfigException;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->f:Landroid/util/LruCache;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return-object p0

    .line 22
    :cond_1
    invoke-virtual {p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->f:Landroid/util/LruCache;

    .line 27
    .line 28
    invoke-virtual {p0, p1, p2}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    .line 31
    return-object p2

    .line 32
    :catch_0
    move-exception p0

    .line 33
    new-instance p1, Lcom/p1/mobile/putong/remote_config/RemoteConfigException;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    if-nez p2, :cond_2

    .line 40
    .line 41
    const-string p0, "RemoteConfig JsonAdapter Parse Error"

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    :goto_0
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfigException;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    throw p1
.end method

.method public w(Ljava/lang/String;)D
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->u()Ll/nw5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/nw5;->i(Ljava/lang/String;)D

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    return-wide p0
.end method

.method public y(Ljava/lang/String;)I
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->u()Ll/nw5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/nw5;->m(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public z(Ljava/lang/String;I)I
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->u()Ll/nw5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Ll/nw5;->n(Ljava/lang/String;I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
