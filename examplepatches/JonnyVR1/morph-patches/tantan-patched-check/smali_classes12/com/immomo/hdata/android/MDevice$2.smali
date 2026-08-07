.class final Lcom/immomo/hdata/android/MDevice$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rmw$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/hdata/android/MDevice;->getMMuidV3(Ljava/lang/String;Lcom/immomo/hdata/android/MDevice$MmuidCallBack;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field final synthetic val$callBack:Lcom/immomo/hdata/android/MDevice$MmuidCallBack;


# direct methods
.method public constructor <init>(Lcom/immomo/hdata/android/MDevice$MmuidCallBack;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/hdata/android/MDevice$2;->val$callBack:Lcom/immomo/hdata/android/MDevice$MmuidCallBack;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onMMUIDGetComplete(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/hdata/android/MDevice$2;->val$callBack:Lcom/immomo/hdata/android/MDevice$MmuidCallBack;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/immomo/hdata/android/MDevice$MmuidCallBack;->onMMUIDGetComplete(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onMMUIDGetError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/hdata/android/MDevice$2;->val$callBack:Lcom/immomo/hdata/android/MDevice$MmuidCallBack;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/immomo/hdata/android/MDevice$MmuidCallBack;->onMMUIDGetError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
