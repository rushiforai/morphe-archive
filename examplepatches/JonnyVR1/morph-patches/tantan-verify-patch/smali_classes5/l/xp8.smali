.class public final synthetic Ll/xp8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$b;

.field public final synthetic b:Landroid/widget/ScrollView;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$b;Landroid/widget/ScrollView;Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xp8;->a:Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$b;

    iput-object p2, p0, Ll/xp8;->b:Landroid/widget/ScrollView;

    iput-object p3, p0, Ll/xp8;->c:Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xp8;->a:Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$b;

    iget-object v1, p0, Ll/xp8;->b:Landroid/widget/ScrollView;

    iget-object p0, p0, Ll/xp8;->c:Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$b;->a(Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$b;Landroid/widget/ScrollView;Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;)V

    return-void
.end method
