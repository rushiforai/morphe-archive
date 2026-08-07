.class public final Ll/cfx0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Ll/cfx0;

.field public static final c:Ll/cfx0;

.field public static final d:Ll/cfx0;

.field public static final e:Ll/cfx0;

.field public static final f:Ll/cfx0;

.field public static final g:Ll/cfx0;

.field public static final h:Ll/cfx0;


# instance fields
.field public final a:Ll/bfx0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/cfx0;

    .line 2
    .line 3
    new-instance v1, Ll/gfx0;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/gfx0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/cfx0;-><init>(Ll/nfx0;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Ll/cfx0;->b:Ll/cfx0;

    .line 12
    .line 13
    new-instance v0, Ll/cfx0;

    .line 14
    .line 15
    new-instance v1, Ll/kfx0;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/kfx0;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-direct {v0, v1}, Ll/cfx0;-><init>(Ll/nfx0;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Ll/cfx0;->c:Ll/cfx0;

    .line 24
    .line 25
    new-instance v0, Ll/cfx0;

    .line 26
    .line 27
    new-instance v1, Ll/mfx0;

    .line 28
    .line 29
    invoke-direct {v1}, Ll/mfx0;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-direct {v0, v1}, Ll/cfx0;-><init>(Ll/nfx0;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Ll/cfx0;->d:Ll/cfx0;

    .line 36
    .line 37
    new-instance v0, Ll/cfx0;

    .line 38
    .line 39
    new-instance v1, Ll/lfx0;

    .line 40
    .line 41
    invoke-direct {v1}, Ll/lfx0;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-direct {v0, v1}, Ll/cfx0;-><init>(Ll/nfx0;)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Ll/cfx0;->e:Ll/cfx0;

    .line 48
    .line 49
    new-instance v0, Ll/cfx0;

    .line 50
    .line 51
    new-instance v1, Ll/hfx0;

    .line 52
    .line 53
    invoke-direct {v1}, Ll/hfx0;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-direct {v0, v1}, Ll/cfx0;-><init>(Ll/nfx0;)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Ll/cfx0;->f:Ll/cfx0;

    .line 60
    .line 61
    new-instance v0, Ll/cfx0;

    .line 62
    .line 63
    new-instance v1, Ll/jfx0;

    .line 64
    .line 65
    invoke-direct {v1}, Ll/jfx0;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-direct {v0, v1}, Ll/cfx0;-><init>(Ll/nfx0;)V

    .line 69
    .line 70
    .line 71
    sput-object v0, Ll/cfx0;->g:Ll/cfx0;

    .line 72
    .line 73
    new-instance v0, Ll/cfx0;

    .line 74
    .line 75
    new-instance v1, Ll/ifx0;

    .line 76
    .line 77
    invoke-direct {v1}, Ll/ifx0;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-direct {v0, v1}, Ll/cfx0;-><init>(Ll/nfx0;)V

    .line 81
    .line 82
    .line 83
    sput-object v0, Ll/cfx0;->h:Ll/cfx0;

    .line 84
    .line 85
    return-void
.end method

.method public constructor <init>(Ll/nfx0;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/t4x0;->b()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    const-string v0, "The Android Project"

    .line 12
    .line 13
    const-string v2, "java.vendor"

    .line 14
    .line 15
    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    new-instance v0, Ll/wex0;

    .line 26
    .line 27
    invoke-direct {v0, p1, v1}, Ll/wex0;-><init>(Ll/nfx0;Ll/vex0;)V

    .line 28
    .line 29
    .line 30
    :goto_0
    iput-object v0, p0, Ll/cfx0;->a:Ll/bfx0;

    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    new-instance v0, Ll/yex0;

    .line 34
    .line 35
    invoke-direct {v0, p1, v1}, Ll/yex0;-><init>(Ll/nfx0;Ll/xex0;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    new-instance v0, Ll/afx0;

    .line 40
    .line 41
    invoke-direct {v0, p1, v1}, Ll/afx0;-><init>(Ll/nfx0;Ll/zex0;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0
.end method

.method public static varargs b([Ljava/lang/String;)Ljava/util/List;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    array-length v2, p0

    .line 8
    if-ge v1, v2, :cond_1

    .line 9
    .line 10
    aget-object v2, p0, v1

    .line 11
    .line 12
    invoke-static {v2}, Ljava/security/Security;->getProvider(Ljava/lang/String;)Ljava/security/Provider;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    return-object v0
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cfx0;->a:Ll/bfx0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/bfx0;->zza(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
