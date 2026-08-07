.class public final synthetic Ll/i4q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/CommonTipBox;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;Lcom/p1/mobile/putong/core/data/CommonTipBox;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i4q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;

    iput-object p2, p0, Ll/i4q;->b:Lcom/p1/mobile/putong/core/data/CommonTipBox;

    iput-object p3, p0, Ll/i4q;->c:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/i4q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;

    iget-object v1, p0, Ll/i4q;->b:Lcom/p1/mobile/putong/core/data/CommonTipBox;

    iget-object p0, p0, Ll/i4q;->c:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;->Q(Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;Lcom/p1/mobile/putong/core/data/CommonTipBox;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
