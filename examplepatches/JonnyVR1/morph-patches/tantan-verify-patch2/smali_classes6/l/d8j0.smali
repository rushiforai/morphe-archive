.class public Ll/d8j0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/d8j0$a;
    }
.end annotation


# instance fields
.field public a:Ll/jbj0;

.field public b:Ll/d8j0$a;

.field public c:Landroid/widget/EditText;

.field public d:Z

.field public e:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

.field public f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;Ll/jbj0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/d8j0;->f:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Ll/d8j0;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 9
    .line 10
    iput-object p2, p0, Ll/d8j0;->a:Ll/jbj0;

    .line 11
    .line 12
    new-instance p1, Ll/b8j0;

    .line 13
    .line 14
    invoke-direct {p1, p0}, Ll/b8j0;-><init>(Ll/d8j0;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p2, p1}, Ll/jbj0;->y(Ll/x20;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/d8j0;->a:Ll/jbj0;

    .line 21
    .line 22
    new-instance p2, Ll/c8j0;

    .line 23
    .line 24
    invoke-direct {p2, p0}, Ll/c8j0;-><init>(Ll/d8j0;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p2}, Ll/jbj0;->z(Ll/x20;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic a(Ll/d8j0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d8j0;->j()V

    return-void
.end method

.method public static synthetic b(Ll/d8j0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d8j0;->i()V

    return-void
.end method


# virtual methods
.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/d8j0;->b:Ll/d8j0$a;

    .line 3
    .line 4
    return-void
.end method

.method public final d()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/d8j0;->c:Landroid/widget/EditText;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/d8j0;->c:Landroid/widget/EditText;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Ll/d8j0;->c:Landroid/widget/EditText;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/widget/TextView;->getSelectionStart()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-lez p0, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    add-int/lit8 v2, p0, -0x1

    .line 28
    .line 29
    invoke-virtual {v1, v2, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v3, "#"

    .line 34
    .line 35
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    invoke-interface {v0, v2, p0}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public e(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d8j0;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->F:Ll/yaj0;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const-string v1, ""

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iput-object v1, p0, Ll/d8j0;->f:Ljava/lang/String;

    .line 19
    .line 20
    iget-object p0, p0, Ll/d8j0;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->F:Ll/yaj0;

    .line 23
    .line 24
    invoke-virtual {p0, v1}, Ll/yaj0;->b(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    const-string v0, "[^\\x{4e00}-\\x{9fa5}A-Za-z0-9]+"

    .line 29
    .line 30
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p1, v1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object v0, p0, Ll/d8j0;->f:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    iput-object p1, p0, Ll/d8j0;->f:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    iget-object p0, p0, Ll/d8j0;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 62
    .line 63
    const/16 v1, 0x1e

    .line 64
    .line 65
    if-lt v0, v1, :cond_3

    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->F:Ll/yaj0;

    .line 68
    .line 69
    const/4 v0, 0x0

    .line 70
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p0, p1}, Ll/yaj0;->b(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->F:Ll/yaj0;

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Ll/yaj0;->b(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_4
    :goto_0
    return-void
.end method

.method public f(Landroid/text/Editable;IZ)V
    .locals 5

    .line 1
    const-string v0, "#[\\x{4e00}-\\x{9fa5}A-Za-z0-9]+"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const-string v2, ""

    .line 20
    .line 21
    if-eqz v1, :cond_4

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0, p3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    add-int/2addr v1, v0

    .line 40
    if-le p2, v0, :cond_3

    .line 41
    .line 42
    if-gt p2, v1, :cond_3

    .line 43
    .line 44
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p3

    .line 48
    invoke-virtual {p3, v0, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    const/16 v3, 0x1f

    .line 57
    .line 58
    const/4 v4, 0x1

    .line 59
    if-le v1, v3, :cond_0

    .line 60
    .line 61
    const-string v1, "\u8bdd\u9898\u5b57\u6570\u8d85\u51fa\u9650\u5236"

    .line 62
    .line 63
    invoke-static {v1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iput-boolean v4, p0, Ll/d8j0;->d:Z

    .line 67
    .line 68
    const/4 p0, 0x0

    .line 69
    invoke-virtual {p3, p0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-interface {p1, v0, p2, p0}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_0
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-le p1, v4, :cond_1

    .line 82
    .line 83
    new-instance p1, Ll/d8j0$a;

    .line 84
    .line 85
    invoke-virtual {p3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-direct {p1, p3, v1, v0, p2}, Ll/d8j0$a;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    .line 90
    .line 91
    .line 92
    iput-object p1, p0, Ll/d8j0;->b:Ll/d8j0$a;

    .line 93
    .line 94
    iget-object v2, p1, Ll/d8j0$a;->b:Ljava/lang/String;

    .line 95
    .line 96
    :cond_1
    iget-object p1, p0, Ll/d8j0;->a:Ll/jbj0;

    .line 97
    .line 98
    invoke-virtual {p1}, Ll/jbj0;->o()Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-nez p1, :cond_2

    .line 103
    .line 104
    iget-object p1, p0, Ll/d8j0;->a:Ll/jbj0;

    .line 105
    .line 106
    invoke-virtual {p1}, Ll/jbj0;->F()V

    .line 107
    .line 108
    .line 109
    :cond_2
    iget-object p0, p0, Ll/d8j0;->a:Ll/jbj0;

    .line 110
    .line 111
    invoke-virtual {p0, v2}, Ll/jbj0;->x(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_3
    invoke-virtual {p0, p1, p3, v0}, Ll/d8j0;->g(Landroid/text/Editable;Ljava/lang/String;I)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_4
    const/4 p1, 0x0

    .line 120
    if-eqz p3, :cond_5

    .line 121
    .line 122
    iput-object p1, p0, Ll/d8j0;->b:Ll/d8j0$a;

    .line 123
    .line 124
    iget-object p1, p0, Ll/d8j0;->a:Ll/jbj0;

    .line 125
    .line 126
    invoke-virtual {p1}, Ll/jbj0;->F()V

    .line 127
    .line 128
    .line 129
    iget-object p0, p0, Ll/d8j0;->a:Ll/jbj0;

    .line 130
    .line 131
    invoke-virtual {p0, v2}, Ll/jbj0;->x(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :cond_5
    iput-object p1, p0, Ll/d8j0;->b:Ll/d8j0$a;

    .line 136
    .line 137
    invoke-virtual {p0}, Ll/d8j0;->h()V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public final g(Landroid/text/Editable;Ljava/lang/String;I)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    iput-object p2, p0, Ll/d8j0;->b:Ll/d8j0$a;

    .line 3
    .line 4
    add-int/lit8 p2, p3, 0x1

    .line 5
    .line 6
    invoke-interface {p1, p3, p2}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/d8j0;->h()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final h()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d8j0;->a:Ll/jbj0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/jbj0;->o()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/d8j0;->a:Ll/jbj0;

    .line 10
    .line 11
    const-string v1, ""

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/jbj0;->x(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/d8j0;->a:Ll/jbj0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/jbj0;->l()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final synthetic i()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/d8j0;->b:Ll/d8j0$a;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Ll/d8j0;->c:Landroid/widget/EditText;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v2, p0, Ll/d8j0;->b:Ll/d8j0$a;

    .line 19
    .line 20
    iget-object v2, v2, Ll/d8j0$a;->a:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    iget-object p0, p0, Ll/d8j0;->b:Ll/d8j0$a;

    .line 27
    .line 28
    iget-object p0, p0, Ll/d8j0$a;->a:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    add-int/2addr p0, v1

    .line 35
    if-ltz v1, :cond_1

    .line 36
    .line 37
    invoke-interface {v0, v1, p0}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void

    .line 41
    :cond_2
    :goto_0
    invoke-virtual {p0}, Ll/d8j0;->d()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic j()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d8j0;->b:Ll/d8j0$a;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Ll/d8j0;->c:Landroid/widget/EditText;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object p0, p0, Ll/d8j0;->b:Ll/d8j0$a;

    .line 19
    .line 20
    iget-object p0, p0, Ll/d8j0$a;->a:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v1, p0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    add-int/lit8 v1, p0, 0x1

    .line 27
    .line 28
    if-ltz p0, :cond_1

    .line 29
    .line 30
    invoke-interface {v0, p0, v1}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :cond_2
    :goto_0
    invoke-virtual {p0}, Ll/d8j0;->d()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public k(Landroid/widget/EditText;Ljava/lang/CharSequence;III)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/d8j0;->c:Landroid/widget/EditText;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ll/d8j0;->e(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 7
    .line 8
    .line 9
    move-result-object p4

    .line 10
    invoke-virtual {p1}, Landroid/widget/TextView;->getSelectionStart()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const-string v0, "#"

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    if-lez p5, :cond_1

    .line 18
    .line 19
    add-int/2addr p5, p3

    .line 20
    invoke-interface {p2, p3, p5}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    if-eqz p2, :cond_3

    .line 33
    .line 34
    iget-boolean p3, p0, Ll/d8j0;->d:Z

    .line 35
    .line 36
    if-nez p3, :cond_3

    .line 37
    .line 38
    iget-object p3, p0, Ll/d8j0;->b:Ll/d8j0$a;

    .line 39
    .line 40
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p3

    .line 44
    if-eqz p3, :cond_3

    .line 45
    .line 46
    iput-boolean v1, p0, Ll/d8j0;->d:Z

    .line 47
    .line 48
    iget-object p3, p0, Ll/d8j0;->b:Ll/d8j0$a;

    .line 49
    .line 50
    iget-object p3, p3, Ll/d8j0$a;->a:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p5

    .line 56
    invoke-virtual {p5, p3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result p5

    .line 60
    if-ltz p5, :cond_0

    .line 61
    .line 62
    invoke-virtual {p0, p4, p3, p5}, Ll/d8j0;->g(Landroid/text/Editable;Ljava/lang/String;I)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    const/4 p3, 0x0

    .line 67
    iput-object p3, p0, Ll/d8j0;->b:Ll/d8j0$a;

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    add-int/lit8 p5, p3, -0x1

    .line 71
    .line 72
    if-ltz p5, :cond_2

    .line 73
    .line 74
    invoke-interface {p2, p5, p3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result p2

    .line 86
    if-eqz p2, :cond_3

    .line 87
    .line 88
    iget-object p3, p0, Ll/d8j0;->b:Ll/d8j0$a;

    .line 89
    .line 90
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result p3

    .line 94
    if-eqz p3, :cond_3

    .line 95
    .line 96
    iget-object p3, p0, Ll/d8j0;->b:Ll/d8j0$a;

    .line 97
    .line 98
    iget-object p3, p3, Ll/d8j0$a;->a:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {p4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p5

    .line 104
    invoke-virtual {p5, p3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 105
    .line 106
    .line 107
    move-result p5

    .line 108
    if-ltz p5, :cond_3

    .line 109
    .line 110
    invoke-virtual {p0, p4, p3, p5}, Ll/d8j0;->g(Landroid/text/Editable;Ljava/lang/String;I)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_2
    move p2, v1

    .line 115
    :cond_3
    :goto_0
    iput-boolean v1, p0, Ll/d8j0;->d:Z

    .line 116
    .line 117
    invoke-virtual {p0, p4, p1, p2}, Ll/d8j0;->f(Landroid/text/Editable;IZ)V

    .line 118
    .line 119
    .line 120
    return-void
.end method
