.class Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/awt/event/ActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->initializeToolBar(Lorg/seamless/swing/logging/LogController$Expiration;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$6;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$6;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

    .line 2
    .line 3
    invoke-virtual {p1}, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->getSelectedMessages()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$6;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

    .line 16
    .line 17
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->presenter:Lorg/fourthline/cling/support/shared/log/LogView$Presenter;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Lorg/seamless/swing/logging/LogMessage;

    .line 25
    .line 26
    invoke-interface {p0, p1}, Lorg/fourthline/cling/support/shared/log/LogView$Presenter;->onExpand(Lorg/seamless/swing/logging/LogMessage;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
