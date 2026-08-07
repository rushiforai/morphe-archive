.class final Lcom/vivo/push/d/ad;
.super Lcom/vivo/push/d/z;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/vivo/push/o;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/vivo/push/d/z;-><init>(Lcom/vivo/push/o;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/vivo/push/d/ad;)Landroid/content/Context;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/vivo/push/l;->a:Landroid/content/Context;

    return-object p0
.end method


# virtual methods
.method public final a(Lcom/vivo/push/o;)V
    .locals 4

    .line 1
    check-cast p1, Lcom/vivo/push/b/i;

    .line 2
    .line 3
    invoke-static {}, Lcom/vivo/push/e;->a()Lcom/vivo/push/e;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Lcom/vivo/push/b/s;->g()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p1}, Lcom/vivo/push/b/s;->h()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/4 v3, 0x0

    .line 16
    new-array v3, v3, [Ljava/lang/Object;

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2, v3}, Lcom/vivo/push/e;->a(Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Lcom/vivo/push/d/ae;

    .line 22
    .line 23
    invoke-direct {v0, p0, p1}, Lcom/vivo/push/d/ae;-><init>(Lcom/vivo/push/d/ad;Lcom/vivo/push/b/i;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Lcom/vivo/push/m;->b(Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
