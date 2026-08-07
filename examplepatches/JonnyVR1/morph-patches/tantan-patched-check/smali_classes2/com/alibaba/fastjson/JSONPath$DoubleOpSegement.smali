.class Lcom/alibaba/fastjson/JSONPath$DoubleOpSegement;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/alibaba/fastjson/JSONPath$Filter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alibaba/fastjson/JSONPath;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DoubleOpSegement"
.end annotation


# instance fields
.field private final op:Lcom/alibaba/fastjson/JSONPath$Operator;

.field private final propertyName:Ljava/lang/String;

.field private final propertyNameHash:J

.field private final value:D


# direct methods
.method public constructor <init>(Ljava/lang/String;DLcom/alibaba/fastjson/JSONPath$Operator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/alibaba/fastjson/JSONPath$DoubleOpSegement;->propertyName:Ljava/lang/String;

    .line 5
    .line 6
    iput-wide p2, p0, Lcom/alibaba/fastjson/JSONPath$DoubleOpSegement;->value:D

    .line 7
    .line 8
    iput-object p4, p0, Lcom/alibaba/fastjson/JSONPath$DoubleOpSegement;->op:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/alibaba/fastjson/util/TypeUtils;->fnv1a_64(Ljava/lang/String;)J

    .line 11
    .line 12
    .line 13
    move-result-wide p1

    .line 14
    iput-wide p1, p0, Lcom/alibaba/fastjson/JSONPath$DoubleOpSegement;->propertyNameHash:J

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public apply(Lcom/alibaba/fastjson/JSONPath;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/alibaba/fastjson/JSONPath$DoubleOpSegement;->propertyName:Ljava/lang/String;

    .line 2
    .line 3
    iget-wide v0, p0, Lcom/alibaba/fastjson/JSONPath$DoubleOpSegement;->propertyNameHash:J

    .line 4
    .line 5
    invoke-virtual {p1, p4, p2, v0, v1}, Lcom/alibaba/fastjson/JSONPath;->getPropertyValue(Ljava/lang/Object;Ljava/lang/String;J)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 p2, 0x0

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    return p2

    .line 13
    :cond_0
    instance-of p3, p1, Ljava/lang/Number;

    .line 14
    .line 15
    if-nez p3, :cond_1

    .line 16
    .line 17
    return p2

    .line 18
    :cond_1
    check-cast p1, Ljava/lang/Number;

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    .line 21
    .line 22
    .line 23
    move-result-wide p3

    .line 24
    sget-object p1, Lcom/alibaba/fastjson/JSONPath$1;->$SwitchMap$com$alibaba$fastjson$JSONPath$Operator:[I

    .line 25
    .line 26
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONPath$DoubleOpSegement;->op:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    aget p1, p1, v0

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    packed-switch p1, :pswitch_data_0

    .line 36
    .line 37
    .line 38
    return p2

    .line 39
    :pswitch_0
    iget-wide p0, p0, Lcom/alibaba/fastjson/JSONPath$DoubleOpSegement;->value:D

    .line 40
    .line 41
    cmpg-double p0, p3, p0

    .line 42
    .line 43
    if-gez p0, :cond_2

    .line 44
    .line 45
    return v0

    .line 46
    :cond_2
    return p2

    .line 47
    :pswitch_1
    iget-wide p0, p0, Lcom/alibaba/fastjson/JSONPath$DoubleOpSegement;->value:D

    .line 48
    .line 49
    cmpg-double p0, p3, p0

    .line 50
    .line 51
    if-gtz p0, :cond_3

    .line 52
    .line 53
    return v0

    .line 54
    :cond_3
    return p2

    .line 55
    :pswitch_2
    iget-wide p0, p0, Lcom/alibaba/fastjson/JSONPath$DoubleOpSegement;->value:D

    .line 56
    .line 57
    cmpl-double p0, p3, p0

    .line 58
    .line 59
    if-lez p0, :cond_4

    .line 60
    .line 61
    return v0

    .line 62
    :cond_4
    return p2

    .line 63
    :pswitch_3
    iget-wide p0, p0, Lcom/alibaba/fastjson/JSONPath$DoubleOpSegement;->value:D

    .line 64
    .line 65
    cmpl-double p0, p3, p0

    .line 66
    .line 67
    if-ltz p0, :cond_5

    .line 68
    .line 69
    return v0

    .line 70
    :cond_5
    return p2

    .line 71
    :pswitch_4
    iget-wide p0, p0, Lcom/alibaba/fastjson/JSONPath$DoubleOpSegement;->value:D

    .line 72
    .line 73
    cmpl-double p0, p3, p0

    .line 74
    .line 75
    if-eqz p0, :cond_6

    .line 76
    .line 77
    return v0

    .line 78
    :cond_6
    return p2

    .line 79
    :pswitch_5
    iget-wide p0, p0, Lcom/alibaba/fastjson/JSONPath$DoubleOpSegement;->value:D

    .line 80
    .line 81
    cmpl-double p0, p3, p0

    .line 82
    .line 83
    if-nez p0, :cond_7

    .line 84
    .line 85
    return v0

    .line 86
    :cond_7
    return p2

    .line 87
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
