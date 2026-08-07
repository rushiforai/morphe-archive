.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->l0()Landroid/text/TextWatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/data/TopicMoment;Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;->c()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/cmg;->x()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->T(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)Ll/iog;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->T(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)Ll/iog;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 26
    .line 27
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->V(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->H:Ljava/util/ArrayList;

    .line 32
    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 34
    .line 35
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->V(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->G:Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-virtual {v0, p1, v1, v2}, Ll/iog;->b(Landroid/text/Editable;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 45
    .line 46
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->V(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->H:Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-nez p1, :cond_1

    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 59
    .line 60
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->V(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->H:Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_1

    .line 75
    .line 76
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;

    .line 81
    .line 82
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->new_()Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->topic:Lcom/p1/mobile/putong/data/TopicMomentIdBox;

    .line 87
    .line 88
    iget-object v2, v0, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->id:Ljava/lang/String;

    .line 89
    .line 90
    iput-object v2, v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 91
    .line 92
    iget-object v0, v0, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->name:Ljava/lang/String;

    .line 93
    .line 94
    iput-object v0, v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 97
    .line 98
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->V(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 103
    .line 104
    new-instance v2, Ll/re40;

    .line 105
    .line 106
    invoke-direct {v2, v1}, Ll/re40;-><init>(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 107
    .line 108
    .line 109
    invoke-static {v0, v2}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-nez v0, :cond_0

    .line 114
    .line 115
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 116
    .line 117
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->V(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 122
    .line 123
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    const/4 v2, 0x3

    .line 128
    if-ge v0, v2, :cond_0

    .line 129
    .line 130
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 131
    .line 132
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->V(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 137
    .line 138
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 142
    .line 143
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->V(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 148
    .line 149
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->V(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 154
    .line 155
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->S1(Ljava/util/ArrayList;)V

    .line 156
    .line 157
    .line 158
    goto :goto_0

    .line 159
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 160
    .line 161
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->z:Lv/VText;

    .line 162
    .line 163
    const/4 v0, 0x0

    .line 164
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 165
    .line 166
    .line 167
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 168
    .line 169
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->J1()V

    .line 170
    .line 171
    .line 172
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public final synthetic c()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->X(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->U(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)Ll/d8j0;

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
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->S(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 23
    .line 24
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->W(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->U(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)Ll/d8j0;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 34
    .line 35
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 36
    .line 37
    move-object v3, p1

    .line 38
    move v4, p2

    .line 39
    move v5, p3

    .line 40
    move v6, p4

    .line 41
    invoke-virtual/range {v1 .. v6}, Ll/d8j0;->k(Landroid/widget/EditText;Ljava/lang/CharSequence;III)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    move-object v3, p1

    .line 46
    move v4, p2

    .line 47
    move v5, p3

    .line 48
    move v6, p4

    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 50
    .line 51
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->W(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Z)V

    .line 52
    .line 53
    .line 54
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 55
    .line 56
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->T(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)Ll/iog;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-eqz p1, :cond_1

    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 67
    .line 68
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->T(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)Ll/iog;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 73
    .line 74
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 75
    .line 76
    new-instance v9, Ll/se40;

    .line 77
    .line 78
    invoke-direct {v9, p0}, Ll/se40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;)V

    .line 79
    .line 80
    .line 81
    move v7, v5

    .line 82
    move v8, v6

    .line 83
    move-object v5, v3

    .line 84
    move v6, v4

    .line 85
    move-object v3, p1

    .line 86
    move-object v4, p2

    .line 87
    invoke-virtual/range {v3 .. v9}, Ll/iog;->f(Landroid/widget/EditText;Ljava/lang/CharSequence;IIILl/x20;)V

    .line 88
    .line 89
    .line 90
    :cond_1
    return-void
.end method
