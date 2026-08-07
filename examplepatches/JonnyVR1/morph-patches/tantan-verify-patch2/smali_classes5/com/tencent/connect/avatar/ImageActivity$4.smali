.class Lcom/tencent/connect/avatar/ImageActivity$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/connect/avatar/ImageActivity;->a(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:I

.field final synthetic c:Lcom/tencent/connect/avatar/ImageActivity;


# direct methods
.method public constructor <init>(Lcom/tencent/connect/avatar/ImageActivity;Ljava/lang/String;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/connect/avatar/ImageActivity$4;->c:Lcom/tencent/connect/avatar/ImageActivity;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/connect/avatar/ImageActivity$4;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/connect/avatar/ImageActivity$4;->b:I

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/connect/avatar/ImageActivity$4;->c:Lcom/tencent/connect/avatar/ImageActivity;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/connect/avatar/ImageActivity$4;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget p0, p0, Lcom/tencent/connect/avatar/ImageActivity$4;->b:I

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/tencent/connect/avatar/ImageActivity;->a(Lcom/tencent/connect/avatar/ImageActivity;Ljava/lang/String;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
