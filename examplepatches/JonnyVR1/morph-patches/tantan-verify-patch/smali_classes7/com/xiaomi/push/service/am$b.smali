.class public Lcom/xiaomi/push/service/am$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/service/am;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/push/service/am$b$a;,
        Lcom/xiaomi/push/service/am$b$b;,
        Lcom/xiaomi/push/service/am$b$c;
    }
.end annotation


# instance fields
.field private a:I

.field public a:Landroid/content/Context;

.field a:Landroid/os/IBinder$DeathRecipient;

.field a:Landroid/os/Messenger;

.field private a:Lcom/xiaomi/push/service/XMPushService$c;

.field private a:Lcom/xiaomi/push/service/XMPushService;

.field final a:Lcom/xiaomi/push/service/am$b$b;

.field a:Lcom/xiaomi/push/service/am$c;

.field public a:Lcom/xiaomi/push/service/h;

.field public a:Ljava/lang/String;

.field private final a:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lcom/xiaomi/push/service/am$b$a;",
            ">;"
        }
    .end annotation
.end field

.field public a:Z

.field b:Lcom/xiaomi/push/service/am$c;

.field public b:Ljava/lang/String;

.field private b:Z

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    sget-object v0, Lcom/xiaomi/push/service/am$c;->a:Lcom/xiaomi/push/service/am$c;

    iput-object v0, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/am$c;

    const/4 v0, 0x0

    .line 52
    iput v0, p0, Lcom/xiaomi/push/service/am$b;->a:I

    .line 53
    new-instance v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v1, p0, Lcom/xiaomi/push/service/am$b;->a:Ljava/util/concurrent/CopyOnWriteArrayList;

    const/4 v1, 0x0

    .line 54
    iput-object v1, p0, Lcom/xiaomi/push/service/am$b;->b:Lcom/xiaomi/push/service/am$c;

    .line 55
    iput-boolean v0, p0, Lcom/xiaomi/push/service/am$b;->b:Z

    .line 56
    new-instance v0, Lcom/xiaomi/push/service/XMPushService$c;

    invoke-direct {v0, p0}, Lcom/xiaomi/push/service/XMPushService$c;-><init>(Lcom/xiaomi/push/service/am$b;)V

    iput-object v0, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/XMPushService$c;

    .line 57
    iput-object v1, p0, Lcom/xiaomi/push/service/am$b;->a:Landroid/os/IBinder$DeathRecipient;

    .line 58
    new-instance v0, Lcom/xiaomi/push/service/am$b$b;

    invoke-direct {v0, p0}, Lcom/xiaomi/push/service/am$b$b;-><init>(Lcom/xiaomi/push/service/am$b;)V

    iput-object v0, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/am$b$b;

    return-void
.end method

.method public constructor <init>(Lcom/xiaomi/push/service/XMPushService;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/xiaomi/push/service/am$c;->a:Lcom/xiaomi/push/service/am$c;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/am$c;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Lcom/xiaomi/push/service/am$b;->a:I

    .line 10
    .line 11
    new-instance v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcom/xiaomi/push/service/am$b;->a:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    iput-object v1, p0, Lcom/xiaomi/push/service/am$b;->b:Lcom/xiaomi/push/service/am$c;

    .line 20
    .line 21
    iput-boolean v0, p0, Lcom/xiaomi/push/service/am$b;->b:Z

    .line 22
    .line 23
    new-instance v0, Lcom/xiaomi/push/service/XMPushService$c;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Lcom/xiaomi/push/service/XMPushService$c;-><init>(Lcom/xiaomi/push/service/am$b;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/XMPushService$c;

    .line 29
    .line 30
    iput-object v1, p0, Lcom/xiaomi/push/service/am$b;->a:Landroid/os/IBinder$DeathRecipient;

    .line 31
    .line 32
    new-instance v0, Lcom/xiaomi/push/service/am$b$b;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Lcom/xiaomi/push/service/am$b$b;-><init>(Lcom/xiaomi/push/service/am$b;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/am$b$b;

    .line 38
    .line 39
    iput-object p1, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 40
    .line 41
    new-instance p1, Lcom/xiaomi/push/service/am$b$1;

    .line 42
    .line 43
    invoke-direct {p1, p0}, Lcom/xiaomi/push/service/am$b$1;-><init>(Lcom/xiaomi/push/service/am$b;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/service/am$b;->a(Lcom/xiaomi/push/service/am$b$a;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static synthetic a(Lcom/xiaomi/push/service/am$b;)Lcom/xiaomi/push/service/XMPushService$c;
    .locals 0

    .line 146
    iget-object p0, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/XMPushService$c;

    return-object p0
.end method

.method public static synthetic a(Lcom/xiaomi/push/service/am$b;)Lcom/xiaomi/push/service/XMPushService;
    .locals 0

    .line 130
    iget-object p0, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/XMPushService;

    return-object p0
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 170
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 171
    :cond_0
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    add-int/lit8 v0, v0, 0x1

    .line 172
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 173
    :cond_1
    :goto_0
    const-string p0, ""

    return-object p0
.end method

.method private a(IILjava/lang/String;Ljava/lang/String;)V
    .locals 9

    .line 147
    iget-object v0, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/am$c;

    iput-object v0, p0, Lcom/xiaomi/push/service/am$b;->b:Lcom/xiaomi/push/service/am$c;

    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    .line 148
    iget-object p1, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/h;

    iget-object p3, p0, Lcom/xiaomi/push/service/am$b;->a:Landroid/content/Context;

    invoke-virtual {p1, p3, p0, p2}, Lcom/xiaomi/push/service/h;->a(Landroid/content/Context;Lcom/xiaomi/push/service/am$b;I)V

    return-void

    :cond_0
    const/4 v1, 0x3

    if-ne p1, v1, :cond_1

    .line 149
    iget-object p1, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/h;

    iget-object p2, p0, Lcom/xiaomi/push/service/am$b;->a:Landroid/content/Context;

    invoke-virtual {p1, p2, p0, p4, p3}, Lcom/xiaomi/push/service/h;->a(Landroid/content/Context;Lcom/xiaomi/push/service/am$b;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    const/4 v1, 0x1

    if-ne p1, v1, :cond_5

    .line 150
    sget-object p1, Lcom/xiaomi/push/service/am$c;->c:Lcom/xiaomi/push/service/am$c;

    const/4 v2, 0x0

    if-ne v0, p1, :cond_2

    move v6, v1

    goto :goto_0

    :cond_2
    move v6, v2

    :goto_0
    if-nez v6, :cond_3

    .line 151
    const-string p1, "wait"

    invoke-virtual {p1, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 152
    iget p1, p0, Lcom/xiaomi/push/service/am$b;->a:I

    add-int/2addr p1, v1

    iput p1, p0, Lcom/xiaomi/push/service/am$b;->a:I

    goto :goto_1

    :cond_3
    if-eqz v6, :cond_4

    .line 153
    iput v2, p0, Lcom/xiaomi/push/service/am$b;->a:I

    .line 154
    iget-object p1, p0, Lcom/xiaomi/push/service/am$b;->a:Landroid/os/Messenger;

    if-eqz p1, :cond_4

    .line 155
    iget-object p1, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/XMPushService;

    iget-object p1, p1, Lcom/xiaomi/push/service/XMPushService;->a:Landroid/os/Messenger;

    const/4 p4, 0x0

    const/16 v0, 0x10

    invoke-static {p4, v0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    .line 156
    :try_start_0
    iget-object p4, p0, Lcom/xiaomi/push/service/am$b;->a:Landroid/os/Messenger;

    invoke-virtual {p4, p1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 157
    :catch_0
    :cond_4
    :goto_1
    iget-object v3, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/h;

    iget-object v4, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/XMPushService;

    move-object v5, p0

    move v7, p2

    move-object v8, p3

    invoke-virtual/range {v3 .. v8}, Lcom/xiaomi/push/service/h;->a(Landroid/content/Context;Lcom/xiaomi/push/service/am$b;ZILjava/lang/String;)V

    :cond_5
    return-void
.end method

.method public static synthetic a(Lcom/xiaomi/push/service/am$b;IILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 131
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/xiaomi/push/service/am$b;->a(IILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private a(IILjava/lang/String;)Z
    .locals 2

    .line 158
    iget-object p1, p0, Lcom/xiaomi/push/service/am$b;->b:Lcom/xiaomi/push/service/am$c;

    const/4 p2, 0x1

    if-eqz p1, :cond_3

    iget-boolean p3, p0, Lcom/xiaomi/push/service/am$b;->b:Z

    if-nez p3, :cond_0

    goto :goto_0

    .line 159
    :cond_0
    iget-object v0, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/am$c;

    const/4 v1, 0x0

    if-ne p1, v0, :cond_1

    .line 160
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, " status recovered, don\'t notify client:"

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/xiaomi/push/service/am$b;->g:Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/ouq0;->w(Ljava/lang/String;)V

    return v1

    .line 161
    :cond_1
    iget-object p1, p0, Lcom/xiaomi/push/service/am$b;->a:Landroid/os/Messenger;

    if-eqz p1, :cond_2

    if-eqz p3, :cond_2

    .line 162
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p3, "Peer alive notify status to client:"

    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/xiaomi/push/service/am$b;->g:Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/ouq0;->w(Ljava/lang/String;)V

    return p2

    .line 163
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "peer died, ignore notify "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/xiaomi/push/service/am$b;->g:Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/ouq0;->w(Ljava/lang/String;)V

    return v1

    :cond_3
    :goto_0
    return p2
.end method

.method public static synthetic a(Lcom/xiaomi/push/service/am$b;IILjava/lang/String;)Z
    .locals 0

    .line 132
    invoke-direct {p0, p1, p2, p3}, Lcom/xiaomi/push/service/am$b;->a(IILjava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private b(IILjava/lang/String;)Z
    .locals 4

    .line 1
    const-string v0, "wait"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eq p1, v2, :cond_2

    .line 6
    .line 7
    const/4 p2, 0x2

    .line 8
    if-eq p1, p2, :cond_1

    .line 9
    .line 10
    const/4 p0, 0x3

    .line 11
    if-eq p1, p0, :cond_0

    .line 12
    .line 13
    return v1

    .line 14
    :cond_0
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    xor-int/2addr p0, v2

    .line 19
    return p0

    .line 20
    :cond_1
    iget-object p0, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->c()Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_2
    iget-object p1, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/am$c;

    .line 28
    .line 29
    sget-object v3, Lcom/xiaomi/push/service/am$c;->c:Lcom/xiaomi/push/service/am$c;

    .line 30
    .line 31
    if-ne p1, v3, :cond_3

    .line 32
    .line 33
    return v1

    .line 34
    :cond_3
    iget-object p0, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->c()Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-nez p0, :cond_4

    .line 41
    .line 42
    return v1

    .line 43
    :cond_4
    const/16 p0, 0x15

    .line 44
    .line 45
    if-eq p2, p0, :cond_6

    .line 46
    .line 47
    const/4 p0, 0x7

    .line 48
    if-ne p2, p0, :cond_5

    .line 49
    .line 50
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-eqz p0, :cond_5

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_5
    return v2

    .line 58
    :cond_6
    :goto_0
    return v1
.end method


# virtual methods
.method public a()J
    .locals 4

    .line 169
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    const-wide/high16 v2, 0x4034000000000000L    # 20.0

    mul-double/2addr v0, v2

    const-wide/high16 v2, 0x4024000000000000L    # 10.0

    sub-double/2addr v0, v2

    double-to-long v0, v0

    iget p0, p0, Lcom/xiaomi/push/service/am$b;->a:I

    add-int/lit8 p0, p0, 0x1

    mul-int/lit8 p0, p0, 0xf

    int-to-long v2, p0

    add-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    return-wide v0
.end method

.method public a(I)Ljava/lang/String;
    .locals 0

    const/4 p0, 0x1

    if-eq p1, p0, :cond_2

    const/4 p0, 0x2

    if-eq p1, p0, :cond_1

    const/4 p0, 0x3

    if-eq p1, p0, :cond_0

    .line 164
    const-string p0, "unknown"

    return-object p0

    .line 165
    :cond_0
    const-string p0, "KICK"

    return-object p0

    .line 166
    :cond_1
    const-string p0, "CLOSE"

    return-object p0

    .line 167
    :cond_2
    const-string p0, "OPEN"

    return-object p0
.end method

.method public a()V
    .locals 3

    .line 133
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/push/service/am$b;->a:Landroid/os/Messenger;

    if-eqz v0, :cond_0

    .line 134
    iget-object v1, p0, Lcom/xiaomi/push/service/am$b;->a:Landroid/os/IBinder$DeathRecipient;

    if-eqz v1, :cond_0

    .line 135
    invoke-virtual {v0}, Landroid/os/Messenger;->getBinder()Landroid/os/IBinder;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/push/service/am$b;->a:Landroid/os/IBinder$DeathRecipient;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/os/IBinder;->unlinkToDeath(Landroid/os/IBinder$DeathRecipient;I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    const/4 v0, 0x0

    .line 136
    iput-object v0, p0, Lcom/xiaomi/push/service/am$b;->b:Lcom/xiaomi/push/service/am$c;

    return-void
.end method

.method public a(Landroid/os/Messenger;)V
    .locals 3

    .line 137
    const-string v0, "peer linked with old sdk chid = "

    invoke-virtual {p0}, Lcom/xiaomi/push/service/am$b;->a()V

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    .line 138
    :try_start_0
    iput-object p1, p0, Lcom/xiaomi/push/service/am$b;->a:Landroid/os/Messenger;

    const/4 v0, 0x1

    .line 139
    iput-boolean v0, p0, Lcom/xiaomi/push/service/am$b;->b:Z

    .line 140
    new-instance v0, Lcom/xiaomi/push/service/am$b$c;

    invoke-direct {v0, p0, p0, p1}, Lcom/xiaomi/push/service/am$b$c;-><init>(Lcom/xiaomi/push/service/am$b;Lcom/xiaomi/push/service/am$b;Landroid/os/Messenger;)V

    iput-object v0, p0, Lcom/xiaomi/push/service/am$b;->a:Landroid/os/IBinder$DeathRecipient;

    .line 141
    invoke-virtual {p1}, Landroid/os/Messenger;->getBinder()Landroid/os/IBinder;

    move-result-object p1

    iget-object v0, p0, Lcom/xiaomi/push/service/am$b;->a:Landroid/os/IBinder$DeathRecipient;

    invoke-interface {p1, v0, v1}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V

    return-void

    :catch_0
    move-exception p1

    goto :goto_0

    .line 142
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/xiaomi/push/service/am$b;->g:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ll/ouq0;->w(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 143
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "peer linkToDeath err: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ll/ouq0;->w(Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 144
    iput-object p1, p0, Lcom/xiaomi/push/service/am$b;->a:Landroid/os/Messenger;

    .line 145
    iput-boolean v1, p0, Lcom/xiaomi/push/service/am$b;->b:Z

    return-void
.end method

.method public a(Lcom/xiaomi/push/service/am$b$a;)V
    .locals 0

    .line 168
    iget-object p0, p0, Lcom/xiaomi/push/service/am$b;->a:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public a(Lcom/xiaomi/push/service/am$c;IILjava/lang/String;Ljava/lang/String;)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/service/am$b;->a:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/xiaomi/push/service/am$b$a;

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object v2, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/am$c;

    .line 22
    .line 23
    invoke-interface {v1, v2, p1, p3}, Lcom/xiaomi/push/service/am$b$a;->a(Lcom/xiaomi/push/service/am$c;Lcom/xiaomi/push/service/am$c;I)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    iget-object v3, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/am$c;

    .line 28
    .line 29
    if-eq v3, p1, :cond_2

    .line 30
    .line 31
    invoke-virtual {p0, p2}, Lcom/xiaomi/push/service/am$b;->a(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    invoke-static {p3}, Lcom/xiaomi/push/service/an;->a(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    iget-object v9, p0, Lcom/xiaomi/push/service/am$b;->g:Ljava/lang/String;

    .line 40
    .line 41
    move-object v4, p1

    .line 42
    move-object v7, p4

    .line 43
    move-object v8, p5

    .line 44
    filled-new-array/range {v3 .. v9}, [Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const-string p4, "update the client %7$s status. %1$s->%2$s %3$s %4$s %5$s %6$s"

    .line 49
    .line 50
    invoke-static {p4, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {p1}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iput-object v4, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/am$c;

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_2
    move-object v4, p1

    .line 61
    move-object v7, p4

    .line 62
    move-object v8, p5

    .line 63
    :goto_1
    iget-object p1, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/h;

    .line 64
    .line 65
    if-nez p1, :cond_3

    .line 66
    .line 67
    const-string p0, "status changed while the client dispatcher is missing"

    .line 68
    .line 69
    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_3
    sget-object p1, Lcom/xiaomi/push/service/am$c;->b:Lcom/xiaomi/push/service/am$c;

    .line 74
    .line 75
    if-ne v4, p1, :cond_4

    .line 76
    .line 77
    return-void

    .line 78
    :cond_4
    iget-object p1, p0, Lcom/xiaomi/push/service/am$b;->b:Lcom/xiaomi/push/service/am$c;

    .line 79
    .line 80
    if-eqz p1, :cond_7

    .line 81
    .line 82
    iget-boolean p1, p0, Lcom/xiaomi/push/service/am$b;->b:Z

    .line 83
    .line 84
    if-nez p1, :cond_5

    .line 85
    .line 86
    goto :goto_2

    .line 87
    :cond_5
    iget-object p4, p0, Lcom/xiaomi/push/service/am$b;->a:Landroid/os/Messenger;

    .line 88
    .line 89
    if-eqz p4, :cond_6

    .line 90
    .line 91
    if-eqz p1, :cond_6

    .line 92
    .line 93
    const/16 p1, 0x3e8

    .line 94
    .line 95
    goto :goto_3

    .line 96
    :cond_6
    const/16 p1, 0x2774

    .line 97
    .line 98
    goto :goto_3

    .line 99
    :cond_7
    :goto_2
    const/4 p1, 0x0

    .line 100
    :goto_3
    iget-object p4, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 101
    .line 102
    iget-object p5, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/am$b$b;

    .line 103
    .line 104
    invoke-virtual {p4, p5}, Lcom/xiaomi/push/service/XMPushService;->b(Lcom/xiaomi/push/service/XMPushService$j;)V

    .line 105
    .line 106
    .line 107
    invoke-direct {p0, p2, p3, v8}, Lcom/xiaomi/push/service/am$b;->b(IILjava/lang/String;)Z

    .line 108
    .line 109
    .line 110
    move-result p4

    .line 111
    if-eqz p4, :cond_8

    .line 112
    .line 113
    invoke-direct {p0, p2, p3, v7, v8}, Lcom/xiaomi/push/service/am$b;->a(IILjava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_8
    iget-object p4, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 118
    .line 119
    iget-object p0, p0, Lcom/xiaomi/push/service/am$b;->a:Lcom/xiaomi/push/service/am$b$b;

    .line 120
    .line 121
    invoke-virtual {p0, p2, p3, v7, v8}, Lcom/xiaomi/push/service/am$b$b;->a(IILjava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/XMPushService$j;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    int-to-long p1, p1

    .line 126
    invoke-virtual {p4, p0, p1, p2}, Lcom/xiaomi/push/service/XMPushService;->a(Lcom/xiaomi/push/service/XMPushService$j;J)V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public b(Lcom/xiaomi/push/service/am$b$a;)V
    .locals 0

    .line 59
    iget-object p0, p0, Lcom/xiaomi/push/service/am$b;->a:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method
