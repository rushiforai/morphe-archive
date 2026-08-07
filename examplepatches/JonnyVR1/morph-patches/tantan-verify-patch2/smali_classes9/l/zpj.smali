.class public final synthetic Ll/zpj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/MessageQueue$IdleHandler;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zpj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    return-void
.end method


# virtual methods
.method public final queueIdle()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zpj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->i0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;)Z

    move-result p0

    return p0
.end method
