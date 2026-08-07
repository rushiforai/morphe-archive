.class public final synthetic Lcom/ss/bytertc/base/media/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/base/media/RTCVSyncHelper$ChoreographerFrameCallback;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/base/media/RTCVSyncHelper$ChoreographerFrameCallback;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/ss/bytertc/base/media/a;->a:Lcom/ss/bytertc/base/media/RTCVSyncHelper$ChoreographerFrameCallback;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/a;->a:Lcom/ss/bytertc/base/media/RTCVSyncHelper$ChoreographerFrameCallback;

    invoke-static {p0}, Lcom/ss/bytertc/base/media/RTCVSyncHelper;->a(Lcom/ss/bytertc/base/media/RTCVSyncHelper$ChoreographerFrameCallback;)V

    return-void
.end method
