.class public final Ll/tpa0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/upa0;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0007\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0019\u0010\u000b\u001a\u00020\u00072\u0008\u0010\n\u001a\u0004\u0018\u00010\u0002H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u000f\u0010\r\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\r\u0010\tJ\u0015\u0010\u0010\u001a\u00020\u00072\u0006\u0010\u000f\u001a\u00020\u000e\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u000f\u0010\u0012\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0012\u0010\tR\u001e\u0010\u0017\u001a\n\u0012\u0004\u0012\u00020\u0014\u0018\u00010\u00138\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0015\u0010\u0016R\"\u0010\u001e\u001a\u00020\u00188\u0000@\u0000X\u0080\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0019\u0010\r\u001a\u0004\u0008\u001a\u0010\u001b\"\u0004\u0008\u001c\u0010\u001d\u00a8\u0006\u001f"
    }
    d2 = {
        "Ll/tpa0;",
        "Ll/ar2;",
        "Ll/upa0;",
        "Ll/ner;",
        "lifecycleProvider",
        "<init>",
        "(Ll/ner;)V",
        "",
        "i0",
        "()V",
        "viewModel",
        "f0",
        "(Ll/upa0;)V",
        "Z",
        "Lcom/p1/mobile/putong/data/User;",
        "user",
        "g0",
        "(Lcom/p1/mobile/putong/data/User;)V",
        "destroy",
        "",
        "Lcom/p1/mobile/putong/data/IntlProfileInfo;",
        "a",
        "Ljava/util/List;",
        "fillData",
        "",
        "b",
        "h0",
        "()Z",
        "setLanguageType$profile_intlGmsRelease",
        "(Z)V",
        "languageType",
        "profile_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/data/IntlProfileInfo;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public b:Z


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0
    .param p1    # Ll/ner;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static e0(Ll/tpa0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/tpa0;->i0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final i0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/upa0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/upa0;->f()Landroid/os/Bundle;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v1, "loop_input_type"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 23
    .line 24
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->LANGUAGE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 25
    .line 26
    if-ne v0, v1, :cond_1

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    const/4 v0, 0x0

    .line 31
    :goto_1
    iput-boolean v0, p0, Ll/tpa0;->b:Z

    .line 32
    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    sget-object v0, Ll/rpa0;->INSTANCE:Ll/rpa0;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/rpa0;->c()Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    check-cast v0, Ljava/util/ArrayList;

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_2
    sget-object v0, Ll/rpa0;->INSTANCE:Ll/rpa0;

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/rpa0;->b()Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 54
    .line 55
    .line 56
    check-cast v0, Ljava/util/ArrayList;

    .line 57
    .line 58
    :goto_2
    iput-object v0, p0, Ll/tpa0;->a:Ljava/util/List;

    .line 59
    .line 60
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 61
    .line 62
    check-cast v1, Ll/upa0;

    .line 63
    .line 64
    if-eqz v1, :cond_3

    .line 65
    .line 66
    iget-boolean p0, p0, Ll/tpa0;->b:Z

    .line 67
    .line 68
    invoke-virtual {v1, v0, p0}, Ll/upa0;->m(Ljava/util/List;Z)V

    .line 69
    .line 70
    .line 71
    :cond_3
    return-void
.end method


# virtual methods
.method public bridge synthetic C(Ll/iam;)V
    .locals 0

    .line 1
    check-cast p1, Ll/upa0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tpa0;->f0(Ll/upa0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Z()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/spa0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/spa0;-><init>(Ll/tpa0;)V

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

.method public f0(Ll/upa0;)V
    .locals 0
    .param p1    # Ll/upa0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Ll/ar2;->C(Ll/iam;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final g0(Lcom/p1/mobile/putong/data/User;)V
    .locals 4
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Ll/tpa0;->a:Ljava/util/List;

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    check-cast v1, Ljava/lang/Iterable;

    .line 14
    .line 15
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Lcom/p1/mobile/putong/data/IntlProfileInfo;

    .line 30
    .line 31
    iget-boolean v3, v2, Lcom/p1/mobile/putong/data/IntlProfileInfo;->selected:Z

    .line 32
    .line 33
    if-eqz v3, :cond_0

    .line 34
    .line 35
    iget-object v2, v2, Lcom/p1/mobile/putong/data/IntlProfileInfo;->key:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    sget-object v1, Ll/rpa0;->INSTANCE:Ll/rpa0;

    .line 42
    .line 43
    iget-boolean v2, p0, Ll/tpa0;->b:Z

    .line 44
    .line 45
    invoke-virtual {v1, v0, v2}, Ll/rpa0;->g(Ljava/util/List;Z)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-nez v1, :cond_3

    .line 53
    .line 54
    iget-boolean p0, p0, Ll/tpa0;->b:Z

    .line 55
    .line 56
    if-nez p0, :cond_2

    .line 57
    .line 58
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 63
    .line 64
    iput-object v0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ethnicity:Ljava/util/List;

    .line 65
    .line 66
    return-void

    .line 67
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 72
    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->language:Ljava/util/List;

    .line 74
    .line 75
    :cond_3
    return-void
.end method

.method public final h0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/tpa0;->b:Z

    .line 2
    .line 3
    return p0
.end method
