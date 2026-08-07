.class public final synthetic Ll/ygd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/uhd0;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;


# direct methods
.method public synthetic constructor <init>(Ll/uhd0;ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ygd0;->a:Ll/uhd0;

    iput-boolean p2, p0, Ll/ygd0;->b:Z

    iput-object p3, p0, Ll/ygd0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ygd0;->a:Ll/uhd0;

    iget-boolean v1, p0, Ll/ygd0;->b:Z

    iget-object p0, p0, Ll/ygd0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    check-cast p1, Lrx/Notification;

    invoke-static {v0, v1, p0, p1}, Ll/uhd0;->d4(Ll/uhd0;ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lrx/Notification;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
