.class public final synthetic Ll/yzz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yzz;->a:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yzz;->a:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    check-cast p1, Ll/pf60;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageMediaItemImage;->h(Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;Ll/pf60;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
