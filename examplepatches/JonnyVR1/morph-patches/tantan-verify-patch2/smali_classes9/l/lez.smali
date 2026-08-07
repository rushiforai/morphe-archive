.class public final synthetic Ll/lez;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/StickerBundle;

.field public final synthetic b:Ljava/util/HashMap;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/StickerBundle;Ljava/util/HashMap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lez;->a:Lcom/p1/mobile/putong/core/data/StickerBundle;

    iput-object p2, p0, Ll/lez;->b:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lez;->a:Lcom/p1/mobile/putong/core/data/StickerBundle;

    iget-object p0, p0, Ll/lez;->b:Ljava/util/HashMap;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/vez;->j0(Lcom/p1/mobile/putong/core/data/StickerBundle;Ljava/util/HashMap;Ljava/lang/String;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
