.class Lorg/eclipse/jetty/security/authentication/DigestAuthenticator$Nonce;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/security/authentication/DigestAuthenticator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Nonce"
.end annotation


# instance fields
.field _nc:Ljava/util/concurrent/atomic/AtomicInteger;

.field final _nonce:Ljava/lang/String;

.field final _ts:J


# direct methods
.method public constructor <init>(Ljava/lang/String;J)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/eclipse/jetty/security/authentication/DigestAuthenticator$Nonce;->_nc:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 10
    .line 11
    iput-object p1, p0, Lorg/eclipse/jetty/security/authentication/DigestAuthenticator$Nonce;->_nonce:Ljava/lang/String;

    .line 12
    .line 13
    iput-wide p2, p0, Lorg/eclipse/jetty/security/authentication/DigestAuthenticator$Nonce;->_ts:J

    .line 14
    .line 15
    return-void
.end method
