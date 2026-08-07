.class public Lcom/p1/mobile/putong/ui/download/DownloadTask$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/ui/download/DownloadTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public final a:Ll/rg50;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/io/File;

.field public g:Z

.field public h:I

.field public i:I

.field public j:I

.field public k:Z

.field public l:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public m:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public o:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;",
            ">;"
        }
    .end annotation
.end field

.field public p:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public q:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public r:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field public s:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field public t:Lcom/tantanapp/common/network/ApiCallBack;


# direct methods
.method public constructor <init>(Ll/rg50;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->c:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->d:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->e:Ljava/lang/String;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->f:Ljava/io/File;

    .line 14
    .line 15
    const/16 v1, 0x2000

    .line 16
    .line 17
    iput v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->h:I

    .line 18
    .line 19
    const/16 v1, 0x10

    .line 20
    .line 21
    iput v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->i:I

    .line 22
    .line 23
    const/4 v1, 0x3

    .line 24
    iput v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->j:I

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    iput-boolean v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->k:Z

    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->m:Ll/y20;

    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->n:Ll/z20;

    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->o:Ll/y20;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->p:Ll/z20;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->q:Ll/z20;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->r:Ll/z20;

    .line 40
    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->s:Ll/z20;

    .line 42
    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->t:Lcom/tantanapp/common/network/ApiCallBack;

    .line 44
    .line 45
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->a:Ll/rg50;

    .line 46
    .line 47
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/ui/download/DownloadTask;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->e:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->f:Ljava/io/File;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->e:Ljava/lang/String;

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    const-string p0, "mLocalPath can\'t be null!"

    .line 29
    .line 30
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :goto_0
    const/4 p0, 0x0

    .line 34
    return-object p0

    .line 35
    :cond_1
    :goto_1
    new-instance v0, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;-><init>(Lcom/p1/mobile/putong/ui/download/DownloadTask$a;)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->a:Ll/rg50;

    .line 42
    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->a:Ll/rg50;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->c:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->b(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/String;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->e:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->h(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->d:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->i(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/String;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    iget-boolean v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->g:Z

    .line 61
    .line 62
    iput-boolean v1, v0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->c:Z

    .line 63
    .line 64
    iput-boolean v1, v0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->d:Z

    .line 65
    .line 66
    iget v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->h:I

    .line 67
    .line 68
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->j(Lcom/p1/mobile/putong/ui/download/DownloadTask;I)I

    .line 69
    .line 70
    .line 71
    iget v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->i:I

    .line 72
    .line 73
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->k(Lcom/p1/mobile/putong/ui/download/DownloadTask;I)I

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->l:Ljava/util/Map;

    .line 77
    .line 78
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->l(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/util/Map;)Ljava/util/Map;

    .line 79
    .line 80
    .line 81
    iget-boolean v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->k:Z

    .line 82
    .line 83
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->m(Lcom/p1/mobile/putong/ui/download/DownloadTask;Z)Z

    .line 84
    .line 85
    .line 86
    iget v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->j:I

    .line 87
    .line 88
    iput v1, v0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->q:I

    .line 89
    .line 90
    iget-boolean v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->g:Z

    .line 91
    .line 92
    if-eqz v1, :cond_2

    .line 93
    .line 94
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->f:Ljava/io/File;

    .line 95
    .line 96
    if-eqz v1, :cond_2

    .line 97
    .line 98
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-eqz v1, :cond_2

    .line 103
    .line 104
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->f:Ljava/io/File;

    .line 105
    .line 106
    invoke-virtual {v1}, Ljava/io/File;->length()J

    .line 107
    .line 108
    .line 109
    move-result-wide v1

    .line 110
    iput-wide v1, v0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->g:J

    .line 111
    .line 112
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->m:Ll/y20;

    .line 113
    .line 114
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->n(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ll/y20;)Ll/y20;

    .line 115
    .line 116
    .line 117
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->n:Ll/z20;

    .line 118
    .line 119
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->o(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ll/z20;)Ll/z20;

    .line 120
    .line 121
    .line 122
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->o:Ll/y20;

    .line 123
    .line 124
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->a(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ll/y20;)Ll/y20;

    .line 125
    .line 126
    .line 127
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->p:Ll/z20;

    .line 128
    .line 129
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->c(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ll/z20;)Ll/z20;

    .line 130
    .line 131
    .line 132
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->r:Ll/z20;

    .line 133
    .line 134
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->d(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ll/z20;)Ll/z20;

    .line 135
    .line 136
    .line 137
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->s:Ll/z20;

    .line 138
    .line 139
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->e(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ll/z20;)Ll/z20;

    .line 140
    .line 141
    .line 142
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->q:Ll/z20;

    .line 143
    .line 144
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->f(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ll/z20;)Ll/z20;

    .line 145
    .line 146
    .line 147
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->t:Lcom/tantanapp/common/network/ApiCallBack;

    .line 148
    .line 149
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->g(Lcom/p1/mobile/putong/ui/download/DownloadTask;Lcom/tantanapp/common/network/ApiCallBack;)Lcom/tantanapp/common/network/ApiCallBack;

    .line 150
    .line 151
    .line 152
    return-object v0

    .line 153
    :cond_3
    const-string p0, "mNetPath can\'t be null!"

    .line 154
    .line 155
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    goto :goto_0
.end method

.method public final b(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->b:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "UTF-8"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1, p0, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    return-object p0

    .line 14
    :catch_0
    move-exception p0

    .line 15
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    return-object p1
.end method

.method public final c(Ljava/lang/String;)Z
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Ljava/net/URL;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/net/URL;->getFile()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/16 v0, 0x2f

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(I)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x1

    .line 17
    add-int/2addr v0, v1

    .line 18
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->b:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string p1, ".apk"

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result p0
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    if-eqz p0, :cond_0

    .line 35
    .line 36
    return v1

    .line 37
    :catch_0
    move-exception p0

    .line 38
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    const/4 p0, 0x0

    .line 42
    return p0
.end method

.method public d(Ll/y20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;",
            ">;)",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask$b;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->o:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask$b;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->n:Ll/z20;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;",
            "Ljava/lang/Throwable;",
            ">;)",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask$b;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->s:Ll/z20;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;",
            "Ljava/lang/Integer;",
            ">;)",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask$b;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->p:Ll/z20;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask$b;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->q:Ll/z20;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Ll/y20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;",
            ">;)",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask$b;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->m:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;",
            "Ljava/io/File;",
            ">;)",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask$b;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->r:Ll/z20;

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Lcom/tantanapp/common/network/ApiCallBack;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->t:Lcom/tantanapp/common/network/ApiCallBack;

    .line 2
    .line 3
    return-object p0
.end method

.method public l(I)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->h:I

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Ljava/util/Map;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask$b;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->l:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public n(Ljava/io/File;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->e:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->f:Ljava/io/File;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, "localPath and localFile can\'t be set at the same time!"

    .line 13
    .line 14
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public o(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->f:Ljava/io/File;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->e:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string p0, "localPath and localFile can\'t be set at the same time!"

    .line 9
    .line 10
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public p(I)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->j:I

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->c(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->c:Ljava/lang/String;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->c:Ljava/lang/String;

    .line 15
    .line 16
    :goto_0
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->d:Ljava/lang/String;

    .line 17
    .line 18
    return-object p0
.end method

.method public r(Z)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->k:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public s(I)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->i:I

    .line 2
    .line 3
    return-object p0
.end method

.method public t(Z)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->g:Z

    .line 2
    .line 3
    return-object p0
.end method
