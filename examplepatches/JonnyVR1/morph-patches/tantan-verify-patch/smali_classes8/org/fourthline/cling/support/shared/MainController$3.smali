.class Lorg/fourthline/cling/support/shared/MainController$3;
.super Lorg/seamless/swing/logging/LoggingHandler;
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
    iput-object p1, p0, Lorg/fourthline/cling/support/shared/MainController$3;->this$0:Lorg/fourthline/cling/support/shared/MainController;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/seamless/swing/logging/LoggingHandler;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public log(Lorg/seamless/swing/logging/LogMessage;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/MainController$3;->this$0:Lorg/fourthline/cling/support/shared/MainController;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/fourthline/cling/support/shared/MainController;->access$000(Lorg/fourthline/cling/support/shared/MainController;)Lorg/seamless/swing/logging/LogController;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lorg/seamless/swing/logging/LogController;->pushMessage(Lorg/seamless/swing/logging/LogMessage;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
