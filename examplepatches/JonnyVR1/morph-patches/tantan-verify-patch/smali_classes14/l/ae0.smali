.class public final synthetic Ll/ae0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ae0;->a:Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ae0;->a:Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/ye0;->f(Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;Ljava/lang/String;)Ll/ff0;

    move-result-object p0

    return-object p0
.end method
