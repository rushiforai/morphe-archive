.class Lorg/fourthline/cling/support/shared/log/impl/LogPresenter$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/support/shared/log/impl/LogPresenter;->pushMessage(Lorg/seamless/swing/logging/LogMessage;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/support/shared/log/impl/LogPresenter;

.field final synthetic val$message:Lorg/seamless/swing/logging/LogMessage;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/support/shared/log/impl/LogPresenter;Lorg/seamless/swing/logging/LogMessage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogPresenter$2;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogPresenter;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/fourthline/cling/support/shared/log/impl/LogPresenter$2;->val$message:Lorg/seamless/swing/logging/LogMessage;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogPresenter$2;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogPresenter;

    .line 2
    .line 3
    iget-object v0, v0, Lorg/fourthline/cling/support/shared/log/impl/LogPresenter;->view:Lorg/fourthline/cling/support/shared/log/LogView;

    .line 4
    .line 5
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogPresenter$2;->val$message:Lorg/seamless/swing/logging/LogMessage;

    .line 6
    .line 7
    invoke-interface {v0, p0}, Lorg/fourthline/cling/support/shared/log/LogView;->pushMessage(Lorg/seamless/swing/logging/LogMessage;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
