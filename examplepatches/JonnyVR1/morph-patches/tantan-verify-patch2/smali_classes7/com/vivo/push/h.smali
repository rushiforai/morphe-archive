.class final Lcom/vivo/push/h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/vivo/push/b/b;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Lcom/vivo/push/e;


# direct methods
.method public constructor <init>(Lcom/vivo/push/e;Lcom/vivo/push/b/b;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/vivo/push/h;->c:Lcom/vivo/push/e;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/vivo/push/h;->a:Lcom/vivo/push/b/b;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/vivo/push/h;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/vivo/push/h;->c:Lcom/vivo/push/e;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/vivo/push/h;->a:Lcom/vivo/push/b/b;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/vivo/push/e;->a(Lcom/vivo/push/o;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/vivo/push/h;->c:Lcom/vivo/push/e;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/vivo/push/h;->b:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0, p0}, Lcom/vivo/push/e;->b(Lcom/vivo/push/e;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
