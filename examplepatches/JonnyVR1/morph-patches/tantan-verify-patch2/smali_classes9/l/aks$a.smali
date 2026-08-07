.class public Ll/aks$a;
.super Ll/x8e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/aks;->N3(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

.field public final synthetic b:Z

.field public final synthetic c:Ll/aks;


# direct methods
.method public constructor <init>(Ll/aks;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aks$a;->c:Ll/aks;

    .line 2
    .line 3
    iput-object p2, p0, Ll/aks$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/aks$a;->b:Z

    .line 6
    .line 7
    invoke-direct {p0}, Ll/x8e;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onFailed(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/aks$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->v()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-boolean p0, p0, Ll/aks$a;->b:Z

    .line 8
    .line 9
    invoke-static {p1, v0, p0}, Ll/e4d0;->b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)Ll/e4d0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ll/rre;->f(Ll/e4d0;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
