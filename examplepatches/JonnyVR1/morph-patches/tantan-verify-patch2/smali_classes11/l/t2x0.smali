.class public final Ll/t2x0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Ll/t2x0;

.field public static final c:Ll/t2x0;

.field public static final d:Ll/t2x0;

.field public static final e:Ll/t2x0;

.field public static final f:Ll/t2x0;

.field public static final g:Ll/t2x0;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/t2x0;

    .line 2
    .line 3
    const-string v1, "ASSUME_AES_GCM"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/t2x0;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/t2x0;->b:Ll/t2x0;

    .line 9
    .line 10
    new-instance v0, Ll/t2x0;

    .line 11
    .line 12
    const-string v1, "ASSUME_XCHACHA20POLY1305"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ll/t2x0;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Ll/t2x0;->c:Ll/t2x0;

    .line 18
    .line 19
    new-instance v0, Ll/t2x0;

    .line 20
    .line 21
    const-string v1, "ASSUME_CHACHA20POLY1305"

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ll/t2x0;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Ll/t2x0;->d:Ll/t2x0;

    .line 27
    .line 28
    new-instance v0, Ll/t2x0;

    .line 29
    .line 30
    const-string v1, "ASSUME_AES_CTR_HMAC"

    .line 31
    .line 32
    invoke-direct {v0, v1}, Ll/t2x0;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Ll/t2x0;->e:Ll/t2x0;

    .line 36
    .line 37
    new-instance v0, Ll/t2x0;

    .line 38
    .line 39
    const-string v1, "ASSUME_AES_EAX"

    .line 40
    .line 41
    invoke-direct {v0, v1}, Ll/t2x0;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    sput-object v0, Ll/t2x0;->f:Ll/t2x0;

    .line 45
    .line 46
    new-instance v0, Ll/t2x0;

    .line 47
    .line 48
    const-string v1, "ASSUME_AES_GCM_SIV"

    .line 49
    .line 50
    invoke-direct {v0, v1}, Ll/t2x0;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    sput-object v0, Ll/t2x0;->g:Ll/t2x0;

    .line 54
    .line 55
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/t2x0;->a:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t2x0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
