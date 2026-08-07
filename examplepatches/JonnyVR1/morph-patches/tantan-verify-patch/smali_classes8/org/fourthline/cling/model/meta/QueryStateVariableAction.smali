.class public Lorg/fourthline/cling/model/meta/QueryStateVariableAction;
.super Lorg/fourthline/cling/model/meta/Action;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Lorg/fourthline/cling/model/meta/Service;",
        ">",
        "Lorg/fourthline/cling/model/meta/Action<",
        "TS;>;"
    }
.end annotation


# static fields
.field public static final ACTION_NAME:Ljava/lang/String; = "QueryStateVariable"

.field public static final INPUT_ARG_VAR_NAME:Ljava/lang/String; = "varName"

.field public static final OUTPUT_ARG_RETURN:Ljava/lang/String; = "return"

.field public static final VIRTUAL_STATEVARIABLE_INPUT:Ljava/lang/String; = "VirtualQueryActionInput"

.field public static final VIRTUAL_STATEVARIABLE_OUTPUT:Ljava/lang/String; = "VirtualQueryActionOutput"


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 36
    invoke-direct {p0, v0}, Lorg/fourthline/cling/model/meta/QueryStateVariableAction;-><init>(Lorg/fourthline/cling/model/meta/Service;)V

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/model/meta/Service;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/fourthline/cling/model/meta/ActionArgument;

    .line 2
    .line 3
    const-string v1, "VirtualQueryActionInput"

    .line 4
    .line 5
    sget-object v2, Lorg/fourthline/cling/model/meta/ActionArgument$Direction;->IN:Lorg/fourthline/cling/model/meta/ActionArgument$Direction;

    .line 6
    .line 7
    const-string v3, "varName"

    .line 8
    .line 9
    invoke-direct {v0, v3, v1, v2}, Lorg/fourthline/cling/model/meta/ActionArgument;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/fourthline/cling/model/meta/ActionArgument$Direction;)V

    .line 10
    .line 11
    .line 12
    new-instance v1, Lorg/fourthline/cling/model/meta/ActionArgument;

    .line 13
    .line 14
    const-string v2, "VirtualQueryActionOutput"

    .line 15
    .line 16
    sget-object v3, Lorg/fourthline/cling/model/meta/ActionArgument$Direction;->OUT:Lorg/fourthline/cling/model/meta/ActionArgument$Direction;

    .line 17
    .line 18
    const-string v4, "return"

    .line 19
    .line 20
    invoke-direct {v1, v4, v2, v3}, Lorg/fourthline/cling/model/meta/ActionArgument;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/fourthline/cling/model/meta/ActionArgument$Direction;)V

    .line 21
    .line 22
    .line 23
    filled-new-array {v0, v1}, [Lorg/fourthline/cling/model/meta/ActionArgument;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "QueryStateVariable"

    .line 28
    .line 29
    invoke-direct {p0, v1, v0}, Lorg/fourthline/cling/model/meta/Action;-><init>(Ljava/lang/String;[Lorg/fourthline/cling/model/meta/ActionArgument;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lorg/fourthline/cling/model/meta/Action;->setService(Lorg/fourthline/cling/model/meta/Service;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "QueryStateVariable"

    .line 2
    .line 3
    return-object p0
.end method

.method public validate()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/fourthline/cling/model/ValidationError;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method
