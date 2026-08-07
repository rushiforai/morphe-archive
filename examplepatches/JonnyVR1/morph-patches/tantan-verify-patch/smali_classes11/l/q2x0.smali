.class public final Ll/q2x0;
.super Ll/fyw0;
.source "SourceFile"


# instance fields
.field public final a:Ll/v2x0;


# direct methods
.method public constructor <init>(Ll/v2x0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fyw0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/q2x0;->a:Ll/v2x0;

    .line 5
    .line 6
    return-void
.end method

.method public static a(Ll/v2x0;)Ll/q2x0;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/q2x0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/q2x0;-><init>(Ll/v2x0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public final b()Ll/v2x0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q2x0;->a:Ll/v2x0;

    .line 2
    .line 3
    return-object p0
.end method
