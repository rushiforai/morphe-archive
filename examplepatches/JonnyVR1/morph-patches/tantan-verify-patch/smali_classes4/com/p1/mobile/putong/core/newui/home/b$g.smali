.class public Lcom/p1/mobile/putong/core/newui/home/b$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/card/VSwipeStack$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/b;->y3()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/f1g0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/b;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/b;Ll/f1g0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$g;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/b$g;->a:Ll/f1g0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b(ZFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b$g;->a:Ll/f1g0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/f1g0;->d()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    cmpl-float v0, p2, v0

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    const/4 v2, 0x0

    .line 18
    if-lez v0, :cond_2

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b$g;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->C2()Ll/avl;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-interface {p1, p3}, Ll/avl;->c(Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$g;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->o2()Ll/avl;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-interface {p1, p3}, Ll/avl;->c(Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$g;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->r2()Ll/avl;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-interface {p1, p2, p3}, Ll/avl;->a(FLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$g;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 50
    .line 51
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/core/newui/home/b;->z1(Lcom/p1/mobile/putong/core/newui/home/b;Z)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$g;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 55
    .line 56
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/core/newui/home/b;->y1(Lcom/p1/mobile/putong/core/newui/home/b;Z)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/b$g;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 60
    .line 61
    invoke-static {p0, v2}, Lcom/p1/mobile/putong/core/newui/home/b;->A1(Lcom/p1/mobile/putong/core/newui/home/b;Z)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->r2()Ll/avl;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-interface {p1, p3}, Ll/avl;->c(Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$g;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 73
    .line 74
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->o2()Ll/avl;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-interface {p1, p3}, Ll/avl;->c(Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 79
    .line 80
    .line 81
    invoke-static {}, Ll/gra;->r1()Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-eqz p1, :cond_1

    .line 86
    .line 87
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$g;->a:Ll/f1g0;

    .line 88
    .line 89
    invoke-interface {p1}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-eqz p1, :cond_1

    .line 98
    .line 99
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$g;->a:Ll/f1g0;

    .line 100
    .line 101
    invoke-interface {p1}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->meetAgain:Z

    .line 106
    .line 107
    if-eqz p1, :cond_1

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$g;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 111
    .line 112
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->C2()Ll/avl;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-interface {p1, p2, p3}, Ll/avl;->a(FLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 117
    .line 118
    .line 119
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$g;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 120
    .line 121
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/core/newui/home/b;->y1(Lcom/p1/mobile/putong/core/newui/home/b;Z)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$g;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 125
    .line 126
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/core/newui/home/b;->z1(Lcom/p1/mobile/putong/core/newui/home/b;Z)V

    .line 127
    .line 128
    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/b$g;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 130
    .line 131
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/b;->A1(Lcom/p1/mobile/putong/core/newui/home/b;Z)V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$g;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 136
    .line 137
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->C2()Ll/avl;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-interface {p1, p3}, Ll/avl;->c(Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 142
    .line 143
    .line 144
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$g;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 145
    .line 146
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->r2()Ll/avl;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-interface {p1, p3}, Ll/avl;->c(Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 151
    .line 152
    .line 153
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$g;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 154
    .line 155
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->o2()Ll/avl;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    neg-float p2, p2

    .line 160
    invoke-interface {p1, p2, p3}, Ll/avl;->a(FLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 161
    .line 162
    .line 163
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$g;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 164
    .line 165
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/core/newui/home/b;->y1(Lcom/p1/mobile/putong/core/newui/home/b;Z)V

    .line 166
    .line 167
    .line 168
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$g;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 169
    .line 170
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/core/newui/home/b;->z1(Lcom/p1/mobile/putong/core/newui/home/b;Z)V

    .line 171
    .line 172
    .line 173
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/b$g;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 174
    .line 175
    invoke-static {p0, v2}, Lcom/p1/mobile/putong/core/newui/home/b;->A1(Lcom/p1/mobile/putong/core/newui/home/b;Z)V

    .line 176
    .line 177
    .line 178
    :cond_3
    return-void
.end method
