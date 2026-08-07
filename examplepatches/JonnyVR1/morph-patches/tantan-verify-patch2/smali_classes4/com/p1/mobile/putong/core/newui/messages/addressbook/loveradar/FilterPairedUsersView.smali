.class public Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VFrame;

.field public b:Lv/VImage;

.field public c:Lv/VFrame;

.field public d:Lv/VImage;

.field public e:Lv/VLinear;

.field public f:Lv/VFrame;

.field public g:Lv/VText;

.field public h:Lv/VFrame;

.field public i:Lv/VText;

.field public j:Lv/VFrame;

.field public k:Lv/VText;

.field public l:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public m:Lcom/p1/mobile/putong/core/data/FateRadar;

.field public n:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->n:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->n:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->n:Z

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;)Ll/y20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->l:Ll/y20;

    return-object p0
.end method

.method private static getMeNewTags()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Interest;->tags:Ljava/util/List;

    .line 22
    .line 23
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Interest;->tags:Ljava/util/List;

    .line 44
    .line 45
    return-object v0

    .line 46
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .line 50
    .line 51
    return-object v0
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/mmi;->a(Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/data/FateRadar;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->m:Lcom/p1/mobile/putong/core/data/FateRadar;

    .line 2
    .line 3
    return-void
.end method

.method public d()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->d:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->b:Lv/VImage;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->j:Lv/VFrame;

    .line 14
    .line 15
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->n:Z

    .line 16
    .line 17
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->e:Lv/VLinear;

    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->g:Lv/VText;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->getSearchOtherStatus()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->i:Lv/VText;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->getSearchOtherFeature()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->k:Lv/VText;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->getMeSelectedInterest()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public e()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->d:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->b:Lv/VImage;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->e:Lv/VLinear;

    .line 14
    .line 15
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public getMeSelectedInterest()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->m:Lcom/p1/mobile/putong/core/data/FateRadar;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->m:Lcom/p1/mobile/putong/core/data/FateRadar;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/FateRadar;->searchConditions:Lcom/p1/mobile/putong/core/data/FateRadarSearchConditions;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/FateRadarSearchConditions;->customItems:Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;->selectedInterest:Ljava/util/List;

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->getMeNewTags()Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    new-instance v3, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView$c;

    .line 26
    .line 27
    invoke-direct {v3, p0, v2}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView$c;-><init>(Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, v3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1, p0}, Ll/gj40;->P(Ljava/util/List;)Ll/gj40$h;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Ll/gj40$h;->b()Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const/4 v1, 0x0

    .line 47
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-ge v1, v2, :cond_2

    .line 52
    .line 53
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    check-cast v2, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-nez v3, :cond_1

    .line 64
    .line 65
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_1
    const-string v3, "\u3001"

    .line 72
    .line 73
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    if-nez p0, :cond_3

    .line 89
    .line 90
    const-string p0, "\u4e0d\u9650"

    .line 91
    .line 92
    return-object p0

    .line 93
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    return-object p0
.end method

.method public getSearchOtherFeature()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->m:Lcom/p1/mobile/putong/core/data/FateRadar;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->m:Lcom/p1/mobile/putong/core/data/FateRadar;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/FateRadar;->searchConditions:Lcom/p1/mobile/putong/core/data/FateRadarSearchConditions;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/FateRadarSearchConditions;->customItems:Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;->feature:Ljava/util/List;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-ge v1, v2, :cond_3

    .line 27
    .line 28
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Lcom/p1/mobile/putong/core/data/FilterConditionsStatusItem;

    .line 33
    .line 34
    iget-boolean v3, v2, Lcom/p1/mobile/putong/core/data/FilterConditionsStatusItem;->selected:Z

    .line 35
    .line 36
    if-eqz v3, :cond_2

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-nez v3, :cond_1

    .line 43
    .line 44
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/FilterConditionsStatusItem;->value:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    const-string v3, "\u3001"

    .line 51
    .line 52
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/FilterConditionsStatusItem;->value:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-nez p0, :cond_4

    .line 68
    .line 69
    const-string p0, "\u4e0d\u9650"

    .line 70
    .line 71
    return-object p0

    .line 72
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0
.end method

.method public getSearchOtherStatus()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->m:Lcom/p1/mobile/putong/core/data/FateRadar;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->m:Lcom/p1/mobile/putong/core/data/FateRadar;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/FateRadar;->searchConditions:Lcom/p1/mobile/putong/core/data/FateRadarSearchConditions;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/FateRadarSearchConditions;->customItems:Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;->status:Ljava/util/List;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-ge v1, v2, :cond_3

    .line 27
    .line 28
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Lcom/p1/mobile/putong/core/data/FilterConditionsStatusItem;

    .line 33
    .line 34
    iget-boolean v3, v2, Lcom/p1/mobile/putong/core/data/FilterConditionsStatusItem;->selected:Z

    .line 35
    .line 36
    if-eqz v3, :cond_2

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-nez v3, :cond_1

    .line 43
    .line 44
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/FilterConditionsStatusItem;->value:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    const-string v3, "\u3001"

    .line 51
    .line 52
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/FilterConditionsStatusItem;->value:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-nez p0, :cond_4

    .line 68
    .line 69
    const-string p0, "\u4e0d\u9650"

    .line 70
    .line 71
    return-object p0

    .line 72
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->a:Lv/VFrame;

    .line 8
    .line 9
    new-instance v1, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView$a;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->c:Lv/VFrame;

    .line 18
    .line 19
    new-instance v1, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView$b;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView$b;-><init>(Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public setAfterChangeStateListener(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->l:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public setShowInterest(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/FilterPairedUsersView;->n:Z

    .line 2
    .line 3
    return-void
.end method
