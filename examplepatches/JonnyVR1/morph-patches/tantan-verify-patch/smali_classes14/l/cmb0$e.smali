.class public Ll/cmb0$e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/cmb0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public a:Lcom/tantanapp/common/data/orm/LruCache2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LruCache2<",
            "TT;",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tantanapp/common/data/orm/LruCache2;

    .line 5
    .line 6
    const/16 v1, 0x64

    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/tantanapp/common/data/orm/LruCache2;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/cmb0$e;->a:Lcom/tantanapp/common/data/orm/LruCache2;

    .line 12
    .line 13
    return-void
.end method

.method public synthetic constructor <init>(Ll/dmb0;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Ll/cmb0$e;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object v1, p0, Ll/cmb0$e;->a:Lcom/tantanapp/common/data/orm/LruCache2;

    .line 6
    .line 7
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/LruCache2;->cached(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_1
    iget-object p0, p0, Ll/cmb0$e;->a:Lcom/tantanapp/common/data/orm/LruCache2;

    .line 16
    .line 17
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 18
    .line 19
    invoke-virtual {p0, p1, v1}, Lcom/tantanapp/common/data/orm/LruCache2;->cache(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    return v0
.end method
