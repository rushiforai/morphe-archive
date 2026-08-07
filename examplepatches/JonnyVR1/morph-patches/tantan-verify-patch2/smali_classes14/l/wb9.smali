.class public final synthetic Ll/wb9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/n;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Relationship;

.field public final synthetic d:Ljava/util/Map;

.field public final synthetic e:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/n;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wb9;->a:Lcom/p1/mobile/putong/core/api/n;

    iput-object p2, p0, Ll/wb9;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/wb9;->c:Lcom/p1/mobile/putong/data/Relationship;

    iput-object p4, p0, Ll/wb9;->d:Ljava/util/Map;

    iput-object p5, p0, Ll/wb9;->e:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/wb9;->a:Lcom/p1/mobile/putong/core/api/n;

    iget-object v1, p0, Ll/wb9;->b:Lcom/p1/mobile/putong/data/User;

    iget-object v2, p0, Ll/wb9;->c:Lcom/p1/mobile/putong/data/Relationship;

    iget-object v3, p0, Ll/wb9;->d:Ljava/util/Map;

    iget-object p0, p0, Ll/wb9;->e:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/core/api/n;->a3(Lcom/p1/mobile/putong/core/api/n;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
