.class Lorg/fourthline/cling/UpnpServiceImpl$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/UpnpServiceImpl;->shutdown(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/UpnpServiceImpl;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/UpnpServiceImpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/UpnpServiceImpl$1;->this$0:Lorg/fourthline/cling/UpnpServiceImpl;

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
    .locals 2

    .line 1
    invoke-static {}, Lorg/fourthline/cling/UpnpServiceImpl;->access$000()Ljava/util/logging/Logger;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, ">>> Shutting down UPnP service..."

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lorg/fourthline/cling/UpnpServiceImpl$1;->this$0:Lorg/fourthline/cling/UpnpServiceImpl;

    .line 11
    .line 12
    invoke-virtual {v0}, Lorg/fourthline/cling/UpnpServiceImpl;->shutdownRegistry()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lorg/fourthline/cling/UpnpServiceImpl$1;->this$0:Lorg/fourthline/cling/UpnpServiceImpl;

    .line 16
    .line 17
    invoke-virtual {v0}, Lorg/fourthline/cling/UpnpServiceImpl;->shutdownRouter()V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lorg/fourthline/cling/UpnpServiceImpl$1;->this$0:Lorg/fourthline/cling/UpnpServiceImpl;

    .line 21
    .line 22
    invoke-virtual {p0}, Lorg/fourthline/cling/UpnpServiceImpl;->shutdownConfiguration()V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lorg/fourthline/cling/UpnpServiceImpl;->access$000()Ljava/util/logging/Logger;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v0, "<<< UPnP service shutdown completed"

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
