.class public final synthetic Ll/d1q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d1q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d1q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;

    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;->b(Lcom/p1/mobile/putong/core/ui/messages/ItemAddArtworkGuide;Lcom/p1/mobile/putong/core/data/CoreData;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
