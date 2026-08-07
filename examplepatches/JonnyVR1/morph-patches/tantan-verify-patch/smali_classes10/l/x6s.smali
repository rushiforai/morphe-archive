.class public Ll/x6s;
.super Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/x6s$c;
    }
.end annotation


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/vxl;",
            ">;"
        }
    .end annotation
.end field

.field public final b:[Ll/x6s$c;

.field public c:I

.field public d:I

.field public e:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;

.field public final f:Ljava/lang/String;


# direct methods
.method public constructor <init>(IILjava/util/List;Ljava/lang/String;)V
    .locals 1
    .param p3    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List<",
            "Ll/vxl;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/b;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/x6s;->a:Ljava/util/List;

    .line 5
    .line 6
    iput-object p4, p0, Ll/x6s;->f:Ljava/lang/String;

    .line 7
    .line 8
    new-instance p4, Ll/x6s$c;

    .line 9
    .line 10
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    add-int/lit8 v0, v0, 0x2

    .line 15
    .line 16
    invoke-direct {p4, p1, v0}, Ll/x6s$c;-><init>(II)V

    .line 17
    .line 18
    .line 19
    new-instance p1, Ll/x6s$c;

    .line 20
    .line 21
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result p3

    .line 25
    add-int/lit8 p3, p3, 0x3

    .line 26
    .line 27
    invoke-direct {p1, p2, p3}, Ll/x6s$c;-><init>(II)V

    .line 28
    .line 29
    .line 30
    filled-new-array {p4, p1}, [Ll/x6s$c;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iput-object p1, p0, Ll/x6s;->b:[Ll/x6s$c;

    .line 35
    .line 36
    return-void
.end method

.method public static bridge synthetic c(Ll/x6s;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x6s;->f:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public a(Ll/smc0;I)Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/x6s;->f(Ll/smc0;I)Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b()Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x6s;->e:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->m()Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final d(Ll/smc0;I)Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/x6s;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/x6s;->a:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/lit8 v0, v0, -0x1

    .line 16
    .line 17
    if-le p2, v0, :cond_0

    .line 18
    .line 19
    const/4 p2, 0x0

    .line 20
    :cond_0
    iget-object v0, p0, Ll/x6s;->a:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    check-cast p2, Ll/vxl;

    .line 27
    .line 28
    invoke-virtual {p2}, Ll/vxl;->a()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p1}, Ll/smc0;->m()Ll/vzv;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    const-string v2, "create new connect succeed, rawUrl:"

    .line 39
    .line 40
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Ll/smc0;->o()Ll/r3w;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object p2, v0, Ll/r3w;->n:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {p0, p1, p2}, Ll/x6s;->e(Ll/smc0;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0

    .line 64
    :cond_1
    invoke-virtual {p1}, Ll/smc0;->m()Ll/vzv;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const-string p1, "create new connect fail, address list is empty"

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    const/4 p0, 0x0

    .line 74
    return-object p0
.end method

.method public final e(Ll/smc0;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/x6s;->e:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;

    .line 6
    .line 7
    new-instance v1, Ll/x6s$a;

    .line 8
    .line 9
    invoke-direct {v1, p0, p2}, Ll/x6s$a;-><init>(Ll/x6s;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;-><init>(Ll/smc0;Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/x6s;->e:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    new-instance p1, Ll/x6s$b;

    .line 19
    .line 20
    invoke-direct {p1, p0, p2}, Ll/x6s$b;-><init>(Ll/x6s;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->o(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;)V

    .line 24
    .line 25
    .line 26
    :goto_0
    iget-object p0, p0, Ll/x6s;->e:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;

    .line 27
    .line 28
    return-object p0
.end method

.method public final f(Ll/smc0;I)Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/x6s;->i()V

    .line 4
    .line 5
    .line 6
    :cond_0
    invoke-virtual {p1}, Ll/smc0;->m()Ll/vzv;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v2, "===retryCount:"

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v2, "===ServerAddressIndex:"

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget v2, p0, Ll/x6s;->c:I

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v2, "===currentReConnectLevel:"

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget v2, p0, Ll/x6s;->d:I

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, p2}, Ll/x6s;->g(I)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    invoke-virtual {p0, p1, v0}, Ll/x6s;->d(Ll/smc0;I)Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const-string v1, ""

    .line 66
    .line 67
    const/16 v2, 0x9

    .line 68
    .line 69
    if-eqz v0, :cond_3

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/x6s;->h()I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    int-to-long v3, v3

    .line 76
    const-wide/16 v5, 0x0

    .line 77
    .line 78
    cmp-long v5, v3, v5

    .line 79
    .line 80
    if-ltz v5, :cond_2

    .line 81
    .line 82
    if-eqz p2, :cond_1

    .line 83
    .line 84
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    .line 85
    .line 86
    .line 87
    :cond_1
    return-object v0

    .line 88
    :cond_2
    invoke-virtual {p1}, Ll/smc0;->i()Ll/ixl;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    new-instance v0, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    invoke-virtual {p1, v2, p2}, Ll/ixl;->c(ILjava/lang/String;)V

    .line 105
    .line 106
    .line 107
    new-instance p1, Ljava/lang/Exception;

    .line 108
    .line 109
    new-instance p2, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    const-string p0, "Retry reconnection exceeds the maximum number of times"

    .line 122
    .line 123
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-direct {p1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    throw p1

    .line 134
    :cond_3
    invoke-virtual {p1}, Ll/smc0;->i()Ll/ixl;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    new-instance p1, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-virtual {p0, v2, p1}, Ll/ixl;->c(ILjava/lang/String;)V

    .line 151
    .line 152
    .line 153
    const-string p0, "Retry reconnection exceeds the maximum number of times null"

    .line 154
    .line 155
    invoke-static {p0}, Ll/brq0;->a(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    const/4 p0, 0x0

    .line 159
    return-object p0
.end method

.method public final g(I)I
    .locals 0

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    rem-int/lit8 p1, p1, 0x2

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget p1, p0, Ll/x6s;->c:I

    .line 8
    .line 9
    add-int/lit8 p1, p1, 0x1

    .line 10
    .line 11
    iput p1, p0, Ll/x6s;->c:I

    .line 12
    .line 13
    return p1

    .line 14
    :cond_0
    iget p0, p0, Ll/x6s;->c:I

    .line 15
    .line 16
    return p0
.end method

.method public final h()I
    .locals 3

    .line 1
    iget v0, p0, Ll/x6s;->d:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/x6s;->b:[Ll/x6s$c;

    .line 4
    .line 5
    array-length v2, v1

    .line 6
    if-ge v0, v2, :cond_1

    .line 7
    .line 8
    aget-object v0, v1, v0

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/x6s$c;->b()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-static {v0}, Ll/x6s$c;->a(Ll/x6s$c;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_0
    iget v0, p0, Ll/x6s;->d:I

    .line 22
    .line 23
    add-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    iput v0, p0, Ll/x6s;->d:I

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/x6s;->h()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_1
    array-length v0, v1

    .line 33
    add-int/lit8 v0, v0, -0x1

    .line 34
    .line 35
    iput v0, p0, Ll/x6s;->d:I

    .line 36
    .line 37
    const/4 p0, -0x1

    .line 38
    return p0
.end method

.method public final i()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/x6s;->d:I

    .line 3
    .line 4
    iput v0, p0, Ll/x6s;->c:I

    .line 5
    .line 6
    iget-object p0, p0, Ll/x6s;->b:[Ll/x6s$c;

    .line 7
    .line 8
    array-length v1, p0

    .line 9
    :goto_0
    if-ge v0, v1, :cond_0

    .line 10
    .line 11
    aget-object v2, p0, v0

    .line 12
    .line 13
    invoke-virtual {v2}, Ll/x6s$c;->c()V

    .line 14
    .line 15
    .line 16
    add-int/lit8 v0, v0, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    return-void
.end method
