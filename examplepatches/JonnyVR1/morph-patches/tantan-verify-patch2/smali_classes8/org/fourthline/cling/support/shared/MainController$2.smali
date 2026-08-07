.class Lorg/fourthline/cling/support/shared/MainController$2;
.super Lorg/seamless/swing/logging/LogController;
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
.method public constructor <init>(Lorg/fourthline/cling/support/shared/MainController;Lorg/seamless/swing/Controller;Ljava/util/List;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/shared/MainController$2;->this$0:Lorg/fourthline/cling/support/shared/MainController;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, Lorg/seamless/swing/logging/LogController;-><init>(Lorg/seamless/swing/Controller;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public expand(Lorg/seamless/swing/logging/LogMessage;)V
    .locals 1

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/shared/TextExpandEvent;

    .line 2
    .line 3
    invoke-virtual {p1}, Lorg/seamless/swing/logging/LogMessage;->getMessage()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {v0, p1}, Lorg/fourthline/cling/support/shared/TextExpandEvent;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/shared/MainController$2;->fireEventGlobal(Lorg/seamless/swing/Event;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public getParentWindow()Ljava/awt/Frame;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/MainController$2;->this$0:Lorg/fourthline/cling/support/shared/MainController;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/fourthline/cling/support/shared/MainController;->getView()Ljava/awt/Container;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/awt/Frame;

    .line 8
    .line 9
    return-object p0
.end method
