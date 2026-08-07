.class public Lcom/facebook/login/widget/LoginButton$e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/login/widget/LoginButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation


# instance fields
.field public a:Lcom/facebook/login/DefaultAudience;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public c:Lcom/facebook/login/LoginBehavior;

.field public d:Ljava/lang/String;

.field public e:Lcom/facebook/login/LoginTargetApp;

.field public f:Z

.field public g:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public h:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/facebook/login/DefaultAudience;->FRIENDS:Lcom/facebook/login/DefaultAudience;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/facebook/login/widget/LoginButton$e;->a:Lcom/facebook/login/DefaultAudience;

    .line 7
    .line 8
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/facebook/login/widget/LoginButton$e;->b:Ljava/util/List;

    .line 11
    .line 12
    sget-object v0, Lcom/facebook/login/LoginBehavior;->NATIVE_WITH_FALLBACK:Lcom/facebook/login/LoginBehavior;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/facebook/login/widget/LoginButton$e;->c:Lcom/facebook/login/LoginBehavior;

    .line 15
    .line 16
    const-string v0, "rerequest"

    .line 17
    .line 18
    iput-object v0, p0, Lcom/facebook/login/widget/LoginButton$e;->d:Ljava/lang/String;

    .line 19
    .line 20
    sget-object v0, Lcom/facebook/login/LoginTargetApp;->FACEBOOK:Lcom/facebook/login/LoginTargetApp;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/facebook/login/widget/LoginButton$e;->e:Lcom/facebook/login/LoginTargetApp;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p0, Lcom/facebook/login/widget/LoginButton$e;->f:Z

    .line 26
    .line 27
    return-void
.end method

.method public static synthetic a(Lcom/facebook/login/widget/LoginButton$e;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/facebook/login/widget/LoginButton$e;->b:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/facebook/login/widget/LoginButton$e;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Lcom/facebook/login/DefaultAudience;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/facebook/login/widget/LoginButton$e;->a:Lcom/facebook/login/DefaultAudience;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Lcom/facebook/login/LoginBehavior;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/facebook/login/widget/LoginButton$e;->c:Lcom/facebook/login/LoginBehavior;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Lcom/facebook/login/LoginTargetApp;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/facebook/login/widget/LoginButton$e;->e:Lcom/facebook/login/LoginTargetApp;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/facebook/login/widget/LoginButton$e;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/facebook/login/widget/LoginButton$e;->b:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/facebook/login/widget/LoginButton$e;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/facebook/login/widget/LoginButton$e;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public j(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/facebook/login/widget/LoginButton$e;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public k(Lcom/facebook/login/DefaultAudience;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/facebook/login/widget/LoginButton$e;->a:Lcom/facebook/login/DefaultAudience;

    .line 2
    .line 3
    return-void
.end method

.method public l(Lcom/facebook/login/LoginBehavior;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/facebook/login/widget/LoginButton$e;->c:Lcom/facebook/login/LoginBehavior;

    .line 2
    .line 3
    return-void
.end method

.method public m(Lcom/facebook/login/LoginTargetApp;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/facebook/login/widget/LoginButton$e;->e:Lcom/facebook/login/LoginTargetApp;

    .line 2
    .line 3
    return-void
.end method

.method public n(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/facebook/login/widget/LoginButton$e;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public o(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/facebook/login/widget/LoginButton$e;->b:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public p(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/facebook/login/widget/LoginButton$e;->h:Z

    .line 2
    .line 3
    return-void
.end method
