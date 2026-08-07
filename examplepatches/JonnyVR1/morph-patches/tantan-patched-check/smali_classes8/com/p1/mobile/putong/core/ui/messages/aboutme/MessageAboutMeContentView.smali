.class public Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Z

.field public final c:I

.field public d:I

.field public e:[Landroid/widget/TextView;

.field public f:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public i:Landroid/widget/TextView;

.field public j:Landroid/widget/TextView;

.field public k:Landroid/widget/TextView;

.field public l:Landroid/widget/TextView;

.field public m:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 31
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 30
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->a:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->b:Z

    .line 8
    .line 9
    const/4 v0, 0x5

    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->c:I

    .line 11
    .line 12
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->f:Ljava/util/Set;

    .line 18
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->g:Ljava/util/List;

    .line 25
    .line 26
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->b(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public final a(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->h:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/util/Pair;

    .line 8
    .line 9
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    const-string v1, ","

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->f:Ljava/util/Set;

    .line 26
    .line 27
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {v1, v0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->h:Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Landroid/util/Pair;

    .line 41
    .line 42
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast p1, Ljava/lang/String;

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->g:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_1

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->g:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    :cond_1
    return-void
.end method

.method public final b(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    sget p2, Ll/qec0;->D1:I

    .line 2
    .line 3
    invoke-static {p1, p2, p0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    sget p1, Ll/edc0;->b5:I

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Landroid/widget/TextView;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->i:Landroid/widget/TextView;

    .line 15
    .line 16
    sget p1, Ll/edc0;->c5:I

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Landroid/widget/TextView;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->j:Landroid/widget/TextView;

    .line 25
    .line 26
    sget p1, Ll/edc0;->d5:I

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Landroid/widget/TextView;

    .line 33
    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->k:Landroid/widget/TextView;

    .line 35
    .line 36
    sget p1, Ll/edc0;->e5:I

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Landroid/widget/TextView;

    .line 43
    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->l:Landroid/widget/TextView;

    .line 45
    .line 46
    sget p1, Ll/edc0;->f5:I

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Landroid/widget/TextView;

    .line 53
    .line 54
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->m:Landroid/widget/TextView;

    .line 55
    .line 56
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 57
    .line 58
    const/16 p2, 0x1c

    .line 59
    .line 60
    if-lt p1, p2, :cond_0

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->i:Landroid/widget/TextView;

    .line 63
    .line 64
    const/high16 p1, 0x41900000    # 18.0f

    .line 65
    .line 66
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    invoke-static {p0, p1}, Ll/aty;->a(Landroid/widget/TextView;I)V

    .line 71
    .line 72
    .line 73
    :cond_0
    return-void
.end method

.method public getShowContent()Lorg/json/JSONArray;
    .locals 1

    .line 1
    new-instance v0, Lorg/json/JSONArray;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->g:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public getShowedTagType()Ljava/util/Set;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->f:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public getShowedTrackParams()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->f:Ljava/util/Set;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, ","

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-lez p0, :cond_1

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    add-int/lit8 p0, p0, -0x1

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method public onMeasure(II)V
    .locals 5

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->a:Z

    .line 5
    .line 6
    if-nez v0, :cond_4

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    move v1, v0

    .line 10
    :goto_0
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->d:I

    .line 11
    .line 12
    const/4 v3, 0x1

    .line 13
    if-ge v0, v2, :cond_3

    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->e:[Landroid/widget/TextView;

    .line 16
    .line 17
    aget-object v2, v2, v0

    .line 18
    .line 19
    invoke-virtual {v2}, Landroid/widget/TextView;->getLineCount()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    add-int/2addr v2, v1

    .line 24
    const/4 v4, 0x5

    .line 25
    if-lt v2, v4, :cond_2

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->e:[Landroid/widget/TextView;

    .line 28
    .line 29
    aget-object v2, v2, v0

    .line 30
    .line 31
    invoke-virtual {v2}, Landroid/widget/TextView;->getLineCount()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    add-int/2addr v2, v1

    .line 36
    if-le v2, v4, :cond_0

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->a(I)V

    .line 39
    .line 40
    .line 41
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->e:[Landroid/widget/TextView;

    .line 42
    .line 43
    aget-object v2, v2, v0

    .line 44
    .line 45
    rsub-int/lit8 v1, v1, 0x7

    .line 46
    .line 47
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 48
    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->e:[Landroid/widget/TextView;

    .line 52
    .line 53
    aget-object v2, v2, v0

    .line 54
    .line 55
    invoke-virtual {v2}, Landroid/widget/TextView;->getLineCount()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    add-int/2addr v2, v1

    .line 60
    if-ne v2, v4, :cond_1

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->a(I)V

    .line 63
    .line 64
    .line 65
    :cond_1
    :goto_1
    add-int/2addr v0, v3

    .line 66
    :goto_2
    if-ge v0, v4, :cond_3

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->e:[Landroid/widget/TextView;

    .line 69
    .line 70
    aget-object v1, v1, v0

    .line 71
    .line 72
    const/16 v2, 0x8

    .line 73
    .line 74
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 75
    .line 76
    .line 77
    add-int/lit8 v0, v0, 0x1

    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->a(I)V

    .line 81
    .line 82
    .line 83
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->e:[Landroid/widget/TextView;

    .line 84
    .line 85
    aget-object v2, v2, v0

    .line 86
    .line 87
    invoke-virtual {v2}, Landroid/widget/TextView;->getLineCount()I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    add-int/2addr v1, v2

    .line 92
    add-int/lit8 v0, v0, 0x1

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_3
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->a:Z

    .line 96
    .line 97
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 98
    .line 99
    .line 100
    :cond_4
    return-void
.end method

.method public setContent(Ljava/util/ArrayList;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->b:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->h:Ljava/util/ArrayList;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->i:Landroid/widget/TextView;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->j:Landroid/widget/TextView;

    .line 17
    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->k:Landroid/widget/TextView;

    .line 19
    .line 20
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->l:Landroid/widget/TextView;

    .line 21
    .line 22
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->m:Landroid/widget/TextView;

    .line 23
    .line 24
    filled-new-array {v0, v1, v2, v3, v4}, [Landroid/widget/TextView;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->e:[Landroid/widget/TextView;

    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->e:[Landroid/widget/TextView;

    .line 35
    .line 36
    array-length v1, v1

    .line 37
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->d:I

    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    move v1, v0

    .line 45
    :goto_0
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->d:I

    .line 46
    .line 47
    if-ge v1, v2, :cond_1

    .line 48
    .line 49
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->e:[Landroid/widget/TextView;

    .line 50
    .line 51
    aget-object v2, v2, v1

    .line 52
    .line 53
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 54
    .line 55
    .line 56
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->e:[Landroid/widget/TextView;

    .line 57
    .line 58
    aget-object v2, v2, v1

    .line 59
    .line 60
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    check-cast v3, Landroid/util/Pair;

    .line 65
    .line 66
    iget-object v3, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 67
    .line 68
    check-cast v3, Ljava/lang/CharSequence;

    .line 69
    .line 70
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    add-int/lit8 v1, v1, 0x1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_1
    const/4 p1, 0x1

    .line 77
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aboutme/MessageAboutMeContentView;->b:Z

    .line 78
    .line 79
    return-void
.end method
