.class public Ll/wkb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vkb0;


# instance fields
.field public a:Ll/vkb0;


# direct methods
.method public constructor <init>(Ll/vkb0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wkb0;->a:Ll/vkb0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/wkb0;->a:Ll/vkb0;

    .line 3
    .line 4
    return-void
.end method

.method public d(Lcom/android/billingclient/api/d;Ljava/util/List;)V
    .locals 1
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/billingclient/api/d;",
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/Purchase;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wkb0;->a:Ll/vkb0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/wkb0;->a:Ll/vkb0;

    .line 10
    .line 11
    invoke-interface {p0, p1, p2}, Ll/vkb0;->d(Lcom/android/billingclient/api/d;Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
