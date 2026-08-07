.class public Ll/fef$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/fef;->q(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/fef;


# direct methods
.method public constructor <init>(Ll/fef;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fef$a;->a:Ll/fef;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fef$a;->a:Ll/fef;

    .line 2
    .line 3
    invoke-static {v0}, Ll/fef;->U(Ll/fef;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/fef$a;->a:Ll/fef;

    .line 11
    .line 12
    invoke-static {p1}, Ll/fef;->U(Ll/fef;)Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {p1, v0}, Ll/fef;->V(Ll/fef;Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/fef$a;->a:Ll/fef;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 34
    .line 35
    iget-object p0, p0, Ll/fef$a;->a:Ll/fef;

    .line 36
    .line 37
    invoke-static {p0}, Ll/fef;->U(Ll/fef;)Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserWealth;->petImg:Ljava/util/List;

    .line 42
    .line 43
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fef$a;->a:Ll/fef;

    .line 2
    .line 3
    invoke-static {v0}, Ll/fef;->U(Ll/fef;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/fef$a;->a:Ll/fef;

    .line 11
    .line 12
    invoke-static {p1}, Ll/fef;->U(Ll/fef;)Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {p1, v0}, Ll/fef;->V(Ll/fef;Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/fef$a;->a:Ll/fef;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 34
    .line 35
    iget-object p0, p0, Ll/fef$a;->a:Ll/fef;

    .line 36
    .line 37
    invoke-static {p0}, Ll/fef;->U(Ll/fef;)Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserWealth;->petImg:Ljava/util/List;

    .line 42
    .line 43
    return-void
.end method
