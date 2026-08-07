.class public final synthetic Ll/kku;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/oku;


# direct methods
.method public synthetic constructor <init>(Ll/oku;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kku;->a:Ll/oku;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kku;->a:Ll/oku;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftDialogBottomBar;->h0(Ll/oku;Landroid/view/View;)V

    return-void
.end method
