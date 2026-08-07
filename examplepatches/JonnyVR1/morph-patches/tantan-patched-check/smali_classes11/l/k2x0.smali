.class public final Ll/k2x0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/wfx0;

.field public static final b:Ll/r6x0;

.field public static final c:Ll/n6x0;

.field public static final d:Ll/n5x0;

.field public static final e:Ll/j5x0;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const-string v0, "type.googleapis.com/google.crypto.tink.KmsAeadKey"

    .line 2
    .line 3
    invoke-static {v0}, Ll/u7x0;->a(Ljava/lang/String;)Ll/wfx0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/k2x0;->a:Ll/wfx0;

    .line 8
    .line 9
    sget-object v1, Ll/g2x0;->a:Ll/g2x0;

    .line 10
    .line 11
    const-class v2, Ll/f2x0;

    .line 12
    .line 13
    const-class v3, Ll/d7x0;

    .line 14
    .line 15
    invoke-static {v1, v2, v3}, Ll/r6x0;->b(Ll/p6x0;Ljava/lang/Class;Ljava/lang/Class;)Ll/r6x0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sput-object v1, Ll/k2x0;->b:Ll/r6x0;

    .line 20
    .line 21
    sget-object v1, Ll/h2x0;->a:Ll/h2x0;

    .line 22
    .line 23
    invoke-static {v1, v0, v3}, Ll/n6x0;->b(Ll/l6x0;Ll/wfx0;Ljava/lang/Class;)Ll/n6x0;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sput-object v1, Ll/k2x0;->c:Ll/n6x0;

    .line 28
    .line 29
    sget-object v1, Ll/i2x0;->a:Ll/i2x0;

    .line 30
    .line 31
    const-class v2, Ll/e2x0;

    .line 32
    .line 33
    const-class v3, Ll/c7x0;

    .line 34
    .line 35
    invoke-static {v1, v2, v3}, Ll/n5x0;->b(Ll/l5x0;Ljava/lang/Class;Ljava/lang/Class;)Ll/n5x0;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    sput-object v1, Ll/k2x0;->d:Ll/n5x0;

    .line 40
    .line 41
    sget-object v1, Ll/j2x0;->a:Ll/j2x0;

    .line 42
    .line 43
    invoke-static {v1, v0, v3}, Ll/j5x0;->b(Ll/h5x0;Ll/wfx0;Ljava/lang/Class;)Ll/j5x0;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sput-object v0, Ll/k2x0;->e:Ll/j5x0;

    .line 48
    .line 49
    return-void
.end method

.method public static a(Ll/j6x0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    sget-object v0, Ll/k2x0;->b:Ll/r6x0;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/j6x0;->j(Ll/r6x0;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/k2x0;->c:Ll/n6x0;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/j6x0;->i(Ll/n6x0;)V

    .line 9
    .line 10
    .line 11
    sget-object v0, Ll/k2x0;->d:Ll/n5x0;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/j6x0;->h(Ll/n5x0;)V

    .line 14
    .line 15
    .line 16
    sget-object v0, Ll/k2x0;->e:Ll/j5x0;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/j6x0;->g(Ll/j5x0;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
