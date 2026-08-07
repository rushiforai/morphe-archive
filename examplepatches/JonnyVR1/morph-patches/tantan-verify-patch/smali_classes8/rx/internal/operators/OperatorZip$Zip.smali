.class final Lrx/internal/operators/OperatorZip$Zip;
.super Ljava/util/concurrent/atomic/AtomicLong;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorZip;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Zip"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OperatorZip$Zip$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicLong;"
    }
.end annotation


# static fields
.field static final THRESHOLD:I

.field private static final serialVersionUID:J = 0x53337eae55d8937dL


# instance fields
.field final child:Ll/bb50;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/bb50<",
            "-TR;>;"
        }
    .end annotation
.end field

.field private final childSubscription:Ll/ft5;

.field emitted:I

.field private requested:Ljava/util/concurrent/atomic/AtomicLong;

.field private volatile subscribers:[Ljava/lang/Object;

.field private final zipFunction:Ll/zcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/zcj<",
            "+TR;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    sget v0, Ll/urd0;->g:I

    .line 2
    .line 3
    int-to-double v0, v0

    .line 4
    const-wide v2, 0x3fe6666666666666L    # 0.7

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    mul-double/2addr v0, v2

    .line 10
    double-to-int v0, v0

    .line 11
    sput v0, Lrx/internal/operators/OperatorZip$Zip;->THRESHOLD:I

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Ll/gcg0;Ll/zcj;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TR;>;",
            "Ll/zcj<",
            "+TR;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ft5;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/ft5;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lrx/internal/operators/OperatorZip$Zip;->childSubscription:Ll/ft5;

    .line 10
    .line 11
    iput-object p1, p0, Lrx/internal/operators/OperatorZip$Zip;->child:Ll/bb50;

    .line 12
    .line 13
    iput-object p2, p0, Lrx/internal/operators/OperatorZip$Zip;->zipFunction:Ll/zcj;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public start([Lrx/c;Ljava/util/concurrent/atomic/AtomicLong;)V
    .locals 5

    .line 1
    array-length v0, p1

    .line 2
    new-array v0, v0, [Ljava/lang/Object;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    :goto_0
    array-length v3, p1

    .line 7
    if-ge v2, v3, :cond_0

    .line 8
    .line 9
    new-instance v3, Lrx/internal/operators/OperatorZip$Zip$a;

    .line 10
    .line 11
    invoke-direct {v3, p0}, Lrx/internal/operators/OperatorZip$Zip$a;-><init>(Lrx/internal/operators/OperatorZip$Zip;)V

    .line 12
    .line 13
    .line 14
    aput-object v3, v0, v2

    .line 15
    .line 16
    iget-object v4, p0, Lrx/internal/operators/OperatorZip$Zip;->childSubscription:Ll/ft5;

    .line 17
    .line 18
    invoke-virtual {v4, v3}, Ll/ft5;->a(Ll/kcg0;)V

    .line 19
    .line 20
    .line 21
    add-int/lit8 v2, v2, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iput-object p2, p0, Lrx/internal/operators/OperatorZip$Zip;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 25
    .line 26
    iput-object v0, p0, Lrx/internal/operators/OperatorZip$Zip;->subscribers:[Ljava/lang/Object;

    .line 27
    .line 28
    :goto_1
    array-length p0, p1

    .line 29
    if-ge v1, p0, :cond_1

    .line 30
    .line 31
    aget-object p0, p1, v1

    .line 32
    .line 33
    aget-object p2, v0, v1

    .line 34
    .line 35
    check-cast p2, Lrx/internal/operators/OperatorZip$Zip$a;

    .line 36
    .line 37
    invoke-virtual {p0, p2}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    add-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    return-void
.end method

.method public tick()V
    .locals 14

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorZip$Zip;->subscribers:[Ljava/lang/Object;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_5

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    const-wide/16 v3, 0x0

    .line 12
    .line 13
    cmp-long v1, v1, v3

    .line 14
    .line 15
    if-nez v1, :cond_9

    .line 16
    .line 17
    array-length v1, v0

    .line 18
    iget-object v2, p0, Lrx/internal/operators/OperatorZip$Zip;->child:Ll/bb50;

    .line 19
    .line 20
    iget-object v5, p0, Lrx/internal/operators/OperatorZip$Zip;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 21
    .line 22
    :cond_1
    :goto_0
    new-array v6, v1, [Ljava/lang/Object;

    .line 23
    .line 24
    const/4 v7, 0x0

    .line 25
    const/4 v8, 0x1

    .line 26
    move v9, v7

    .line 27
    move v10, v8

    .line 28
    :goto_1
    if-ge v9, v1, :cond_4

    .line 29
    .line 30
    aget-object v11, v0, v9

    .line 31
    .line 32
    check-cast v11, Lrx/internal/operators/OperatorZip$Zip$a;

    .line 33
    .line 34
    iget-object v11, v11, Lrx/internal/operators/OperatorZip$Zip$a;->e:Ll/urd0;

    .line 35
    .line 36
    invoke-virtual {v11}, Ll/urd0;->h()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v12

    .line 40
    if-nez v12, :cond_2

    .line 41
    .line 42
    move v10, v7

    .line 43
    goto :goto_2

    .line 44
    :cond_2
    invoke-virtual {v11, v12}, Ll/urd0;->d(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v13

    .line 48
    if-eqz v13, :cond_3

    .line 49
    .line 50
    invoke-interface {v2}, Ll/bb50;->onCompleted()V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lrx/internal/operators/OperatorZip$Zip;->childSubscription:Ll/ft5;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/ft5;->unsubscribe()V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_3
    invoke-virtual {v11, v12}, Ll/urd0;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v11

    .line 63
    aput-object v11, v6, v9

    .line 64
    .line 65
    :goto_2
    add-int/lit8 v9, v9, 0x1

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_4
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 69
    .line 70
    .line 71
    move-result-wide v11

    .line 72
    cmp-long v9, v11, v3

    .line 73
    .line 74
    if-lez v9, :cond_8

    .line 75
    .line 76
    if-eqz v10, :cond_8

    .line 77
    .line 78
    :try_start_0
    iget-object v9, p0, Lrx/internal/operators/OperatorZip$Zip;->zipFunction:Ll/zcj;

    .line 79
    .line 80
    invoke-interface {v9, v6}, Ll/zcj;->call([Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v9

    .line 84
    invoke-interface {v2, v9}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicLong;->decrementAndGet()J

    .line 88
    .line 89
    .line 90
    iget v9, p0, Lrx/internal/operators/OperatorZip$Zip;->emitted:I

    .line 91
    .line 92
    add-int/2addr v9, v8

    .line 93
    iput v9, p0, Lrx/internal/operators/OperatorZip$Zip;->emitted:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    .line 95
    array-length v6, v0

    .line 96
    move v8, v7

    .line 97
    :goto_3
    if-ge v8, v6, :cond_6

    .line 98
    .line 99
    aget-object v9, v0, v8

    .line 100
    .line 101
    check-cast v9, Lrx/internal/operators/OperatorZip$Zip$a;

    .line 102
    .line 103
    iget-object v9, v9, Lrx/internal/operators/OperatorZip$Zip$a;->e:Ll/urd0;

    .line 104
    .line 105
    invoke-virtual {v9}, Ll/urd0;->i()Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v9}, Ll/urd0;->h()Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v10

    .line 112
    invoke-virtual {v9, v10}, Ll/urd0;->d(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v9

    .line 116
    if-eqz v9, :cond_5

    .line 117
    .line 118
    invoke-interface {v2}, Ll/bb50;->onCompleted()V

    .line 119
    .line 120
    .line 121
    iget-object p0, p0, Lrx/internal/operators/OperatorZip$Zip;->childSubscription:Ll/ft5;

    .line 122
    .line 123
    invoke-virtual {p0}, Ll/ft5;->unsubscribe()V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_5
    add-int/lit8 v8, v8, 0x1

    .line 128
    .line 129
    goto :goto_3

    .line 130
    :cond_6
    iget v6, p0, Lrx/internal/operators/OperatorZip$Zip;->emitted:I

    .line 131
    .line 132
    sget v8, Lrx/internal/operators/OperatorZip$Zip;->THRESHOLD:I

    .line 133
    .line 134
    if-le v6, v8, :cond_1

    .line 135
    .line 136
    array-length v6, v0

    .line 137
    move v8, v7

    .line 138
    :goto_4
    if-ge v8, v6, :cond_7

    .line 139
    .line 140
    aget-object v9, v0, v8

    .line 141
    .line 142
    check-cast v9, Lrx/internal/operators/OperatorZip$Zip$a;

    .line 143
    .line 144
    iget v10, p0, Lrx/internal/operators/OperatorZip$Zip;->emitted:I

    .line 145
    .line 146
    int-to-long v10, v10

    .line 147
    invoke-virtual {v9, v10, v11}, Lrx/internal/operators/OperatorZip$Zip$a;->g(J)V

    .line 148
    .line 149
    .line 150
    add-int/lit8 v8, v8, 0x1

    .line 151
    .line 152
    goto :goto_4

    .line 153
    :cond_7
    iput v7, p0, Lrx/internal/operators/OperatorZip$Zip;->emitted:I

    .line 154
    .line 155
    goto/16 :goto_0

    .line 156
    .line 157
    :catchall_0
    move-exception p0

    .line 158
    invoke-static {p0, v2, v6}, Ll/j6f;->g(Ljava/lang/Throwable;Ll/bb50;Ljava/lang/Object;)V

    .line 159
    .line 160
    .line 161
    return-void

    .line 162
    :cond_8
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->decrementAndGet()J

    .line 163
    .line 164
    .line 165
    move-result-wide v6

    .line 166
    cmp-long v6, v6, v3

    .line 167
    .line 168
    if-gtz v6, :cond_1

    .line 169
    .line 170
    :cond_9
    :goto_5
    return-void
.end method
