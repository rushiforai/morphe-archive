.class public final synthetic Ll/m3q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m3q;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/m3q;->b:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m3q;->a:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/m3q;->b:Lcom/p1/mobile/putong/core/data/Message;

    check-cast p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/expirence/view/ItemChallengeTipsMsg$a;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;)V

    return-void
.end method
