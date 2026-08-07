.class public Lcom/p1/mobile/putong/newui/view/MessageInputEditView;
.super Lv/VEditText;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;
    }
.end annotation


# instance fields
.field public d:Ljava/lang/Runnable;

.field public e:I

.field public f:Z

.field public g:Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;",
            ">;"
        }
    .end annotation
.end field

.field public i:Z

.field public j:Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;

.field public k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public m:Ljava/lang/StringBuilder;

.field public n:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 39
    invoke-direct {p0, p1}, Lv/VEditText;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 40
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->f:Z

    const/4 p1, 0x0

    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->j:Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;

    .line 42
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->k:Ljava/util/ArrayList;

    .line 43
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->l:Ljava/util/HashMap;

    .line 44
    const-string p1, " "

    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->n:Ljava/lang/String;

    .line 45
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->l()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 32
    invoke-direct {p0, p1, p2}, Lv/VEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 33
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->f:Z

    const/4 p1, 0x0

    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->j:Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;

    .line 35
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->k:Ljava/util/ArrayList;

    .line 36
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->l:Ljava/util/HashMap;

    .line 37
    const-string p1, " "

    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->n:Ljava/lang/String;

    .line 38
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->l()V

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
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->f:Z

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->j:Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;

    .line 9
    .line 10
    new-instance p1, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->k:Ljava/util/ArrayList;

    .line 16
    .line 17
    new-instance p1, Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->l:Ljava/util/HashMap;

    .line 23
    .line 24
    const-string p1, " "

    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->n:Ljava/lang/String;

    .line 27
    .line 28
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->l()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private l()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->n:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "\u8f93\u5165\u65b0\u6d88\u606f"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->m:Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-super {p0, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->f:Z

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
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->l:Ljava/util/HashMap;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->l:Ljava/util/HashMap;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->l:Ljava/util/HashMap;

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
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->j(II)Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;

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
    iput-boolean v3, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->i:Z

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
    iget-boolean v0, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->i:Z

    .line 93
    .line 94
    if-nez v0, :cond_3

    .line 95
    .line 96
    iget v0, v2, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;->a:I

    .line 97
    .line 98
    if-eq v1, v0, :cond_3

    .line 99
    .line 100
    const/4 p1, 0x1

    .line 101
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->i:Z

    .line 102
    .line 103
    iput-object v2, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->g:Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;

    .line 104
    .line 105
    iget v1, v2, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;->b:I

    .line 106
    .line 107
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->setSelection(II)V

    .line 108
    .line 109
    .line 110
    return p1

    .line 111
    :cond_3
    iput-boolean v3, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->i:Z

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
    iput-boolean v3, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->i:Z

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
    iget-boolean v0, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->i:Z

    .line 128
    .line 129
    if-nez v0, :cond_6

    .line 130
    .line 131
    iget v0, v2, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;->a:I

    .line 132
    .line 133
    if-eq v1, v0, :cond_6

    .line 134
    .line 135
    iput-boolean v3, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->i:Z

    .line 136
    .line 137
    iput-object v2, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->g:Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;

    .line 138
    .line 139
    iget v1, v2, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;->b:I

    .line 140
    .line 141
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->setSelection(II)V

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
    iput-boolean v3, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->i:Z

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
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->h:Ljava/util/List;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->h:Ljava/util/List;

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
    check-cast v1, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;->c:Ljava/lang/String;

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

.method public final j(II)Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->h:Ljava/util/List;

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
    check-cast v1, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;

    .line 23
    .line 24
    invoke-virtual {v1, p1, p2}, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;->a(II)Z

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

.method public final k(II)Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->h:Ljava/util/List;

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
    check-cast v1, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;

    .line 23
    .line 24
    invoke-virtual {v1, p1, p2}, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;->d(II)Z

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
    iget-boolean v0, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->f:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->g:Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;->c(II)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_5

    .line 18
    .line 19
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->j(II)Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    iget v0, v0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;->b:I

    .line 26
    .line 27
    if-ne v0, p2, :cond_2

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput-boolean v0, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->i:Z

    .line 31
    .line 32
    :cond_2
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->k(II)Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;

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
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;->b(I)I

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
    iget v1, v0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;->b:I

    .line 49
    .line 50
    if-ge p2, v1, :cond_4

    .line 51
    .line 52
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->setSelection(II)V

    .line 53
    .line 54
    .line 55
    :cond_4
    iget v0, v0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$b;->a:I

    .line 56
    .line 57
    if-le p1, v0, :cond_5

    .line 58
    .line 59
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->setSelection(II)V

    .line 60
    .line 61
    .line 62
    :cond_5
    :goto_0
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lv/VEditText;->onTextChanged(Ljava/lang/CharSequence;III)V

    .line 2
    .line 3
    .line 4
    return-void
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
    iput p1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->e:I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->n:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->n:Ljava/lang/String;

    .line 29
    .line 30
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->m:Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->m:Ljava/lang/StringBuilder;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->d:Ljava/lang/Runnable;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    new-instance p1, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$a;

    .line 9
    .line 10
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/newui/view/MessageInputEditView$a;-><init>(Lcom/p1/mobile/putong/newui/view/MessageInputEditView;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->d:Ljava/lang/Runnable;

    .line 14
    .line 15
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->d:Ljava/lang/Runnable;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method
