.class public final synthetic Ll/q0b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Sticker;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/UserSticker;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/Sticker;Lcom/p1/mobile/putong/core/data/UserSticker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q0b;->a:Lcom/p1/mobile/putong/core/data/Sticker;

    iput-object p2, p0, Ll/q0b;->b:Lcom/p1/mobile/putong/core/data/UserSticker;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q0b;->a:Lcom/p1/mobile/putong/core/data/Sticker;

    iget-object p0, p0, Ll/q0b;->b:Lcom/p1/mobile/putong/core/data/UserSticker;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/z$c;->I(Lcom/p1/mobile/putong/core/data/Sticker;Lcom/p1/mobile/putong/core/data/UserSticker;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
