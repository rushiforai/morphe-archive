.class Lorg/fourthline/cling/support/shared/log/impl/LogPresenter$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/support/shared/log/impl/LogPresenter;->destroy()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/support/shared/log/impl/LogPresenter;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/support/shared/log/impl/LogPresenter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/shared/log/impl/LogPresenter$1;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogPresenter;

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
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogPresenter$1;->this$0:Lorg/fourthline/cling/support/shared/log/impl/LogPresenter;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/log/impl/LogPresenter;->view:Lorg/fourthline/cling/support/shared/log/LogView;

    .line 4
    .line 5
    invoke-interface {p0}, Lorg/fourthline/cling/support/shared/log/LogView;->dispose()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
