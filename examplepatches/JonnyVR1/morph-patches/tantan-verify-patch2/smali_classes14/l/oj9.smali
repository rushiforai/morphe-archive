.class public final synthetic Ll/oj9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreLikers;

.field public final synthetic b:J

.field public final synthetic c:Z

.field public final synthetic d:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreLikers;JZLcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oj9;->a:Lcom/p1/mobile/putong/core/api/CoreLikers;

    iput-wide p2, p0, Ll/oj9;->b:J

    iput-boolean p4, p0, Ll/oj9;->c:Z

    iput-object p5, p0, Ll/oj9;->d:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;

    iput-boolean p6, p0, Ll/oj9;->e:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/oj9;->a:Lcom/p1/mobile/putong/core/api/CoreLikers;

    iget-wide v1, p0, Ll/oj9;->b:J

    iget-boolean v3, p0, Ll/oj9;->c:Z

    iget-object v4, p0, Ll/oj9;->d:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;

    iget-boolean v5, p0, Ll/oj9;->e:Z

    move-object v6, p1

    check-cast v6, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/api/CoreLikers;->I3(Lcom/p1/mobile/putong/core/api/CoreLikers;JZLcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;ZLcom/p1/mobile/putong/data/Envelope;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
