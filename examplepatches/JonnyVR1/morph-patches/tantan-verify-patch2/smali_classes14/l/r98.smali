.class public final synthetic Ll/r98;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r98;->a:Ljava/util/List;

    iput-object p2, p0, Ll/r98;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r98;->a:Ljava/util/List;

    iget-object p0, p0, Ll/r98;->b:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/core/data/SogouGifEnvelope;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/g;->Ec(Ljava/util/List;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/SogouGifEnvelope;)Lcom/p1/mobile/putong/core/data/Sticker;

    move-result-object p0

    return-object p0
.end method
