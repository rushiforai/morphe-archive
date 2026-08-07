.class public Ll/ssa0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/vsa0;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/ssa0;->a:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance p1, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/ssa0;->b:Ljava/util/Map;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic e0(Ll/ssa0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ssa0;->g0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic g0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ssa0;->f0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/rsa0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/rsa0;-><init>(Ll/ssa0;)V

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

.method public f0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/vsa0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/vsa0;->s()Landroid/os/Bundle;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "loop_input_type"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 16
    .line 17
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast v1, Ll/vsa0;

    .line 20
    .line 21
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->title:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ll/vsa0;->A3(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast p0, Ll/vsa0;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/vsa0;->B(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
