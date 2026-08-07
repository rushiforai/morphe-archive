.class public Lorg/fourthline/cling/support/shared/log/impl/LogPresenter;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/support/shared/log/LogView$Presenter;


# annotations
.annotation runtime Ljavax/enterprise/context/ApplicationScoped;
.end annotation


# instance fields
.field protected textExpandEvent:Ljavax/enterprise/event/Event;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavax/enterprise/event/Event<",
            "Lorg/fourthline/cling/support/shared/TextExpand;",
            ">;"
        }
    .end annotation
.end field

.field protected view:Lorg/fourthline/cling/support/shared/log/LogView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 1
    .annotation runtime Ljavax/annotation/PreDestroy;
    .end annotation

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/shared/log/impl/LogPresenter$1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lorg/fourthline/cling/support/shared/log/impl/LogPresenter$1;-><init>(Lorg/fourthline/cling/support/shared/log/impl/LogPresenter;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public init()V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogPresenter;->view:Lorg/fourthline/cling/support/shared/log/LogView;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Lorg/fourthline/cling/support/shared/View;->setPresenter(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onExpand(Lorg/seamless/swing/logging/LogMessage;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogPresenter;->textExpandEvent:Ljavax/enterprise/event/Event;

    .line 2
    .line 3
    new-instance v0, Lorg/fourthline/cling/support/shared/TextExpand;

    .line 4
    .line 5
    invoke-virtual {p1}, Lorg/seamless/swing/logging/LogMessage;->getMessage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {v0, p1}, Lorg/fourthline/cling/support/shared/TextExpand;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {p0, v0}, Ljavax/enterprise/event/Event;->fire(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public pushMessage(Lorg/seamless/swing/logging/LogMessage;)V
    .locals 1

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/shared/log/impl/LogPresenter$2;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lorg/fourthline/cling/support/shared/log/impl/LogPresenter$2;-><init>(Lorg/fourthline/cling/support/shared/log/impl/LogPresenter;Lorg/seamless/swing/logging/LogMessage;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
