.class Lcom/tencent/connect/avatar/ImageActivity$6$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/connect/avatar/ImageActivity$6;->onComplete(Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lcom/tencent/connect/avatar/ImageActivity$6;


# direct methods
.method public constructor <init>(Lcom/tencent/connect/avatar/ImageActivity$6;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/connect/avatar/ImageActivity$6$1;->b:Lcom/tencent/connect/avatar/ImageActivity$6;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/connect/avatar/ImageActivity$6$1;->a:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/tencent/connect/avatar/ImageActivity$6$1;->b:Lcom/tencent/connect/avatar/ImageActivity$6;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/connect/avatar/ImageActivity$6;->a:Lcom/tencent/connect/avatar/ImageActivity;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/connect/avatar/ImageActivity$6$1;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0, p0}, Lcom/tencent/connect/avatar/ImageActivity;->b(Lcom/tencent/connect/avatar/ImageActivity;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
