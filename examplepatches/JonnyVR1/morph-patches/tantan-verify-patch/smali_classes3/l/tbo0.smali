.class public final synthetic Ll/tbo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xbo0;

.field public final synthetic b:Landroid/widget/PopupWindow;


# direct methods
.method public synthetic constructor <init>(Ll/xbo0;Landroid/widget/PopupWindow;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tbo0;->a:Ll/xbo0;

    iput-object p2, p0, Ll/tbo0;->b:Landroid/widget/PopupWindow;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tbo0;->a:Ll/xbo0;

    iget-object p0, p0, Ll/tbo0;->b:Landroid/widget/PopupWindow;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftTab$SortRule;

    invoke-static {v0, p0, p1}, Ll/xbo0;->G(Ll/xbo0;Landroid/widget/PopupWindow;Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftTab$SortRule;)V

    return-void
.end method
