.class public final synthetic Ll/pg9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreLikers;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:J

.field public final synthetic d:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;

.field public final synthetic e:Z

.field public final synthetic f:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreLikers;Lcom/p1/mobile/putong/data/User;JLcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pg9;->a:Lcom/p1/mobile/putong/core/api/CoreLikers;

    iput-object p2, p0, Ll/pg9;->b:Lcom/p1/mobile/putong/data/User;

    iput-wide p3, p0, Ll/pg9;->c:J

    iput-object p5, p0, Ll/pg9;->d:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;

    iput-boolean p6, p0, Ll/pg9;->e:Z

    iput-boolean p7, p0, Ll/pg9;->f:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/pg9;->a:Lcom/p1/mobile/putong/core/api/CoreLikers;

    iget-object v1, p0, Ll/pg9;->b:Lcom/p1/mobile/putong/data/User;

    iget-wide v2, p0, Ll/pg9;->c:J

    iget-object v4, p0, Ll/pg9;->d:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;

    iget-boolean v5, p0, Ll/pg9;->e:Z

    iget-boolean v6, p0, Ll/pg9;->f:Z

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/api/CoreLikers;->f4(Lcom/p1/mobile/putong/core/api/CoreLikers;Lcom/p1/mobile/putong/data/User;JLcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;ZZ)Lrx/c;

    move-result-object p0

    return-object p0
.end method
