.class public final synthetic Ll/qmp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;

.field public final synthetic c:Ll/y20;

.field public final synthetic d:Landroid/app/Dialog;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;Ll/y20;Landroid/app/Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qmp;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/qmp;->b:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;

    iput-object p3, p0, Ll/qmp;->c:Ll/y20;

    iput-object p4, p0, Ll/qmp;->d:Landroid/app/Dialog;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qmp;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/qmp;->b:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;

    iget-object v2, p0, Ll/qmp;->c:Ll/y20;

    iget-object p0, p0, Ll/qmp;->d:Landroid/app/Dialog;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, v1, v2, p0, p1}, Ll/tmp;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;Ll/y20;Landroid/app/Dialog;Ljava/lang/String;)V

    return-void
.end method
