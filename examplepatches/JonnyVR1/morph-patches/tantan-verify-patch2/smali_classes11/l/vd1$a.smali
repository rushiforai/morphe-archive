.class public Ll/vd1$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/api/Api$ApiOptions$Optional;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/vd1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/vd1$a$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final d:Ll/vd1$a;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Z

.field public final c:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/vd1$a$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/vd1$a$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ll/vd1$a$a;->b()Ll/vd1$a;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Ll/vd1$a;->d:Ll/vd1$a;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Ll/vd1$a$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Ll/vd1$a$a;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Ll/vd1$a;->a:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v0, p1, Ll/vd1$a$a;->b:Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput-boolean v0, p0, Ll/vd1$a;->b:Z

    .line 15
    .line 16
    iget-object p1, p1, Ll/vd1$a$a;->c:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p1, p0, Ll/vd1$a;->c:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic b(Ll/vd1$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vd1$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ll/vd1$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/vd1$a;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic d(Ll/vd1$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vd1$a;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final a()Landroid/os/Bundle;
    .locals 3

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "consumer_package"

    .line 7
    .line 8
    iget-object v2, p0, Ll/vd1$a;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-string v1, "force_save_dialog"

    .line 14
    .line 15
    iget-boolean v2, p0, Ll/vd1$a;->b:Z

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 18
    .line 19
    .line 20
    const-string v1, "log_session_id"

    .line 21
    .line 22
    iget-object p0, p0, Ll/vd1$a;->c:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Ll/vd1$a;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Ll/vd1$a;

    .line 12
    .line 13
    iget-object v1, p0, Ll/vd1$a;->a:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Ll/vd1$a;->a:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1, v3}, Lcom/google/android/gms/common/internal/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-boolean v1, p0, Ll/vd1$a;->b:Z

    .line 24
    .line 25
    iget-boolean v3, p1, Ll/vd1$a;->b:Z

    .line 26
    .line 27
    if-ne v1, v3, :cond_2

    .line 28
    .line 29
    iget-object p0, p0, Ll/vd1$a;->c:Ljava/lang/String;

    .line 30
    .line 31
    iget-object p1, p1, Ll/vd1$a;->c:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {p0, p1}, Lcom/google/android/gms/common/internal/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    return v0

    .line 40
    :cond_2
    return v2
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vd1$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/vd1$a;->b:Z

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object p0, p0, Ll/vd1$a;->c:Ljava/lang/String;

    .line 10
    .line 11
    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Lcom/google/android/gms/common/internal/Objects;->hashCode([Ljava/lang/Object;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method
