.class public final Ll/q5x0;
.super Ll/xww0;
.source "SourceFile"


# instance fields
.field public final a:Ll/c7x0;


# direct methods
.method public constructor <init>(Ll/c7x0;Ll/ayw0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/xww0;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1, p2}, Ll/q5x0;->c(Ll/c7x0;Ll/ayw0;)V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/q5x0;->a:Ll/c7x0;

    .line 8
    .line 9
    return-void
.end method

.method public static c(Ll/c7x0;Ll/ayw0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    sget-object p1, Ll/p5x0;->b:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/c7x0;->b()Lcom/google/android/gms/internal/ads/zzgus;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    aget p0, p1, p0

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a(Ll/ayw0;)Ll/c7x0;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/q5x0;->a:Ll/c7x0;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/q5x0;->c(Ll/c7x0;Ll/ayw0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/q5x0;->a:Ll/c7x0;

    .line 7
    .line 8
    return-object p0
.end method

.method public final b()Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q5x0;->a:Ll/c7x0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/c7x0;->e()Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
