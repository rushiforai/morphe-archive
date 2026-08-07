.class public Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;
.super Lv/VEditText;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;,
        Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$c;,
        Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$b;
    }
.end annotation


# instance fields
.field public d:Ljava/util/regex/Pattern;

.field public e:Ljava/lang/Runnable;

.field public f:I

.field public g:Z

.field public h:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;",
            ">;"
        }
    .end annotation
.end field

.field public j:Z

.field public k:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

.field public l:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;",
            ">;"
        }
    .end annotation
.end field

.field public m:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ljava/lang/StringBuilder;

.field public o:Ljava/lang/String;

.field public p:Landroid/text/SpannableString;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 39
    invoke-direct {p0, p1}, Lv/VEditText;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 40
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->g:Z

    const/4 p1, 0x0

    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->k:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    .line 42
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->l:Ljava/util/ArrayList;

    .line 43
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->m:Ljava/util/HashMap;

    .line 44
    const-string p1, " "

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->o:Ljava/lang/String;

    .line 45
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->u()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 32
    invoke-direct {p0, p1, p2}, Lv/VEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 33
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->g:Z

    const/4 p1, 0x0

    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->k:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    .line 35
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->l:Ljava/util/ArrayList;

    .line 36
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->m:Ljava/util/HashMap;

    .line 37
    const-string p1, " "

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->o:Ljava/lang/String;

    .line 38
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->u()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->g:Z

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->k:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    .line 9
    .line 10
    new-instance p1, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->l:Ljava/util/ArrayList;

    .line 16
    .line 17
    new-instance p1, Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->m:Ljava/util/HashMap;

    .line 23
    .line 24
    const-string p1, " "

    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->o:Ljava/lang/String;

    .line 27
    .line 28
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->u()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->j:Z

    return p0
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->g:Z

    return p0
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->j:Z

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->h:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;II)Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->q(II)Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->v()Z

    move-result p0

    return p0
.end method

.method private t()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->i:Ljava/util/List;

    .line 8
    .line 9
    const-string v0, "@[\\u4e00-\\u9fa5\\w\\-]+"

    .line 10
    .line 11
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->d:Ljava/util/regex/Pattern;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget v1, Ll/z8c0;->t:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->f:I

    .line 28
    .line 29
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$c;

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$c;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;Ll/eez;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private u()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->o:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->N0:I

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->n:Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-super {p0, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->g:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/view/View;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->m:Ljava/util/HashMap;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->m:Ljava/util/HashMap;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Ljava/lang/Boolean;

    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->m:Ljava/util/HashMap;

    .line 41
    .line 42
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    invoke-super {p0, p1}, Landroid/view/View;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    return p0

    .line 50
    :cond_1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_7

    .line 55
    .line 56
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    const/16 v1, 0x43

    .line 61
    .line 62
    if-ne v0, v1, :cond_7

    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/view/View;->hasFocus()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-virtual {p0}, Landroid/widget/TextView;->getSelectionStart()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    invoke-virtual {p0}, Landroid/widget/TextView;->getSelectionEnd()I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->q(II)Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    const/4 v3, 0x0

    .line 81
    if-eqz v0, :cond_4

    .line 82
    .line 83
    if-nez v2, :cond_2

    .line 84
    .line 85
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->j:Z

    .line 86
    .line 87
    invoke-super {p0, p1}, Landroid/view/View;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    return p0

    .line 92
    :cond_2
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->j:Z

    .line 93
    .line 94
    if-nez v0, :cond_3

    .line 95
    .line 96
    iget v0, v2, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->a:I

    .line 97
    .line 98
    if-eq v1, v0, :cond_3

    .line 99
    .line 100
    const/4 p1, 0x1

    .line 101
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->j:Z

    .line 102
    .line 103
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->h:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    .line 104
    .line 105
    iget v1, v2, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->b:I

    .line 106
    .line 107
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setSelection(II)V

    .line 108
    .line 109
    .line 110
    return p1

    .line 111
    :cond_3
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->j:Z

    .line 112
    .line 113
    invoke-super {p0, p1}, Landroid/view/View;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    return p0

    .line 118
    :cond_4
    if-nez v2, :cond_5

    .line 119
    .line 120
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->j:Z

    .line 121
    .line 122
    invoke-super {p0, p1}, Landroid/view/View;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 123
    .line 124
    .line 125
    move-result p0

    .line 126
    return p0

    .line 127
    :cond_5
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->j:Z

    .line 128
    .line 129
    if-nez v0, :cond_6

    .line 130
    .line 131
    iget v0, v2, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->a:I

    .line 132
    .line 133
    if-eq v1, v0, :cond_6

    .line 134
    .line 135
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->j:Z

    .line 136
    .line 137
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->h:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    .line 138
    .line 139
    iget v1, v2, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->b:I

    .line 140
    .line 141
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setSelection(II)V

    .line 142
    .line 143
    .line 144
    invoke-super {p0, p1}, Landroid/view/View;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 145
    .line 146
    .line 147
    move-result p0

    .line 148
    return p0

    .line 149
    :cond_6
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->j:Z

    .line 150
    .line 151
    invoke-super {p0, p1}, Landroid/view/View;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 152
    .line 153
    .line 154
    move-result p0

    .line 155
    return p0

    .line 156
    :cond_7
    invoke-super {p0, p1}, Landroid/view/View;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 157
    .line 158
    .line 159
    move-result p0

    .line 160
    return p0
.end method

.method public getAtIdList()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->i:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->i:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->c:Ljava/lang/String;

    .line 33
    .line 34
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    return-object v0
.end method

.method public onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$b;

    .line 2
    .line 3
    invoke-super {p0, p1}, Landroid/view/View;->onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-direct {v0, p0, p1, v1, p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$b;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;Landroid/view/inputmethod/InputConnection;ZLcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onSelectionChanged(II)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->onSelectionChanged(II)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->g:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->h:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->c(II)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_5

    .line 18
    .line 19
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->q(II)Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->b:I

    .line 26
    .line 27
    if-ne v0, p2, :cond_2

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->j:Z

    .line 31
    .line 32
    :cond_2
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->r(II)Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-eqz v0, :cond_5

    .line 37
    .line 38
    if-ne p1, p2, :cond_3

    .line 39
    .line 40
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->b(I)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_3
    iget v1, v0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->b:I

    .line 49
    .line 50
    if-ge p2, v1, :cond_4

    .line 51
    .line 52
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setSelection(II)V

    .line 53
    .line 54
    .line 55
    :cond_4
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->a:I

    .line 56
    .line 57
    if-le p1, v0, :cond_5

    .line 58
    .line 59
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setSelection(II)V

    .line 60
    .line 61
    .line 62
    :cond_5
    :goto_0
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lv/VEditText;->onTextChanged(Ljava/lang/CharSequence;III)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->g:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {p0, p1, p2, p3, p4}, Ll/bek;->a(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;Ljava/lang/CharSequence;III)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->x(III)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public p(Ljava/lang/String;II)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;II)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->e(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->k:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    .line 11
    .line 12
    return-void
.end method

.method public final q(II)Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->i:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return-object v0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_2

    .line 16
    .line 17
    return-object v0

    .line 18
    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    .line 23
    .line 24
    invoke-virtual {v1, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->a(II)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    return-object v1
.end method

.method public final r(II)Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->i:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return-object v0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_2

    .line 16
    .line 17
    return-object v0

    .line 18
    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    .line 23
    .line 24
    invoke-virtual {v1, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->d(II)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    return-object v1
.end method

.method public final s(I)Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->l:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return-object v1

    .line 11
    :cond_0
    if-ltz p1, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->l:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-lt p1, v0, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->l:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_2
    :goto_0
    return-object v1
.end method

.method public setFocusable(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/EditText;->setFocusable(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setFocusable(Z)V
    .locals 0

    .line 5
    invoke-super {p0, p1}, Landroid/view/View;->setFocusable(Z)V

    return-void
.end method

.method public setFocusableInTouchMode(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setMentionTextColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->f:I

    .line 2
    .line 3
    return-void
.end method

.method public setSelection(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->setSelection(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setSpaceHint(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->o:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-super {p0, p1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->o:Ljava/lang/String;

    .line 29
    .line 30
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->n:Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->n:Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-super {p0, p1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->e:Ljava/lang/Runnable;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$a;

    .line 9
    .line 10
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->e:Ljava/lang/Runnable;

    .line 14
    .line 15
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->e:Ljava/lang/Runnable;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final v()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public w()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->g:Z

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->t()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final x(III)V
    .locals 6

    .line 1
    const/4 p3, 0x0

    .line 2
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->j:Z

    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->l:Ljava/util/ArrayList;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->i:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->i:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    .line 36
    .line 37
    add-int v2, p1, p2

    .line 38
    .line 39
    invoke-virtual {v1, p1, v2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->a(II)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    if-nez p2, :cond_0

    .line 46
    .line 47
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->l:Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->i:Ljava/util/List;

    .line 54
    .line 55
    if-eqz p1, :cond_3

    .line 56
    .line 57
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 58
    .line 59
    .line 60
    :cond_3
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    if-eqz p1, :cond_7

    .line 65
    .line 66
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    if-nez p2, :cond_7

    .line 75
    .line 76
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    const-class v0, Landroid/text/style/ForegroundColorSpan;

    .line 81
    .line 82
    invoke-interface {p1, p3, p2, v0}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    check-cast p2, [Landroid/text/style/ForegroundColorSpan;

    .line 87
    .line 88
    array-length v0, p2

    .line 89
    new-instance v1, Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 92
    .line 93
    .line 94
    :goto_1
    if-ge p3, v0, :cond_5

    .line 95
    .line 96
    aget-object v2, p2, p3

    .line 97
    .line 98
    new-instance v3, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    .line 99
    .line 100
    invoke-interface {p1, v2}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    .line 101
    .line 102
    .line 103
    move-result v4

    .line 104
    invoke-interface {p1, v2}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    .line 105
    .line 106
    .line 107
    move-result v5

    .line 108
    invoke-direct {v3, p0, v4, v5}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;II)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->s(I)Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v5

    .line 119
    if-eqz v5, :cond_4

    .line 120
    .line 121
    iget-object v4, v4, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->c:Ljava/lang/String;

    .line 122
    .line 123
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->e(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    :cond_4
    invoke-interface {p1, v2}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    .line 130
    .line 131
    .line 132
    add-int/lit8 p3, p3, 0x1

    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_5
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->k:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    .line 136
    .line 137
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result p2

    .line 141
    if-eqz p2, :cond_6

    .line 142
    .line 143
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->k:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    .line 144
    .line 145
    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    const/4 p2, 0x0

    .line 149
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->k:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    .line 150
    .line 151
    :cond_6
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 152
    .line 153
    .line 154
    move-result-object p2

    .line 155
    :goto_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 156
    .line 157
    .line 158
    move-result p3

    .line 159
    if-eqz p3, :cond_7

    .line 160
    .line 161
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object p3

    .line 165
    check-cast p3, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    .line 166
    .line 167
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    .line 168
    .line 169
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->f:I

    .line 170
    .line 171
    invoke-direct {v0, v1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 172
    .line 173
    .line 174
    iget v1, p3, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->a:I

    .line 175
    .line 176
    iget v2, p3, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->b:I

    .line 177
    .line 178
    const/16 v3, 0x21

    .line 179
    .line 180
    invoke-interface {p1, v0, v1, v2, v3}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 181
    .line 182
    .line 183
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->i:Ljava/util/List;

    .line 184
    .line 185
    invoke-interface {v0, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    goto :goto_2

    .line 189
    :cond_7
    return-void
.end method

.method public y(Ljava/lang/String;I)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->p:Landroid/text/SpannableString;

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->n:Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-super {p0, p1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    new-instance v0, Landroid/text/SpannableString;

    .line 17
    .line 18
    invoke-direct {v0, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->p:Landroid/text/SpannableString;

    .line 22
    .line 23
    new-instance v1, Landroid/text/style/AbsoluteSizeSpan;

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    invoke-direct {v1, p2, v2}, Landroid/text/style/AbsoluteSizeSpan;-><init>(IZ)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    const/16 p2, 0x21

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    invoke-virtual {v0, v1, v2, p1, p2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->p:Landroid/text/SpannableString;

    .line 40
    .line 41
    invoke-super {p0, p1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public z(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->p:Landroid/text/SpannableString;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->p:Landroid/text/SpannableString;

    .line 12
    .line 13
    invoke-super {p0, p1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void

    .line 17
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->n:Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-super {p0, p1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
