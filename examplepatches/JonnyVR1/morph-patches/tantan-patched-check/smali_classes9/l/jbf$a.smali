.class public Ll/jbf$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/jbf;->q(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/jbf;


# direct methods
.method public constructor <init>(Ll/jbf;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jbf$a;->a:Ll/jbf;

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
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jbf$a;->a:Ll/jbf;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jbf;->Y(Ll/jbf;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x3

    .line 12
    if-lt v0, v1, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, p0, Ll/jbf$a;->a:Ll/jbf;

    .line 16
    .line 17
    invoke-static {v0}, Ll/jbf;->Y(Ll/jbf;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/jbf$a;->a:Ll/jbf;

    .line 25
    .line 26
    invoke-static {p1}, Ll/jbf;->Y(Ll/jbf;)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {p1, v0}, Ll/jbf;->Z(Ll/jbf;Ljava/util/List;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/jbf$a;->a:Ll/jbf;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-interface {p1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 48
    .line 49
    iget-object p0, p0, Ll/jbf$a;->a:Ll/jbf;

    .line 50
    .line 51
    invoke-static {p0}, Ll/jbf;->Y(Ll/jbf;)Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ExtensionGame;->screenshot:Ljava/util/List;

    .line 56
    .line 57
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jbf$a;->a:Ll/jbf;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jbf;->Y(Ll/jbf;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/jbf$a;->a:Ll/jbf;

    .line 11
    .line 12
    invoke-static {p1}, Ll/jbf;->Y(Ll/jbf;)Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {p1, v0}, Ll/jbf;->Z(Ll/jbf;Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/jbf$a;->a:Ll/jbf;

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
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 34
    .line 35
    iget-object p0, p0, Ll/jbf$a;->a:Ll/jbf;

    .line 36
    .line 37
    invoke-static {p0}, Ll/jbf;->Y(Ll/jbf;)Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ExtensionGame;->screenshot:Ljava/util/List;

    .line 42
    .line 43
    return-void
.end method
