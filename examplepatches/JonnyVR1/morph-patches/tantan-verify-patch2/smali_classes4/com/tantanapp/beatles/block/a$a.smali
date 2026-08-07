.class public Lcom/tantanapp/beatles/block/a$a;
.super Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/beatles/block/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final synthetic f:Lcom/tantanapp/beatles/block/a;


# direct methods
.method public constructor <init>(Lcom/tantanapp/beatles/block/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/block/a$a;->f:Lcom/tantanapp/beatles/block/a;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;-><init>(Lcom/tantanapp/beatles/block/BlockBaseStrategy;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public l(Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 2
    .line 3
    sget-object v1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;->LOW:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 4
    .line 5
    if-ne v0, v1, :cond_2

    .line 6
    .line 7
    iget-object v0, p1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->f:Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, "PAGE_CREATING"

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/tantanapp/beatles/block/a$a;->f:Lcom/tantanapp/beatles/block/a;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->d:Ll/e43;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/e43;->r()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b:Ljava/util/LinkedList;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b:Ljava/util/LinkedList;

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/util/LinkedList;->peekFirst()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    iget-wide v1, p1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->b:J

    .line 45
    .line 46
    iget-wide v3, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 47
    .line 48
    sub-long/2addr v1, v3

    .line 49
    iget-object p1, p0, Lcom/tantanapp/beatles/block/a$a;->f:Lcom/tantanapp/beatles/block/a;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->d:Ll/e43;

    .line 52
    .line 53
    invoke-virtual {p1}, Ll/e43;->p()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    int-to-long v3, p1

    .line 58
    cmp-long p1, v1, v3

    .line 59
    .line 60
    if-lez p1, :cond_1

    .line 61
    .line 62
    iget-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b:Ljava/util/LinkedList;

    .line 63
    .line 64
    invoke-virtual {p1}, Ljava/util/LinkedList;->pop()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a()V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->c:Ljava/util/LinkedList;

    .line 74
    .line 75
    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    :cond_1
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->j()Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-eqz p1, :cond_4

    .line 83
    .line 84
    iget-object p0, p0, Lcom/tantanapp/beatles/block/a$a;->f:Lcom/tantanapp/beatles/block/a;

    .line 85
    .line 86
    iget-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->d:Ll/e43;

    .line 87
    .line 88
    invoke-virtual {p1}, Ll/e43;->l()I

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    int-to-long v0, p1

    .line 93
    invoke-virtual {p0, v0, v1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->g(J)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_2
    sget-object v1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;->HIGH:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 98
    .line 99
    if-ne v0, v1, :cond_4

    .line 100
    .line 101
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b:Ljava/util/LinkedList;

    .line 102
    .line 103
    invoke-virtual {v0}, Ljava/util/LinkedList;->peekLast()Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 108
    .line 109
    if-eqz v0, :cond_3

    .line 110
    .line 111
    iget-wide v0, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 112
    .line 113
    iget-wide v2, p1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 114
    .line 115
    cmp-long v0, v0, v2

    .line 116
    .line 117
    if-nez v0, :cond_3

    .line 118
    .line 119
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b:Ljava/util/LinkedList;

    .line 120
    .line 121
    invoke-virtual {v0}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    check-cast v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 126
    .line 127
    invoke-virtual {v0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a()V

    .line 128
    .line 129
    .line 130
    iget-object v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->c:Ljava/util/LinkedList;

    .line 131
    .line 132
    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    :cond_3
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->d:Ljava/util/LinkedList;

    .line 136
    .line 137
    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    iget-object p0, p0, Lcom/tantanapp/beatles/block/a$a;->f:Lcom/tantanapp/beatles/block/a;

    .line 141
    .line 142
    iget-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->d:Ll/e43;

    .line 143
    .line 144
    invoke-virtual {p1}, Ll/e43;->l()I

    .line 145
    .line 146
    .line 147
    move-result p1

    .line 148
    int-to-long v0, p1

    .line 149
    invoke-virtual {p0, v0, v1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->f(J)V

    .line 150
    .line 151
    .line 152
    :cond_4
    :goto_0
    return-void
.end method
