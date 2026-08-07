.class public abstract Lcom/p1/mobile/threadhook/AbsHook;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/threadhook/AbsHook$Status;
    }
.end annotation


# instance fields
.field private mStatus:Lcom/p1/mobile/threadhook/AbsHook$Status;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/threadhook/AbsHook$Status;->UNCOMMIT:Lcom/p1/mobile/threadhook/AbsHook$Status;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/threadhook/AbsHook;->mStatus:Lcom/p1/mobile/threadhook/AbsHook$Status;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public abstract getNativeLibraryName()Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public getStatus()Lcom/p1/mobile/threadhook/AbsHook$Status;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/threadhook/AbsHook;->mStatus:Lcom/p1/mobile/threadhook/AbsHook$Status;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract onConfigure()Z
.end method

.method public abstract onHook(Z)Z
.end method

.method public setStatus(Lcom/p1/mobile/threadhook/AbsHook$Status;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/threadhook/AbsHook;->mStatus:Lcom/p1/mobile/threadhook/AbsHook$Status;

    .line 2
    .line 3
    return-void
.end method
