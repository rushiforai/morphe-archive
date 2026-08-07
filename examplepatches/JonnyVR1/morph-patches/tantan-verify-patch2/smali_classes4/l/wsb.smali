.class public final synthetic Ll/wsb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/zsb;

.field public final synthetic b:Ll/l4g0;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;


# direct methods
.method public synthetic constructor <init>(Ll/zsb;Ll/l4g0;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wsb;->a:Ll/zsb;

    iput-object p2, p0, Ll/wsb;->b:Ll/l4g0;

    iput-object p3, p0, Ll/wsb;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/wsb;->d:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wsb;->a:Ll/zsb;

    iget-object v1, p0, Ll/wsb;->b:Ll/l4g0;

    iget-object v2, p0, Ll/wsb;->c:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/wsb;->d:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;

    invoke-static {v0, v1, v2, p0, p1}, Ll/zsb;->a(Ll/zsb;Ll/l4g0;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;Landroid/content/DialogInterface;)V

    return-void
.end method
