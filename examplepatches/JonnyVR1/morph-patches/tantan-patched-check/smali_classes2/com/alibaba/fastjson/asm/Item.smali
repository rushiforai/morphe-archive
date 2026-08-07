.class final Lcom/alibaba/fastjson/asm/Item;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field hashCode:I

.field index:I

.field intVal:I

.field longVal:J

.field next:Lcom/alibaba/fastjson/asm/Item;

.field strVal1:Ljava/lang/String;

.field strVal2:Ljava/lang/String;

.field strVal3:Ljava/lang/String;

.field type:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(ILcom/alibaba/fastjson/asm/Item;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/alibaba/fastjson/asm/Item;->index:I

    .line 5
    .line 6
    iget p1, p2, Lcom/alibaba/fastjson/asm/Item;->type:I

    .line 7
    .line 8
    iput p1, p0, Lcom/alibaba/fastjson/asm/Item;->type:I

    .line 9
    .line 10
    iget p1, p2, Lcom/alibaba/fastjson/asm/Item;->intVal:I

    .line 11
    .line 12
    iput p1, p0, Lcom/alibaba/fastjson/asm/Item;->intVal:I

    .line 13
    .line 14
    iget-wide v0, p2, Lcom/alibaba/fastjson/asm/Item;->longVal:J

    .line 15
    .line 16
    iput-wide v0, p0, Lcom/alibaba/fastjson/asm/Item;->longVal:J

    .line 17
    .line 18
    iget-object p1, p2, Lcom/alibaba/fastjson/asm/Item;->strVal1:Ljava/lang/String;

    .line 19
    .line 20
    iput-object p1, p0, Lcom/alibaba/fastjson/asm/Item;->strVal1:Ljava/lang/String;

    .line 21
    .line 22
    iget-object p1, p2, Lcom/alibaba/fastjson/asm/Item;->strVal2:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/alibaba/fastjson/asm/Item;->strVal2:Ljava/lang/String;

    .line 25
    .line 26
    iget-object p1, p2, Lcom/alibaba/fastjson/asm/Item;->strVal3:Ljava/lang/String;

    .line 27
    .line 28
    iput-object p1, p0, Lcom/alibaba/fastjson/asm/Item;->strVal3:Ljava/lang/String;

    .line 29
    .line 30
    iget p1, p2, Lcom/alibaba/fastjson/asm/Item;->hashCode:I

    .line 31
    .line 32
    iput p1, p0, Lcom/alibaba/fastjson/asm/Item;->hashCode:I

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public isEqualTo(Lcom/alibaba/fastjson/asm/Item;)Z
    .locals 6

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/asm/Item;->type:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_6

    .line 5
    .line 6
    const/16 v2, 0xf

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    if-eq v0, v2, :cond_4

    .line 10
    .line 11
    const/16 v2, 0xc

    .line 12
    .line 13
    if-eq v0, v2, :cond_2

    .line 14
    .line 15
    const/16 v2, 0xd

    .line 16
    .line 17
    if-eq v0, v2, :cond_6

    .line 18
    .line 19
    packed-switch v0, :pswitch_data_0

    .line 20
    .line 21
    .line 22
    iget-object v0, p1, Lcom/alibaba/fastjson/asm/Item;->strVal1:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v2, p0, Lcom/alibaba/fastjson/asm/Item;->strVal1:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p1, Lcom/alibaba/fastjson/asm/Item;->strVal2:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v2, p0, Lcom/alibaba/fastjson/asm/Item;->strVal2:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    iget-object p1, p1, Lcom/alibaba/fastjson/asm/Item;->strVal3:Ljava/lang/String;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/alibaba/fastjson/asm/Item;->strVal3:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_0

    .line 51
    .line 52
    return v1

    .line 53
    :cond_0
    return v3

    .line 54
    :pswitch_0
    iget p1, p1, Lcom/alibaba/fastjson/asm/Item;->intVal:I

    .line 55
    .line 56
    iget p0, p0, Lcom/alibaba/fastjson/asm/Item;->intVal:I

    .line 57
    .line 58
    if-ne p1, p0, :cond_1

    .line 59
    .line 60
    return v1

    .line 61
    :cond_1
    return v3

    .line 62
    :cond_2
    iget-object v0, p1, Lcom/alibaba/fastjson/asm/Item;->strVal1:Ljava/lang/String;

    .line 63
    .line 64
    iget-object v2, p0, Lcom/alibaba/fastjson/asm/Item;->strVal1:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    iget-object p1, p1, Lcom/alibaba/fastjson/asm/Item;->strVal2:Ljava/lang/String;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/alibaba/fastjson/asm/Item;->strVal2:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-eqz p0, :cond_3

    .line 81
    .line 82
    return v1

    .line 83
    :cond_3
    return v3

    .line 84
    :cond_4
    :pswitch_1
    iget-wide v4, p1, Lcom/alibaba/fastjson/asm/Item;->longVal:J

    .line 85
    .line 86
    iget-wide p0, p0, Lcom/alibaba/fastjson/asm/Item;->longVal:J

    .line 87
    .line 88
    cmp-long p0, v4, p0

    .line 89
    .line 90
    if-nez p0, :cond_5

    .line 91
    .line 92
    return v1

    .line 93
    :cond_5
    return v3

    .line 94
    :cond_6
    :pswitch_2
    iget-object p1, p1, Lcom/alibaba/fastjson/asm/Item;->strVal1:Ljava/lang/String;

    .line 95
    .line 96
    iget-object p0, p0, Lcom/alibaba/fastjson/asm/Item;->strVal1:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    return p0

    .line 103
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method public set(I)V
    .locals 2

    const/4 v0, 0x3

    .line 72
    iput v0, p0, Lcom/alibaba/fastjson/asm/Item;->type:I

    .line 73
    iput p1, p0, Lcom/alibaba/fastjson/asm/Item;->intVal:I

    const v1, 0x7fffffff

    add-int/2addr v0, p1

    and-int p1, v0, v1

    .line 74
    iput p1, p0, Lcom/alibaba/fastjson/asm/Item;->hashCode:I

    return-void
.end method

.method public set(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/alibaba/fastjson/asm/Item;->type:I

    .line 2
    .line 3
    iput-object p2, p0, Lcom/alibaba/fastjson/asm/Item;->strVal1:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/alibaba/fastjson/asm/Item;->strVal2:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/alibaba/fastjson/asm/Item;->strVal3:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    const v1, 0x7fffffff

    .line 11
    .line 12
    .line 13
    if-eq p1, v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x7

    .line 16
    if-eq p1, v0, :cond_1

    .line 17
    .line 18
    const/16 v0, 0x8

    .line 19
    .line 20
    if-eq p1, v0, :cond_1

    .line 21
    .line 22
    const/16 v0, 0xc

    .line 23
    .line 24
    if-eq p1, v0, :cond_0

    .line 25
    .line 26
    const/16 v0, 0xd

    .line 27
    .line 28
    if-eq p1, v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    .line 35
    .line 36
    .line 37
    move-result p3

    .line 38
    mul-int/2addr p2, p3

    .line 39
    invoke-virtual {p4}, Ljava/lang/String;->hashCode()I

    .line 40
    .line 41
    .line 42
    move-result p3

    .line 43
    mul-int/2addr p2, p3

    .line 44
    add-int/2addr p1, p2

    .line 45
    and-int/2addr p1, v1

    .line 46
    iput p1, p0, Lcom/alibaba/fastjson/asm/Item;->hashCode:I

    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    .line 54
    .line 55
    .line 56
    move-result p3

    .line 57
    mul-int/2addr p2, p3

    .line 58
    add-int/2addr p1, p2

    .line 59
    and-int/2addr p1, v1

    .line 60
    iput p1, p0, Lcom/alibaba/fastjson/asm/Item;->hashCode:I

    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    add-int/2addr p1, p2

    .line 68
    and-int/2addr p1, v1

    .line 69
    iput p1, p0, Lcom/alibaba/fastjson/asm/Item;->hashCode:I

    .line 70
    .line 71
    return-void
.end method
