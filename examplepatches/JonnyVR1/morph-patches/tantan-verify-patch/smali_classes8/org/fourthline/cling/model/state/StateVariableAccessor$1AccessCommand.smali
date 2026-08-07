.class Lorg/fourthline/cling/model/state/StateVariableAccessor$1AccessCommand;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/model/Command;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/model/state/StateVariableAccessor;->read(Lorg/fourthline/cling/model/meta/StateVariable;Ljava/lang/Object;)Lorg/fourthline/cling/model/state/StateVariableValue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AccessCommand"
.end annotation


# instance fields
.field result:Ljava/lang/Object;

.field final synthetic this$0:Lorg/fourthline/cling/model/state/StateVariableAccessor;

.field final synthetic val$serviceImpl:Ljava/lang/Object;

.field final synthetic val$stateVariable:Lorg/fourthline/cling/model/meta/StateVariable;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/model/state/StateVariableAccessor;Ljava/lang/Object;Lorg/fourthline/cling/model/meta/StateVariable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/model/state/StateVariableAccessor$1AccessCommand;->this$0:Lorg/fourthline/cling/model/state/StateVariableAccessor;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/fourthline/cling/model/state/StateVariableAccessor$1AccessCommand;->val$serviceImpl:Ljava/lang/Object;

    .line 4
    .line 5
    iput-object p3, p0, Lorg/fourthline/cling/model/state/StateVariableAccessor$1AccessCommand;->val$stateVariable:Lorg/fourthline/cling/model/meta/StateVariable;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public execute(Lorg/fourthline/cling/model/ServiceManager;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lorg/fourthline/cling/model/state/StateVariableAccessor$1AccessCommand;->this$0:Lorg/fourthline/cling/model/state/StateVariableAccessor;

    .line 2
    .line 3
    iget-object v0, p0, Lorg/fourthline/cling/model/state/StateVariableAccessor$1AccessCommand;->val$serviceImpl:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lorg/fourthline/cling/model/state/StateVariableAccessor;->read(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Lorg/fourthline/cling/model/state/StateVariableAccessor$1AccessCommand;->result:Ljava/lang/Object;

    .line 10
    .line 11
    iget-object p1, p0, Lorg/fourthline/cling/model/state/StateVariableAccessor$1AccessCommand;->val$stateVariable:Lorg/fourthline/cling/model/meta/StateVariable;

    .line 12
    .line 13
    invoke-virtual {p1}, Lorg/fourthline/cling/model/meta/StateVariable;->getService()Lorg/fourthline/cling/model/meta/Service;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lorg/fourthline/cling/model/meta/LocalService;

    .line 18
    .line 19
    iget-object v0, p0, Lorg/fourthline/cling/model/state/StateVariableAccessor$1AccessCommand;->result:Ljava/lang/Object;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lorg/fourthline/cling/model/meta/LocalService;->isStringConvertibleType(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Lorg/fourthline/cling/model/state/StateVariableAccessor$1AccessCommand;->result:Ljava/lang/Object;

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Lorg/fourthline/cling/model/state/StateVariableAccessor$1AccessCommand;->result:Ljava/lang/Object;

    .line 34
    .line 35
    :cond_0
    return-void
.end method
