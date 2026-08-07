.class Lorg/fourthline/cling/support/shared/Main$3;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/support/shared/Main;->init()V
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
    iput-object p1, p0, Lorg/fourthline/cling/support/shared/Main$3;->this$0:Lorg/fourthline/cling/support/shared/Main;

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
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/Main$3;->this$0:Lorg/fourthline/cling/support/shared/Main;

    .line 2
    .line 3
    iget-boolean v0, p0, Lorg/fourthline/cling/support/shared/Main;->isRegularShutdown:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/fourthline/cling/support/shared/Main;->shutdown()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
