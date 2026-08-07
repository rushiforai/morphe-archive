.class public final synthetic Ll/f08;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Ljava/util/Set;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Ljava/util/Set;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f08;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/f08;->b:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f08;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object p0, p0, Ll/f08;->b:Ljava/util/Set;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->D8(Lcom/p1/mobile/putong/core/api/g;Ljava/util/Set;)V

    return-void
.end method
