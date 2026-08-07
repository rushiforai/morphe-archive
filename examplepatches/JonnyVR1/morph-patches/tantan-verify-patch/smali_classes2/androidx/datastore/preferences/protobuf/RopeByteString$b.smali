.class public Landroidx/datastore/preferences/protobuf/RopeByteString$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/datastore/preferences/protobuf/RopeByteString;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public final a:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Landroidx/datastore/preferences/protobuf/ByteString;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayDeque;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Landroidx/datastore/preferences/protobuf/RopeByteString$b;->a:Ljava/util/ArrayDeque;

    .line 10
    .line 11
    return-void
.end method

.method public synthetic constructor <init>(Landroidx/datastore/preferences/protobuf/RopeByteString$a;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Landroidx/datastore/preferences/protobuf/RopeByteString$b;-><init>()V

    return-void
.end method

.method public static synthetic a(Landroidx/datastore/preferences/protobuf/RopeByteString$b;Landroidx/datastore/preferences/protobuf/ByteString;Landroidx/datastore/preferences/protobuf/ByteString;)Landroidx/datastore/preferences/protobuf/ByteString;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Landroidx/datastore/preferences/protobuf/RopeByteString$b;->b(Landroidx/datastore/preferences/protobuf/ByteString;Landroidx/datastore/preferences/protobuf/ByteString;)Landroidx/datastore/preferences/protobuf/ByteString;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method public final b(Landroidx/datastore/preferences/protobuf/ByteString;Landroidx/datastore/preferences/protobuf/ByteString;)Landroidx/datastore/preferences/protobuf/ByteString;
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Landroidx/datastore/preferences/protobuf/RopeByteString$b;->c(Landroidx/datastore/preferences/protobuf/ByteString;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Landroidx/datastore/preferences/protobuf/RopeByteString$b;->c(Landroidx/datastore/preferences/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Landroidx/datastore/preferences/protobuf/RopeByteString$b;->a:Ljava/util/ArrayDeque;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 14
    .line 15
    :goto_0
    iget-object p2, p0, Landroidx/datastore/preferences/protobuf/RopeByteString$b;->a:Ljava/util/ArrayDeque;

    .line 16
    .line 17
    invoke-virtual {p2}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-nez p2, :cond_0

    .line 22
    .line 23
    iget-object p2, p0, Landroidx/datastore/preferences/protobuf/RopeByteString$b;->a:Ljava/util/ArrayDeque;

    .line 24
    .line 25
    invoke-virtual {p2}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    check-cast p2, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 30
    .line 31
    new-instance v0, Landroidx/datastore/preferences/protobuf/RopeByteString;

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-direct {v0, p2, p1, v1}, Landroidx/datastore/preferences/protobuf/RopeByteString;-><init>(Landroidx/datastore/preferences/protobuf/ByteString;Landroidx/datastore/preferences/protobuf/ByteString;Landroidx/datastore/preferences/protobuf/RopeByteString$a;)V

    .line 35
    .line 36
    .line 37
    move-object p1, v0

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-object p1
.end method

.method public final c(Landroidx/datastore/preferences/protobuf/ByteString;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroidx/datastore/preferences/protobuf/ByteString;->isBalanced()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroidx/datastore/preferences/protobuf/RopeByteString$b;->e(Landroidx/datastore/preferences/protobuf/ByteString;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    instance-of v0, p1, Landroidx/datastore/preferences/protobuf/RopeByteString;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    check-cast p1, Landroidx/datastore/preferences/protobuf/RopeByteString;

    .line 16
    .line 17
    invoke-static {p1}, Landroidx/datastore/preferences/protobuf/RopeByteString;->access$400(Landroidx/datastore/preferences/protobuf/RopeByteString;)Landroidx/datastore/preferences/protobuf/ByteString;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Landroidx/datastore/preferences/protobuf/RopeByteString$b;->c(Landroidx/datastore/preferences/protobuf/ByteString;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1}, Landroidx/datastore/preferences/protobuf/RopeByteString;->access$500(Landroidx/datastore/preferences/protobuf/RopeByteString;)Landroidx/datastore/preferences/protobuf/ByteString;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Landroidx/datastore/preferences/protobuf/RopeByteString$b;->c(Landroidx/datastore/preferences/protobuf/ByteString;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    const-string p0, "Has a new type of ByteString been created? Found "

    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {p0, p1}, Ll/yg3;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final d(I)I
    .locals 0

    .line 1
    sget-object p0, Landroidx/datastore/preferences/protobuf/RopeByteString;->minLengthByDepth:[I

    .line 2
    .line 3
    invoke-static {p0, p1}, Ljava/util/Arrays;->binarySearch([II)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-gez p0, :cond_0

    .line 8
    .line 9
    add-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    neg-int p0, p0

    .line 12
    add-int/lit8 p0, p0, -0x1

    .line 13
    .line 14
    :cond_0
    return p0
.end method

.method public final e(Landroidx/datastore/preferences/protobuf/ByteString;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroidx/datastore/preferences/protobuf/ByteString;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Landroidx/datastore/preferences/protobuf/RopeByteString$b;->d(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    sget-object v1, Landroidx/datastore/preferences/protobuf/RopeByteString;->minLengthByDepth:[I

    .line 10
    .line 11
    add-int/lit8 v2, v0, 0x1

    .line 12
    .line 13
    aget v2, v1, v2

    .line 14
    .line 15
    iget-object v3, p0, Landroidx/datastore/preferences/protobuf/RopeByteString$b;->a:Ljava/util/ArrayDeque;

    .line 16
    .line 17
    invoke-virtual {v3}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-nez v3, :cond_3

    .line 22
    .line 23
    iget-object v3, p0, Landroidx/datastore/preferences/protobuf/RopeByteString$b;->a:Ljava/util/ArrayDeque;

    .line 24
    .line 25
    invoke-virtual {v3}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 30
    .line 31
    invoke-virtual {v3}, Landroidx/datastore/preferences/protobuf/ByteString;->size()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-lt v3, v2, :cond_0

    .line 36
    .line 37
    goto :goto_2

    .line 38
    :cond_0
    aget v0, v1, v0

    .line 39
    .line 40
    iget-object v1, p0, Landroidx/datastore/preferences/protobuf/RopeByteString$b;->a:Ljava/util/ArrayDeque;

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 47
    .line 48
    :goto_0
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/RopeByteString$b;->a:Ljava/util/ArrayDeque;

    .line 49
    .line 50
    invoke-virtual {v2}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    const/4 v3, 0x0

    .line 55
    if-nez v2, :cond_1

    .line 56
    .line 57
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/RopeByteString$b;->a:Ljava/util/ArrayDeque;

    .line 58
    .line 59
    invoke-virtual {v2}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    check-cast v2, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 64
    .line 65
    invoke-virtual {v2}, Landroidx/datastore/preferences/protobuf/ByteString;->size()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-ge v2, v0, :cond_1

    .line 70
    .line 71
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/RopeByteString$b;->a:Ljava/util/ArrayDeque;

    .line 72
    .line 73
    invoke-virtual {v2}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    check-cast v2, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 78
    .line 79
    new-instance v4, Landroidx/datastore/preferences/protobuf/RopeByteString;

    .line 80
    .line 81
    invoke-direct {v4, v2, v1, v3}, Landroidx/datastore/preferences/protobuf/RopeByteString;-><init>(Landroidx/datastore/preferences/protobuf/ByteString;Landroidx/datastore/preferences/protobuf/ByteString;Landroidx/datastore/preferences/protobuf/RopeByteString$a;)V

    .line 82
    .line 83
    .line 84
    move-object v1, v4

    .line 85
    goto :goto_0

    .line 86
    :cond_1
    new-instance v0, Landroidx/datastore/preferences/protobuf/RopeByteString;

    .line 87
    .line 88
    invoke-direct {v0, v1, p1, v3}, Landroidx/datastore/preferences/protobuf/RopeByteString;-><init>(Landroidx/datastore/preferences/protobuf/ByteString;Landroidx/datastore/preferences/protobuf/ByteString;Landroidx/datastore/preferences/protobuf/RopeByteString$a;)V

    .line 89
    .line 90
    .line 91
    :goto_1
    iget-object p1, p0, Landroidx/datastore/preferences/protobuf/RopeByteString$b;->a:Ljava/util/ArrayDeque;

    .line 92
    .line 93
    invoke-virtual {p1}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-nez p1, :cond_2

    .line 98
    .line 99
    invoke-virtual {v0}, Landroidx/datastore/preferences/protobuf/ByteString;->size()I

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    invoke-virtual {p0, p1}, Landroidx/datastore/preferences/protobuf/RopeByteString$b;->d(I)I

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    sget-object v1, Landroidx/datastore/preferences/protobuf/RopeByteString;->minLengthByDepth:[I

    .line 108
    .line 109
    add-int/lit8 p1, p1, 0x1

    .line 110
    .line 111
    aget p1, v1, p1

    .line 112
    .line 113
    iget-object v1, p0, Landroidx/datastore/preferences/protobuf/RopeByteString$b;->a:Ljava/util/ArrayDeque;

    .line 114
    .line 115
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    check-cast v1, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 120
    .line 121
    invoke-virtual {v1}, Landroidx/datastore/preferences/protobuf/ByteString;->size()I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    if-ge v1, p1, :cond_2

    .line 126
    .line 127
    iget-object p1, p0, Landroidx/datastore/preferences/protobuf/RopeByteString$b;->a:Ljava/util/ArrayDeque;

    .line 128
    .line 129
    invoke-virtual {p1}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    check-cast p1, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 134
    .line 135
    new-instance v1, Landroidx/datastore/preferences/protobuf/RopeByteString;

    .line 136
    .line 137
    invoke-direct {v1, p1, v0, v3}, Landroidx/datastore/preferences/protobuf/RopeByteString;-><init>(Landroidx/datastore/preferences/protobuf/ByteString;Landroidx/datastore/preferences/protobuf/ByteString;Landroidx/datastore/preferences/protobuf/RopeByteString$a;)V

    .line 138
    .line 139
    .line 140
    move-object v0, v1

    .line 141
    goto :goto_1

    .line 142
    :cond_2
    iget-object p0, p0, Landroidx/datastore/preferences/protobuf/RopeByteString$b;->a:Ljava/util/ArrayDeque;

    .line 143
    .line 144
    invoke-virtual {p0, v0}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :cond_3
    :goto_2
    iget-object p0, p0, Landroidx/datastore/preferences/protobuf/RopeByteString$b;->a:Ljava/util/ArrayDeque;

    .line 149
    .line 150
    invoke-virtual {p0, p1}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    .line 151
    .line 152
    .line 153
    return-void
.end method
