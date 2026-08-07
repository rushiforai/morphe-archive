.class public final synthetic Ll/usb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/zsb;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;

.field public final synthetic d:Ll/y20;

.field public final synthetic e:Landroid/app/Dialog;


# direct methods
.method public synthetic constructor <init>(Ll/zsb;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;Ll/y20;Landroid/app/Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/usb;->a:Ll/zsb;

    iput-object p2, p0, Ll/usb;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/usb;->c:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;

    iput-object p4, p0, Ll/usb;->d:Ll/y20;

    iput-object p5, p0, Ll/usb;->e:Landroid/app/Dialog;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/usb;->a:Ll/zsb;

    iget-object v1, p0, Ll/usb;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/usb;->c:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;

    iget-object v3, p0, Ll/usb;->d:Ll/y20;

    iget-object v4, p0, Ll/usb;->e:Landroid/app/Dialog;

    move-object v5, p1

    check-cast v5, Ljava/lang/String;

    invoke-static/range {v0 .. v5}, Ll/zsb;->c(Ll/zsb;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;Ll/y20;Landroid/app/Dialog;Ljava/lang/String;)V

    return-void
.end method
