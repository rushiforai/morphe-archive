.class public abstract Lq36;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/security/SecureRandom;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    sput-object v0, Lq36;->a:Ljava/security/SecureRandom;

    return-void
.end method

.method public static a(I)Z
    .registers 4

    sget-object v0, Lm36;->a:[Lm36;

    sget-object v0, Ln36;->a:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    const/4 v2, 0x1

    if-ne v0, v2, :cond_14

    const/16 v0, 0x80

    if-eq p0, v0, :cond_13

    const/16 v0, 0x100

    if-eq p0, v0, :cond_13

    return v1

    :cond_13
    return v2

    :cond_14
    invoke-static {}, Lh9o;->p()V

    return v1
.end method
