.class public final synthetic Ll/w3b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public final synthetic d:Z

.field public final synthetic e:Lcom/p1/mobile/putong/data/Relationship;

.field public final synthetic f:Lcom/p1/mobile/putong/data/LikeExtraData;

.field public final synthetic g:Lcom/p1/mobile/putong/data/LikeFrom;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreSuggested;ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ZLcom/p1/mobile/putong/data/Relationship;Lcom/p1/mobile/putong/data/LikeExtraData;Lcom/p1/mobile/putong/data/LikeFrom;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w3b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iput-boolean p2, p0, Ll/w3b;->b:Z

    iput-object p3, p0, Ll/w3b;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iput-boolean p4, p0, Ll/w3b;->d:Z

    iput-object p5, p0, Ll/w3b;->e:Lcom/p1/mobile/putong/data/Relationship;

    iput-object p6, p0, Ll/w3b;->f:Lcom/p1/mobile/putong/data/LikeExtraData;

    iput-object p7, p0, Ll/w3b;->g:Lcom/p1/mobile/putong/data/LikeFrom;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/w3b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-boolean v1, p0, Ll/w3b;->b:Z

    iget-object v2, p0, Ll/w3b;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iget-boolean v3, p0, Ll/w3b;->d:Z

    iget-object v4, p0, Ll/w3b;->e:Lcom/p1/mobile/putong/data/Relationship;

    iget-object v5, p0, Ll/w3b;->f:Lcom/p1/mobile/putong/data/LikeExtraData;

    iget-object v6, p0, Ll/w3b;->g:Lcom/p1/mobile/putong/data/LikeFrom;

    move-object v7, p1

    check-cast v7, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->l4(Lcom/p1/mobile/putong/core/api/CoreSuggested;ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ZLcom/p1/mobile/putong/data/Relationship;Lcom/p1/mobile/putong/data/LikeExtraData;Lcom/p1/mobile/putong/data/LikeFrom;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
