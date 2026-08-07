.class public final synthetic Ll/ig9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreLikers;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:J

.field public final synthetic d:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreLikers;Lcom/p1/mobile/putong/data/User;JLcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ig9;->a:Lcom/p1/mobile/putong/core/api/CoreLikers;

    iput-object p2, p0, Ll/ig9;->b:Lcom/p1/mobile/putong/data/User;

    iput-wide p3, p0, Ll/ig9;->c:J

    iput-object p5, p0, Ll/ig9;->d:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ig9;->a:Lcom/p1/mobile/putong/core/api/CoreLikers;

    iget-object v1, p0, Ll/ig9;->b:Lcom/p1/mobile/putong/data/User;

    iget-wide v2, p0, Ll/ig9;->c:J

    iget-object p0, p0, Ll/ig9;->d:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->u3(Lcom/p1/mobile/putong/core/api/CoreLikers;Lcom/p1/mobile/putong/data/User;JLcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
