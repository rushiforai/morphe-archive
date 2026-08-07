.class Lcom/idv/identity/platform/log/RecordService$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/n3k0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/platform/log/RecordService;->tryUpload(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/idv/identity/platform/log/RecordService;


# direct methods
.method public constructor <init>(Lcom/idv/identity/platform/log/RecordService;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/log/RecordService$1;->this$0:Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFail(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/log/RecordService$1;->this$0:Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/idv/identity/platform/log/RecordService;->access$000(Lcom/idv/identity/platform/log/RecordService;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onSuccess()V
    .locals 0

    return-void
.end method
