.class public final synthetic Ll/tks;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z9m;


# instance fields
.field public final synthetic a:Ll/uks;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/uks;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tks;->a:Ll/uks;

    iput-object p2, p0, Ll/tks;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    iput-boolean p3, p0, Ll/tks;->c:Z

    return-void
.end method


# virtual methods
.method public final onError(ILjava/lang/String;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tks;->a:Ll/uks;

    iget-object v1, p0, Ll/tks;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    iget-boolean p0, p0, Ll/tks;->c:Z

    invoke-static {v0, v1, p0, p1, p2}, Ll/uks;->c(Ll/uks;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZILjava/lang/String;)Z

    move-result p0

    return p0
.end method
