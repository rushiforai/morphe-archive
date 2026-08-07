.class public Lcom/p1/mobile/putong/core/ui/profile/ProfileAct$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tvf;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->C2(Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/tvf<",
        "Ll/a1w;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;Ll/x20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct$a;->b:Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct$a;->a:Ll/x20;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/facebook/FacebookException;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/api/api/FacebookApi;->m(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Ll/a1w;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/a1w;->a()Lcom/facebook/AccessToken;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/facebook/AccessToken;->l()Ljava/util/Set;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/api/api/FacebookApi;->e:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p1, v0}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct$a;->a:Ll/x20;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/x20;->call()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public onCancel()V
    .locals 0

    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/a1w;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct$a;->b(Ll/a1w;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
