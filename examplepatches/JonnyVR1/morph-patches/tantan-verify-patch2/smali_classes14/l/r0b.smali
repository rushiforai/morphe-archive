.class public final synthetic Ll/r0b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/z$c;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Sticker;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/UserSticker;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/z$c;Lcom/p1/mobile/putong/core/data/Sticker;Lcom/p1/mobile/putong/core/data/UserSticker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r0b;->a:Lcom/p1/mobile/putong/core/api/z$c;

    iput-object p2, p0, Ll/r0b;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    iput-object p3, p0, Ll/r0b;->c:Lcom/p1/mobile/putong/core/data/UserSticker;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/r0b;->a:Lcom/p1/mobile/putong/core/api/z$c;

    iget-object v1, p0, Ll/r0b;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    iget-object p0, p0, Ll/r0b;->c:Lcom/p1/mobile/putong/core/data/UserSticker;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/api/z$c;->D(Lcom/p1/mobile/putong/core/api/z$c;Lcom/p1/mobile/putong/core/data/Sticker;Lcom/p1/mobile/putong/core/data/UserSticker;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
