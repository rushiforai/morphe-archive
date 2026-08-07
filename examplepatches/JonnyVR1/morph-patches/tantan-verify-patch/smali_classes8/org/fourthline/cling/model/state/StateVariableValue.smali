.class public Lorg/fourthline/cling/model/state/StateVariableValue;
.super Lorg/fourthline/cling/model/VariableValue;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Lorg/fourthline/cling/model/meta/Service;",
        ">",
        "Lorg/fourthline/cling/model/VariableValue;"
    }
.end annotation


# instance fields
.field private stateVariable:Lorg/fourthline/cling/model/meta/StateVariable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/fourthline/cling/model/meta/StateVariable<",
            "TS;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/model/meta/StateVariable;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/fourthline/cling/model/meta/StateVariable<",
            "TS;>;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/fourthline/cling/model/types/InvalidValueException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lorg/fourthline/cling/model/meta/StateVariable;->getTypeDetails()Lorg/fourthline/cling/model/meta/StateVariableTypeDetails;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lorg/fourthline/cling/model/meta/StateVariableTypeDetails;->getDatatype()Lorg/fourthline/cling/model/types/Datatype;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p0, v0, p2}, Lorg/fourthline/cling/model/VariableValue;-><init>(Lorg/fourthline/cling/model/types/Datatype;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lorg/fourthline/cling/model/state/StateVariableValue;->stateVariable:Lorg/fourthline/cling/model/meta/StateVariable;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getStateVariable()Lorg/fourthline/cling/model/meta/StateVariable;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/fourthline/cling/model/meta/StateVariable<",
            "TS;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/state/StateVariableValue;->stateVariable:Lorg/fourthline/cling/model/meta/StateVariable;

    .line 2
    .line 3
    return-object p0
.end method
