.class public Ll/p0k0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/p0k0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

.field public final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;",
            ">;"
        }
    .end annotation
.end field

.field public c:Z

.field public d:Z

.field public e:Z

.field public final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateType;->AVATAR:Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

    .line 5
    .line 6
    iput-object v0, p0, Ll/p0k0$a;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/p0k0$a;->b:Ljava/util/List;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Ll/p0k0$a;->c:Z

    .line 17
    .line 18
    iput-boolean v0, p0, Ll/p0k0$a;->d:Z

    .line 19
    .line 20
    iput-boolean v0, p0, Ll/p0k0$a;->e:Z

    .line 21
    .line 22
    new-instance v0, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/p0k0$a;->f:Ljava/util/List;

    .line 28
    .line 29
    const-string v0, ""

    .line 30
    .line 31
    iput-object v0, p0, Ll/p0k0$a;->g:Ljava/lang/String;

    .line 32
    .line 33
    return-void
.end method

.method public static bridge synthetic a(Ll/p0k0$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/p0k0$a;->e:Z

    return p0
.end method

.method public static bridge synthetic b(Ll/p0k0$a;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p0k0$a;->b:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/p0k0$a;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p0k0$a;->f:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/p0k0$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/p0k0$a;->c:Z

    return p0
.end method

.method public static bridge synthetic e(Ll/p0k0$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/p0k0$a;->d:Z

    return p0
.end method

.method public static bridge synthetic f(Ll/p0k0$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p0k0$a;->g:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic g(Ll/p0k0$a;)Lcom/p1/mobile/putong/core/view/AvatarUpdateType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p0k0$a;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

    return-object p0
.end method


# virtual methods
.method public h(Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;)Ll/p0k0$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p0k0$a;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public i(Z)Ll/p0k0$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/p0k0$a;->e:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Ljava/util/List;)Ll/p0k0$a;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ll/p0k0$a;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/p0k0$a;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/p0k0$a;->f:Ljava/util/List;

    .line 13
    .line 14
    new-instance v1, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 17
    .line 18
    .line 19
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    return-object p0
.end method

.method public k(Z)Ll/p0k0$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/p0k0$a;->c:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public l(Z)Ll/p0k0$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/p0k0$a;->d:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Ljava/lang/String;)Ll/p0k0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/p0k0$a;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public n(Lcom/p1/mobile/putong/core/view/AvatarUpdateType;)Ll/p0k0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/p0k0$a;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

    .line 2
    .line 3
    return-object p0
.end method
