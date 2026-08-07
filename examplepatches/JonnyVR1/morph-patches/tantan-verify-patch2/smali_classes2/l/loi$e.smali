.class public Ll/loi$e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/loi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation


# instance fields
.field public final a:Ljava/security/Signature;

.field public final b:Ljavax/crypto/Cipher;

.field public final c:Ljavax/crypto/Mac;


# direct methods
.method public constructor <init>(Ljava/security/Signature;)V
    .locals 0
    .param p1    # Ljava/security/Signature;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/loi$e;->a:Ljava/security/Signature;

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-object p1, p0, Ll/loi$e;->b:Ljavax/crypto/Cipher;

    .line 8
    .line 9
    iput-object p1, p0, Ll/loi$e;->c:Ljavax/crypto/Mac;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Ljavax/crypto/Cipher;)V
    .locals 0
    .param p1    # Ljavax/crypto/Cipher;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Ll/loi$e;->b:Ljavax/crypto/Cipher;

    const/4 p1, 0x0

    .line 14
    iput-object p1, p0, Ll/loi$e;->a:Ljava/security/Signature;

    .line 15
    iput-object p1, p0, Ll/loi$e;->c:Ljavax/crypto/Mac;

    return-void
.end method

.method public constructor <init>(Ljavax/crypto/Mac;)V
    .locals 0
    .param p1    # Ljavax/crypto/Mac;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Ll/loi$e;->c:Ljavax/crypto/Mac;

    const/4 p1, 0x0

    .line 18
    iput-object p1, p0, Ll/loi$e;->b:Ljavax/crypto/Cipher;

    .line 19
    iput-object p1, p0, Ll/loi$e;->a:Ljava/security/Signature;

    return-void
.end method


# virtual methods
.method public a()Ljavax/crypto/Cipher;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/loi$e;->b:Ljavax/crypto/Cipher;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljavax/crypto/Mac;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/loi$e;->c:Ljavax/crypto/Mac;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/security/Signature;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/loi$e;->a:Ljava/security/Signature;

    .line 2
    .line 3
    return-object p0
.end method
