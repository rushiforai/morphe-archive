.class public final synthetic Ll/tez;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/util/HashMap;


# direct methods
.method public synthetic constructor <init>(Ljava/util/HashMap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tez;->a:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tez;->a:Ljava/util/HashMap;

    check-cast p1, Lcom/p1/mobile/putong/core/data/StickerBundle;

    invoke-static {p0, p1}, Ll/vez;->l0(Ljava/util/HashMap;Lcom/p1/mobile/putong/core/data/StickerBundle;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
