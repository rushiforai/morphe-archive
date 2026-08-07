.class Lcom/tencent/liteav/c$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/c;->c(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Z

.field final synthetic b:Lcom/tencent/liteav/c;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/c;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/c$1;->b:Lcom/tencent/liteav/c;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/tencent/liteav/c$1;->a:Z

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/c$1;->b:Lcom/tencent/liteav/c;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/c;->a(Lcom/tencent/liteav/c;)Lcom/tencent/liteav/g;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-boolean p0, p0, Lcom/tencent/liteav/c$1;->a:Z

    .line 8
    .line 9
    iput-boolean p0, v0, Lcom/tencent/liteav/g;->S:Z

    .line 10
    .line 11
    return-void
.end method
