.class public final synthetic Ll/cgq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Picture;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;Lcom/p1/mobile/putong/data/Picture;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cgq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;

    iput-object p2, p0, Ll/cgq;->b:Lcom/p1/mobile/putong/data/Picture;

    iput-object p3, p0, Ll/cgq;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ll/cgq;->d:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cgq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;

    iget-object v1, p0, Ll/cgq;->b:Lcom/p1/mobile/putong/data/Picture;

    iget-object v2, p0, Ll/cgq;->c:Ljava/lang/String;

    iget-boolean p0, p0, Ll/cgq;->d:Z

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;Lcom/p1/mobile/putong/data/Picture;Ljava/lang/String;ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method
