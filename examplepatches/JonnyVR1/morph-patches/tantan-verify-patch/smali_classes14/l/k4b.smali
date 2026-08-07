.class public final synthetic Ll/k4b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Relationship;

.field public final synthetic d:Ljava/util/Map;

.field public final synthetic e:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public final synthetic f:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreSuggested;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k4b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iput-object p2, p0, Ll/k4b;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/k4b;->c:Lcom/p1/mobile/putong/data/Relationship;

    iput-object p4, p0, Ll/k4b;->d:Ljava/util/Map;

    iput-object p5, p0, Ll/k4b;->e:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iput-boolean p6, p0, Ll/k4b;->f:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/k4b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-object v1, p0, Ll/k4b;->b:Lcom/p1/mobile/putong/data/User;

    iget-object v2, p0, Ll/k4b;->c:Lcom/p1/mobile/putong/data/Relationship;

    iget-object v3, p0, Ll/k4b;->d:Ljava/util/Map;

    iget-object v4, p0, Ll/k4b;->e:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iget-boolean v5, p0, Ll/k4b;->f:Z

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->q4(Lcom/p1/mobile/putong/core/api/CoreSuggested;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method
