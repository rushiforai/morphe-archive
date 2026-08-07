.class public Lcom/tencent/liteav/beauty/d$e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/liteav/beauty/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation


# instance fields
.field public a:Lcom/tencent/liteav/beauty/d$g;

.field public b:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/tencent/liteav/beauty/d$g;->b:Lcom/tencent/liteav/beauty/d$g;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/liteav/beauty/d$e;->a:Lcom/tencent/liteav/beauty/d$g;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/tencent/liteav/beauty/d$e;->b:Z

    .line 10
    .line 11
    return-void
.end method
