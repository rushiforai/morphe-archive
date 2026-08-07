.class public final synthetic Ll/h6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/tantan/library/svga/ResourceKey;

.field public final synthetic b:Lcom/tantan/library/svga/exception/SVGAException;

.field public final synthetic c:Lcom/tantan/library/svga/data/request/AbsTarget;


# direct methods
.method public synthetic constructor <init>(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/exception/SVGAException;Lcom/tantan/library/svga/data/request/AbsTarget;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h6;->a:Lcom/tantan/library/svga/ResourceKey;

    iput-object p2, p0, Ll/h6;->b:Lcom/tantan/library/svga/exception/SVGAException;

    iput-object p3, p0, Ll/h6;->c:Lcom/tantan/library/svga/data/request/AbsTarget;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h6;->a:Lcom/tantan/library/svga/ResourceKey;

    iget-object v1, p0, Ll/h6;->b:Lcom/tantan/library/svga/exception/SVGAException;

    iget-object p0, p0, Ll/h6;->c:Lcom/tantan/library/svga/data/request/AbsTarget;

    invoke-static {v0, v1, p0}, Lcom/tantan/library/svga/data/request/AbsTarget;->a(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/exception/SVGAException;Lcom/tantan/library/svga/data/request/AbsTarget;)V

    return-void
.end method
