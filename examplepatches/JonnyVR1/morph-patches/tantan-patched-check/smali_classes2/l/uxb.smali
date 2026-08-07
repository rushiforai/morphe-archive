.class public final Ll/uxb;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0011\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0017\u0010\r\u001a\u00020\u000c2\u0006\u0010\u000b\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u000f\u0010\u0010\u001a\u00020\u000fH\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u000f\u0010\u0012\u001a\u00020\u000fH\u0016\u00a2\u0006\u0004\u0008\u0012\u0010\u0011J\u0017\u0010\u0014\u001a\u00020\u000c2\u0006\u0010\u0013\u001a\u00020\u000fH\u0016\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u0017\u0010\u0017\u001a\u00020\u000c2\u0006\u0010\u0016\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u0017\u0010\u000eR\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\t\u0010\u0018\u001a\u0004\u0008\u0019\u0010\u001aR\u0017\u0010\u0005\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0012\u0010\u001b\u001a\u0004\u0008\u001c\u0010\u001dR\u0016\u0010\u001f\u001a\u00020\u000f8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0010\u0010\u001e\u00a8\u0006 "
    }
    d2 = {
        "Ll/uxb;",
        "",
        "Landroid/content/Context;",
        "context",
        "",
        "accountId",
        "<init>",
        "(Landroid/content/Context;Ljava/lang/String;)V",
        "",
        "a",
        "()Z",
        "migrated",
        "",
        "e",
        "(Z)V",
        "",
        "c",
        "()I",
        "b",
        "configEncryptionLevel",
        "d",
        "(I)V",
        "migrationSuccessful",
        "f",
        "Landroid/content/Context;",
        "getContext",
        "()Landroid/content/Context;",
        "Ljava/lang/String;",
        "getAccountId",
        "()Ljava/lang/String;",
        "I",
        "migrationFailureCount",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final a:Landroid/content/Context;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final b:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private c:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/uxb;->a:Landroid/content/Context;

    .line 11
    .line 12
    iput-object p2, p0, Ll/uxb;->b:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uxb;->a:Landroid/content/Context;

    .line 2
    .line 3
    iget-object p0, p0, Ll/uxb;->b:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "ssInAppMigrated"

    .line 6
    .line 7
    invoke-static {v0, p0, v1}, Ll/v5g0;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public b()I
    .locals 3

    .line 1
    iget-object v0, p0, Ll/uxb;->a:Landroid/content/Context;

    .line 2
    .line 3
    iget-object p0, p0, Ll/uxb;->b:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "encryptionMigrationFailureCount"

    .line 6
    .line 7
    const/4 v2, -0x1

    .line 8
    invoke-static {v0, p0, v1, v2}, Ll/v5g0;->d(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public c()I
    .locals 3

    .line 1
    iget-object v0, p0, Ll/uxb;->a:Landroid/content/Context;

    .line 2
    .line 3
    iget-object p0, p0, Ll/uxb;->b:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "encryptionLevel"

    .line 6
    .line 7
    const/4 v2, -0x1

    .line 8
    invoke-static {v0, p0, v1, v2}, Ll/v5g0;->d(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public d(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uxb;->a:Landroid/content/Context;

    .line 2
    .line 3
    iget-object p0, p0, Ll/uxb;->b:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "encryptionLevel"

    .line 6
    .line 7
    invoke-static {v0, p0, v1, p1}, Ll/v5g0;->r(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public e(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uxb;->a:Landroid/content/Context;

    .line 2
    .line 3
    iget-object p0, p0, Ll/uxb;->b:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "ssInAppMigrated"

    .line 6
    .line 7
    invoke-static {v0, p0, v1, p1}, Ll/v5g0;->n(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public f(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    iget p1, p0, Ll/uxb;->c:I

    .line 6
    .line 7
    add-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    :goto_0
    iput p1, p0, Ll/uxb;->c:I

    .line 10
    .line 11
    iget-object p1, p0, Ll/uxb;->b:Ljava/lang/String;

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v1, "Updating migrationFailureCount to "

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget v1, p0, Ll/uxb;->c:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {p1, v0}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/uxb;->a:Landroid/content/Context;

    .line 33
    .line 34
    iget-object v0, p0, Ll/uxb;->b:Ljava/lang/String;

    .line 35
    .line 36
    const-string v1, "encryptionMigrationFailureCount"

    .line 37
    .line 38
    iget p0, p0, Ll/uxb;->c:I

    .line 39
    .line 40
    invoke-static {p1, v0, v1, p0}, Ll/v5g0;->r(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
