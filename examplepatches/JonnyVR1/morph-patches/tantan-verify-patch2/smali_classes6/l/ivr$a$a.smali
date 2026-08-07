.class public Ll/ivr$a$a;
.super Ll/aj2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ivr$a;->b(Ll/gcg0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/aj2<",
        "Ll/fb5<",
        "Ll/db5;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/gcg0;

.field public final synthetic b:Ll/ivr$a;


# direct methods
.method public constructor <init>(Ll/ivr$a;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ivr$a$a;->b:Ll/ivr$a;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ivr$a$a;->a:Ll/gcg0;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/aj2;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public e(Ll/i6c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6c<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Ll/ivr$a$a;->a:Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/gcg0;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/ivr$a$a;->a:Ll/gcg0;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public f(Ll/i6c;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6c<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/i6c;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_1

    .line 8
    .line 9
    :cond_0
    invoke-interface {p1}, Ll/i6c;->getResult()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Ll/fb5;

    .line 14
    .line 15
    iget-object v0, p0, Ll/ivr$a$a;->a:Ll/gcg0;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/gcg0;->isUnsubscribed()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-static {p1}, Ll/fb5;->v(Ll/fb5;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    if-nez p1, :cond_2

    .line 28
    .line 29
    iget-object p1, p0, Ll/ivr$a$a;->a:Ll/gcg0;

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/gcg0;->isUnsubscribed()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_6

    .line 36
    .line 37
    iget-object p0, p0, Ll/ivr$a$a;->a:Ll/gcg0;

    .line 38
    .line 39
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    const/4 v0, 0x0

    .line 44
    const/4 v1, 0x0

    .line 45
    :try_start_0
    invoke-virtual {p1}, Ll/fb5;->B()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Ll/db5;

    .line 50
    .line 51
    invoke-static {}, Ll/vjm;->m()Ll/vjm;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    sget-object v4, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 56
    .line 57
    invoke-virtual {v3, v4}, Ll/vjm;->b(Landroid/content/Context;)Ll/rce;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    if-eqz v3, :cond_4

    .line 62
    .line 63
    if-eqz v2, :cond_4

    .line 64
    .line 65
    invoke-interface {v3, v2}, Ll/rce;->a(Ll/db5;)Z

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    if-eqz v4, :cond_4

    .line 70
    .line 71
    invoke-interface {v3, v2}, Ll/rce;->b(Ll/db5;)Landroid/graphics/drawable/Drawable;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    instance-of v3, v2, Ll/wp0;

    .line 76
    .line 77
    if-eqz v3, :cond_4

    .line 78
    .line 79
    check-cast v2, Ll/wp0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 80
    .line 81
    :try_start_1
    iget-object v1, p0, Ll/ivr$a$a;->a:Ll/gcg0;

    .line 82
    .line 83
    invoke-virtual {v1}, Ll/gcg0;->isUnsubscribed()Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-nez v1, :cond_3

    .line 88
    .line 89
    iget-object v1, p0, Ll/ivr$a$a;->a:Ll/gcg0;

    .line 90
    .line 91
    new-instance v3, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;

    .line 92
    .line 93
    invoke-direct {v3, v2, p1}, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;-><init>(Ll/wp0;Ll/fb5;)V

    .line 94
    .line 95
    .line 96
    invoke-interface {v1, v3}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    const/4 v0, 0x1

    .line 100
    iget-object v1, p0, Ll/ivr$a$a;->a:Ll/gcg0;

    .line 101
    .line 102
    invoke-interface {v1}, Ll/bb50;->onCompleted()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 103
    .line 104
    .line 105
    :cond_3
    move-object v1, v2

    .line 106
    goto :goto_0

    .line 107
    :catchall_0
    move-exception v1

    .line 108
    goto :goto_2

    .line 109
    :catchall_1
    move-exception v2

    .line 110
    move-object v5, v2

    .line 111
    move-object v2, v1

    .line 112
    move-object v1, v5

    .line 113
    goto :goto_2

    .line 114
    :cond_4
    :goto_0
    if-nez v0, :cond_6

    .line 115
    .line 116
    if-eqz v1, :cond_5

    .line 117
    .line 118
    invoke-virtual {v1}, Ll/wp0;->a()V

    .line 119
    .line 120
    .line 121
    :cond_5
    invoke-static {p1}, Ll/fb5;->v(Ll/fb5;)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Ll/ivr$a$a;->a:Ll/gcg0;

    .line 125
    .line 126
    invoke-virtual {p1}, Ll/gcg0;->isUnsubscribed()Z

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    if-nez p1, :cond_6

    .line 131
    .line 132
    iget-object p0, p0, Ll/ivr$a$a;->a:Ll/gcg0;

    .line 133
    .line 134
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 135
    .line 136
    .line 137
    :cond_6
    :goto_1
    return-void

    .line 138
    :goto_2
    if-nez v0, :cond_8

    .line 139
    .line 140
    if-eqz v2, :cond_7

    .line 141
    .line 142
    invoke-virtual {v2}, Ll/wp0;->a()V

    .line 143
    .line 144
    .line 145
    :cond_7
    invoke-static {p1}, Ll/fb5;->v(Ll/fb5;)V

    .line 146
    .line 147
    .line 148
    iget-object p1, p0, Ll/ivr$a$a;->a:Ll/gcg0;

    .line 149
    .line 150
    invoke-virtual {p1}, Ll/gcg0;->isUnsubscribed()Z

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    if-nez p1, :cond_8

    .line 155
    .line 156
    iget-object p0, p0, Ll/ivr$a$a;->a:Ll/gcg0;

    .line 157
    .line 158
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 159
    .line 160
    .line 161
    :cond_8
    throw v1
.end method
