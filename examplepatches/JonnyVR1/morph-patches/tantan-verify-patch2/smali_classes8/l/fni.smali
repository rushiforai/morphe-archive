.class public final synthetic Ll/fni;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:[Ll/kcg0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;

.field public final synthetic c:Ll/l4g0;


# direct methods
.method public synthetic constructor <init>([Ll/kcg0;Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fni;->a:[Ll/kcg0;

    iput-object p2, p0, Ll/fni;->b:Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;

    iput-object p3, p0, Ll/fni;->c:Ll/l4g0;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fni;->a:[Ll/kcg0;

    iget-object v1, p0, Ll/fni;->b:Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;

    iget-object p0, p0, Ll/fni;->c:Ll/l4g0;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;->E([Ll/kcg0;Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;Ll/l4g0;Landroid/content/DialogInterface;)V

    return-void
.end method
