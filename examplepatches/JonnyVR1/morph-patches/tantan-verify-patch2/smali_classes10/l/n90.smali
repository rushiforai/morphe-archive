.class public final synthetic Ll/n90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;

.field public final synthetic b:Ljava/io/File;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;Ljava/io/File;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n90;->a:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;

    iput-object p2, p0, Ll/n90;->b:Ljava/io/File;

    iput-object p3, p0, Ll/n90;->c:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n90;->a:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;

    iget-object v1, p0, Ll/n90;->b:Ljava/io/File;

    iget-object p0, p0, Ll/n90;->c:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->a(Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;Ljava/io/File;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    return-void
.end method
