.class public final Ll/eax0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s8x0;


# instance fields
.field public final a:Ll/z8x0;


# direct methods
.method public constructor <init>(Ll/z8x0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    invoke-static {v0}, Ll/s4x0;->a(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iput-object p1, p0, Ll/eax0;->a:Ll/z8x0;

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string p0, "Can not use HMAC in FIPS-mode, as BoringCrypto module is not available."

    .line 15
    .line 16
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    throw p0
.end method
