.class public Ll/gl6$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tk6$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/gl6;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/gl6;


# direct methods
.method public constructor <init>(Ll/gl6;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gl6$a;->a:Ll/gl6;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 6

    .line 1
    new-instance v4, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v5, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/gl6$a;->a:Ll/gl6;

    .line 12
    .line 13
    invoke-static {v0}, Ll/gl6;->i(Ll/gl6;)Ll/zk6;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object v0, v0, Ll/zk6;->j:Ljava/util/List;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v0, v0, Ll/zk6;->l:Ljava/util/List;

    .line 23
    .line 24
    :goto_0
    const/4 v1, 0x0

    .line 25
    move v2, v1

    .line 26
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-ge v2, v3, :cond_1

    .line 31
    .line 32
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    check-cast v3, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 37
    .line 38
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    add-int/lit8 v2, v2, 0x1

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    if-nez p1, :cond_2

    .line 47
    .line 48
    :goto_2
    iget-object v0, p0, Ll/gl6$a;->a:Ll/gl6;

    .line 49
    .line 50
    invoke-static {v0}, Ll/gl6;->i(Ll/gl6;)Ll/zk6;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v0, v0, Ll/zk6;->m:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-ge v1, v0, :cond_2

    .line 61
    .line 62
    iget-object v0, p0, Ll/gl6$a;->a:Ll/gl6;

    .line 63
    .line 64
    invoke-static {v0}, Ll/gl6;->i(Ll/gl6;)Ll/zk6;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object v0, v0, Ll/zk6;->m:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Lcom/p1/mobile/putong/core/data/Message;

    .line 75
    .line 76
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    add-int/lit8 v1, v1, 0x1

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_2
    iget-object v0, p0, Ll/gl6$a;->a:Ll/gl6;

    .line 85
    .line 86
    iget-object v0, v0, Ll/gl6;->g:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 87
    .line 88
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iget-object v1, p0, Ll/gl6$a;->a:Ll/gl6;

    .line 93
    .line 94
    iget-object v1, v1, Ll/gl6;->k:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 95
    .line 96
    const/high16 v2, 0x42560000    # 53.5f

    .line 97
    .line 98
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    neg-int v2, v2

    .line 103
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    if-eqz v3, :cond_3

    .line 108
    .line 109
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    goto :goto_3

    .line 114
    :cond_3
    const-string v0, ""

    .line 115
    .line 116
    :goto_3
    if-eqz p1, :cond_4

    .line 117
    .line 118
    sget p1, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->m:I

    .line 119
    .line 120
    :goto_4
    move v3, v2

    .line 121
    move-object v2, v0

    .line 122
    move-object v0, v1

    .line 123
    move v1, v3

    .line 124
    move v3, p1

    .line 125
    goto :goto_5

    .line 126
    :cond_4
    sget p1, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->n:I

    .line 127
    .line 128
    goto :goto_4

    .line 129
    :goto_5
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->c2(Landroid/content/Context;ILjava/lang/String;ILjava/util/ArrayList;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 134
    .line 135
    .line 136
    iget-object p0, p0, Ll/gl6$a;->a:Ll/gl6;

    .line 137
    .line 138
    iget-object p0, p0, Ll/gl6;->k:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 139
    .line 140
    sget p1, Ll/x7c0;->t:I

    .line 141
    .line 142
    sget v0, Ll/x7c0;->u:I

    .line 143
    .line 144
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 145
    .line 146
    .line 147
    return-void
.end method
