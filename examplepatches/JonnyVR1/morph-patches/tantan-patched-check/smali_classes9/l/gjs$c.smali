.class public final Ll/gjs$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w8e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/gjs;->m(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\'\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0004*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0017\u0010\t\u001a\u00020\u00042\u0006\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0017\u0010\r\u001a\u00020\u00042\u0006\u0010\u000c\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000e\u00a8\u0006\u000f"
    }
    d2 = {
        "l/gjs$c",
        "Ll/w8e;",
        "",
        "progress",
        "",
        "b",
        "(I)V",
        "Ljava/io/File;",
        "file",
        "a",
        "(Ljava/io/File;)V",
        "",
        "errMsg",
        "onFailed",
        "(Ljava/lang/String;)V",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Ll/gjs;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;

.field public final synthetic c:I

.field public final synthetic d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/gjs;Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gjs;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;",
            "I",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/gjs$c;->a:Ll/gjs;

    .line 2
    .line 3
    iput-object p2, p0, Ll/gjs$c;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;

    .line 4
    .line 5
    iput p3, p0, Ll/gjs$c;->c:I

    .line 6
    .line 7
    iput-object p4, p0, Ll/gjs$c;->d:Ljava/util/List;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Ljava/io/File;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/gjs$c;->a:Ll/gjs;

    .line 5
    .line 6
    iget-object v1, p0, Ll/gjs$c;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;

    .line 7
    .line 8
    iget-object p0, p0, Ll/gjs$c;->d:Ljava/util/List;

    .line 9
    .line 10
    invoke-static {v0, v1, p0, p1}, Ll/gjs;->d(Ll/gjs;Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;Ljava/util/List;Ljava/io/File;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public b(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gjs$c;->a:Ll/gjs;

    .line 2
    .line 3
    iget-object v1, p0, Ll/gjs$c;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;

    .line 4
    .line 5
    iget p0, p0, Ll/gjs$c;->c:I

    .line 6
    .line 7
    invoke-static {v0, v1, p1, p0}, Ll/gjs;->c(Ll/gjs;Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public bridge c(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/w8e;->c(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge d(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/w8e;->d(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge onCancel()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/w8e;->onCancel()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFailed(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/gjs$c;->a:Ll/gjs;

    .line 5
    .line 6
    invoke-static {p0, p1}, Ll/gjs;->b(Ll/gjs;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public bridge onStart()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/w8e;->onStart()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
