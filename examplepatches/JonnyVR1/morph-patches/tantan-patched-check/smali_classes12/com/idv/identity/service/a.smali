.class public final Lcom/idv/identity/service/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/idv/identity/service/IdentityFaceService;


# direct methods
.method public constructor <init>(Lcom/idv/identity/service/IdentityFaceService;I)V
    .locals 0

    iput-object p1, p0, Lcom/idv/identity/service/a;->b:Lcom/idv/identity/service/IdentityFaceService;

    iput p2, p0, Lcom/idv/identity/service/a;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/idv/identity/service/a;->b:Lcom/idv/identity/service/IdentityFaceService;

    iget-object v0, v0, Lcom/idv/identity/service/IdentityFaceService;->identityFaceCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ll/gfm;

    iget v2, p0, Lcom/idv/identity/service/a;->a:I

    invoke-interface {v1, v2}, Ll/gfm;->f(I)V

    goto :goto_0

    :cond_0
    return-void
.end method
