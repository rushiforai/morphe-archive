.class final Lcom/vivo/push/k;
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
    iput-object p1, p0, Lcom/vivo/push/k;->b:Lcom/vivo/push/e;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/vivo/push/k;->a:Ljava/lang/String;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/vivo/push/k;->b:Lcom/vivo/push/e;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/vivo/push/k;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/vivo/push/e;->c(Lcom/vivo/push/e;Ljava/lang/String;)Lcom/vivo/push/e$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    new-array v0, v0, [Ljava/lang/Object;

    .line 13
    .line 14
    const/16 v1, 0x3eb

    .line 15
    .line 16
    invoke-virtual {p0, v1, v0}, Lcom/vivo/push/e$a;->a(I[Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method
