.class public Ll/l43;
.super Ll/sz90;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/u3m;Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/sz90;-><init>(Ll/u3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/on2<",
            "Ll/t3m;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 2
    .line 3
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 4
    .line 5
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;-><init>(Ll/q3m;Ll/ner;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    new-instance v0, Ll/ap90;

    .line 14
    .line 15
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 16
    .line 17
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 18
    .line 19
    invoke-direct {v0, v1, v2}, Ll/ap90;-><init>(Ll/t3m;Ll/ner;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/sz90;->a:Ll/u3m;

    .line 26
    .line 27
    invoke-interface {v0}, Ll/t3m;->from()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "push_like"

    .line 32
    .line 33
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    new-instance v0, Ll/xya0;

    .line 40
    .line 41
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 42
    .line 43
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 44
    .line 45
    invoke-direct {v0, v1, v2}, Ll/xya0;-><init>(Ll/t3m;Ll/ner;)V

    .line 46
    .line 47
    .line 48
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    :cond_0
    new-instance v0, Ll/d4b0;

    .line 52
    .line 53
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 54
    .line 55
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 56
    .line 57
    invoke-direct {v0, v1, v2}, Ll/d4b0;-><init>(Ll/t3m;Ll/ner;)V

    .line 58
    .line 59
    .line 60
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    new-instance v0, Ll/s1b0;

    .line 64
    .line 65
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 66
    .line 67
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 68
    .line 69
    invoke-direct {v0, v1, v2}, Ll/s1b0;-><init>(Ll/t3m;Ll/ner;)V

    .line 70
    .line 71
    .line 72
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    new-instance v0, Ll/mya0;

    .line 76
    .line 77
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 78
    .line 79
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 80
    .line 81
    invoke-direct {v0, v1, v2}, Ll/mya0;-><init>(Ll/t3m;Ll/ner;)V

    .line 82
    .line 83
    .line 84
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    new-instance v0, Ll/m2b0;

    .line 88
    .line 89
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 90
    .line 91
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 92
    .line 93
    invoke-direct {v0, v1, v2}, Ll/m2b0;-><init>(Ll/t3m;Ll/ner;)V

    .line 94
    .line 95
    .line 96
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    new-instance v0, Ll/vya0;

    .line 100
    .line 101
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 102
    .line 103
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 104
    .line 105
    invoke-direct {v0, v1, v2}, Ll/vya0;-><init>(Ll/t3m;Ll/ner;)V

    .line 106
    .line 107
    .line 108
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    new-instance v0, Ll/k1b0;

    .line 112
    .line 113
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 114
    .line 115
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 116
    .line 117
    invoke-direct {v0, v1, v2}, Ll/k1b0;-><init>(Ll/t3m;Ll/ner;)V

    .line 118
    .line 119
    .line 120
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Ll/sz90;->a:Ll/u3m;

    .line 124
    .line 125
    invoke-interface {v0}, Ll/s7m;->userId()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-nez v0, :cond_1

    .line 142
    .line 143
    new-instance v0, Ll/b43;

    .line 144
    .line 145
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 146
    .line 147
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 148
    .line 149
    invoke-direct {v0, v1, v2}, Ll/b43;-><init>(Ll/t3m;Ll/ner;)V

    .line 150
    .line 151
    .line 152
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    :cond_1
    new-instance v0, Ll/b43;

    .line 156
    .line 157
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 158
    .line 159
    iget-object p0, p0, Ll/sz90;->b:Ll/ner;

    .line 160
    .line 161
    invoke-direct {v0, v1, p0}, Ll/b43;-><init>(Ll/t3m;Ll/ner;)V

    .line 162
    .line 163
    .line 164
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    return-void
.end method
