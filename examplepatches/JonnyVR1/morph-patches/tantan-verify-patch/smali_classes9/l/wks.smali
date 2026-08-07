.class public final synthetic Ll/wks;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/xks;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/xks;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wks;->a:Ll/xks;

    iput-object p2, p0, Ll/wks;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    iput-boolean p3, p0, Ll/wks;->c:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wks;->a:Ll/xks;

    iget-object v1, p0, Ll/wks;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    iget-boolean p0, p0, Ll/wks;->c:Z

    invoke-static {v0, v1, p0}, Ll/xks;->b(Ll/xks;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V

    return-void
.end method
