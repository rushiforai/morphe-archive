.class public final synthetic Ll/m47;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

.field public final synthetic b:Ll/bqq;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/data/Picture;

.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Ll/bqq;Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m47;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    iput-object p2, p0, Ll/m47;->b:Ll/bqq;

    iput-object p3, p0, Ll/m47;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/m47;->d:Lcom/p1/mobile/putong/data/Picture;

    iput p5, p0, Ll/m47;->e:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/m47;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    iget-object v1, p0, Ll/m47;->b:Ll/bqq;

    iget-object v2, p0, Ll/m47;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/m47;->d:Lcom/p1/mobile/putong/data/Picture;

    iget v4, p0, Ll/m47;->e:I

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/data/Picture;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->N(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Ll/bqq;Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture;ILcom/p1/mobile/putong/data/Picture;)V

    return-void
.end method
