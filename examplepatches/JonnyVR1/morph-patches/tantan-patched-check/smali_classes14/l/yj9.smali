.class public final synthetic Ll/yj9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreLikers;

.field public final synthetic b:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;

.field public final synthetic c:I

.field public final synthetic d:Lcom/p1/mobile/putong/data/Envelope;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreLikers;Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;ILcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yj9;->a:Lcom/p1/mobile/putong/core/api/CoreLikers;

    iput-object p2, p0, Ll/yj9;->b:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;

    iput p3, p0, Ll/yj9;->c:I

    iput-object p4, p0, Ll/yj9;->d:Lcom/p1/mobile/putong/data/Envelope;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yj9;->a:Lcom/p1/mobile/putong/core/api/CoreLikers;

    iget-object v1, p0, Ll/yj9;->b:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;

    iget v2, p0, Ll/yj9;->c:I

    iget-object p0, p0, Ll/yj9;->d:Lcom/p1/mobile/putong/data/Envelope;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->Y4(Lcom/p1/mobile/putong/core/api/CoreLikers;Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;ILcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    move-result-object p0

    return-object p0
.end method
