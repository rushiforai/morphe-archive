.class public final synthetic Ll/fvr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/fct0;


# static fields
.field public static final synthetic a:Ll/fvr0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/fvr0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/fvr0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/fvr0;->a:Ll/fvr0;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    const-string p0, "com.google.android.gms.ads.internal.client.IMobileAdsSettingManagerCreator"

    .line 6
    .line 7
    invoke-interface {p1, p0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    instance-of v0, p0, Ll/bqt0;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    check-cast p0, Ll/bqt0;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_1
    new-instance p0, Ll/bqt0;

    .line 19
    .line 20
    invoke-direct {p0, p1}, Ll/bqt0;-><init>(Landroid/os/IBinder;)V

    .line 21
    .line 22
    .line 23
    return-object p0
.end method
