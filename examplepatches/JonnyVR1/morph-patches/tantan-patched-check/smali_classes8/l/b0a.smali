.class public final synthetic Ll/b0a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b0a;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b0a;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;

    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->l(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;Lcom/p1/mobile/putong/core/data/CoreData;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
