.class final Lcom/vivo/push/util/l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Ljava/util/List;

.field final synthetic b:Lcom/vivo/push/util/k;


# direct methods
.method public constructor <init>(Lcom/vivo/push/util/k;Ljava/util/List;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/vivo/push/util/l;->b:Lcom/vivo/push/util/k;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/vivo/push/util/l;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/vivo/push/util/l;->b:Lcom/vivo/push/util/k;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/vivo/push/util/k;->a(Lcom/vivo/push/util/k;)Lcom/vivo/push/model/InsideNotificationItem;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/vivo/push/util/w;->b()Lcom/vivo/push/util/w;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/vivo/push/util/l;->b:Lcom/vivo/push/util/k;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/vivo/push/util/k;->b(Lcom/vivo/push/util/k;)J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    const-string v3, "com.vivo.push.notify_key"

    .line 20
    .line 21
    invoke-virtual {v0, v3, v1, v2}, Lcom/vivo/push/util/b;->a(Ljava/lang/String;J)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/vivo/push/util/l;->b:Lcom/vivo/push/util/k;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/vivo/push/util/k;->c(Lcom/vivo/push/util/k;)Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object v2, p0, Lcom/vivo/push/util/l;->a:Ljava/util/List;

    .line 31
    .line 32
    iget-object v0, p0, Lcom/vivo/push/util/l;->b:Lcom/vivo/push/util/k;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/vivo/push/util/k;->a(Lcom/vivo/push/util/k;)Lcom/vivo/push/model/InsideNotificationItem;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    iget-object v0, p0, Lcom/vivo/push/util/l;->b:Lcom/vivo/push/util/k;

    .line 39
    .line 40
    invoke-static {v0}, Lcom/vivo/push/util/k;->b(Lcom/vivo/push/util/k;)J

    .line 41
    .line 42
    .line 43
    move-result-wide v4

    .line 44
    iget-object v0, p0, Lcom/vivo/push/util/l;->b:Lcom/vivo/push/util/k;

    .line 45
    .line 46
    invoke-static {v0}, Lcom/vivo/push/util/k;->d(Lcom/vivo/push/util/k;)I

    .line 47
    .line 48
    .line 49
    move-result v6

    .line 50
    iget-object p0, p0, Lcom/vivo/push/util/l;->b:Lcom/vivo/push/util/k;

    .line 51
    .line 52
    invoke-static {p0}, Lcom/vivo/push/util/k;->e(Lcom/vivo/push/util/k;)Lcom/vivo/push/d/r$a;

    .line 53
    .line 54
    .line 55
    move-result-object v7

    .line 56
    invoke-static/range {v1 .. v7}, Lcom/vivo/push/util/NotifyAdapterUtil;->pushNotification(Landroid/content/Context;Ljava/util/List;Lcom/vivo/push/model/InsideNotificationItem;JILcom/vivo/push/d/r$a;)V

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method
