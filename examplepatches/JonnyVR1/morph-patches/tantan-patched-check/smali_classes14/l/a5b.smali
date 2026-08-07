.class public final synthetic Ll/a5b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Relationship;

.field public final synthetic d:Ljava/util/Map;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreSuggested;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a5b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iput-object p2, p0, Ll/a5b;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/a5b;->c:Lcom/p1/mobile/putong/data/Relationship;

    iput-object p4, p0, Ll/a5b;->d:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/a5b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-object v1, p0, Ll/a5b;->b:Lcom/p1/mobile/putong/data/User;

    iget-object v2, p0, Ll/a5b;->c:Lcom/p1/mobile/putong/data/Relationship;

    iget-object p0, p0, Ll/a5b;->d:Ljava/util/Map;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->w3(Lcom/p1/mobile/putong/core/api/CoreSuggested;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
