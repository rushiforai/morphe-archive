.class final Lcom/vivo/push/d/j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:I

.field final synthetic b:Ljava/util/List;

.field final synthetic c:Ljava/util/List;

.field final synthetic d:Ljava/lang/String;

.field final synthetic e:Lcom/vivo/push/d/h;


# direct methods
.method public constructor <init>(Lcom/vivo/push/d/h;ILjava/util/List;Ljava/util/List;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/vivo/push/d/j;->e:Lcom/vivo/push/d/h;

    .line 2
    .line 3
    iput p2, p0, Lcom/vivo/push/d/j;->a:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/vivo/push/d/j;->b:Ljava/util/List;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/vivo/push/d/j;->c:Ljava/util/List;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/vivo/push/d/j;->d:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/vivo/push/d/j;->e:Lcom/vivo/push/d/h;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/vivo/push/d/z;->b:Lcom/vivo/push/sdk/PushMessageCallback;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/vivo/push/d/h;->b(Lcom/vivo/push/d/h;)Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    iget v3, p0, Lcom/vivo/push/d/j;->a:I

    .line 10
    .line 11
    iget-object v4, p0, Lcom/vivo/push/d/j;->b:Ljava/util/List;

    .line 12
    .line 13
    iget-object v5, p0, Lcom/vivo/push/d/j;->c:Ljava/util/List;

    .line 14
    .line 15
    iget-object v6, p0, Lcom/vivo/push/d/j;->d:Ljava/lang/String;

    .line 16
    .line 17
    invoke-interface/range {v1 .. v6}, Lcom/vivo/push/sdk/PushMessageCallback;->onDelAlias(Landroid/content/Context;ILjava/util/List;Ljava/util/List;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
