.class public final Ll/g0f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kzq;


# static fields
.field private static final b:Ll/g0f;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/g0f;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/g0f;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/g0f;->b:Ll/g0f;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static c()Ll/g0f;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    sget-object v0, Ll/g0f;->b:Ll/g0f;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(Ljava/security/MessageDigest;)V
    .locals 0
    .param p1    # Ljava/security/MessageDigest;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "EmptySignature"

    .line 2
    .line 3
    return-object p0
.end method
