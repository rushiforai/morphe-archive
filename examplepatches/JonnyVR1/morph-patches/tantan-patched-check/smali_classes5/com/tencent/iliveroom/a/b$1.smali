.class Lcom/tencent/iliveroom/a/b$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/b;->onAudioEffectFinished(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/iliveroom/a/a;

.field final synthetic b:I

.field final synthetic c:Lcom/tencent/iliveroom/a/b;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/b;Lcom/tencent/iliveroom/a/a;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/b$1;->c:Lcom/tencent/iliveroom/a/b;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/iliveroom/a/b$1;->a:Lcom/tencent/iliveroom/a/a;

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/iliveroom/a/b$1;->b:I

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/b$1;->a:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/iliveroom/a/a;->f:Ljava/util/Set;

    .line 4
    .line 5
    iget p0, p0, Lcom/tencent/iliveroom/a/b$1;->b:I

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method
