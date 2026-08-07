.class public Lcom/p1/mobile/putong/core/ui/mediapicker/EmojiMediaPickerAct;
.super Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v2(Lcom/p1/mobile/putong/core/ui/mediapicker/EmojiMediaPickerAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/mediapicker/EmojiMediaPickerAct;->y2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w2(Lcom/p1/mobile/putong/core/ui/mediapicker/EmojiMediaPickerAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/mediapicker/EmojiMediaPickerAct;->z2(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic y2(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->z:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-lez p1, :cond_0

    .line 8
    .line 9
    new-instance p1, Landroid/content/Intent;

    .line 10
    .line 11
    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 12
    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->z:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    const/4 v0, -0x1

    .line 22
    invoke-virtual {p0, v0, p1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private synthetic z2(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    sget p1, Lcom/p1/mobile/putong/core/R$string;->l4:I

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->B:Ll/z0y;

    .line 7
    .line 8
    iget-object p1, p1, Ll/z0y;->k:Lv/VText;

    .line 9
    .line 10
    new-instance v0, Ll/eze;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/eze;-><init>(Lcom/p1/mobile/putong/core/ui/mediapicker/EmojiMediaPickerAct;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/mediapicker/EmojiMediaPickerAct;->f()V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->B:Ll/z0y;

    .line 22
    .line 23
    iget-object p0, p0, Ll/z0y;->j:Lv/VText;

    .line 24
    .line 25
    const/16 p1, 0x8

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public f()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->z:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->B:Ll/z0y;

    .line 8
    .line 9
    iget-object v1, v1, Ll/z0y;->k:Lv/VText;

    .line 10
    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v2, 0x0

    .line 16
    :goto_0
    invoke-static {v1, v2}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->B:Ll/z0y;

    .line 20
    .line 21
    iget-object v1, v1, Ll/z0y;->k:Lv/VText;

    .line 22
    .line 23
    new-instance v2, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    sget v3, Lcom/p1/mobile/putong/core/R$string;->k4:I

    .line 29
    .line 30
    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    if-gtz v0, :cond_1

    .line 38
    .line 39
    const-string p0, ""

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v3, "("

    .line 45
    .line 46
    invoke-direct {p0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v0, ")"

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    :goto_1
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/data/Media;Z)Z
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->z:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->l:I

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->z:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-ne p2, v1, :cond_1

    .line 19
    .line 20
    sget p1, Lcom/p1/mobile/putong/core/R$string;->n4:I

    .line 21
    .line 22
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->z:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/mediapicker/EmojiMediaPickerAct;->f()V

    .line 33
    .line 34
    .line 35
    return v0
.end method

.method public initDataOnCreate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/dze;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/dze;-><init>(Lcom/p1/mobile/putong/core/ui/mediapicker/EmojiMediaPickerAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public j(Landroid/view/View;Lcom/p1/mobile/putong/data/Media;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->z:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    const/4 v2, 0x1

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    move v0, v2

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    :goto_0
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/core/ui/mediapicker/EmojiMediaPickerAct;->i(Lcom/p1/mobile/putong/data/Media;Z)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    check-cast p1, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaItemView;

    .line 21
    .line 22
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaItemView;->e:Lv/VCheckCircle;

    .line 23
    .line 24
    invoke-virtual {p0, v0, v2}, Lv/VCheckCircle;->e(ZZ)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const-string v0, "spanCount"

    .line 9
    .line 10
    const/4 v1, 0x3

    .line 11
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->w:I

    .line 16
    .line 17
    return-void
.end method
