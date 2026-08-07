.class public final Lcom/vivo/push/b/p;
.super Lcom/vivo/push/o;
.source "SourceFile"


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/String;

.field private c:[B

.field private d:J

.field private e:Lcom/vivo/push/model/InsideNotificationItem;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x5

    .line 12
    invoke-direct {p0, v0}, Lcom/vivo/push/o;-><init>(I)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JLcom/vivo/push/model/InsideNotificationItem;)V
    .locals 1

    .line 1
    const/4 v0, 0x5

    .line 2
    invoke-direct {p0, v0}, Lcom/vivo/push/o;-><init>(I)V

    .line 3
    .line 4
    .line 5
    iput-object p1, p0, Lcom/vivo/push/b/p;->a:Ljava/lang/String;

    .line 6
    .line 7
    iput-wide p2, p0, Lcom/vivo/push/b/p;->d:J

    .line 8
    .line 9
    iput-object p4, p0, Lcom/vivo/push/b/p;->e:Lcom/vivo/push/model/InsideNotificationItem;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final c(Lcom/vivo/push/a;)V
    .locals 3

    .line 1
    const-string v0, "package_name"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/vivo/push/b/p;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, v0, v1}, Lcom/vivo/push/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "notify_id"

    .line 9
    .line 10
    iget-wide v1, p0, Lcom/vivo/push/b/p;->d:J

    .line 11
    .line 12
    invoke-virtual {p1, v0, v1, v2}, Lcom/vivo/push/a;->a(Ljava/lang/String;J)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/vivo/push/b/p;->e:Lcom/vivo/push/model/InsideNotificationItem;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/vivo/push/util/q;->b(Lcom/vivo/push/model/InsideNotificationItem;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "notification_v1"

    .line 22
    .line 23
    invoke-virtual {p1, v1, v0}, Lcom/vivo/push/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string v0, "open_pkg_name"

    .line 27
    .line 28
    iget-object v1, p0, Lcom/vivo/push/b/p;->b:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p1, v0, v1}, Lcom/vivo/push/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const-string v0, "open_pkg_name_encode"

    .line 34
    .line 35
    iget-object p0, p0, Lcom/vivo/push/b/p;->c:[B

    .line 36
    .line 37
    invoke-virtual {p1, v0, p0}, Lcom/vivo/push/a;->a(Ljava/lang/String;[B)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final d()Ljava/lang/String;
    .locals 0

    .line 63
    iget-object p0, p0, Lcom/vivo/push/b/p;->a:Ljava/lang/String;

    return-object p0
.end method

.method public final d(Lcom/vivo/push/a;)V
    .locals 3

    .line 1
    const-string v0, "package_name"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/vivo/push/a;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lcom/vivo/push/b/p;->a:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "notify_id"

    .line 10
    .line 11
    const-wide/16 v1, -0x1

    .line 12
    .line 13
    invoke-virtual {p1, v0, v1, v2}, Lcom/vivo/push/a;->b(Ljava/lang/String;J)J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    iput-wide v0, p0, Lcom/vivo/push/b/p;->d:J

    .line 18
    .line 19
    const-string v0, "open_pkg_name"

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lcom/vivo/push/a;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/vivo/push/b/p;->b:Ljava/lang/String;

    .line 26
    .line 27
    const-string v0, "open_pkg_name_encode"

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lcom/vivo/push/a;->b(Ljava/lang/String;)[B

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/vivo/push/b/p;->c:[B

    .line 34
    .line 35
    const-string v0, "notification_v1"

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Lcom/vivo/push/a;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_0

    .line 46
    .line 47
    invoke-static {p1}, Lcom/vivo/push/util/q;->a(Ljava/lang/String;)Lcom/vivo/push/model/InsideNotificationItem;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iput-object p1, p0, Lcom/vivo/push/b/p;->e:Lcom/vivo/push/model/InsideNotificationItem;

    .line 52
    .line 53
    :cond_0
    iget-object p1, p0, Lcom/vivo/push/b/p;->e:Lcom/vivo/push/model/InsideNotificationItem;

    .line 54
    .line 55
    if-eqz p1, :cond_1

    .line 56
    .line 57
    iget-wide v0, p0, Lcom/vivo/push/b/p;->d:J

    .line 58
    .line 59
    invoke-virtual {p1, v0, v1}, Lcom/vivo/push/model/UPSNotificationMessage;->setMsgId(J)V

    .line 60
    .line 61
    .line 62
    :cond_1
    return-void
.end method

.method public final e()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/vivo/push/b/p;->d:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final f()Lcom/vivo/push/model/InsideNotificationItem;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/vivo/push/b/p;->e:Lcom/vivo/push/model/InsideNotificationItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "OnNotificationClickCommand"

    .line 2
    .line 3
    return-object p0
.end method
