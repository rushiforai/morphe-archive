.class public Ll/rfk;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/vfk;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GroupAttribute;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lcom/p1/mobile/putong/core/data/GroupCreate;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Ll/rfk;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rfk;->f0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic f0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/vfk;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/vfk;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private pageId()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method


# virtual methods
.method public Z()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "group_attributes"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    iput-object v0, p0, Ll/rfk;->a:Ljava/util/List;

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GroupCreate;->new_()Lcom/p1/mobile/putong/core/data/GroupCreate;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/rfk;->b:Lcom/p1/mobile/putong/core/data/GroupCreate;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/rfk;->i0()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/rfk;->h0()V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/qfk;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/qfk;-><init>(Ll/rfk;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public g0(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/rfk;->b:Lcom/p1/mobile/putong/core/data/GroupCreate;

    .line 2
    .line 3
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/GroupCreate;->type:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, p0, Ll/rfk;->a:Ljava/util/List;

    .line 14
    .line 15
    iget-object v3, p0, Ll/rfk;->b:Lcom/p1/mobile/putong/core/data/GroupCreate;

    .line 16
    .line 17
    invoke-static {v1, v2, v3}, Lcom/p1/mobile/putong/core/newui/group/GroupCreateCategoryAct;->a2(Landroid/content/Context;Ljava/util/List;Lcom/p1/mobile/putong/core/data/GroupCreate;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const/16 v2, 0x101

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0}, Ll/rfk;->pageId()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    new-instance v0, Ll/pf60;

    .line 31
    .line 32
    const-string v1, "anonymous"

    .line 33
    .line 34
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const-string v1, "is_anonymou_group"

    .line 43
    .line 44
    invoke-direct {v0, v1, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    filled-new-array {v0}, [Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const-string v0, "e_select_group_type_step_one"

    .line 52
    .line 53
    invoke-static {v0, p0, p1}, Ll/sfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final h0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/rfk;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/rfk;->b:Lcom/p1/mobile/putong/core/data/GroupCreate;

    .line 11
    .line 12
    iget-object v1, p0, Ll/rfk;->a:Ljava/util/List;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/p1/mobile/putong/core/data/GroupAttribute;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GroupAttribute;->creationType:Lcom/p1/mobile/putong/core/data/GroupCreationType;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GroupCreationType;->defaultType:Ljava/lang/String;

    .line 24
    .line 25
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/GroupCreate;->type:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iget-object v2, p0, Ll/rfk;->a:Ljava/util/List;

    .line 36
    .line 37
    iget-object v3, p0, Ll/rfk;->b:Lcom/p1/mobile/putong/core/data/GroupCreate;

    .line 38
    .line 39
    invoke-static {v1, v2, v3}, Lcom/p1/mobile/putong/core/newui/group/GroupCreateCategoryAct;->a2(Landroid/content/Context;Ljava/util/List;Lcom/p1/mobile/putong/core/data/GroupCreate;)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final i0()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rfk;->a:Ljava/util/List;

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
    return v1

    .line 11
    :cond_0
    iget-object p0, p0, Ll/rfk;->a:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/core/data/GroupAttribute;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GroupAttribute;->creationType:Lcom/p1/mobile/putong/core/data/GroupCreationType;

    .line 20
    .line 21
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/GroupCreationType;->selectable:Z

    .line 22
    .line 23
    xor-int/lit8 p0, p0, 0x1

    .line 24
    .line 25
    return p0
.end method
