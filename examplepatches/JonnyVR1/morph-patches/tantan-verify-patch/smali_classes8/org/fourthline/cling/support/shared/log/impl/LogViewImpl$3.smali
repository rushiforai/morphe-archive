.class Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$3;
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
    iput-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$3;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

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
    iget-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$3;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

    .line 2
    .line 3
    iget-object v0, p1, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->centerWindowEvent:Ljavax/enterprise/event/Event;

    .line 4
    .line 5
    new-instance v1, Lorg/fourthline/cling/support/shared/CenterWindow;

    .line 6
    .line 7
    iget-object p1, p1, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logCategorySelector:Lorg/seamless/swing/logging/LogCategorySelector;

    .line 8
    .line 9
    invoke-direct {v1, p1}, Lorg/fourthline/cling/support/shared/CenterWindow;-><init>(Ljava/awt/Window;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljavax/enterprise/event/Event;->fire(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl$3;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;

    .line 16
    .line 17
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogViewImpl;->logCategorySelector:Lorg/seamless/swing/logging/LogCategorySelector;

    .line 18
    .line 19
    invoke-virtual {p0}, Lorg/seamless/swing/logging/LogCategorySelector;->isVisible()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    xor-int/lit8 p1, p1, 0x1

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lorg/seamless/swing/logging/LogCategorySelector;->setVisible(Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
