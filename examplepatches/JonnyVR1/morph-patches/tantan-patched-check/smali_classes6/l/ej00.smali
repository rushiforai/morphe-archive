.class public final synthetic Ll/ej00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/StickerInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/StickerInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ej00;->a:Lcom/p1/mobile/putong/data/StickerInfo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ej00;->a:Lcom/p1/mobile/putong/data/StickerInfo;

    check-cast p1, Lcom/p1/mobile/putong/data/StickerInfo;

    invoke-static {p0, p1}, Ll/hj00;->y0(Lcom/p1/mobile/putong/data/StickerInfo;Lcom/p1/mobile/putong/data/StickerInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
