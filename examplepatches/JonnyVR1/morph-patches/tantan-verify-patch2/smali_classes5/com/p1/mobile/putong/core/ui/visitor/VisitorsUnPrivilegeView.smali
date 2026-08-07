.class public Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;

.field public b:Lv/VRelative;

.field public c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

.field public d:Lv/VLinear;

.field public e:Lv/VLinear;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Landroid/widget/TextView;

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->i:Ljava/lang/String;

    .line 7
    .line 8
    const-string p1, "p_my_visitor"

    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->j:Ljava/lang/String;

    .line 11
    .line 12
    const-string p1, "p_my_visitor,e_visitor_decrypt,click"

    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->k:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 17
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 18
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->i:Ljava/lang/String;

    .line 19
    const-string p1, "p_my_visitor"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->j:Ljava/lang/String;

    .line 20
    const-string p1, "p_my_visitor,e_visitor_decrypt,click"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->k:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 21
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 22
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->i:Ljava/lang/String;

    .line 23
    const-string p1, "p_my_visitor"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->j:Ljava/lang/String;

    .line 24
    const-string p1, "p_my_visitor,e_visitor_decrypt,click"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->k:Ljava/lang/String;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;Lcom/p1/mobile/putong/core/ui/visitor/a$a;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->n(Lcom/p1/mobile/putong/core/ui/visitor/a$a;ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/visitor/a$a;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/ui/visitor/a$a;->getData()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;Lcom/p1/mobile/putong/core/ui/visitor/a$a;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->m(Lcom/p1/mobile/putong/core/ui/visitor/a$a;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->o(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->p(Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;Landroid/view/View;)V

    return-void
.end method

.method public static h(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 3

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 7
    .line 8
    iget p0, p0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 9
    .line 10
    const/16 v0, 0x64

    .line 11
    .line 12
    if-gt p0, v0, :cond_1

    .line 13
    .line 14
    const-string p0, "\u8ddd\u79bb\u4f60100m"

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    const-string v0, "\u8ddd\u79bb\u4f60"

    .line 18
    .line 19
    const/16 v1, 0x3e8

    .line 20
    .line 21
    if-ge p0, v1, :cond_2

    .line 22
    .line 23
    new-instance v1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string p0, "m"

    .line 32
    .line 33
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_2
    const/16 v2, 0x2710

    .line 42
    .line 43
    if-ge p0, v2, :cond_3

    .line 44
    .line 45
    new-instance v2, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    div-int/2addr p0, v1

    .line 51
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string p0, "km"

    .line 55
    .line 56
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0

    .line 64
    :cond_3
    const-string p0, "\u8ddd\u79bb\u4f6010+km"

    .line 65
    .line 66
    return-object p0
.end method

.method public static i(Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->recommendationType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "visitMost"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "\u4e2a\u6708"

    .line 10
    .line 11
    const-string v2, "\u6708"

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/pzi0;->o()J

    .line 16
    .line 17
    .line 18
    move-result-wide v3

    .line 19
    iget-wide p0, p0, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->lastVisitTime:D

    .line 20
    .line 21
    invoke-static {v3, v4, p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/e;->e(JD)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->recommendationType:Ljava/lang/String;

    .line 31
    .line 32
    const-string v3, "sameCity"

    .line 33
    .line 34
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->h(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0

    .line 45
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->recommendationType:Ljava/lang/String;

    .line 46
    .line 47
    const-string v3, "latestActive"

    .line 48
    .line 49
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    const-string v3, ""

    .line 54
    .line 55
    if-eqz v0, :cond_3

    .line 56
    .line 57
    if-nez p1, :cond_2

    .line 58
    .line 59
    return-object v3

    .line 60
    :cond_2
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/visitor/e;->f(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0

    .line 69
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->recommendationType:Ljava/lang/String;

    .line 70
    .line 71
    const-string v4, "matched"

    .line 72
    .line 73
    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_4

    .line 78
    .line 79
    invoke-static {}, Ll/pzi0;->o()J

    .line 80
    .line 81
    .line 82
    move-result-wide v3

    .line 83
    iget-wide p0, p0, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->lastVisitTime:D

    .line 84
    .line 85
    invoke-static {v3, v4, p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/e;->e(JD)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    return-object p0

    .line 94
    :cond_4
    if-nez p1, :cond_5

    .line 95
    .line 96
    return-object v3

    .line 97
    :cond_5
    new-instance p0, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 100
    .line 101
    .line 102
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 103
    .line 104
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    const-string p1, "\u5c81"

    .line 108
    .line 109
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    return-object p0
.end method

.method public static j(Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;
    .locals 4

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->i(Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->visitCount:I

    .line 6
    .line 7
    if-lez p0, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/visitor/e;->c(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "\u8bbf\u95ee%s\u6b21"

    .line 18
    .line 19
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const-string p0, ""

    .line 25
    .line 26
    :goto_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    return-object p1

    .line 33
    :cond_1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_2

    .line 43
    .line 44
    const-string v1, " \u00b7 "

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 47
    .line 48
    .line 49
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    .line 54
    .line 55
    const-string v2, "#fe7e1d"

    .line 56
    .line 57
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    invoke-direct {v1, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 62
    .line 63
    .line 64
    const/4 v2, 0x0

    .line 65
    const/16 v3, 0x21

    .line 66
    .line 67
    invoke-virtual {v0, v1, v2, p0, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 71
    .line 72
    .line 73
    return-object v0
.end method

.method public static k(Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;)Ljava/lang/CharSequence;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->recommendationText:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->userId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Ll/enb;->I3(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    const-string p0, "\u3010\u5f02\u5e38\u7528\u6237\u3011"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->recommendationType:Ljava/lang/String;

    .line 19
    .line 20
    const-string v3, "visitMost"

    .line 21
    .line 22
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    const-string v3, "#fe7e1d"

    .line 27
    .line 28
    const-string v4, "%s"

    .line 29
    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->recommendationText:Ljava/lang/String;

    .line 33
    .line 34
    iget v1, p0, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->visitCount:I

    .line 35
    .line 36
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const-string v2, " %s "

    .line 45
    .line 46
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v4, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget p0, p0, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->visitCount:I

    .line 55
    .line 56
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    filled-new-array {p0}, [Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 73
    .line 74
    invoke-static {v0, p0, v1, v2}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0

    .line 79
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->recommendationType:Ljava/lang/String;

    .line 80
    .line 81
    const-string v5, "sameCity"

    .line 82
    .line 83
    invoke-static {v2, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-eqz v2, :cond_5

    .line 88
    .line 89
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 98
    .line 99
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 100
    .line 101
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 102
    .line 103
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    if-eqz v2, :cond_2

    .line 108
    .line 109
    iget-object v0, v1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 110
    .line 111
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 112
    .line 113
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_2
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 117
    .line 118
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 119
    .line 120
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 121
    .line 122
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    if-eqz v2, :cond_3

    .line 127
    .line 128
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 129
    .line 130
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 131
    .line 132
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_3
    iget-object v0, v1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 136
    .line 137
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 138
    .line 139
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 140
    .line 141
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-eqz v0, :cond_4

    .line 146
    .line 147
    iget-object v0, v1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 148
    .line 149
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 150
    .line 151
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 152
    .line 153
    goto :goto_0

    .line 154
    :cond_4
    const-string v0, "\u4e2d\u56fd"

    .line 155
    .line 156
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->recommendationText:Ljava/lang/String;

    .line 157
    .line 158
    invoke-virtual {p0, v4, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    filled-new-array {v0}, [Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 175
    .line 176
    invoke-static {p0, v0, v1, v2}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    return-object p0

    .line 181
    :cond_5
    return-object v0
.end method


# virtual methods
.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/mjm0;->a(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public final l(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "visitMost"

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string p0, "1"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, "sameCity"

    .line 13
    .line 14
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    const-string p0, "2"

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    const-string p0, "latestActive"

    .line 24
    .line 25
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    const-string p0, "3"

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_2
    const-string p0, "matched"

    .line 35
    .line 36
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_3

    .line 41
    .line 42
    const-string p0, "4"

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_3
    const-string p0, "5"

    .line 46
    .line 47
    return-object p0
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/core/ui/visitor/a$a;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->g()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p2, Ll/ljm0;

    .line 6
    .line 7
    invoke-direct {p2, p1}, Ll/ljm0;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/a$a;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v0, 0x3e8

    .line 11
    .line 12
    invoke-static {p0, p2, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/core/ui/visitor/a$a;ILandroid/view/View;)V
    .locals 7

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->g()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->g()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-interface {p3, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->isNewMainActContext(Landroid/app/Activity;)Z

    .line 22
    .line 23
    .line 24
    move-result p3

    .line 25
    if-eqz p3, :cond_0

    .line 26
    .line 27
    const-string p3, "p_navigation,visit_module"

    .line 28
    .line 29
    :goto_0
    move-object v2, p3

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    const-string p3, "p_navigation_visit,button_pull"

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :goto_1
    new-instance v3, Ll/kjm0;

    .line 35
    .line 36
    invoke-direct {v3, p0, p1}, Ll/kjm0;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;Lcom/p1/mobile/putong/core/ui/visitor/a$a;)V

    .line 37
    .line 38
    .line 39
    const/4 v5, 0x0

    .line 40
    sget-object v6, Lcom/p1/mobile/putong/core/data/Privilege;->oDiamondVisitor:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 41
    .line 42
    const/4 v4, 0x0

    .line 43
    invoke-interface/range {v0 .. v6}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Og(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->j:Ljava/lang/String;

    .line 47
    .line 48
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->i:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result p3

    .line 54
    if-eqz p3, :cond_1

    .line 55
    .line 56
    const-string p3, "title"

    .line 57
    .line 58
    goto :goto_2

    .line 59
    :cond_1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->i:Ljava/lang/String;

    .line 60
    .line 61
    :goto_2
    const-string v0, "visitor_click_type"

    .line 62
    .line 63
    invoke-static {v0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    add-int/lit8 p2, p2, 0x1

    .line 68
    .line 69
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    const-string v0, "user_index"

    .line 74
    .line 75
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->h:Landroid/widget/TextView;

    .line 80
    .line 81
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    const-string v1, "visitor_button_text"

    .line 86
    .line 87
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->f:Lv/VText;

    .line 92
    .line 93
    invoke-virtual {v1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    const-string v2, "visitor_user_title"

    .line 98
    .line 99
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->g:Lv/VText;

    .line 104
    .line 105
    invoke-virtual {v2}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    const-string v3, "visitor_user_sub_title"

    .line 110
    .line 111
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    filled-new-array {p3, p2, v0, v1, v2}, [Ll/pf60;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    const-string p3, "e_visitor_click_infos"

    .line 120
    .line 121
    invoke-static {p3, p1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 122
    .line 123
    .line 124
    const-string p1, ""

    .line 125
    .line 126
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->i:Ljava/lang/String;

    .line 127
    .line 128
    return-void
.end method

.method public final synthetic o(Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p1, "avatar"

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->i:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->a:Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->f(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic p(Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->j:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->recommendationType:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->l(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "visitor_decrypt_type"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    filled-new-array {p1}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string v0, "e_visitor_decrypt"

    .line 20
    .line 21
    invoke-static {v0, p2, p1}, Ll/sfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    const-string p1, "button"

    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->i:Ljava/lang/String;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->a:Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public q(Ll/cfm0;ILcom/p1/mobile/putong/core/ui/visitor/a$a;)V
    .locals 6

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p1, Ll/cfm0;->d:Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->n2:Ll/enb;

    .line 10
    .line 11
    iget-object v2, v0, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->userId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Ll/enb;->I3(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const/4 v2, 0x0

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->f:Lv/VText;

    .line 21
    .line 22
    const-string p2, "\u3010\u5f02\u5e38\u7528\u6237\u3011"

    .line 23
    .line 24
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 28
    .line 29
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 30
    .line 31
    invoke-virtual {p2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->get_pic()Lv/VDraweeView;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-virtual {p1, p2}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 39
    .line 40
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->G0(Z)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->g:Lv/VText;

    .line 44
    .line 45
    const-string p1, ""

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    iget-boolean p1, p1, Ll/cfm0;->e:Z

    .line 52
    .line 53
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 54
    .line 55
    if-eqz p1, :cond_1

    .line 56
    .line 57
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    const/4 v4, 0x2

    .line 70
    const/16 v5, 0x14

    .line 71
    .line 72
    invoke-virtual {v3, p1, v4, v5}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->i0(Ljava/lang/String;II)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_1
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->t0(Lcom/p1/mobile/putong/data/User;)V

    .line 77
    .line 78
    .line 79
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->f:Lv/VText;

    .line 80
    .line 81
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->k(Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;)Ljava/lang/CharSequence;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->f:Lv/VText;

    .line 89
    .line 90
    const/4 v3, 0x3

    .line 91
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    invoke-virtual {p1, v4, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->g:Lv/VText;

    .line 99
    .line 100
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->j(Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->j:Ljava/lang/String;

    .line 108
    .line 109
    iget-object v1, v0, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->recommendationType:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->l(Ljava/lang/String;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    const-string v4, "visitor_decrypt_type"

    .line 116
    .line 117
    invoke-static {v4, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    filled-new-array {v1}, [Ll/pf60;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    const-string v4, "e_visitor_decrypt"

    .line 126
    .line 127
    invoke-static {v4, p1, v1}, Ll/sfj0;->l(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 128
    .line 129
    .line 130
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->h:Landroid/widget/TextView;

    .line 131
    .line 132
    iget-object v1, v0, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->buttonText:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 135
    .line 136
    .line 137
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->h:Landroid/widget/TextView;

    .line 138
    .line 139
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {p1, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 144
    .line 145
    .line 146
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->a:Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;

    .line 147
    .line 148
    new-instance v1, Ll/hjm0;

    .line 149
    .line 150
    invoke-direct {v1, p0, p3, p2}, Ll/hjm0;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;Lcom/p1/mobile/putong/core/ui/visitor/a$a;I)V

    .line 151
    .line 152
    .line 153
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 154
    .line 155
    .line 156
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 157
    .line 158
    new-instance p2, Ll/ijm0;

    .line 159
    .line 160
    invoke-direct {p2, p0}, Ll/ijm0;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;)V

    .line 161
    .line 162
    .line 163
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 164
    .line 165
    .line 166
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->h:Landroid/widget/TextView;

    .line 167
    .line 168
    new-instance p2, Ll/jjm0;

    .line 169
    .line 170
    invoke-direct {p2, p0, v0}, Ll/jjm0;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;)V

    .line 171
    .line 172
    .line 173
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 174
    .line 175
    .line 176
    return-void
.end method

.method public r(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->j:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->k:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method
