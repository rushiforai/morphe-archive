.class public final synthetic Ll/i3b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public final synthetic d:Lcom/p1/mobile/putong/data/Relationship;

.field public final synthetic e:Ljava/util/Map;

.field public final synthetic f:Ljava/lang/Long;

.field public final synthetic g:Z

.field public final synthetic h:Lcom/p1/mobile/putong/data/User;

.field public final synthetic i:Z

.field public final synthetic j:Lcom/p1/mobile/putong/data/LikeExtraData;

.field public final synthetic k:Lcom/p1/mobile/putong/data/LikeFrom;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreSuggested;ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Ljava/lang/Long;ZLcom/p1/mobile/putong/data/User;ZLcom/p1/mobile/putong/data/LikeExtraData;Lcom/p1/mobile/putong/data/LikeFrom;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i3b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iput-boolean p2, p0, Ll/i3b;->b:Z

    iput-object p3, p0, Ll/i3b;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iput-object p4, p0, Ll/i3b;->d:Lcom/p1/mobile/putong/data/Relationship;

    iput-object p5, p0, Ll/i3b;->e:Ljava/util/Map;

    iput-object p6, p0, Ll/i3b;->f:Ljava/lang/Long;

    iput-boolean p7, p0, Ll/i3b;->g:Z

    iput-object p8, p0, Ll/i3b;->h:Lcom/p1/mobile/putong/data/User;

    iput-boolean p9, p0, Ll/i3b;->i:Z

    iput-object p10, p0, Ll/i3b;->j:Lcom/p1/mobile/putong/data/LikeExtraData;

    iput-object p11, p0, Ll/i3b;->k:Lcom/p1/mobile/putong/data/LikeFrom;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 11

    .line 1
    iget-object v0, p0, Ll/i3b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-boolean v1, p0, Ll/i3b;->b:Z

    iget-object v2, p0, Ll/i3b;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iget-object v3, p0, Ll/i3b;->d:Lcom/p1/mobile/putong/data/Relationship;

    iget-object v4, p0, Ll/i3b;->e:Ljava/util/Map;

    iget-object v5, p0, Ll/i3b;->f:Ljava/lang/Long;

    iget-boolean v6, p0, Ll/i3b;->g:Z

    iget-object v7, p0, Ll/i3b;->h:Lcom/p1/mobile/putong/data/User;

    iget-boolean v8, p0, Ll/i3b;->i:Z

    iget-object v9, p0, Ll/i3b;->j:Lcom/p1/mobile/putong/data/LikeExtraData;

    iget-object v10, p0, Ll/i3b;->k:Lcom/p1/mobile/putong/data/LikeFrom;

    invoke-static/range {v0 .. v10}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->b4(Lcom/p1/mobile/putong/core/api/CoreSuggested;ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Ljava/lang/Long;ZLcom/p1/mobile/putong/data/User;ZLcom/p1/mobile/putong/data/LikeExtraData;Lcom/p1/mobile/putong/data/LikeFrom;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
