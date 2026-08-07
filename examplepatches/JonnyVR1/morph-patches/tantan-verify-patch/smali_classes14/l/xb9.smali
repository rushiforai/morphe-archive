.class public final synthetic Ll/xb9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/n;

.field public final synthetic b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Relationship;

.field public final synthetic d:Ljava/util/Map;

.field public final synthetic e:Ljava/lang/Long;

.field public final synthetic f:Z

.field public final synthetic g:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/n;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Ljava/lang/Long;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xb9;->a:Lcom/p1/mobile/putong/core/api/n;

    iput-object p2, p0, Ll/xb9;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iput-object p3, p0, Ll/xb9;->c:Lcom/p1/mobile/putong/data/Relationship;

    iput-object p4, p0, Ll/xb9;->d:Ljava/util/Map;

    iput-object p5, p0, Ll/xb9;->e:Ljava/lang/Long;

    iput-boolean p6, p0, Ll/xb9;->f:Z

    iput-object p7, p0, Ll/xb9;->g:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/xb9;->a:Lcom/p1/mobile/putong/core/api/n;

    iget-object v1, p0, Ll/xb9;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iget-object v2, p0, Ll/xb9;->c:Lcom/p1/mobile/putong/data/Relationship;

    iget-object v3, p0, Ll/xb9;->d:Ljava/util/Map;

    iget-object v4, p0, Ll/xb9;->e:Ljava/lang/Long;

    iget-boolean v5, p0, Ll/xb9;->f:Z

    iget-object v6, p0, Ll/xb9;->g:Lcom/p1/mobile/putong/data/User;

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/api/n;->b3(Lcom/p1/mobile/putong/core/api/n;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Ljava/lang/Long;ZLcom/p1/mobile/putong/data/User;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
