.class Lcom/momo/mcamera/mask/cartoon/CartoonProcess$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->delayRelease()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/mask/cartoon/CartoonProcess;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/cartoon/CartoonProcess;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess$2;->this$0:Lcom/momo/mcamera/mask/cartoon/CartoonProcess;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess$2;->this$0:Lcom/momo/mcamera/mask/cartoon/CartoonProcess;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
