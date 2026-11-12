.class public final Lvzc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final a:[B

.field public b:Ljavax/crypto/spec/SecretKeySpec;

.field public final synthetic c:Lg0d;


# direct methods
.method public constructor <init>(Lg0d;[B)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvzc;->c:Lg0d;

    iput-object p2, p0, Lvzc;->a:[B

    return-void
.end method


# virtual methods
.method public final a()Ljava/security/Key;
    .registers 6

    iget-object v0, p0, Lvzc;->b:Ljavax/crypto/spec/SecretKeySpec;

    if-nez v0, :cond_4e

    iget-object v0, p0, Lvzc;->c:Lg0d;

    iget-object v1, v0, Lg0d;->b:Lz4f;

    iget-object v2, p0, Lvzc;->a:[B

    invoke-virtual {v1, v2}, Lz4f;->a([B)[B

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_12

    return-object v2

    :cond_12
    sget-object v3, Lq36;->a:Ljava/security/SecureRandom;

    sget-object v3, Lm36;->a:[Lm36;

    sget-object v3, Ln36;->a:[I

    const/4 v4, 0x0

    aget v3, v3, v4

    const/4 v4, 0x1

    if-ne v3, v4, :cond_4a

    array-length v3, v1

    shl-int/lit8 v3, v3, 0x3

    invoke-static {v3}, Lq36;->a(I)Z

    move-result v3

    if-eqz v3, :cond_2e

    new-instance v2, Ljavax/crypto/spec/SecretKeySpec;

    const-string v3, "AES"

    invoke-direct {v2, v1, v3}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    :cond_2e
    iput-object v2, p0, Lvzc;->b:Ljavax/crypto/spec/SecretKeySpec;

    iget-object v0, v0, Lg0d;->a:Lumi;

    new-instance v1, Lrml;

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v1, v2, v0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Lrkc;

    const/16 v2, 0xa

    invoke-direct {v0, p0, v2}, Lrkc;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    sget-wide v1, Lg0d;->g:J

    invoke-virtual {v0, v1, v2}, Lplk;->q(J)V

    goto :goto_4e

    :cond_4a
    invoke-static {}, Lh9o;->p()V

    return-object v2

    :cond_4e
    :goto_4e
    iget-object p0, p0, Lvzc;->b:Ljavax/crypto/spec/SecretKeySpec;

    return-object p0
.end method

.method public final bridge synthetic get()Ljava/lang/Object;
    .registers 1

    invoke-virtual {p0}, Lvzc;->a()Ljava/security/Key;

    move-result-object p0

    return-object p0
.end method
