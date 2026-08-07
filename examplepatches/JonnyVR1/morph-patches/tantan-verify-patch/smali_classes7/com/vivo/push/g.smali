.class final Lcom/vivo/push/g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/vivo/push/IPushActionListener;


# instance fields
.field final synthetic a:Lcom/vivo/push/e$a;

.field final synthetic b:Lcom/vivo/push/e;


# direct methods
.method public constructor <init>(Lcom/vivo/push/e;Lcom/vivo/push/e$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/vivo/push/g;->b:Lcom/vivo/push/e;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/vivo/push/g;->a:Lcom/vivo/push/e$a;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onStateChanged(I)V
    .locals 1

    .line 1
    if-nez p1, :cond_2

    .line 2
    .line 3
    iget-object p1, p0, Lcom/vivo/push/g;->a:Lcom/vivo/push/e$a;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/vivo/push/e$a;->b()[Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    array-length p1, p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p1, p0, Lcom/vivo/push/g;->b:Lcom/vivo/push/e;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/vivo/push/g;->a:Lcom/vivo/push/e$a;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/vivo/push/e$a;->b()[Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/4 v0, 0x0

    .line 24
    aget-object p0, p0, v0

    .line 25
    .line 26
    check-cast p0, Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p1, p0}, Lcom/vivo/push/e;->a(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    :goto_0
    const-string p0, "PushClientManager"

    .line 33
    .line 34
    const-string p1, "bind app result is null"

    .line 35
    .line 36
    invoke-static {p0, p1}, Lcom/vivo/push/util/p;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_2
    iget-object p1, p0, Lcom/vivo/push/g;->b:Lcom/vivo/push/e;

    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    invoke-static {p1, v0}, Lcom/vivo/push/e;->a(Lcom/vivo/push/e;Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/vivo/push/g;->b:Lcom/vivo/push/e;

    .line 47
    .line 48
    invoke-static {p0}, Lcom/vivo/push/e;->b(Lcom/vivo/push/e;)Lcom/vivo/push/util/b;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const-string p1, "APP_TOKEN"

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Lcom/vivo/push/util/b;->b(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method
