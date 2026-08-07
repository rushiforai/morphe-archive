.class Lorg/fourthline/cling/support/shared/MainController$1;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/support/shared/MainController;-><init>(Ljavax/swing/JFrame;Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/support/shared/MainController;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/support/shared/MainController;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/shared/MainController$1;->this$0:Lorg/fourthline/cling/support/shared/MainController;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/MainController$1;->this$0:Lorg/fourthline/cling/support/shared/MainController;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/fourthline/cling/support/shared/MainController;->getUpnpService()Lorg/fourthline/cling/UpnpService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/MainController$1;->this$0:Lorg/fourthline/cling/support/shared/MainController;

    .line 10
    .line 11
    invoke-virtual {p0}, Lorg/fourthline/cling/support/shared/MainController;->getUpnpService()Lorg/fourthline/cling/UpnpService;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Lorg/fourthline/cling/UpnpService;->shutdown()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
