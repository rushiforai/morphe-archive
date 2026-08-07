.class public final Ll/g4x0;
.super Ll/h4x0;
.source "SourceFile"


# direct methods
.method public constructor <init>([B)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/h4x0;-><init>([B)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a([BI)Ll/f4x0;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .line 1
    new-instance p0, Ll/e4x0;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Ll/e4x0;-><init>([BI)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
