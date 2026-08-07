.class public Ll/nml;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljavax/servlet/annotation/ServletSecurity$EmptyRoleSemantic;

.field public b:Ljavax/servlet/annotation/ServletSecurity$TransportGuarantee;

.field public c:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 27
    sget-object v0, Ljavax/servlet/annotation/ServletSecurity$EmptyRoleSemantic;->PERMIT:Ljavax/servlet/annotation/ServletSecurity$EmptyRoleSemantic;

    invoke-direct {p0, v0}, Ll/nml;-><init>(Ljavax/servlet/annotation/ServletSecurity$EmptyRoleSemantic;)V

    return-void
.end method

.method public constructor <init>(Ljavax/servlet/annotation/ServletSecurity$EmptyRoleSemantic;)V
    .locals 2

    .line 26
    sget-object v0, Ljavax/servlet/annotation/ServletSecurity$TransportGuarantee;->NONE:Ljavax/servlet/annotation/ServletSecurity$TransportGuarantee;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-direct {p0, p1, v0, v1}, Ll/nml;-><init>(Ljavax/servlet/annotation/ServletSecurity$EmptyRoleSemantic;Ljavax/servlet/annotation/ServletSecurity$TransportGuarantee;[Ljava/lang/String;)V

    return-void
.end method

.method public varargs constructor <init>(Ljavax/servlet/annotation/ServletSecurity$EmptyRoleSemantic;Ljavax/servlet/annotation/ServletSecurity$TransportGuarantee;[Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljavax/servlet/annotation/ServletSecurity$EmptyRoleSemantic;->DENY:Ljavax/servlet/annotation/ServletSecurity$EmptyRoleSemantic;

    .line 5
    .line 6
    if-ne p1, v0, :cond_1

    .line 7
    .line 8
    array-length v0, p3

    .line 9
    if-gtz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p0, "Deny semantic with rolesAllowed"

    .line 13
    .line 14
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    throw p0

    .line 19
    :cond_1
    :goto_0
    iput-object p1, p0, Ll/nml;->a:Ljavax/servlet/annotation/ServletSecurity$EmptyRoleSemantic;

    .line 20
    .line 21
    iput-object p2, p0, Ll/nml;->b:Ljavax/servlet/annotation/ServletSecurity$TransportGuarantee;

    .line 22
    .line 23
    iput-object p3, p0, Ll/nml;->c:[Ljava/lang/String;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public a()Ljavax/servlet/annotation/ServletSecurity$EmptyRoleSemantic;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nml;->a:Ljavax/servlet/annotation/ServletSecurity$EmptyRoleSemantic;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()[Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nml;->c:[Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljavax/servlet/annotation/ServletSecurity$TransportGuarantee;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nml;->b:Ljavax/servlet/annotation/ServletSecurity$TransportGuarantee;

    .line 2
    .line 3
    return-object p0
.end method
