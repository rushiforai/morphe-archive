.class public final synthetic Ll/qg9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreLikers;

.field public final synthetic b:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreLikers;Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qg9;->a:Lcom/p1/mobile/putong/core/api/CoreLikers;

    iput-object p2, p0, Ll/qg9;->b:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qg9;->a:Lcom/p1/mobile/putong/core/api/CoreLikers;

    iget-object p0, p0, Ll/qg9;->b:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->c4(Lcom/p1/mobile/putong/core/api/CoreLikers;Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;Ljava/lang/Throwable;)V

    return-void
.end method
