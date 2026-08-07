.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a$a;
    }
.end annotation


# instance fields
.field public a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a$a;",
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
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;->a:Ljava/util/ArrayList;

    .line 10
    .line 11
    return-void
.end method

.method public synthetic constructor <init>(Ll/u3k;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;-><init>()V

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;->a:Ljava/util/ArrayList;

    return-object p0
.end method


# virtual methods
.method public b(Landroid/view/MotionEvent;)Z
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a$a;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a$a;-><init>(Landroid/view/MotionEvent;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x3

    .line 16
    const/4 v2, 0x0

    .line 17
    if-ne v0, v1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;->a:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 22
    .line 23
    .line 24
    return v2

    .line 25
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    const/4 v0, 0x1

    .line 30
    if-ne p1, v0, :cond_5

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;->a:Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-le p1, v0, :cond_4

    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;->a:Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a$a;

    .line 47
    .line 48
    iget p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a$a;->a:I

    .line 49
    .line 50
    if-nez p1, :cond_4

    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;->a:Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    sub-int/2addr v1, v0

    .line 59
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a$a;

    .line 64
    .line 65
    iget p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a$a;->a:I

    .line 66
    .line 67
    if-ne p1, v0, :cond_4

    .line 68
    .line 69
    invoke-static {}, Ll/bnl0;->y0()I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    invoke-static {}, Ll/bnl0;->w0()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    div-int/lit8 p1, p1, 0x32

    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;->a:Ljava/util/ArrayList;

    .line 84
    .line 85
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a$a;

    .line 90
    .line 91
    move v3, v0

    .line 92
    :goto_0
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;->a:Ljava/util/ArrayList;

    .line 93
    .line 94
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    const/4 v5, 0x2

    .line 99
    sub-int/2addr v4, v5

    .line 100
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;->a:Ljava/util/ArrayList;

    .line 101
    .line 102
    if-ge v3, v4, :cond_3

    .line 103
    .line 104
    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    check-cast v4, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a$a;

    .line 109
    .line 110
    iget v6, v4, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a$a;->a:I

    .line 111
    .line 112
    if-eq v6, v5, :cond_1

    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_1
    iget v5, v4, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a$a;->c:F

    .line 116
    .line 117
    iget v6, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a$a;->c:F

    .line 118
    .line 119
    sub-float/2addr v5, v6

    .line 120
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    .line 121
    .line 122
    .line 123
    move-result v5

    .line 124
    int-to-float v6, p1

    .line 125
    cmpl-float v5, v5, v6

    .line 126
    .line 127
    if-gtz v5, :cond_4

    .line 128
    .line 129
    iget v4, v4, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a$a;->d:F

    .line 130
    .line 131
    iget v5, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a$a;->d:F

    .line 132
    .line 133
    sub-float/2addr v4, v5

    .line 134
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 135
    .line 136
    .line 137
    move-result v4

    .line 138
    cmpl-float v4, v4, v6

    .line 139
    .line 140
    if-lez v4, :cond_2

    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_3
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 147
    .line 148
    .line 149
    move-result p1

    .line 150
    sub-int/2addr p1, v0

    .line 151
    invoke-virtual {v6, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a$a;

    .line 156
    .line 157
    iget-wide v3, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a$a;->b:J

    .line 158
    .line 159
    iget-wide v5, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a$a;->b:J

    .line 160
    .line 161
    sub-long/2addr v3, v5

    .line 162
    const-wide/16 v5, 0x12c

    .line 163
    .line 164
    cmp-long p1, v3, v5

    .line 165
    .line 166
    if-gez p1, :cond_4

    .line 167
    .line 168
    move v2, v0

    .line 169
    :cond_4
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;->a:Ljava/util/ArrayList;

    .line 170
    .line 171
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 172
    .line 173
    .line 174
    :cond_5
    return v2
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;->a:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a$a;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a$a;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", "

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const-string p0, "]"

    .line 40
    .line 41
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method
