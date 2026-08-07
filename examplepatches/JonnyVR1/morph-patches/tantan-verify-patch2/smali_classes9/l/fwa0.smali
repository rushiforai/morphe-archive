.class public Ll/fwa0;
.super Ll/ep90;
.source "SourceFile"


# instance fields
.field public u:Lv/VLinear;

.field public v:Lv/VText;

.field public w:Lv/VText_Tags;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ep90;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final R()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->me()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 18
    .line 19
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/4 v2, 0x0

    .line 24
    const-string v3, "matched"

    .line 25
    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 31
    .line 32
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_1

    .line 37
    .line 38
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 39
    .line 40
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 49
    .line 50
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_2

    .line 55
    .line 56
    :cond_1
    return v2

    .line 57
    :cond_2
    if-eqz v0, :cond_3

    .line 58
    .line 59
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 60
    .line 61
    const-string v3, "facebook"

    .line 62
    .line 63
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-nez v1, :cond_4

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->hideMutualContacts()Ljava/lang/Boolean;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_4

    .line 80
    .line 81
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->lookups:Ljava/util/List;

    .line 86
    .line 87
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    if-nez p0, :cond_4

    .line 92
    .line 93
    const/4 p0, 0x1

    .line 94
    return p0

    .line 95
    :cond_4
    return v2
.end method

.method public j(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/on2;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/adc0;->I1:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VLinear;

    .line 11
    .line 12
    iput-object v0, p0, Ll/fwa0;->u:Lv/VLinear;

    .line 13
    .line 14
    sget v0, Ll/adc0;->H8:I

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VText;

    .line 21
    .line 22
    iput-object v0, p0, Ll/fwa0;->v:Lv/VText;

    .line 23
    .line 24
    sget v0, Ll/adc0;->G8:I

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lv/VText_Tags;

    .line 31
    .line 32
    iput-object p1, p0, Ll/fwa0;->w:Lv/VText_Tags;

    .line 33
    .line 34
    iget-object p1, p0, Ll/fwa0;->u:Lv/VLinear;

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/fwa0;->v:Lv/VText;

    .line 41
    .line 42
    sget-object p1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public l()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fwa0;->R()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/t3m;->H2()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget v0, Ll/kec0;->Ba:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public t()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->lookups:Ljava/util/List;

    .line 14
    .line 15
    new-instance v1, Ljava/lang/StringBuffer;

    .line 16
    .line 17
    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    const/4 v3, 0x3

    .line 25
    if-gt v2, v3, :cond_1

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-ge v2, v3, :cond_3

    .line 33
    .line 34
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    check-cast v3, Lcom/p1/mobile/putong/data/Contact;

    .line 39
    .line 40
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Contact;->name:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 43
    .line 44
    .line 45
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    add-int/lit8 v3, v3, -0x1

    .line 50
    .line 51
    if-ge v2, v3, :cond_0

    .line 52
    .line 53
    const-string v3, "\u3001"

    .line 54
    .line 55
    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 56
    .line 57
    .line 58
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    const/16 v3, 0x14

    .line 66
    .line 67
    if-gt v2, v3, :cond_2

    .line 68
    .line 69
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 70
    .line 71
    sget v3, Lcom/p1/mobile/putong/core/R$string;->ul:I

    .line 72
    .line 73
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v2, v3, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_2
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 94
    .line 95
    sget v3, Lcom/p1/mobile/putong/core/R$string;->vl:I

    .line 96
    .line 97
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v2, v3, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 114
    .line 115
    .line 116
    :cond_3
    :goto_1
    iget-object p0, p0, Ll/fwa0;->w:Lv/VText_Tags;

    .line 117
    .line 118
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    .line 124
    .line 125
    return-void
.end method
