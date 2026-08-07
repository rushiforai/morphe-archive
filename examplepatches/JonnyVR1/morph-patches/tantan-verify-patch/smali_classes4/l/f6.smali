.class public final synthetic Ll/f6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/tantan/library/svga/ResourceKey;

.field public final synthetic b:Lcom/tantan/library/svga/data/request/AbsTarget;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/request/AbsTarget;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f6;->a:Lcom/tantan/library/svga/ResourceKey;

    iput-object p2, p0, Ll/f6;->b:Lcom/tantan/library/svga/data/request/AbsTarget;

    iput-object p3, p0, Ll/f6;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f6;->a:Lcom/tantan/library/svga/ResourceKey;

    iget-object v1, p0, Ll/f6;->b:Lcom/tantan/library/svga/data/request/AbsTarget;

    iget-object p0, p0, Ll/f6;->c:Ljava/lang/Object;

    invoke-static {v0, v1, p0}, Lcom/tantan/library/svga/data/request/AbsTarget;->c(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/request/AbsTarget;Ljava/lang/Object;)V

    return-void
.end method
