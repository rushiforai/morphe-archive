.class final Lcom/vivo/push/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lcom/vivo/push/e;


# direct methods
.method public constructor <init>(Lcom/vivo/push/e;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/vivo/push/f;->b:Lcom/vivo/push/e;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/vivo/push/f;->a:Ljava/lang/String;

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
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/vivo/push/f;->b:Lcom/vivo/push/e;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/vivo/push/e;->a(Lcom/vivo/push/e;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/vivo/push/f;->a:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/vivo/push/f;->b:Lcom/vivo/push/e;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/vivo/push/e;->a(Lcom/vivo/push/e;)Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p0, Lcom/vivo/push/f;->b:Lcom/vivo/push/e;

    .line 25
    .line 26
    invoke-static {v1}, Lcom/vivo/push/e;->a(Lcom/vivo/push/e;)Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget-object v2, p0, Lcom/vivo/push/f;->a:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v0, v1, v2}, Lcom/vivo/push/util/z;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget-object p0, p0, Lcom/vivo/push/f;->b:Lcom/vivo/push/e;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/vivo/push/e;->i()V

    .line 45
    .line 46
    .line 47
    :cond_1
    :goto_0
    return-void
.end method
