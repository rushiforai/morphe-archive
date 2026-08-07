.class public final synthetic Ll/j4m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j4m0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;

    iput-boolean p2, p0, Ll/j4m0;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j4m0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;

    iget-boolean p0, p0, Ll/j4m0;->b:Z

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualSwitchButton;Z)V

    return-void
.end method
