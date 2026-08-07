.class public Lcom/cmic/sso/sdk/a/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cmic/sso/sdk/a/a$a;
    }
.end annotation


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;

.field private d:Ljava/lang/String;

.field private e:Z

.field private f:Z

.field private g:Z

.field private h:Z

.field private i:Z

.field private j:Z

.field private k:I

.field private l:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "rcs.cmpassport.com"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/cmic/sso/sdk/a/a;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/cmic/sso/sdk/a/a;->b:Ljava/lang/String;

    .line 9
    .line 10
    const-string v0, "config2.cmpassport.com"

    .line 11
    .line 12
    iput-object v0, p0, Lcom/cmic/sso/sdk/a/a;->c:Ljava/lang/String;

    .line 13
    .line 14
    const-string v0, "log2.cmpassport.com:9443"

    .line 15
    .line 16
    iput-object v0, p0, Lcom/cmic/sso/sdk/a/a;->d:Ljava/lang/String;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Lcom/cmic/sso/sdk/a/a;->e:Z

    .line 20
    .line 21
    iput-boolean v0, p0, Lcom/cmic/sso/sdk/a/a;->f:Z

    .line 22
    .line 23
    iput-boolean v0, p0, Lcom/cmic/sso/sdk/a/a;->g:Z

    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/cmic/sso/sdk/a/a;->h:Z

    .line 26
    .line 27
    iput-boolean v0, p0, Lcom/cmic/sso/sdk/a/a;->i:Z

    .line 28
    .line 29
    iput-boolean v0, p0, Lcom/cmic/sso/sdk/a/a;->j:Z

    .line 30
    .line 31
    const/4 v0, 0x3

    .line 32
    iput v0, p0, Lcom/cmic/sso/sdk/a/a;->k:I

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    iput v0, p0, Lcom/cmic/sso/sdk/a/a;->l:I

    .line 36
    .line 37
    return-void
.end method

.method public synthetic constructor <init>(Lcom/cmic/sso/sdk/a/a$1;)V
    .locals 0

    .line 38
    invoke-direct {p0}, Lcom/cmic/sso/sdk/a/a;-><init>()V

    return-void
.end method

.method public static synthetic a(Lcom/cmic/sso/sdk/a/a;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/cmic/sso/sdk/a/a;->k:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic a(Lcom/cmic/sso/sdk/a/a;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 4
    iput-object p1, p0, Lcom/cmic/sso/sdk/a/a;->a:Ljava/lang/String;

    return-object p1
.end method

.method public static synthetic a(Lcom/cmic/sso/sdk/a/a;Z)Z
    .locals 0

    .line 5
    iput-boolean p1, p0, Lcom/cmic/sso/sdk/a/a;->e:Z

    return p1
.end method

.method public static synthetic b(Lcom/cmic/sso/sdk/a/a;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/cmic/sso/sdk/a/a;->l:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic b(Lcom/cmic/sso/sdk/a/a;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 4
    iput-object p1, p0, Lcom/cmic/sso/sdk/a/a;->b:Ljava/lang/String;

    return-object p1
.end method

.method public static synthetic b(Lcom/cmic/sso/sdk/a/a;Z)Z
    .locals 0

    .line 5
    iput-boolean p1, p0, Lcom/cmic/sso/sdk/a/a;->f:Z

    return p1
.end method

.method public static synthetic c(Lcom/cmic/sso/sdk/a/a;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cmic/sso/sdk/a/a;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic c(Lcom/cmic/sso/sdk/a/a;Z)Z
    .locals 0

    .line 4
    iput-boolean p1, p0, Lcom/cmic/sso/sdk/a/a;->g:Z

    return p1
.end method

.method public static synthetic d(Lcom/cmic/sso/sdk/a/a;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cmic/sso/sdk/a/a;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic d(Lcom/cmic/sso/sdk/a/a;Z)Z
    .locals 0

    .line 4
    iput-boolean p1, p0, Lcom/cmic/sso/sdk/a/a;->h:Z

    return p1
.end method

.method public static synthetic e(Lcom/cmic/sso/sdk/a/a;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/cmic/sso/sdk/a/a;->i:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic f(Lcom/cmic/sso/sdk/a/a;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/cmic/sso/sdk/a/a;->j:Z

    .line 2
    .line 3
    return p1
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 6
    iget-object p0, p0, Lcom/cmic/sso/sdk/a/a;->a:Ljava/lang/String;

    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 6
    iget-object p0, p0, Lcom/cmic/sso/sdk/a/a;->b:Ljava/lang/String;

    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 5
    iget-object p0, p0, Lcom/cmic/sso/sdk/a/a;->c:Ljava/lang/String;

    return-object p0
.end method

.method public synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/cmic/sso/sdk/a/a;->m()Lcom/cmic/sso/sdk/a/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 5
    iget-object p0, p0, Lcom/cmic/sso/sdk/a/a;->d:Ljava/lang/String;

    return-object p0
.end method

.method public e()Z
    .locals 0

    .line 4
    iget-boolean p0, p0, Lcom/cmic/sso/sdk/a/a;->e:Z

    return p0
.end method

.method public f()Z
    .locals 0

    .line 4
    iget-boolean p0, p0, Lcom/cmic/sso/sdk/a/a;->f:Z

    return p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/cmic/sso/sdk/a/a;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/cmic/sso/sdk/a/a;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/cmic/sso/sdk/a/a;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method public j()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/cmic/sso/sdk/a/a;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public k()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/cmic/sso/sdk/a/a;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public l()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/cmic/sso/sdk/a/a;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public m()Lcom/cmic/sso/sdk/a/a;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/cmic/sso/sdk/a/a;

    .line 6
    .line 7
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "UmcConfigBean{mHttpsGetTokenHost=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/cmic/sso/sdk/a/a;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', mHttpsGetPhoneScripHost=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/cmic/sso/sdk/a/a;->b:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', mConfigHost=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/cmic/sso/sdk/a/a;->c:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "\', mLogHost=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/cmic/sso/sdk/a/a;->d:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "\', mCloseCtccWork="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-boolean v1, p0, Lcom/cmic/sso/sdk/a/a;->e:Z

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", mCloseCuccWort="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-boolean v1, p0, Lcom/cmic/sso/sdk/a/a;->f:Z

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", mCloseM008Business="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-boolean v1, p0, Lcom/cmic/sso/sdk/a/a;->g:Z

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ", mCloseGetPhoneIpv4="

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-boolean v1, p0, Lcom/cmic/sso/sdk/a/a;->h:Z

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, ", mCloseGetPhoneIpv6="

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-boolean v1, p0, Lcom/cmic/sso/sdk/a/a;->i:Z

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, ", mCloseLog="

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget-boolean v1, p0, Lcom/cmic/sso/sdk/a/a;->j:Z

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, ", mMaxFailedLogTimes="

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget v1, p0, Lcom/cmic/sso/sdk/a/a;->k:I

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v1, ", mLogSuspendTime="

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget p0, p0, Lcom/cmic/sso/sdk/a/a;->l:I

    .line 119
    .line 120
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const/16 p0, 0x7d

    .line 124
    .line 125
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    return-object p0
.end method
