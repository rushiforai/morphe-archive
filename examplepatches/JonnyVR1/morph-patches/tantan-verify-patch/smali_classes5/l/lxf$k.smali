.class public Ll/lxf$k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/idv/identity/platform/api/IdentityCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/lxf;->q(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ltl$b;

.field public final synthetic b:Ll/lxf;


# direct methods
.method public constructor <init>(Ll/lxf;Ll/ltl$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lxf$k;->b:Ll/lxf;

    .line 2
    .line 3
    iput-object p2, p0, Ll/lxf$k;->a:Ll/ltl$b;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public response(Lcom/idv/identity/platform/api/IdentityResponse;)Z
    .locals 12

    .line 1
    new-instance v0, Ll/kxf;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/kxf;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/16 v2, 0x3ea

    .line 10
    .line 11
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    const/16 v2, 0x3eb

    .line 16
    .line 17
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    const/16 v2, 0x3ec

    .line 22
    .line 23
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    const/16 v2, 0x3ee

    .line 28
    .line 29
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    const/16 v2, 0x3f1

    .line 34
    .line 35
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v7

    .line 39
    const/16 v2, 0x3f3

    .line 40
    .line 41
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object v8

    .line 45
    const/16 v2, 0x3f4

    .line 46
    .line 47
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v9

    .line 51
    const/16 v2, 0x3f5

    .line 52
    .line 53
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object v10

    .line 57
    const/16 v2, 0x3f6

    .line 58
    .line 59
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object v11

    .line 63
    filled-new-array/range {v3 .. v11}, [Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    iget v3, p1, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 72
    .line 73
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    xor-int/2addr v2, v1

    .line 82
    iput-boolean v2, v0, Ll/kxf;->h:Z

    .line 83
    .line 84
    iget v2, p1, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 85
    .line 86
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    iput-object v2, v0, Ll/kxf;->b:Ljava/lang/String;

    .line 91
    .line 92
    iget-object p1, p1, Lcom/idv/identity/platform/api/IdentityResponse;->message:Ljava/lang/String;

    .line 93
    .line 94
    iput-object p1, v0, Ll/kxf;->d:Ljava/lang/String;

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_0
    const/4 p1, 0x0

    .line 98
    iput-boolean p1, v0, Ll/kxf;->h:Z

    .line 99
    .line 100
    const-string p1, "IdentityResponse is null"

    .line 101
    .line 102
    iput-object p1, v0, Ll/kxf;->g:Ljava/lang/String;

    .line 103
    .line 104
    :goto_0
    iget-object p0, p0, Ll/lxf$k;->a:Ll/ltl$b;

    .line 105
    .line 106
    if-eqz p0, :cond_1

    .line 107
    .line 108
    invoke-interface {p0, v0}, Ll/ltl$b;->a(Ll/kxf;)V

    .line 109
    .line 110
    .line 111
    :cond_1
    return v1
.end method
