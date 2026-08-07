.class public Lorg/fourthline/cling/binding/staging/MutableStateVariable;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public allowedValueRange:Lorg/fourthline/cling/binding/staging/MutableAllowedValueRange;

.field public allowedValues:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public dataType:Lorg/fourthline/cling/model/types/Datatype;

.field public defaultValue:Ljava/lang/String;

.field public eventDetails:Lorg/fourthline/cling/model/meta/StateVariableEventDetails;

.field public name:Ljava/lang/String;


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
.method public build()Lorg/fourthline/cling/model/meta/StateVariable;
    .locals 15

    .line 1
    new-instance v0, Lorg/fourthline/cling/model/meta/StateVariable;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/fourthline/cling/binding/staging/MutableStateVariable;->name:Ljava/lang/String;

    .line 4
    .line 5
    new-instance v2, Lorg/fourthline/cling/model/meta/StateVariableTypeDetails;

    .line 6
    .line 7
    iget-object v3, p0, Lorg/fourthline/cling/binding/staging/MutableStateVariable;->dataType:Lorg/fourthline/cling/model/types/Datatype;

    .line 8
    .line 9
    iget-object v4, p0, Lorg/fourthline/cling/binding/staging/MutableStateVariable;->defaultValue:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v5, p0, Lorg/fourthline/cling/binding/staging/MutableStateVariable;->allowedValues:Ljava/util/List;

    .line 12
    .line 13
    const/4 v6, 0x0

    .line 14
    if-eqz v5, :cond_1

    .line 15
    .line 16
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v5

    .line 20
    if-nez v5, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v5, p0, Lorg/fourthline/cling/binding/staging/MutableStateVariable;->allowedValues:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v7

    .line 29
    new-array v7, v7, [Ljava/lang/String;

    .line 30
    .line 31
    invoke-interface {v5, v7}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    check-cast v5, [Ljava/lang/String;

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_1
    :goto_0
    move-object v5, v6

    .line 39
    :goto_1
    iget-object v7, p0, Lorg/fourthline/cling/binding/staging/MutableStateVariable;->allowedValueRange:Lorg/fourthline/cling/binding/staging/MutableAllowedValueRange;

    .line 40
    .line 41
    if-nez v7, :cond_2

    .line 42
    .line 43
    goto :goto_2

    .line 44
    :cond_2
    new-instance v8, Lorg/fourthline/cling/model/meta/StateVariableAllowedValueRange;

    .line 45
    .line 46
    iget-object v6, p0, Lorg/fourthline/cling/binding/staging/MutableStateVariable;->allowedValueRange:Lorg/fourthline/cling/binding/staging/MutableAllowedValueRange;

    .line 47
    .line 48
    iget-object v6, v6, Lorg/fourthline/cling/binding/staging/MutableAllowedValueRange;->minimum:Ljava/lang/Long;

    .line 49
    .line 50
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    .line 51
    .line 52
    .line 53
    move-result-wide v9

    .line 54
    iget-object v6, p0, Lorg/fourthline/cling/binding/staging/MutableStateVariable;->allowedValueRange:Lorg/fourthline/cling/binding/staging/MutableAllowedValueRange;

    .line 55
    .line 56
    iget-object v6, v6, Lorg/fourthline/cling/binding/staging/MutableAllowedValueRange;->maximum:Ljava/lang/Long;

    .line 57
    .line 58
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    .line 59
    .line 60
    .line 61
    move-result-wide v11

    .line 62
    iget-object v6, p0, Lorg/fourthline/cling/binding/staging/MutableStateVariable;->allowedValueRange:Lorg/fourthline/cling/binding/staging/MutableAllowedValueRange;

    .line 63
    .line 64
    iget-object v6, v6, Lorg/fourthline/cling/binding/staging/MutableAllowedValueRange;->step:Ljava/lang/Long;

    .line 65
    .line 66
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    .line 67
    .line 68
    .line 69
    move-result-wide v13

    .line 70
    invoke-direct/range {v8 .. v14}, Lorg/fourthline/cling/model/meta/StateVariableAllowedValueRange;-><init>(JJJ)V

    .line 71
    .line 72
    .line 73
    move-object v6, v8

    .line 74
    :goto_2
    invoke-direct {v2, v3, v4, v5, v6}, Lorg/fourthline/cling/model/meta/StateVariableTypeDetails;-><init>(Lorg/fourthline/cling/model/types/Datatype;Ljava/lang/String;[Ljava/lang/String;Lorg/fourthline/cling/model/meta/StateVariableAllowedValueRange;)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lorg/fourthline/cling/binding/staging/MutableStateVariable;->eventDetails:Lorg/fourthline/cling/model/meta/StateVariableEventDetails;

    .line 78
    .line 79
    invoke-direct {v0, v1, v2, p0}, Lorg/fourthline/cling/model/meta/StateVariable;-><init>(Ljava/lang/String;Lorg/fourthline/cling/model/meta/StateVariableTypeDetails;Lorg/fourthline/cling/model/meta/StateVariableEventDetails;)V

    .line 80
    .line 81
    .line 82
    return-object v0
.end method
