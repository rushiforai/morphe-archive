.class public final synthetic Ll/qz9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qz9;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;

    iput-object p2, p0, Ll/qz9;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qz9;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;

    iget-object p0, p0, Ll/qz9;->b:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->n(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;Ljava/util/List;Lcom/p1/mobile/putong/core/data/CoreData;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
