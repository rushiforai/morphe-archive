.class Lorg/fourthline/cling/support/shared/Main$1;
.super Lorg/seamless/swing/logging/LoggingHandler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/fourthline/cling/support/shared/Main;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/support/shared/Main;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/support/shared/Main;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/shared/Main$1;->this$0:Lorg/fourthline/cling/support/shared/Main;

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
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/Main$1;->this$0:Lorg/fourthline/cling/support/shared/Main;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/Main;->logPresenter:Lorg/fourthline/cling/support/shared/log/LogView$Presenter;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lorg/fourthline/cling/support/shared/log/LogView$Presenter;->pushMessage(Lorg/seamless/swing/logging/LogMessage;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
