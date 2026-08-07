.class public final synthetic Ll/pjq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic d:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pjq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;

    iput-object p2, p0, Ll/pjq;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/pjq;->c:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p4, p0, Ll/pjq;->d:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pjq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;

    iget-object v1, p0, Ll/pjq;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/pjq;->c:Lcom/p1/mobile/putong/core/data/Message;

    iget-object p0, p0, Ll/pjq;->d:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;->b(Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method
