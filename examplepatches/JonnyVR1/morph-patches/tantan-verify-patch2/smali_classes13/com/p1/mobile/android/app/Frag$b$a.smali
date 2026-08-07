.class public Lcom/p1/mobile/android/app/Frag$b$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/android/app/Frag$b;->b(Ll/gcg0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "Lcom/p1/mobile/android/app/c;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic e:Ll/gcg0;

.field public final synthetic f:Lcom/p1/mobile/android/app/Frag$b;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Frag$b;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/app/Frag$b$a;->f:Lcom/p1/mobile/android/app/Frag$b;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/android/app/Frag$b$a;->e:Ll/gcg0;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public g(Lcom/p1/mobile/android/app/c;)V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->g:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eq p1, v0, :cond_0

    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/android/app/c;->h:Lcom/p1/mobile/android/app/c;

    .line 7
    .line 8
    if-eq p1, v0, :cond_0

    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 11
    .line 12
    if-ne p1, v0, :cond_1

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag$b$a;->f:Lcom/p1/mobile/android/app/Frag$b;

    .line 15
    .line 16
    iput-boolean v1, v0, Lcom/p1/mobile/android/app/Frag$b;->e:Z

    .line 17
    .line 18
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->g:Lcom/p1/mobile/android/app/c;

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    if-eq p1, v0, :cond_6

    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/android/app/c;->h:Lcom/p1/mobile/android/app/c;

    .line 24
    .line 25
    if-eq p1, v0, :cond_2

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 28
    .line 29
    if-ne p1, v0, :cond_3

    .line 30
    .line 31
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag$b$a;->f:Lcom/p1/mobile/android/app/Frag$b;

    .line 32
    .line 33
    iget-boolean v0, v0, Lcom/p1/mobile/android/app/Frag$b;->c:Z

    .line 34
    .line 35
    if-nez v0, :cond_3

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_3
    sget-object v0, Lcom/p1/mobile/android/app/c;->l:Lcom/p1/mobile/android/app/c;

    .line 39
    .line 40
    if-eq p1, v0, :cond_4

    .line 41
    .line 42
    sget-object v0, Lcom/p1/mobile/android/app/c;->o:Lcom/p1/mobile/android/app/c;

    .line 43
    .line 44
    if-ne p1, v0, :cond_7

    .line 45
    .line 46
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag$b$a;->f:Lcom/p1/mobile/android/app/Frag$b;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/android/app/Frag$b;->a:Ll/kcg0;

    .line 49
    .line 50
    if-eqz v0, :cond_5

    .line 51
    .line 52
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-nez v0, :cond_5

    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag$b$a;->f:Lcom/p1/mobile/android/app/Frag$b;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/android/app/Frag$b;->a:Ll/kcg0;

    .line 61
    .line 62
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 63
    .line 64
    .line 65
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag$b$a;->f:Lcom/p1/mobile/android/app/Frag$b;

    .line 66
    .line 67
    iput-boolean v1, v0, Lcom/p1/mobile/android/app/Frag$b;->c:Z

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_6
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag$b$a;->f:Lcom/p1/mobile/android/app/Frag$b;

    .line 71
    .line 72
    iget-object v3, v0, Lcom/p1/mobile/android/app/Frag$b;->g:Ll/pcj;

    .line 73
    .line 74
    invoke-interface {v3}, Ll/pcj;->call()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    check-cast v3, Lrx/c;

    .line 79
    .line 80
    new-instance v4, Lcom/p1/mobile/android/app/Frag$b$a$a;

    .line 81
    .line 82
    invoke-direct {v4, p0}, Lcom/p1/mobile/android/app/Frag$b$a$a;-><init>(Lcom/p1/mobile/android/app/Frag$b$a;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v3, v4}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    iput-object v3, v0, Lcom/p1/mobile/android/app/Frag$b;->a:Ll/kcg0;

    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag$b$a;->f:Lcom/p1/mobile/android/app/Frag$b;

    .line 92
    .line 93
    iput-boolean v2, v0, Lcom/p1/mobile/android/app/Frag$b;->c:Z

    .line 94
    .line 95
    :cond_7
    :goto_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 96
    .line 97
    if-ne p1, v0, :cond_8

    .line 98
    .line 99
    iget-object p1, p0, Lcom/p1/mobile/android/app/Frag$b$a;->f:Lcom/p1/mobile/android/app/Frag$b;

    .line 100
    .line 101
    iput-boolean v2, p1, Lcom/p1/mobile/android/app/Frag$b;->e:Z

    .line 102
    .line 103
    goto :goto_2

    .line 104
    :cond_8
    sget-object v0, Lcom/p1/mobile/android/app/c;->h:Lcom/p1/mobile/android/app/c;

    .line 105
    .line 106
    if-eq p1, v0, :cond_9

    .line 107
    .line 108
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 109
    .line 110
    if-ne p1, v0, :cond_b

    .line 111
    .line 112
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/android/app/Frag$b$a;->f:Lcom/p1/mobile/android/app/Frag$b;

    .line 113
    .line 114
    iput-boolean v1, p1, Lcom/p1/mobile/android/app/Frag$b;->e:Z

    .line 115
    .line 116
    iget-object p1, p1, Lcom/p1/mobile/android/app/Frag$b;->d:Ljava/lang/Object;

    .line 117
    .line 118
    if-eqz p1, :cond_b

    .line 119
    .line 120
    invoke-virtual {p0}, Ll/gcg0;->isUnsubscribed()Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-nez p1, :cond_a

    .line 125
    .line 126
    iget-object p1, p0, Lcom/p1/mobile/android/app/Frag$b$a;->e:Ll/gcg0;

    .line 127
    .line 128
    iget-object v0, p0, Lcom/p1/mobile/android/app/Frag$b$a;->f:Lcom/p1/mobile/android/app/Frag$b;

    .line 129
    .line 130
    iget-object v0, v0, Lcom/p1/mobile/android/app/Frag$b;->d:Ljava/lang/Object;

    .line 131
    .line 132
    invoke-interface {p1, v0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 133
    .line 134
    .line 135
    iget-object p1, p0, Lcom/p1/mobile/android/app/Frag$b$a;->f:Lcom/p1/mobile/android/app/Frag$b;

    .line 136
    .line 137
    iget-boolean p1, p1, Lcom/p1/mobile/android/app/Frag$b;->f:Z

    .line 138
    .line 139
    if-eqz p1, :cond_a

    .line 140
    .line 141
    iget-object p1, p0, Lcom/p1/mobile/android/app/Frag$b$a;->e:Ll/gcg0;

    .line 142
    .line 143
    invoke-interface {p1}, Ll/bb50;->onCompleted()V

    .line 144
    .line 145
    .line 146
    iget-object p1, p0, Lcom/p1/mobile/android/app/Frag$b$a;->e:Ll/gcg0;

    .line 147
    .line 148
    invoke-virtual {p1}, Ll/gcg0;->isUnsubscribed()Z

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    if-nez p1, :cond_a

    .line 153
    .line 154
    iget-object p1, p0, Lcom/p1/mobile/android/app/Frag$b$a;->e:Ll/gcg0;

    .line 155
    .line 156
    invoke-virtual {p1}, Ll/gcg0;->unsubscribe()V

    .line 157
    .line 158
    .line 159
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/android/app/Frag$b$a;->f:Lcom/p1/mobile/android/app/Frag$b;

    .line 160
    .line 161
    const/4 v0, 0x0

    .line 162
    iput-object v0, p1, Lcom/p1/mobile/android/app/Frag$b;->d:Ljava/lang/Object;

    .line 163
    .line 164
    :cond_b
    :goto_2
    invoke-virtual {p0}, Ll/gcg0;->isUnsubscribed()Z

    .line 165
    .line 166
    .line 167
    move-result p1

    .line 168
    if-eqz p1, :cond_c

    .line 169
    .line 170
    iget-object p0, p0, Lcom/p1/mobile/android/app/Frag$b$a;->f:Lcom/p1/mobile/android/app/Frag$b;

    .line 171
    .line 172
    iget-object p0, p0, Lcom/p1/mobile/android/app/Frag$b;->a:Ll/kcg0;

    .line 173
    .line 174
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 175
    .line 176
    .line 177
    :cond_c
    return-void
.end method

.method public onCompleted()V
    .locals 0

    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    new-instance p0, Lrx/exceptions/OnErrorNotImplementedException;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lrx/exceptions/OnErrorNotImplementedException;-><init>(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    throw p0
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Frag$b$a;->g(Lcom/p1/mobile/android/app/c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
