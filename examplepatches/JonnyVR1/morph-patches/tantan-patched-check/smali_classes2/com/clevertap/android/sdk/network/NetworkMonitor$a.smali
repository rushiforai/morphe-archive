.class public final Lcom/clevertap/android/sdk/network/NetworkMonitor$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/clevertap/android/sdk/network/NetworkMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/clevertap/android/sdk/network/NetworkMonitor$a$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0011\u0008\u0086\u0008\u0018\u0000 \u001b2\u00020\u0001:\u0001\u0011B\u001b\u0012\u0008\u0008\u0002\u0010\u0003\u001a\u00020\u0002\u0012\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0010\u0010\t\u001a\u00020\u0008H\u00d6\u0001\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0010\u0010\u000c\u001a\u00020\u000bH\u00d6\u0001\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u001a\u0010\u000f\u001a\u00020\u00022\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003\u00a2\u0006\u0004\u0008\u000f\u0010\u0010R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0011\u0010\u0012\u001a\u0004\u0008\u0013\u0010\u0014R\u0017\u0010\u0005\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0015\u0010\u0016\u001a\u0004\u0008\u0017\u0010\u0018R\u0011\u0010\u001a\u001a\u00020\u00028F\u00a2\u0006\u0006\u001a\u0004\u0008\u0019\u0010\u0014\u00a8\u0006\u001c"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/network/NetworkMonitor$a;",
        "",
        "",
        "isAvailable",
        "Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;",
        "networkType",
        "<init>",
        "(ZLcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;)V",
        "",
        "toString",
        "()Ljava/lang/String;",
        "",
        "hashCode",
        "()I",
        "other",
        "equals",
        "(Ljava/lang/Object;)Z",
        "a",
        "Z",
        "d",
        "()Z",
        "b",
        "Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;",
        "c",
        "()Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;",
        "e",
        "isWifiConnected",
        "Companion",
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


# static fields
.field public static final Companion:Lcom/clevertap/android/sdk/network/NetworkMonitor$a$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final c:Lcom/clevertap/android/sdk/network/NetworkMonitor$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final d:Lcom/clevertap/android/sdk/network/NetworkMonitor$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field private final a:Z

.field private final b:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/clevertap/android/sdk/network/NetworkMonitor$a$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->Companion:Lcom/clevertap/android/sdk/network/NetworkMonitor$a$a;

    .line 8
    .line 9
    new-instance v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;

    .line 10
    .line 11
    sget-object v1, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->DISCONNECTED:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-direct {v0, v2, v1}, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;-><init>(ZLcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->c:Lcom/clevertap/android/sdk/network/NetworkMonitor$a;

    .line 18
    .line 19
    new-instance v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;

    .line 20
    .line 21
    sget-object v1, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->UNDETECTED:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 22
    .line 23
    invoke-direct {v0, v2, v1}, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;-><init>(ZLcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->d:Lcom/clevertap/android/sdk/network/NetworkMonitor$a;

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 19
    const/4 v0, 0x0

    const/4 v1, 0x3

    const/4 v2, 0x0

    invoke-direct {p0, v2, v0, v1, v0}, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;-><init>(ZLcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(ZLcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;)V
    .locals 0
    .param p2    # Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-boolean p1, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->a:Z

    .line 18
    iput-object p2, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->b:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    return-void
.end method

.method public synthetic constructor <init>(ZLcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    and-int/lit8 p4, p3, 0x1

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    :cond_0
    and-int/lit8 p3, p3, 0x2

    .line 7
    .line 8
    if-eqz p3, :cond_1

    .line 9
    .line 10
    sget-object p2, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->UNKNOWN:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 11
    .line 12
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;-><init>(ZLcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static final synthetic a()Lcom/clevertap/android/sdk/network/NetworkMonitor$a;
    .locals 1

    .line 1
    sget-object v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->c:Lcom/clevertap/android/sdk/network/NetworkMonitor$a;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic b()Lcom/clevertap/android/sdk/network/NetworkMonitor$a;
    .locals 1

    .line 1
    sget-object v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->d:Lcom/clevertap/android/sdk/network/NetworkMonitor$a;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public final c()Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->b:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public final e()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->b:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 6
    .line 7
    sget-object v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->WIFI:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;

    iget-boolean v1, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->a:Z

    iget-boolean v3, p1, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->a:Z

    if-eq v1, v3, :cond_2

    return v2

    :cond_2
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->b:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    iget-object p1, p1, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->b:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    if-eq p0, p1, :cond_3

    return v2

    :cond_3
    return v0
.end method

.method public hashCode()I
    .locals 1

    iget-boolean v0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->b:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr v0, p0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "NetworkState(isAvailable="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v1, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->a:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", networkType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->b:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p0, 0x29

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
