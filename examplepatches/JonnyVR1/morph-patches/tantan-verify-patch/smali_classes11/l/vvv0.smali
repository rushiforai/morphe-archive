.class public final synthetic Ll/vvv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/eow0;


# instance fields
.field public final synthetic a:Ll/xvv0;


# direct methods
.method public synthetic constructor <init>(Ll/xvv0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vvv0;->a:Ll/xvv0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vvv0;->a:Ll/xvv0;

    .line 2
    .line 3
    check-cast p1, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$a;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xvv0;->a(Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$a;)Ll/yvv0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
