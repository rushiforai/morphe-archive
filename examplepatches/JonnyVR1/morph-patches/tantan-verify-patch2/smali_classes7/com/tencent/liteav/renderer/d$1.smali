.class Lcom/tencent/liteav/renderer/d$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/renderer/d;->a(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Lcom/tencent/liteav/renderer/d;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/renderer/d;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/renderer/d$1;->b:Lcom/tencent/liteav/renderer/d;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/renderer/d$1;->a:I

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
    iget-object v0, p0, Lcom/tencent/liteav/renderer/d$1;->b:Lcom/tencent/liteav/renderer/d;

    .line 2
    .line 3
    iget p0, p0, Lcom/tencent/liteav/renderer/d$1;->a:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/renderer/d;->b(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
