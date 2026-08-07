.class Lcom/tencent/rtmp/a$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/j$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/rtmp/a;->b(Ljava/lang/String;I)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/rtmp/a;


# direct methods
.method public constructor <init>(Lcom/tencent/rtmp/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/a$4;->a:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/a$4;->a:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-static {v0, p1, p2}, Lcom/tencent/rtmp/a;->a(Lcom/tencent/rtmp/a;J)J

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/tencent/rtmp/a$4;->a:Lcom/tencent/rtmp/a;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/tencent/rtmp/a;->a(Lcom/tencent/rtmp/a;)Lcom/tencent/liteav/n;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/tencent/rtmp/a$4;->a:Lcom/tencent/rtmp/a;

    .line 15
    .line 16
    invoke-static {p0}, Lcom/tencent/rtmp/a;->a(Lcom/tencent/rtmp/a;)Lcom/tencent/liteav/n;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Lcom/tencent/liteav/n;->f()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
