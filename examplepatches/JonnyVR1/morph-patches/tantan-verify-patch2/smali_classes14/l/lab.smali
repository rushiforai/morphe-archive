.class public final synthetic Ll/lab;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/b0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Relationship;

.field public final synthetic d:Ljava/util/Map;

.field public final synthetic e:Ljava/lang/Long;

.field public final synthetic f:Z

.field public final synthetic g:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/b0;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Ljava/lang/Long;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lab;->a:Lcom/p1/mobile/putong/core/api/b0;

    iput-object p2, p0, Ll/lab;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iput-object p3, p0, Ll/lab;->c:Lcom/p1/mobile/putong/data/Relationship;

    iput-object p4, p0, Ll/lab;->d:Ljava/util/Map;

    iput-object p5, p0, Ll/lab;->e:Ljava/lang/Long;

    iput-boolean p6, p0, Ll/lab;->f:Z

    iput-object p7, p0, Ll/lab;->g:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/lab;->a:Lcom/p1/mobile/putong/core/api/b0;

    iget-object v1, p0, Ll/lab;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iget-object v2, p0, Ll/lab;->c:Lcom/p1/mobile/putong/data/Relationship;

    iget-object v3, p0, Ll/lab;->d:Ljava/util/Map;

    iget-object v4, p0, Ll/lab;->e:Ljava/lang/Long;

    iget-boolean v5, p0, Ll/lab;->f:Z

    iget-object v6, p0, Ll/lab;->g:Lcom/p1/mobile/putong/data/User;

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/api/b0;->c3(Lcom/p1/mobile/putong/core/api/b0;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Ljava/lang/Long;ZLcom/p1/mobile/putong/data/User;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
