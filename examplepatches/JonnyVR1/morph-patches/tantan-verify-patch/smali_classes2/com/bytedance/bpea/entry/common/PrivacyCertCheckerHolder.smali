.class public final Lcom/bytedance/bpea/entry/common/PrivacyCertCheckerHolder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u001a\u0010\u0005\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u00082\u0006\u0010\t\u001a\u00020\nR\u0010\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/bytedance/bpea/entry/common/PrivacyCertCheckerHolder;",
        "",
        "()V",
        "certChecker",
        "Lcom/bytedance/bpea/basics/CertChecker;",
        "check",
        "Lcom/bytedance/bpea/basics/CheckResult;",
        "cert",
        "Lcom/bytedance/bpea/basics/Cert;",
        "certContext",
        "Lcom/bytedance/bpea/basics/CertContext;",
        "common-entry_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/bytedance/bpea/entry/common/PrivacyCertCheckerHolder;

.field private static certChecker:Lcom/bytedance/bpea/basics/CertChecker;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/bytedance/bpea/entry/common/PrivacyCertCheckerHolder;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/bytedance/bpea/entry/common/PrivacyCertCheckerHolder;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/bytedance/bpea/entry/common/PrivacyCertCheckerHolder;->INSTANCE:Lcom/bytedance/bpea/entry/common/PrivacyCertCheckerHolder;

    .line 7
    .line 8
    :try_start_0
    const-string v0, "com.bytedance.bpea.core.checker.CertCheckerProvider"

    .line 9
    .line 10
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "INSTANCE"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    const/4 v2, 0x1

    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 25
    .line 26
    .line 27
    const/4 v3, 0x0

    .line 28
    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v3, "CHECKER"

    .line 33
    .line 34
    invoke-virtual {v0, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v2}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    check-cast v0, Lcom/bytedance/bpea/basics/CertChecker;

    .line 51
    .line 52
    sput-object v0, Lcom/bytedance/bpea/entry/common/PrivacyCertCheckerHolder;->certChecker:Lcom/bytedance/bpea/basics/CertChecker;

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    new-instance v0, Lkotlin/TypeCastException;

    .line 56
    .line 57
    const-string v1, "null cannot be cast to non-null type com.bytedance.bpea.basics.CertChecker"

    .line 58
    .line 59
    invoke-direct {v0, v1}, Lkotlin/TypeCastException;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    :catchall_0
    :goto_0
    sget-object v0, Lcom/bytedance/bpea/entry/common/PrivacyCertCheckerHolder;->certChecker:Lcom/bytedance/bpea/basics/CertChecker;

    .line 64
    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    sget-object v0, Lcom/bytedance/bpea/basics/BPEALogUtil;->INSTANCE:Lcom/bytedance/bpea/basics/BPEALogUtil;

    .line 68
    .line 69
    const-string v1, "checker working"

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Lcom/bytedance/bpea/basics/BPEALogUtil;->d(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_1
    sget-object v0, Lcom/bytedance/bpea/basics/BPEALogUtil;->INSTANCE:Lcom/bytedance/bpea/basics/BPEALogUtil;

    .line 76
    .line 77
    const-string v1, "checker not work"

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Lcom/bytedance/bpea/basics/BPEALogUtil;->d(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    :goto_1
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


# virtual methods
.method public final check(Lcom/bytedance/bpea/basics/Cert;Lcom/bytedance/bpea/basics/CertContext;)Lcom/bytedance/bpea/basics/CheckResult;
    .locals 0
    .param p1    # Lcom/bytedance/bpea/basics/Cert;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/bytedance/bpea/basics/CertContext;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/bytedance/bpea/basics/BPEAException;
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/bytedance/bpea/entry/common/PrivacyCertCheckerHolder;->certChecker:Lcom/bytedance/bpea/basics/CertChecker;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1, p2}, Lcom/bytedance/bpea/basics/CertChecker;->check(Lcom/bytedance/bpea/basics/Cert;Lcom/bytedance/bpea/basics/CertContext;)Lcom/bytedance/bpea/basics/CheckResult;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method
