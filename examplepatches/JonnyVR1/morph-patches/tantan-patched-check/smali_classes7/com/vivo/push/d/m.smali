.class final Lcom/vivo/push/d/m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/vivo/push/b/m;

.field final synthetic b:Lcom/vivo/push/d/l;


# direct methods
.method public constructor <init>(Lcom/vivo/push/d/l;Lcom/vivo/push/b/m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/vivo/push/d/m;->b:Lcom/vivo/push/d/l;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/vivo/push/d/m;->a:Lcom/vivo/push/b/m;

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
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/vivo/push/d/m;->b:Lcom/vivo/push/d/l;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/vivo/push/d/z;->b:Lcom/vivo/push/sdk/PushMessageCallback;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/vivo/push/d/l;->a(Lcom/vivo/push/d/l;)Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v2, p0, Lcom/vivo/push/d/m;->a:Lcom/vivo/push/b/m;

    .line 10
    .line 11
    invoke-virtual {v2}, Lcom/vivo/push/b/s;->h()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    iget-object v3, p0, Lcom/vivo/push/d/m;->a:Lcom/vivo/push/b/m;

    .line 16
    .line 17
    invoke-virtual {v3}, Lcom/vivo/push/b/m;->d()Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    iget-object p0, p0, Lcom/vivo/push/d/m;->a:Lcom/vivo/push/b/m;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/vivo/push/b/s;->g()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {v1, v0, v2, v3, p0}, Lcom/vivo/push/sdk/PushMessageCallback;->onListTags(Landroid/content/Context;ILjava/util/List;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
