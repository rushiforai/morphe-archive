.class Ll/mwd0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mxf$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/mwd0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/mxf$d<",
        "Ll/mwd0$b;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Ll/mwd0;


# direct methods
.method public constructor <init>(Ll/mwd0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mwd0$a;->a:Ll/mwd0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Ll/mwd0$b;
    .locals 1

    .line 1
    :try_start_0
    new-instance p0, Ll/mwd0$b;

    .line 2
    .line 3
    const-string v0, "SHA-256"

    .line 4
    .line 5
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p0, v0}, Ll/mwd0$b;-><init>(Ljava/security/MessageDigest;)V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :catch_0
    move-exception p0

    .line 14
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public bridge synthetic create()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mwd0$a;->a()Ll/mwd0$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
