.class final Lcom/immomo/hdata/android/MDevice$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rmw$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/hdata/android/MDevice;->init(Landroid/content/Context;Lcom/immomo/hdata/android/MDevice$Config;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field final synthetic val$config:Lcom/immomo/hdata/android/MDevice$Config;


# direct methods
.method public constructor <init>(Lcom/immomo/hdata/android/MDevice$Config;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/hdata/android/MDevice$1;->val$config:Lcom/immomo/hdata/android/MDevice$Config;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getDnsInstance()Lcom/immomo/mmdns/MDDNSEntrance;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/hdata/android/MDevice$1;->val$config:Lcom/immomo/hdata/android/MDevice$Config;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/immomo/hdata/android/MDevice$Config;->getDnsInstance()Lcom/immomo/mmdns/MDDNSEntrance;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
