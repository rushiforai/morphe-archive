.class public final synthetic Ll/wxu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:Landroid/animation/Animator;


# direct methods
.method public synthetic constructor <init>(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wxu;->a:Landroid/animation/Animator;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wxu;->a:Landroid/animation/Animator;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->a(Landroid/animation/Animator;Landroid/content/DialogInterface;)V

    return-void
.end method
