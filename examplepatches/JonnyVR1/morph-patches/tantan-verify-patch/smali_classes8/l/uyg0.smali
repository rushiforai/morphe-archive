.class public final Ll/uyg0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final p:Ljava/lang/String;

.field public static final q:[Ljava/lang/String;

.field public static final r:[Ljava/lang/String;

.field public static final s:[Ljava/lang/String;

.field public static final t:[Ljava/lang/String;


# instance fields
.field public a:Z

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;

.field public final j:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public k:Ljava/util/ArrayList;

.field public l:Ll/bpg0;

.field public m:Ll/bpg0;

.field public final n:Ljava/util/ArrayList;

.field public final o:Ljava/util/HashMap;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    const-class v0, Ll/uyg0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "SudGIP "

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Ll/uyg0;->p:Ljava/lang/String;

    .line 14
    .line 15
    const-string v0, "https://dev-fqs.sudcdn.ltd/"

    .line 16
    .line 17
    const-string v1, "https://dev-fqs.sudcdn.cloud/"

    .line 18
    .line 19
    const-string v2, "https://dev-fqs.sudden.ltd/"

    .line 20
    .line 21
    const-string v3, "https://dev-fqs.sud.ltd/"

    .line 22
    .line 23
    const-string v4, "https://dev-fqs-os.sudden.ltd/"

    .line 24
    .line 25
    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Ll/uyg0;->q:[Ljava/lang/String;

    .line 30
    .line 31
    const-string v0, "https://fat-fqs.sudcdn.ltd/"

    .line 32
    .line 33
    const-string v1, "https://fat-fqs.sudcdn.cloud/"

    .line 34
    .line 35
    const-string v2, "https://fat-fqs.sudden.ltd/"

    .line 36
    .line 37
    const-string v3, "https://fat-fqs.sud.ltd/"

    .line 38
    .line 39
    const-string v4, "https://fat-fqs-os.sudden.ltd/"

    .line 40
    .line 41
    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Ll/uyg0;->r:[Ljava/lang/String;

    .line 46
    .line 47
    const-string v0, "https://sim-fqs.sudcdn.ltd/"

    .line 48
    .line 49
    const-string v1, "https://sim-fqs.sudcdn.cloud/"

    .line 50
    .line 51
    const-string v2, "https://sim-fqs.sudden.ltd/"

    .line 52
    .line 53
    const-string v3, "https://sim-fqs.sud.ltd/"

    .line 54
    .line 55
    const-string v4, "https://sim-fqs-os.sudden.ltd/"

    .line 56
    .line 57
    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sput-object v0, Ll/uyg0;->s:[Ljava/lang/String;

    .line 62
    .line 63
    const-string v0, "https://fqs.sudcdn.ltd/"

    .line 64
    .line 65
    const-string v1, "https://fqs.sudcdn.cloud/"

    .line 66
    .line 67
    const-string v2, "https://fqs.sudden.ltd/"

    .line 68
    .line 69
    const-string v3, "https://fqs.sud.ltd/"

    .line 70
    .line 71
    const-string v4, "https://fqs-os.sudden.ltd/"

    .line 72
    .line 73
    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    sput-object v0, Ll/uyg0;->t:[Ljava/lang/String;

    .line 78
    .line 79
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/uyg0;->a:Z

    .line 6
    .line 7
    const-string v1, ""

    .line 8
    .line 9
    iput-object v1, p0, Ll/uyg0;->b:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v1, p0, Ll/uyg0;->c:Ljava/lang/String;

    .line 12
    .line 13
    iput-object v1, p0, Ll/uyg0;->d:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v1, p0, Ll/uyg0;->e:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v1, p0, Ll/uyg0;->f:Ljava/lang/String;

    .line 18
    .line 19
    iput-object v1, p0, Ll/uyg0;->g:Ljava/lang/String;

    .line 20
    .line 21
    iput-object v1, p0, Ll/uyg0;->h:Ljava/lang/String;

    .line 22
    .line 23
    iput-object v1, p0, Ll/uyg0;->i:Ljava/lang/String;

    .line 24
    .line 25
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 26
    .line 27
    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Ll/uyg0;->j:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 31
    .line 32
    new-instance v1, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Ll/uyg0;->n:Ljava/util/ArrayList;

    .line 38
    .line 39
    new-instance v0, Ljava/util/HashMap;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Ll/uyg0;->o:Ljava/util/HashMap;

    .line 45
    .line 46
    invoke-static {}, Ll/uyg0;->z()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static synthetic A(Ll/yjg0;Ll/vlg0;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget v0, p0, Ll/yjg0;->a:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-interface {p1, p2}, Ll/vlg0;->onSuccess(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Ll/yjg0;->b:Ljava/lang/String;

    .line 10
    .line 11
    invoke-interface {p1, v0, p0}, Ll/vlg0;->onFailure(ILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static a(Lorg/json/JSONObject;)LD/Sudif;
    .locals 5

    .line 1
    new-instance v0, LD/Sudif;

    .line 2
    .line 3
    invoke-direct {v0}, LD/Sudif;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    iget-object v4, v0, LD/Sudif;->Suddo:Ljava/util/HashMap;

    .line 27
    .line 28
    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-object v0
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/bxg0;Ll/bpg0;Ll/neg0;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "application/json; charset=utf-8"

    .line 2
    .line 3
    invoke-static {v0}, Ll/e7y;->c(Ljava/lang/String;)Ll/e7y;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0, p1}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p2, p3, p4}, Ll/uyg0;->e(Ljava/lang/String;Ll/bxg0;Ll/t4f;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    invoke-virtual {p3, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    invoke-virtual {p3, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    sget-object p3, Ll/tsg0;->b:Ll/rg50;

    .line 28
    .line 29
    invoke-virtual {p3, p1}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    if-eqz p5, :cond_0

    .line 34
    .line 35
    iput-object p1, p5, Ll/neg0;->a:Ll/ry3;

    .line 36
    .line 37
    :cond_0
    invoke-interface {p1}, Ll/ry3;->execute()Ll/i5d0;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Ll/i5d0;->k()Ll/k5d0;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ll/k5d0;->string()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance p3, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    const-string p4, "url="

    .line 55
    .line 56
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string p5, " request-id="

    .line 63
    .line 64
    invoke-virtual {p3, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p3

    .line 74
    const-string v0, "HttpService"

    .line 75
    .line 76
    invoke-static {v0, p3}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    sget-object p3, Ll/uyg0;->p:Ljava/lang/String;

    .line 80
    .line 81
    new-instance v0, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    invoke-direct {v0, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-static {p3, p0}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    return-object p1
.end method

.method public static c(Ljava/lang/String;Ljava/lang/String;Ll/bxg0;Ll/bpg0;Ll/neg0;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p1, p2, p3}, Ll/uyg0;->e(Ljava/lang/String;Ll/bxg0;Ll/t4f;)Ll/x1d0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p2}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p2}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    sget-object p3, Ll/tsg0;->b:Ll/rg50;

    .line 18
    .line 19
    invoke-virtual {p3, p2}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    if-eqz p4, :cond_0

    .line 24
    .line 25
    iput-object p2, p4, Ll/neg0;->a:Ll/ry3;

    .line 26
    .line 27
    :cond_0
    invoke-interface {p2}, Ll/ry3;->execute()Ll/i5d0;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p2}, Ll/i5d0;->k()Ll/k5d0;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2}, Ll/k5d0;->string()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    new-instance p3, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string p4, "url="

    .line 45
    .line 46
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v0, " request-id="

    .line 53
    .line 54
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p3

    .line 64
    const-string v1, "HttpService"

    .line 65
    .line 66
    invoke-static {v1, p3}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    sget-object p3, Ll/uyg0;->p:Ljava/lang/String;

    .line 70
    .line 71
    new-instance v1, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {v1, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-static {p3, p0}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    return-object p2
.end method

.method public static d([Ljava/lang/String;I)Ljava/lang/String;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_2

    .line 3
    .line 4
    array-length v1, p0

    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    if-lez p1, :cond_1

    .line 9
    .line 10
    add-int/lit8 p1, p1, -0x1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    const/4 p1, 0x0

    .line 14
    :goto_0
    array-length v1, p0

    .line 15
    if-ge p1, v1, :cond_2

    .line 16
    .line 17
    aget-object p0, p0, p1

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_2
    :goto_1
    return-object v0
.end method

.method public static e(Ljava/lang/String;Ll/bxg0;Ll/t4f;)Ll/x1d0$a;
    .locals 4

    .line 1
    new-instance v0, Ll/x1d0$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/x1d0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "sud-sdk-version"

    .line 7
    .line 8
    const-string v2, "1.6.7.1286"

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "sud-sdk-version-alias"

    .line 15
    .line 16
    const-string v2, "v1.6.7.1286-static"

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget-object v1, Ll/utg0;->a:Ljava/lang/String;

    .line 23
    .line 24
    const/4 v1, 0x2

    .line 25
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "sud-sdk-platform"

    .line 30
    .line 31
    invoke-virtual {v0, v2, v1}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sget-object v1, Ll/utg0;->g:Ljava/lang/String;

    .line 36
    .line 37
    const-string v2, "sud-sdk-app-id"

    .line 38
    .line 39
    invoke-virtual {v0, v2, v1}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {}, Ll/utg0;->d()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const-string v2, "sud-sdk-bundle-id"

    .line 48
    .line 49
    invoke-virtual {v0, v2, v1}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sget-object v1, Ll/utg0;->j:Ljava/lang/String;

    .line 54
    .line 55
    const-string v2, "sud-sdk-trace-id"

    .line 56
    .line 57
    invoke-virtual {v0, v2, v1}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const-string v1, "sud-sdk-request-id"

    .line 62
    .line 63
    invoke-virtual {v0, v1, p0}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    sget-object v1, Ll/fug0;->a:Ljava/lang/String;

    .line 68
    .line 69
    const-string v2, "sud-sdk-user-id"

    .line 70
    .line 71
    invoke-virtual {v0, v2, v1}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    const/4 v1, 0x0

    .line 76
    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    const-string v3, "sud-sdk-sud-is-dynamic"

    .line 81
    .line 82
    invoke-virtual {v0, v3, v2}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    const-string v2, "sud-sdk-et-is-dynamic"

    .line 91
    .line 92
    invoke-virtual {v0, v2, v1}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-static {p0}, Ll/lwg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    const-string v1, "Referer"

    .line 101
    .line 102
    invoke-virtual {v0, v1, p0}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {}, Ll/pqg0;->a()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-static {v0}, Ll/opg0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    const-string v1, "sud-device-brand"

    .line 115
    .line 116
    invoke-virtual {p0, v1, v0}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-static {}, Ll/pqg0;->d()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    const-string v1, "sud-os-version"

    .line 125
    .line 126
    invoke-virtual {p0, v1, v0}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-static {}, Ll/pqg0;->c()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    const-string v1, "sud-device-id"

    .line 135
    .line 136
    invoke-virtual {p0, v1, v0}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    const-class v0, Ll/bxg0;

    .line 141
    .line 142
    invoke-virtual {p0, v0, p1}, Ll/x1d0$a;->o(Ljava/lang/Class;Ljava/lang/Object;)Ll/x1d0$a;

    .line 143
    .line 144
    .line 145
    if-eqz p2, :cond_0

    .line 146
    .line 147
    const-class p1, Ll/t4f;

    .line 148
    .line 149
    invoke-virtual {p0, p1, p2}, Ll/x1d0$a;->o(Ljava/lang/Class;Ljava/lang/Object;)Ll/x1d0$a;

    .line 150
    .line 151
    .line 152
    :cond_0
    return-object p0
.end method

.method public static h(ILl/vsg0;Ll/zlg0;Ljava/lang/String;)V
    .locals 7

    .line 1
    const-wide/16 v0, 0xbb8

    .line 2
    .line 3
    const-string v2, "SudGIPWebSocket"

    .line 4
    .line 5
    if-nez p0, :cond_6

    .line 6
    .line 7
    check-cast p1, Ll/flg0;

    .line 8
    .line 9
    if-eqz p2, :cond_5

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    iget-object p0, p2, Ll/zlg0;->a:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    goto/16 :goto_1

    .line 23
    .line 24
    :cond_0
    iget-object p0, p1, Ll/flg0;->a:Ll/qug0;

    .line 25
    .line 26
    iget-object p1, p2, Ll/zlg0;->a:Ljava/lang/String;

    .line 27
    .line 28
    iget-object p2, p0, Ll/qug0;->a:Ljava/lang/String;

    .line 29
    .line 30
    new-instance p3, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v3, "connectWebSocket curIsRunning:"

    .line 33
    .line 34
    invoke-direct {p3, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object v4, p0, Ll/qug0;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 38
    .line 39
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    invoke-virtual {p3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    invoke-static {p2, p3}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    new-instance p2, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {p2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object p3, p0, Ll/qug0;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 59
    .line 60
    invoke-virtual {p3}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 61
    .line 62
    .line 63
    move-result p3

    .line 64
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-static {v2, p2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    iget-object p2, p0, Ll/qug0;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 75
    .line 76
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    if-nez p2, :cond_1

    .line 81
    .line 82
    return-void

    .line 83
    :cond_1
    iget-object p2, p0, Ll/qug0;->h:Ll/hsp0;

    .line 84
    .line 85
    if-eqz p2, :cond_2

    .line 86
    .line 87
    iget-object p0, p0, Ll/qug0;->a:Ljava/lang/String;

    .line 88
    .line 89
    const-string p1, "connectWebSocket \u5df2\u5b58\u5728WebSocket\u65e0\u9700\u91cd\u590d\u8fde\u63a5"

    .line 90
    .line 91
    invoke-static {p0, p1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v2, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_2
    sget-object p2, Ll/utg0;->e:Ll/i0h0;

    .line 99
    .line 100
    if-eqz p2, :cond_3

    .line 101
    .line 102
    iget-object p2, p2, Ll/i0h0;->c:Ll/gvg0;

    .line 103
    .line 104
    if-eqz p2, :cond_3

    .line 105
    .line 106
    iget-object p2, p2, Ll/gvg0;->d:Ll/rhg0;

    .line 107
    .line 108
    if-eqz p2, :cond_3

    .line 109
    .line 110
    iget-object p2, p2, Ll/rhg0;->f:Ljava/lang/String;

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_3
    const/4 p2, 0x0

    .line 114
    :goto_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 115
    .line 116
    .line 117
    move-result p3

    .line 118
    if-eqz p3, :cond_4

    .line 119
    .line 120
    invoke-virtual {p0, v0, v1}, Ll/qug0;->b(J)V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_4
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 125
    .line 126
    .line 127
    move-result-object p2

    .line 128
    invoke-virtual {p2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    new-instance p3, Ljava/lang/StringBuilder;

    .line 133
    .line 134
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 135
    .line 136
    .line 137
    iget-wide v0, p0, Ll/qug0;->d:J

    .line 138
    .line 139
    invoke-virtual {p3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    const-string v0, ""

    .line 143
    .line 144
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p3

    .line 151
    const-string v1, "mgid"

    .line 152
    .line 153
    invoke-virtual {p2, v1, p3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 154
    .line 155
    .line 156
    move-result-object p2

    .line 157
    new-instance p3, Ljava/lang/StringBuilder;

    .line 158
    .line 159
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 160
    .line 161
    .line 162
    iget-object v1, p0, Ll/qug0;->c:Ljava/lang/String;

    .line 163
    .line 164
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p3

    .line 174
    const-string v0, "roomid"

    .line 175
    .line 176
    invoke-virtual {p2, v0, p3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 177
    .line 178
    .line 179
    move-result-object p2

    .line 180
    invoke-virtual {p2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 181
    .line 182
    .line 183
    move-result-object p2

    .line 184
    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p2

    .line 188
    new-instance p3, Ljava/lang/StringBuilder;

    .line 189
    .line 190
    const-string v0, "connectWebSocket:"

    .line 191
    .line 192
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p3

    .line 202
    invoke-static {v2, p3}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 203
    .line 204
    .line 205
    new-instance p3, Ll/x1d0$a;

    .line 206
    .line 207
    invoke-direct {p3}, Ll/x1d0$a;-><init>()V

    .line 208
    .line 209
    .line 210
    invoke-virtual {p3, p2}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 211
    .line 212
    .line 213
    move-result-object p2

    .line 214
    new-instance p3, Ljava/lang/StringBuilder;

    .line 215
    .line 216
    const-string v0, "Bearer "

    .line 217
    .line 218
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    const-string p3, "Authorization"

    .line 229
    .line 230
    invoke-virtual {p2, p3, p1}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 231
    .line 232
    .line 233
    move-result-object p1

    .line 234
    invoke-virtual {p1}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    new-instance p2, Ll/zug0;

    .line 239
    .line 240
    invoke-direct {p2}, Ll/zug0;-><init>()V

    .line 241
    .line 242
    .line 243
    const/4 p3, 0x3

    .line 244
    iput p3, p2, Ll/zug0;->c:I

    .line 245
    .line 246
    iget-object p3, p2, Ll/zug0;->b:Ll/cpg0;

    .line 247
    .line 248
    const-string v0, "SudGIPWsHttpLoggingInterceptor"

    .line 249
    .line 250
    iput-object v0, p3, Ll/cpg0;->a:Ljava/lang/String;

    .line 251
    .line 252
    new-instance p3, Ll/rg50$b;

    .line 253
    .line 254
    invoke-direct {p3}, Ll/rg50$b;-><init>()V

    .line 255
    .line 256
    .line 257
    const-wide/16 v0, 0xa

    .line 258
    .line 259
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 260
    .line 261
    invoke-virtual {p3, v0, v1, v2}, Ll/rg50$b;->q(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 262
    .line 263
    .line 264
    move-result-object p3

    .line 265
    invoke-virtual {p3, p2}, Ll/rg50$b;->a(Ll/azm;)Ll/rg50$b;

    .line 266
    .line 267
    .line 268
    move-result-object p2

    .line 269
    const-wide/16 v0, 0x64

    .line 270
    .line 271
    invoke-virtual {p2, v0, v1, v2}, Ll/rg50$b;->u(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 272
    .line 273
    .line 274
    move-result-object p2

    .line 275
    invoke-virtual {p2, v0, v1, v2}, Ll/rg50$b;->y(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 276
    .line 277
    .line 278
    move-result-object p2

    .line 279
    invoke-virtual {p2}, Ll/rg50$b;->c()Ll/rg50;

    .line 280
    .line 281
    .line 282
    move-result-object p2

    .line 283
    new-instance p3, Ll/yqg0;

    .line 284
    .line 285
    invoke-direct {p3, p0}, Ll/yqg0;-><init>(Ll/qug0;)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {p2, p1, p3}, Ll/rg50;->x(Ll/x1d0;Ll/ksp0;)Ll/hsp0;

    .line 289
    .line 290
    .line 291
    move-result-object p1

    .line 292
    iput-object p1, p0, Ll/qug0;->h:Ll/hsp0;

    .line 293
    .line 294
    return-void

    .line 295
    :cond_5
    :goto_1
    iget-object p0, p1, Ll/flg0;->a:Ll/qug0;

    .line 296
    .line 297
    invoke-virtual {p0, v0, v1}, Ll/qug0;->b(J)V

    .line 298
    .line 299
    .line 300
    return-void

    .line 301
    :cond_6
    check-cast p1, Ll/flg0;

    .line 302
    .line 303
    iget-object p2, p1, Ll/flg0;->a:Ll/qug0;

    .line 304
    .line 305
    iget-object p2, p2, Ll/qug0;->a:Ljava/lang/String;

    .line 306
    .line 307
    new-instance v3, Ljava/lang/StringBuilder;

    .line 308
    .line 309
    const-string v4, "onFailure\uff1a"

    .line 310
    .line 311
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 312
    .line 313
    .line 314
    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 315
    .line 316
    .line 317
    const-string v5, "("

    .line 318
    .line 319
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    .line 321
    .line 322
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 323
    .line 324
    .line 325
    const-string v6, ")"

    .line 326
    .line 327
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 328
    .line 329
    .line 330
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object v3

    .line 334
    invoke-static {p2, v3}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 335
    .line 336
    .line 337
    new-instance p2, Ljava/lang/StringBuilder;

    .line 338
    .line 339
    invoke-direct {p2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 340
    .line 341
    .line 342
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 343
    .line 344
    .line 345
    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 346
    .line 347
    .line 348
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 349
    .line 350
    .line 351
    invoke-virtual {p2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 352
    .line 353
    .line 354
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 355
    .line 356
    .line 357
    move-result-object p0

    .line 358
    invoke-static {v2, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 359
    .line 360
    .line 361
    iget-object p0, p1, Ll/flg0;->a:Ll/qug0;

    .line 362
    .line 363
    invoke-virtual {p0, v0, v1}, Ll/qug0;->b(J)V

    .line 364
    .line 365
    .line 366
    return-void
.end method

.method public static synthetic i(ILl/yug0;Ljava/lang/String;)V
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic r(Ll/yjg0;Ll/vlg0;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget v0, p0, Ll/yjg0;->a:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-interface {p1, p2}, Ll/vlg0;->onSuccess(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Ll/yjg0;->b:Ljava/lang/String;

    .line 10
    .line 11
    invoke-interface {p1, v0, p0}, Ll/vlg0;->onFailure(ILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static w(Lorg/json/JSONObject;Ltech/sud/gip/core/GameInfo;)V
    .locals 3

    .line 1
    const-string v0, "data"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "mg_info"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "mg_id"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    iput-wide v1, p1, Ltech/sud/gip/core/GameInfo;->mgId:J

    .line 20
    .line 21
    const-string v1, "name"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v1}, Ll/uyg0;->a(Lorg/json/JSONObject;)LD/Sudif;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    sget-object v2, Ll/utg0;->d:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v1, v2}, LD/Sudif;->Suddo(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iput-object v1, p1, Ltech/sud/gip/core/GameInfo;->name:Ljava/lang/String;

    .line 38
    .line 39
    const-string v1, "version"

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iput-object v1, p1, Ltech/sud/gip/core/GameInfo;->version:Ljava/lang/String;

    .line 46
    .line 47
    const-string v1, "orientation"

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    iput v1, p1, Ltech/sud/gip/core/GameInfo;->orientation:I

    .line 54
    .line 55
    const-string v1, "screen_mode"

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    iput v1, p1, Ltech/sud/gip/core/GameInfo;->screenMode:I

    .line 62
    .line 63
    const-string v1, "url"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iput-object v1, p1, Ltech/sud/gip/core/GameInfo;->url:Ljava/lang/String;

    .line 70
    .line 71
    const-string v1, "eurl"

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    iput-object v1, p1, Ltech/sud/gip/core/GameInfo;->eUrl:Ljava/lang/String;

    .line 78
    .line 79
    const-string v1, "auturl"

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-eqz v2, :cond_0

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    iput-object v1, p1, Ltech/sud/gip/core/GameInfo;->autUrl:Ljava/lang/String;

    .line 92
    .line 93
    :cond_0
    const-string v1, "game_app_id"

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    iput-object v1, p1, Ltech/sud/gip/core/GameInfo;->appID:Ljava/lang/String;

    .line 100
    .line 101
    const-string v1, "hash"

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    iput-object v1, p1, Ltech/sud/gip/core/GameInfo;->hash:Ljava/lang/String;

    .line 108
    .line 109
    const-string v1, "engine"

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    iput v1, p1, Ltech/sud/gip/core/GameInfo;->engine:I

    .line 116
    .line 117
    const-string v1, "unity_framework_type"

    .line 118
    .line 119
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    if-eqz v2, :cond_1

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    iput v1, p1, Ltech/sud/gip/core/GameInfo;->unityFrameworkType:I

    .line 130
    .line 131
    :cond_1
    const-string v1, "require"

    .line 132
    .line 133
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    const-string v2, ";"

    .line 138
    .line 139
    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    iput-object v1, p1, Ltech/sud/gip/core/GameInfo;->require:[Ljava/lang/String;

    .line 144
    .line 145
    const-string v1, "big_loading_pic"

    .line 146
    .line 147
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    if-eqz v1, :cond_2

    .line 152
    .line 153
    invoke-static {v1}, Ll/uyg0;->a(Lorg/json/JSONObject;)LD/Sudif;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    sget-object v2, Ll/utg0;->d:Ljava/lang/String;

    .line 158
    .line 159
    invoke-virtual {v1, v2}, LD/Sudif;->Suddo(Ljava/lang/String;)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    iput-object v1, p1, Ltech/sud/gip/core/GameInfo;->bigLoadingPic:Ljava/lang/String;

    .line 164
    .line 165
    :cond_2
    const-string v1, "dynamic_config"

    .line 166
    .line 167
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    if-eqz v2, :cond_3

    .line 172
    .line 173
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    iput-object v1, p1, Ltech/sud/gip/core/GameInfo;->dynamicConfig:Ljava/lang/String;

    .line 182
    .line 183
    goto :goto_0

    .line 184
    :cond_3
    const-string v1, "{}"

    .line 185
    .line 186
    iput-object v1, p1, Ltech/sud/gip/core/GameInfo;->dynamicConfig:Ljava/lang/String;

    .line 187
    .line 188
    :goto_0
    const-string v1, "client_version"

    .line 189
    .line 190
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 191
    .line 192
    .line 193
    move-result-wide v1

    .line 194
    iput-wide v1, p1, Ltech/sud/gip/core/GameInfo;->clientVersion:J

    .line 195
    .line 196
    const-string v1, "game_large_model_cfg"

    .line 197
    .line 198
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    if-eqz v0, :cond_4

    .line 203
    .line 204
    new-instance v1, Ll/xlg0;

    .line 205
    .line 206
    invoke-direct {v1}, Ll/xlg0;-><init>()V

    .line 207
    .line 208
    .line 209
    iput-object v1, p1, Ltech/sud/gip/core/GameInfo;->gameLargeModelCfg:Ll/xlg0;

    .line 210
    .line 211
    const-string v2, "enable_asr"

    .line 212
    .line 213
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 214
    .line 215
    .line 216
    move-result v2

    .line 217
    iput-boolean v2, v1, Ll/xlg0;->a:Z

    .line 218
    .line 219
    iget-object v1, p1, Ltech/sud/gip/core/GameInfo;->gameLargeModelCfg:Ll/xlg0;

    .line 220
    .line 221
    const-string v2, "enable_channel"

    .line 222
    .line 223
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 224
    .line 225
    .line 226
    move-result v2

    .line 227
    iput-boolean v2, v1, Ll/xlg0;->b:Z

    .line 228
    .line 229
    iget-object v1, p1, Ltech/sud/gip/core/GameInfo;->gameLargeModelCfg:Ll/xlg0;

    .line 230
    .line 231
    const-string v2, "enable_tts"

    .line 232
    .line 233
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    iput-boolean v0, v1, Ll/xlg0;->c:Z

    .line 238
    .line 239
    :cond_4
    const-string v0, "log_id"

    .line 240
    .line 241
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object p0

    .line 245
    iget-wide v0, p1, Ltech/sud/gip/core/GameInfo;->mgId:J

    .line 246
    .line 247
    const/4 p1, 0x0

    .line 248
    invoke-static {v0, v1, p1, p0}, Ll/tug0;->b(JILjava/lang/String;)V

    .line 249
    .line 250
    .line 251
    invoke-static {}, Ll/tug0;->a()V

    .line 252
    .line 253
    .line 254
    return-void
.end method

.method public static z()V
    .locals 2

    .line 1
    sget-object v0, Ll/tsg0;->a:Ll/zug0;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    iput v1, v0, Ll/zug0;->c:I

    .line 5
    .line 6
    sget v0, Ll/utg0;->f:I

    .line 7
    .line 8
    if-eq v0, v1, :cond_1

    .line 9
    .line 10
    const/4 v1, 0x3

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    sput-boolean v0, Ll/zug0;->d:Z

    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 19
    sput-boolean v0, Ll/zug0;->d:Z

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public final B(Ltech/sud/gip/core/ISudListenerInitSDK;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLl/bpg0;Ll/bpg0;)V
    .locals 10

    .line 1
    move-object/from16 v9, p6

    .line 2
    .line 3
    move-object/from16 v6, p7

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    invoke-virtual/range {p0 .. p1}, Ll/uyg0;->x(Ltech/sud/gip/core/ISudListenerInitSDK;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/uyg0;->j:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    monitor-exit p0

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    move-object p1, v0

    .line 21
    goto :goto_2

    .line 22
    :cond_0
    iget-object p1, p0, Ll/uyg0;->j:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 26
    .line 27
    .line 28
    sget p1, Ll/utg0;->f:I

    .line 29
    .line 30
    const/4 v0, 0x4

    .line 31
    if-ne p1, v0, :cond_1

    .line 32
    .line 33
    sget-object p1, Ll/uyg0;->q:[Ljava/lang/String;

    .line 34
    .line 35
    array-length p1, p1

    .line 36
    :goto_0
    move v7, p1

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    const/4 v0, 0x3

    .line 39
    if-ne p1, v0, :cond_2

    .line 40
    .line 41
    sget-object p1, Ll/uyg0;->r:[Ljava/lang/String;

    .line 42
    .line 43
    array-length p1, p1

    .line 44
    goto :goto_0

    .line 45
    :cond_2
    const/4 v0, 0x2

    .line 46
    if-ne p1, v0, :cond_3

    .line 47
    .line 48
    sget-object p1, Ll/uyg0;->s:[Ljava/lang/String;

    .line 49
    .line 50
    array-length p1, p1

    .line 51
    goto :goto_0

    .line 52
    :cond_3
    sget-object p1, Ll/uyg0;->t:[Ljava/lang/String;

    .line 53
    .line 54
    array-length p1, p1

    .line 55
    goto :goto_0

    .line 56
    :goto_1
    iget-object p1, p0, Ll/uyg0;->l:Ll/bpg0;

    .line 57
    .line 58
    if-eqz p1, :cond_4

    .line 59
    .line 60
    if-eqz v9, :cond_4

    .line 61
    .line 62
    invoke-virtual {p1, v9}, Ll/bpg0;->c(Ll/bpg0;)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ll/uyg0;->l:Ll/bpg0;

    .line 66
    .line 67
    iget-object p1, p1, Ll/bpg0;->b:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v9, p1}, Ll/bpg0;->b(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    :cond_4
    iget-object p1, p0, Ll/uyg0;->m:Ll/bpg0;

    .line 73
    .line 74
    if-eqz p1, :cond_5

    .line 75
    .line 76
    if-eqz v6, :cond_5

    .line 77
    .line 78
    invoke-virtual {p1, v6}, Ll/bpg0;->c(Ll/bpg0;)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Ll/uyg0;->m:Ll/bpg0;

    .line 82
    .line 83
    iget-object p1, p1, Ll/bpg0;->b:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v6, p1}, Ll/bpg0;->b(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :cond_5
    new-instance v0, Ll/axg0;

    .line 89
    .line 90
    const/4 v8, 0x1

    .line 91
    move-object v1, p0

    .line 92
    move-object v2, p2

    .line 93
    move-object v3, p3

    .line 94
    move-object v4, p4

    .line 95
    move v5, p5

    .line 96
    invoke-direct/range {v0 .. v9}, Ll/axg0;-><init>(Ll/uyg0;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLl/bpg0;IILl/bpg0;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0, p3, v8, v0, v9}, Ll/uyg0;->j(Ljava/lang/String;ILl/axg0;Ll/bpg0;)V

    .line 100
    .line 101
    .line 102
    monitor-exit p0

    .line 103
    return-void

    .line 104
    :goto_2
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 105
    throw p1
.end method

.method public final f()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/uyg0;->a:Z

    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/uyg0;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Ll/uyg0;->c:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Ll/uyg0;->d:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Ll/uyg0;->e:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Ll/uyg0;->g:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Ll/uyg0;->h:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Ll/uyg0;->f:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Ll/uyg0;->i:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v0, p0, Ll/uyg0;->n:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/uyg0;->o:Ljava/util/HashMap;

    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final declared-synchronized g(ILjava/lang/String;)V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/uyg0;->k:Ljava/util/ArrayList;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-string p1, "HttpService"

    .line 7
    .line 8
    const-string p2, "error notifyInitSdkFailure but listenerList is null"

    .line 9
    .line 10
    invoke-static {p1, p2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    monitor-exit p0

    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception p1

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    :try_start_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/4 v2, 0x0

    .line 22
    move v3, v2

    .line 23
    :goto_0
    if-ge v3, v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    add-int/lit8 v3, v3, 0x1

    .line 30
    .line 31
    check-cast v4, Ltech/sud/gip/core/ISudListenerInitSDK;

    .line 32
    .line 33
    invoke-interface {v4, p1, p2}, Ltech/sud/gip/core/ISudListenerInitSDK;->onFailure(ILjava/lang/String;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 p1, 0x0

    .line 38
    iput-object p1, p0, Ll/uyg0;->k:Ljava/util/ArrayList;

    .line 39
    .line 40
    iget-object p1, p0, Ll/uyg0;->j:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 41
    .line 42
    invoke-virtual {p1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    .line 44
    .line 45
    monitor-exit p0

    .line 46
    return-void

    .line 47
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 48
    throw p1
.end method

.method public final j(Ljava/lang/String;ILl/axg0;Ll/bpg0;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/uyg0;->b:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_3

    .line 10
    .line 11
    iget-object v2, p3, Ll/axg0;->i:Ll/uyg0;

    .line 12
    .line 13
    iget-object p0, p3, Ll/axg0;->a:Landroid/content/Context;

    .line 14
    .line 15
    iget-object v3, p3, Ll/axg0;->b:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v4, p3, Ll/axg0;->c:Ljava/lang/String;

    .line 18
    .line 19
    iget-boolean v6, p3, Ll/axg0;->d:Z

    .line 20
    .line 21
    iget-object p1, p3, Ll/axg0;->e:Ll/bpg0;

    .line 22
    .line 23
    iget-boolean p2, v2, Ll/uyg0;->a:Z

    .line 24
    .line 25
    if-eqz p2, :cond_2

    .line 26
    .line 27
    monitor-enter v2

    .line 28
    :try_start_0
    iget-object p0, v2, Ll/uyg0;->k:Ljava/util/ArrayList;

    .line 29
    .line 30
    if-nez p0, :cond_0

    .line 31
    .line 32
    const-string p0, "HttpService"

    .line 33
    .line 34
    const-string p1, "error notifyInitSdkSuccess but listenerList is null"

    .line 35
    .line 36
    invoke-static {p0, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    monitor-exit v2

    .line 40
    return-void

    .line 41
    :catchall_0
    move-exception v0

    .line 42
    move-object p0, v0

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    const/4 p2, 0x0

    .line 49
    move p3, p2

    .line 50
    :goto_0
    if-ge p3, p1, :cond_1

    .line 51
    .line 52
    invoke-virtual {p0, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p4

    .line 56
    add-int/lit8 p3, p3, 0x1

    .line 57
    .line 58
    check-cast p4, Ltech/sud/gip/core/ISudListenerInitSDK;

    .line 59
    .line 60
    invoke-interface {p4}, Ltech/sud/gip/core/ISudListenerInitSDK;->onSuccess()V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    const/4 p0, 0x0

    .line 65
    iput-object p0, v2, Ll/uyg0;->k:Ljava/util/ArrayList;

    .line 66
    .line 67
    iget-object p0, v2, Ll/uyg0;->j:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 68
    .line 69
    invoke-virtual {p0, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 70
    .line 71
    .line 72
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 73
    return-void

    .line 74
    :goto_1
    monitor-exit v2

    .line 75
    throw p0

    .line 76
    :cond_2
    sget-object p2, Ll/jpg0;->f:Ll/jpg0;

    .line 77
    .line 78
    invoke-virtual {p2, p0}, Ll/jpg0;->b(Landroid/content/Context;)V

    .line 79
    .line 80
    .line 81
    iget-object v7, v2, Ll/uyg0;->b:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    new-instance p0, Ll/bpg0;

    .line 88
    .line 89
    invoke-direct {p0}, Ll/bpg0;-><init>()V

    .line 90
    .line 91
    .line 92
    iput-object p0, v2, Ll/uyg0;->m:Ll/bpg0;

    .line 93
    .line 94
    invoke-virtual {p0, p1}, Ll/bpg0;->c(Ll/bpg0;)V

    .line 95
    .line 96
    .line 97
    iget-object p0, v2, Ll/uyg0;->m:Ll/bpg0;

    .line 98
    .line 99
    invoke-virtual {p0, v7}, Ll/bpg0;->b(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    new-instance v1, Ll/xug0;

    .line 103
    .line 104
    invoke-direct/range {v1 .. v7}, Ll/xug0;-><init>(Ll/uyg0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 105
    .line 106
    .line 107
    sget-object p0, Ll/tsg0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 108
    .line 109
    invoke-virtual {p0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_3
    sget v0, Ll/utg0;->f:I

    .line 114
    .line 115
    const/4 v1, 0x4

    .line 116
    if-ne v0, v1, :cond_4

    .line 117
    .line 118
    sget-object v0, Ll/uyg0;->q:[Ljava/lang/String;

    .line 119
    .line 120
    invoke-static {v0, p2}, Ll/uyg0;->d([Ljava/lang/String;I)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p2

    .line 124
    goto :goto_2

    .line 125
    :cond_4
    const/4 v1, 0x3

    .line 126
    if-ne v0, v1, :cond_5

    .line 127
    .line 128
    sget-object v0, Ll/uyg0;->r:[Ljava/lang/String;

    .line 129
    .line 130
    invoke-static {v0, p2}, Ll/uyg0;->d([Ljava/lang/String;I)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p2

    .line 134
    goto :goto_2

    .line 135
    :cond_5
    const/4 v1, 0x2

    .line 136
    if-ne v0, v1, :cond_6

    .line 137
    .line 138
    sget-object v0, Ll/uyg0;->s:[Ljava/lang/String;

    .line 139
    .line 140
    invoke-static {v0, p2}, Ll/uyg0;->d([Ljava/lang/String;I)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    goto :goto_2

    .line 145
    :cond_6
    sget-object v0, Ll/uyg0;->t:[Ljava/lang/String;

    .line 146
    .line 147
    invoke-static {v0, p2}, Ll/uyg0;->d([Ljava/lang/String;I)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p2

    .line 151
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 152
    .line 153
    const-string v1, "getFQSInfo baseUrl:"

    .line 154
    .line 155
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    const-string v1, "HttpService"

    .line 166
    .line 167
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 168
    .line 169
    .line 170
    sget-object v0, Ll/uyg0;->p:Ljava/lang/String;

    .line 171
    .line 172
    new-instance v1, Ljava/lang/StringBuilder;

    .line 173
    .line 174
    const-string v2, "getFQSInfo baseUrl:"

    .line 175
    .line 176
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v1

    .line 186
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    new-instance v0, Ljava/lang/StringBuilder;

    .line 190
    .line 191
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-static {p1}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    new-instance v4, Ll/ukg0;

    .line 209
    .line 210
    const-string p1, "getFQSInfo"

    .line 211
    .line 212
    invoke-direct {v4, p1}, Ll/ukg0;-><init>(Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    new-instance v5, Ll/bxg0;

    .line 216
    .line 217
    invoke-direct {v5}, Ll/bxg0;-><init>()V

    .line 218
    .line 219
    .line 220
    iput-object v5, v4, Ll/ukg0;->n:Ll/bxg0;

    .line 221
    .line 222
    new-instance p1, Ll/bpg0;

    .line 223
    .line 224
    invoke-direct {p1}, Ll/bpg0;-><init>()V

    .line 225
    .line 226
    .line 227
    iput-object p1, p0, Ll/uyg0;->l:Ll/bpg0;

    .line 228
    .line 229
    invoke-virtual {p1, p4}, Ll/bpg0;->c(Ll/bpg0;)V

    .line 230
    .line 231
    .line 232
    iget-object p1, p0, Ll/uyg0;->l:Ll/bpg0;

    .line 233
    .line 234
    invoke-virtual {p1, v3}, Ll/bpg0;->b(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    new-instance v1, Ll/jyg0;

    .line 238
    .line 239
    move-object v2, p0

    .line 240
    move-object v6, p3

    .line 241
    invoke-direct/range {v1 .. v6}, Ll/jyg0;-><init>(Ll/uyg0;Ljava/lang/String;Ll/ukg0;Ll/bxg0;Ll/axg0;)V

    .line 242
    .line 243
    .line 244
    sget-object p0, Ll/tsg0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 245
    .line 246
    invoke-virtual {p0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 247
    .line 248
    .line 249
    return-void
.end method

.method public final k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/bxg0;Ll/bpg0;Ll/neg0;Ll/vlg0;)V
    .locals 1

    .line 1
    new-instance p0, Ll/yjg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/yjg0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    :try_start_0
    iput v0, p0, Ll/yjg0;->a:I

    .line 8
    .line 9
    const-string v0, "success"

    .line 10
    .line 11
    iput-object v0, p0, Ll/yjg0;->b:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static/range {p1 .. p6}, Ll/uyg0;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/bxg0;Ll/bpg0;Ll/neg0;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    goto :goto_0

    .line 18
    :catch_0
    move-exception v0

    .line 19
    move-object p1, v0

    .line 20
    new-instance p2, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string p3, "commonPost error :"

    .line 23
    .line 24
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p1}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    sget-object p3, Ll/uyg0;->p:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {p3, p2}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    const-string p3, "HttpService"

    .line 44
    .line 45
    invoke-static {p3, p2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    iget p2, p0, Ll/yjg0;->a:I

    .line 49
    .line 50
    if-nez p2, :cond_0

    .line 51
    .line 52
    invoke-static {p1}, Ll/oeg0;->a(Ljava/lang/Throwable;)I

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    iput p2, p0, Ll/yjg0;->a:I

    .line 57
    .line 58
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iput-object p1, p0, Ll/yjg0;->b:Ljava/lang/String;

    .line 63
    .line 64
    :cond_0
    const-string p1, ""

    .line 65
    .line 66
    :goto_0
    new-instance p2, Ll/iyg0;

    .line 67
    .line 68
    invoke-direct {p2, p0, p7, p1}, Ll/iyg0;-><init>(Ll/yjg0;Ll/vlg0;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-static {p2}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final l(Ljava/lang/String;Ljava/lang/String;Ll/yng0;Ll/vlg0;Ll/neg0;)V
    .locals 10

    .line 1
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v5

    .line 13
    new-instance v6, Ll/bxg0;

    .line 14
    .line 15
    invoke-direct {v6}, Ll/bxg0;-><init>()V

    .line 16
    .line 17
    .line 18
    new-instance v1, Ll/dyg0;

    .line 19
    .line 20
    move-object v2, p0

    .line 21
    move-object v3, p1

    .line 22
    move-object v4, p2

    .line 23
    move-object v7, p3

    .line 24
    move-object v9, p4

    .line 25
    move-object v8, p5

    .line 26
    invoke-direct/range {v1 .. v9}, Ll/dyg0;-><init>(Ll/uyg0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/bxg0;Ll/bpg0;Ll/neg0;Ll/vlg0;)V

    .line 27
    .line 28
    .line 29
    sget-object p0, Ll/tsg0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 30
    .line 31
    invoke-virtual {p0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final m(Ljava/lang/String;Ljava/lang/String;Ll/bxg0;Ll/bpg0;Ll/neg0;Ll/vlg0;)V
    .locals 1

    .line 1
    new-instance p0, Ll/yjg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/yjg0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    :try_start_0
    iput v0, p0, Ll/yjg0;->a:I

    .line 8
    .line 9
    const-string v0, "success"

    .line 10
    .line 11
    iput-object v0, p0, Ll/yjg0;->b:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p1, p2, p3, p4, p5}, Ll/uyg0;->c(Ljava/lang/String;Ljava/lang/String;Ll/bxg0;Ll/bpg0;Ll/neg0;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    goto :goto_0

    .line 18
    :catch_0
    move-exception p1

    .line 19
    new-instance p2, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string p3, "commonGet error :"

    .line 22
    .line 23
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    sget-object p3, Ll/uyg0;->p:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {p3, p2}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    const-string p3, "HttpService"

    .line 43
    .line 44
    invoke-static {p3, p2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    iget p2, p0, Ll/yjg0;->a:I

    .line 48
    .line 49
    if-nez p2, :cond_0

    .line 50
    .line 51
    invoke-static {p1}, Ll/oeg0;->a(Ljava/lang/Throwable;)I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    iput p2, p0, Ll/yjg0;->a:I

    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iput-object p1, p0, Ll/yjg0;->b:Ljava/lang/String;

    .line 62
    .line 63
    :cond_0
    const-string p1, ""

    .line 64
    .line 65
    :goto_0
    new-instance p2, Ll/cyg0;

    .line 66
    .line 67
    invoke-direct {p2, p0, p6, p1}, Ll/cyg0;-><init>(Ll/yjg0;Ll/vlg0;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-static {p2}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final n(Ljava/lang/String;Ll/ukg0;Ll/bxg0;Ll/axg0;)V
    .locals 7

    .line 1
    const-string v0, "url"

    .line 2
    .line 3
    new-instance v3, Ll/yjg0;

    .line 4
    .line 5
    invoke-direct {v3}, Ll/yjg0;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, ""

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    :try_start_0
    iput v2, v3, Ll/yjg0;->a:I

    .line 12
    .line 13
    const-string v2, "success"

    .line 14
    .line 15
    iput-object v2, v3, Ll/yjg0;->b:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v2, p2, Ll/ukg0;->c:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v4, p0, Ll/uyg0;->l:Ll/bpg0;

    .line 20
    .line 21
    const/4 v5, 0x0

    .line 22
    invoke-static {p1, v2, p3, v4, v5}, Ll/uyg0;->c(Ljava/lang/String;Ljava/lang/String;Ll/bxg0;Ll/bpg0;Ll/neg0;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 26
    :try_start_1
    new-instance p3, Lorg/json/JSONObject;

    .line 27
    .line 28
    invoke-direct {p3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 35
    :try_start_2
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-eqz v4, :cond_0

    .line 40
    .line 41
    const/4 v4, -0x1

    .line 42
    iput v4, v3, Ll/yjg0;->a:I

    .line 43
    .line 44
    const-string v4, "url is null or empty"

    .line 45
    .line 46
    iput-object v4, v3, Ll/yjg0;->b:Ljava/lang/String;

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catch_0
    move-exception v0

    .line 50
    move-object p3, v0

    .line 51
    goto :goto_2

    .line 52
    :cond_0
    :goto_0
    const-string v4, "checker"

    .line 53
    .line 54
    invoke-virtual {p3, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    if-eqz p3, :cond_1

    .line 59
    .line 60
    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 64
    :cond_1
    :goto_1
    move-object v6, v1

    .line 65
    move-object v4, v2

    .line 66
    goto :goto_4

    .line 67
    :catch_1
    move-exception v0

    .line 68
    move-object p3, v0

    .line 69
    move-object v2, v1

    .line 70
    goto :goto_2

    .line 71
    :catch_2
    move-exception v0

    .line 72
    move-object p3, v0

    .line 73
    move-object p1, v1

    .line 74
    move-object v2, p1

    .line 75
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    const-string v4, "fqs error :"

    .line 78
    .line 79
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    invoke-static {p3}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    sget-object v4, Ll/uyg0;->p:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {v4, v0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    const-string v4, "HttpService"

    .line 99
    .line 100
    invoke-static {v4, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    iget v0, v3, Ll/yjg0;->a:I

    .line 104
    .line 105
    if-nez v0, :cond_2

    .line 106
    .line 107
    invoke-static {p3}, Ll/oeg0;->a(Ljava/lang/Throwable;)I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    iput v0, v3, Ll/yjg0;->a:I

    .line 112
    .line 113
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p3

    .line 117
    iput-object p3, v3, Ll/yjg0;->b:Ljava/lang/String;

    .line 118
    .line 119
    :cond_2
    if-eqz p1, :cond_3

    .line 120
    .line 121
    iput-object p1, p2, Ll/ukg0;->d:Ljava/lang/String;

    .line 122
    .line 123
    goto :goto_3

    .line 124
    :cond_3
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 125
    .line 126
    .line 127
    :goto_3
    iget p1, v3, Ll/yjg0;->a:I

    .line 128
    .line 129
    iput p1, p2, Ll/ukg0;->e:I

    .line 130
    .line 131
    iget-object p1, v3, Ll/yjg0;->b:Ljava/lang/String;

    .line 132
    .line 133
    if-eqz p1, :cond_1

    .line 134
    .line 135
    iput-object p1, p2, Ll/ukg0;->f:Ljava/lang/String;

    .line 136
    .line 137
    goto :goto_1

    .line 138
    :goto_4
    invoke-static {p2}, Ll/fug0;->b(Ll/ukg0;)V

    .line 139
    .line 140
    .line 141
    new-instance v1, Ll/lyg0;

    .line 142
    .line 143
    move-object v2, p0

    .line 144
    move-object v5, p4

    .line 145
    invoke-direct/range {v1 .. v6}, Ll/lyg0;-><init>(Ll/uyg0;Ll/yjg0;Ljava/lang/String;Ll/axg0;Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    invoke-static {v1}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method public final o(Ljava/lang/String;Ll/yng0;Ll/fzg0;Ll/neg0;)V
    .locals 9

    .line 1
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    new-instance v5, Ll/bxg0;

    .line 14
    .line 15
    invoke-direct {v5}, Ll/bxg0;-><init>()V

    .line 16
    .line 17
    .line 18
    new-instance v1, Ll/kyg0;

    .line 19
    .line 20
    move-object v2, p0

    .line 21
    move-object v3, p1

    .line 22
    move-object v6, p2

    .line 23
    move-object v8, p3

    .line 24
    move-object v7, p4

    .line 25
    invoke-direct/range {v1 .. v8}, Ll/kyg0;-><init>(Ll/uyg0;Ljava/lang/String;Ljava/lang/String;Ll/bxg0;Ll/bpg0;Ll/neg0;Ll/vlg0;)V

    .line 26
    .line 27
    .line 28
    sget-object p0, Ll/tsg0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 29
    .line 30
    invoke-virtual {p0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final p(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    const-string v0, "reportEvent.sp"

    .line 2
    .line 3
    invoke-static {v0}, Ll/kjg0;->a(Ljava/lang/String;)Ll/kjg0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1, p1, p2}, Ll/kjg0;->c(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    iget-object p2, p0, Ll/uyg0;->h:Ljava/lang/String;

    .line 23
    .line 24
    if-eqz p2, :cond_1

    .line 25
    .line 26
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-eqz p2, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    new-instance p1, Ll/ivg0;

    .line 34
    .line 35
    invoke-direct {p1, p0}, Ll/ivg0;-><init>(Ll/uyg0;)V

    .line 36
    .line 37
    .line 38
    sget-object p0, Ll/tsg0;->d:Ljava/util/concurrent/ExecutorService;

    .line 39
    .line 40
    invoke-interface {p0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string p2, "\u8fd8\u672a\u521d\u59cb\u5316sdk\u6210\u529f\uff0c\u7b49\u5f85\u4e0a\u62a5\u7684\u6570\u636e\u4e3a\uff1a"

    .line 47
    .line 48
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const-string p1, "HttpService"

    .line 59
    .line 60
    invoke-static {p1, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final q(Ll/yjg0;Ljava/lang/String;Ll/axg0;Ljava/lang/String;)V
    .locals 11

    .line 1
    iput-object p4, p0, Ll/uyg0;->c:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p3, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result p4

    .line 10
    const/4 v0, 0x0

    .line 11
    if-nez p4, :cond_4

    .line 12
    .line 13
    iput-object p2, p0, Ll/uyg0;->b:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v2, p3, Ll/axg0;->i:Ll/uyg0;

    .line 16
    .line 17
    iget-object p1, p3, Ll/axg0;->a:Landroid/content/Context;

    .line 18
    .line 19
    iget-object v3, p3, Ll/axg0;->b:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v4, p3, Ll/axg0;->c:Ljava/lang/String;

    .line 22
    .line 23
    iget-boolean v6, p3, Ll/axg0;->d:Z

    .line 24
    .line 25
    iget-object p2, p3, Ll/axg0;->e:Ll/bpg0;

    .line 26
    .line 27
    iget-boolean p3, v2, Ll/uyg0;->a:Z

    .line 28
    .line 29
    if-eqz p3, :cond_3

    .line 30
    .line 31
    monitor-enter v2

    .line 32
    :try_start_0
    iget-object p1, v2, Ll/uyg0;->k:Ljava/util/ArrayList;

    .line 33
    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    const-string p1, "HttpService"

    .line 37
    .line 38
    const-string p2, "error notifyInitSdkSuccess but listenerList is null"

    .line 39
    .line 40
    invoke-static {p1, p2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    monitor-exit v2

    .line 44
    goto/16 :goto_2

    .line 45
    .line 46
    :catchall_0
    move-exception v0

    .line 47
    move-object p0, v0

    .line 48
    goto :goto_1

    .line 49
    :cond_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    const/4 p3, 0x0

    .line 54
    move p4, p3

    .line 55
    :goto_0
    if-ge p4, p2, :cond_2

    .line 56
    .line 57
    invoke-virtual {p1, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    add-int/lit8 p4, p4, 0x1

    .line 62
    .line 63
    check-cast v1, Ltech/sud/gip/core/ISudListenerInitSDK;

    .line 64
    .line 65
    invoke-interface {v1}, Ltech/sud/gip/core/ISudListenerInitSDK;->onSuccess()V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    iput-object v0, v2, Ll/uyg0;->k:Ljava/util/ArrayList;

    .line 70
    .line 71
    iget-object p1, v2, Ll/uyg0;->j:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 72
    .line 73
    invoke-virtual {p1, p3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 74
    .line 75
    .line 76
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    goto/16 :goto_2

    .line 78
    .line 79
    :goto_1
    monitor-exit v2

    .line 80
    throw p0

    .line 81
    :cond_3
    sget-object p3, Ll/jpg0;->f:Ll/jpg0;

    .line 82
    .line 83
    invoke-virtual {p3, p1}, Ll/jpg0;->b(Landroid/content/Context;)V

    .line 84
    .line 85
    .line 86
    iget-object v7, v2, Ll/uyg0;->b:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    new-instance p1, Ll/bpg0;

    .line 93
    .line 94
    invoke-direct {p1}, Ll/bpg0;-><init>()V

    .line 95
    .line 96
    .line 97
    iput-object p1, v2, Ll/uyg0;->m:Ll/bpg0;

    .line 98
    .line 99
    invoke-virtual {p1, p2}, Ll/bpg0;->c(Ll/bpg0;)V

    .line 100
    .line 101
    .line 102
    iget-object p1, v2, Ll/uyg0;->m:Ll/bpg0;

    .line 103
    .line 104
    invoke-virtual {p1, v7}, Ll/bpg0;->b(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    new-instance v1, Ll/xug0;

    .line 108
    .line 109
    invoke-direct/range {v1 .. v7}, Ll/xug0;-><init>(Ll/uyg0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 110
    .line 111
    .line 112
    sget-object p1, Ll/tsg0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 113
    .line 114
    invoke-virtual {p1, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 115
    .line 116
    .line 117
    goto/16 :goto_2

    .line 118
    .line 119
    :cond_4
    new-instance p2, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    new-instance p4, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    const-string v1, "getFQSInfo fail appId="

    .line 124
    .line 125
    invoke-direct {p4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    sget-object v1, Ll/utg0;->g:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p4

    .line 137
    invoke-direct {p2, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    new-instance p4, Ljava/lang/StringBuilder;

    .line 141
    .line 142
    const-string v1, " isTestEnv="

    .line 143
    .line 144
    invoke-direct {p4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    sget-boolean v1, Ll/utg0;->c:Z

    .line 148
    .line 149
    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p4

    .line 156
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    const-string p4, " "

    .line 160
    .line 161
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    new-instance p4, Ljava/lang/StringBuilder;

    .line 165
    .line 166
    const-string v1, " ret_code="

    .line 167
    .line 168
    invoke-direct {p4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    iget v1, p1, Ll/yjg0;->a:I

    .line 172
    .line 173
    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p4

    .line 180
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string p4, " null == getSDKTokenUrl || getSDKTokenUrl.isEmpty(), Please contact SUD, Open production environment service"

    .line 184
    .line 185
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    iget-object p4, p1, Ll/yjg0;->b:Ljava/lang/String;

    .line 189
    .line 190
    if-eqz p4, :cond_5

    .line 191
    .line 192
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    :cond_5
    iget p1, p1, Ll/yjg0;->a:I

    .line 196
    .line 197
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object p2

    .line 201
    iget v8, p3, Ll/axg0;->f:I

    .line 202
    .line 203
    if-lez v8, :cond_8

    .line 204
    .line 205
    iget p4, p3, Ll/axg0;->g:I

    .line 206
    .line 207
    if-ge p4, v8, :cond_8

    .line 208
    .line 209
    iget-object v2, p3, Ll/axg0;->i:Ll/uyg0;

    .line 210
    .line 211
    iget-object v3, p3, Ll/axg0;->a:Landroid/content/Context;

    .line 212
    .line 213
    iget-object v4, p3, Ll/axg0;->b:Ljava/lang/String;

    .line 214
    .line 215
    iget-object v5, p3, Ll/axg0;->c:Ljava/lang/String;

    .line 216
    .line 217
    iget-boolean v6, p3, Ll/axg0;->d:Z

    .line 218
    .line 219
    add-int/lit8 v9, p4, 0x1

    .line 220
    .line 221
    iget-object v10, p3, Ll/axg0;->h:Ll/bpg0;

    .line 222
    .line 223
    iget-object v7, p3, Ll/axg0;->e:Ll/bpg0;

    .line 224
    .line 225
    iget-object p1, v2, Ll/uyg0;->l:Ll/bpg0;

    .line 226
    .line 227
    if-eqz p1, :cond_6

    .line 228
    .line 229
    if-eqz v10, :cond_6

    .line 230
    .line 231
    invoke-virtual {p1, v10}, Ll/bpg0;->c(Ll/bpg0;)V

    .line 232
    .line 233
    .line 234
    iget-object p1, v2, Ll/uyg0;->l:Ll/bpg0;

    .line 235
    .line 236
    iget-object p1, p1, Ll/bpg0;->b:Ljava/lang/String;

    .line 237
    .line 238
    invoke-virtual {v10, p1}, Ll/bpg0;->b(Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    :cond_6
    iget-object p1, v2, Ll/uyg0;->m:Ll/bpg0;

    .line 242
    .line 243
    if-eqz p1, :cond_7

    .line 244
    .line 245
    if-eqz v7, :cond_7

    .line 246
    .line 247
    invoke-virtual {p1, v7}, Ll/bpg0;->c(Ll/bpg0;)V

    .line 248
    .line 249
    .line 250
    iget-object p1, v2, Ll/uyg0;->m:Ll/bpg0;

    .line 251
    .line 252
    iget-object p1, p1, Ll/bpg0;->b:Ljava/lang/String;

    .line 253
    .line 254
    invoke-virtual {v7, p1}, Ll/bpg0;->b(Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    :cond_7
    new-instance v1, Ll/axg0;

    .line 258
    .line 259
    invoke-direct/range {v1 .. v10}, Ll/axg0;-><init>(Ll/uyg0;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLl/bpg0;IILl/bpg0;)V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v2, v4, v9, v1, v10}, Ll/uyg0;->j(Ljava/lang/String;ILl/axg0;Ll/bpg0;)V

    .line 263
    .line 264
    .line 265
    goto :goto_2

    .line 266
    :cond_8
    iget-object p3, p3, Ll/axg0;->i:Ll/uyg0;

    .line 267
    .line 268
    invoke-virtual {p3, p1, p2}, Ll/uyg0;->g(ILjava/lang/String;)V

    .line 269
    .line 270
    .line 271
    :goto_2
    iput-object v0, p0, Ll/uyg0;->l:Ll/bpg0;

    .line 272
    .line 273
    return-void
.end method

.method public final s(Ll/ylg0;Ll/ukg0;Ll/bxg0;Ll/vsg0;)V
    .locals 10

    .line 1
    const-string v0, " request-id="

    .line 2
    .line 3
    const-string v1, "url="

    .line 4
    .line 5
    const-string v2, "HttpService"

    .line 6
    .line 7
    new-instance v3, Ll/zlg0;

    .line 8
    .line 9
    invoke-direct {v3}, Ll/zlg0;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v4, ""

    .line 13
    .line 14
    const-string v5, "success"

    .line 15
    .line 16
    const/4 v6, 0x0

    .line 17
    :try_start_0
    new-instance v7, Lorg/json/JSONObject;

    .line 18
    .line 19
    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v8, "app_id"

    .line 23
    .line 24
    iget-object v9, p1, Ll/ylg0;->a:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 27
    .line 28
    .line 29
    const-string v8, "uid"

    .line 30
    .line 31
    iget-object p1, p1, Ll/ylg0;->a:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v7, v8, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iget-object p0, p0, Ll/uyg0;->f:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v7, p2, Ll/ukg0;->c:Ljava/lang/String;

    .line 43
    .line 44
    const-string v8, "application/json; charset=utf-8"

    .line 45
    .line 46
    invoke-static {v8}, Ll/e7y;->c(Ljava/lang/String;)Ll/e7y;

    .line 47
    .line 48
    .line 49
    move-result-object v8

    .line 50
    invoke-static {v8, p1}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    const/4 v8, 0x0

    .line 55
    invoke-static {v7, p3, v8}, Ll/uyg0;->e(Ljava/lang/String;Ll/bxg0;Ll/t4f;)Ll/x1d0$a;

    .line 56
    .line 57
    .line 58
    move-result-object p3

    .line 59
    invoke-virtual {p3, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    invoke-virtual {p3, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-static {p1}, Ll/tsg0;->a(Ll/x1d0$a;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    sget-object p3, Ll/tsg0;->b:Ll/rg50;

    .line 75
    .line 76
    invoke-virtual {p3, p1}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-interface {p1}, Ll/ry3;->execute()Ll/i5d0;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1}, Ll/i5d0;->k()Ll/k5d0;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1}, Ll/k5d0;->string()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    new-instance p3, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {p3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p3

    .line 113
    invoke-static {v2, p3}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    sget-object p3, Ll/uyg0;->p:Ljava/lang/String;

    .line 117
    .line 118
    new-instance v8, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    invoke-direct {v8, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-static {p3, p0}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 137
    .line 138
    .line 139
    :try_start_1
    new-instance p0, Lorg/json/JSONObject;

    .line 140
    .line 141
    invoke-direct {p0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    const-string p3, "ret_code"

    .line 145
    .line 146
    invoke-virtual {p0, p3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 147
    .line 148
    .line 149
    move-result v6

    .line 150
    const-string p3, "ret_msg"

    .line 151
    .line 152
    invoke-virtual {p0, p3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v5

    .line 156
    const-string p3, "data"

    .line 157
    .line 158
    invoke-virtual {p0, p3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    if-eqz p0, :cond_2

    .line 163
    .line 164
    const-string p3, "access_token"

    .line 165
    .line 166
    invoke-virtual {p0, p3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p3

    .line 170
    iput-object p3, v3, Ll/zlg0;->a:Ljava/lang/String;

    .line 171
    .line 172
    const-string p3, "expires_in"

    .line 173
    .line 174
    invoke-virtual {p0, p3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 175
    .line 176
    .line 177
    goto :goto_2

    .line 178
    :catch_0
    move-exception p0

    .line 179
    move-object v4, p1

    .line 180
    goto :goto_0

    .line 181
    :catch_1
    move-exception p0

    .line 182
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 183
    .line 184
    const-string p3, "fqs error :"

    .line 185
    .line 186
    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    invoke-static {p0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p3

    .line 193
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    sget-object p3, Ll/uyg0;->p:Ljava/lang/String;

    .line 201
    .line 202
    invoke-static {p3, p1}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    invoke-static {v2, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 206
    .line 207
    .line 208
    if-nez v6, :cond_0

    .line 209
    .line 210
    invoke-static {p0}, Ll/oeg0;->a(Ljava/lang/Throwable;)I

    .line 211
    .line 212
    .line 213
    move-result p1

    .line 214
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    move-object v5, p0

    .line 219
    move v6, p1

    .line 220
    :cond_0
    if-eqz v4, :cond_1

    .line 221
    .line 222
    iput-object v4, p2, Ll/ukg0;->d:Ljava/lang/String;

    .line 223
    .line 224
    goto :goto_1

    .line 225
    :cond_1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 226
    .line 227
    .line 228
    :goto_1
    iput v6, p2, Ll/ukg0;->e:I

    .line 229
    .line 230
    if-eqz v5, :cond_2

    .line 231
    .line 232
    iput-object v5, p2, Ll/ukg0;->f:Ljava/lang/String;

    .line 233
    .line 234
    :cond_2
    :goto_2
    new-instance p0, Ll/hyg0;

    .line 235
    .line 236
    invoke-direct {p0, v6, p4, v3, v5}, Ll/hyg0;-><init>(ILl/vsg0;Ll/zlg0;Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    invoke-static {p0}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 240
    .line 241
    .line 242
    return-void
.end method

.method public final t(Ll/ylg0;Ll/flg0;)V
    .locals 6

    .line 1
    new-instance v3, Ll/ukg0;

    .line 2
    .line 3
    const-string v0, "getGateToken"

    .line 4
    .line 5
    invoke-direct {v3, v0}, Ll/ukg0;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v4, Ll/bxg0;

    .line 9
    .line 10
    invoke-direct {v4}, Ll/bxg0;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v4, v3, Ll/ukg0;->n:Ll/bxg0;

    .line 14
    .line 15
    new-instance v0, Ll/byg0;

    .line 16
    .line 17
    move-object v1, p0

    .line 18
    move-object v2, p1

    .line 19
    move-object v5, p2

    .line 20
    invoke-direct/range {v0 .. v5}, Ll/byg0;-><init>(Ll/uyg0;Ll/ylg0;Ll/ukg0;Ll/bxg0;Ll/vsg0;)V

    .line 21
    .line 22
    .line 23
    sget-object p0, Ll/tsg0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final u(Ll/dpg0;Ll/cog0;)V
    .locals 1

    .line 1
    new-instance v0, Ll/fyg0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/fyg0;-><init>(Ll/uyg0;Ll/dpg0;Ll/yug0;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ll/tsg0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final v(Ll/dpg0;Ll/yug0;)V
    .locals 8

    .line 1
    const-string p0, " request-id="

    .line 2
    .line 3
    const-string v0, "url="

    .line 4
    .line 5
    const-string v1, "HttpService"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    .line 9
    .line 10
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v4, "message_id"

    .line 14
    .line 15
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 16
    .line 17
    .line 18
    move-result-object v5

    .line 19
    invoke-virtual {v5}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    invoke-static {v5}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 28
    .line 29
    .line 30
    const-string v4, "mg_id"

    .line 31
    .line 32
    iget-wide v5, p1, Ll/dpg0;->a:J

    .line 33
    .line 34
    invoke-virtual {v3, v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 35
    .line 36
    .line 37
    const-string v4, "room_id"

    .line 38
    .line 39
    iget-object v5, p1, Ll/dpg0;->b:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 42
    .line 43
    .line 44
    const-string v4, "message_type"

    .line 45
    .line 46
    const/4 v5, 0x1

    .line 47
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 48
    .line 49
    .line 50
    new-instance v4, Lorg/json/JSONObject;

    .line 51
    .line 52
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 53
    .line 54
    .line 55
    const-string v5, "uid"

    .line 56
    .line 57
    iget-object v6, p1, Ll/dpg0;->c:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 60
    .line 61
    .line 62
    const-string v5, "nickname"

    .line 63
    .line 64
    iget-object v6, p1, Ll/dpg0;->d:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 67
    .line 68
    .line 69
    const-string v5, "sender"

    .line 70
    .line 71
    invoke-virtual {v3, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 72
    .line 73
    .line 74
    const-string v4, "content"

    .line 75
    .line 76
    iget-object v5, p1, Ll/dpg0;->e:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 79
    .line 80
    .line 81
    const-string v4, "timestamp"

    .line 82
    .line 83
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 84
    .line 85
    .line 86
    move-result-wide v5

    .line 87
    invoke-virtual {v3, v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 88
    .line 89
    .line 90
    iget-object v4, p1, Ll/dpg0;->f:Ll/xsg0;

    .line 91
    .line 92
    if-eqz v4, :cond_0

    .line 93
    .line 94
    new-instance v4, Lorg/json/JSONObject;

    .line 95
    .line 96
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 97
    .line 98
    .line 99
    const-string v5, "asr_duration"

    .line 100
    .line 101
    iget-object v6, p1, Ll/dpg0;->f:Ll/xsg0;

    .line 102
    .line 103
    iget-wide v6, v6, Ll/xsg0;->a:J

    .line 104
    .line 105
    invoke-virtual {v4, v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 106
    .line 107
    .line 108
    const-string v5, "end_time"

    .line 109
    .line 110
    iget-object v6, p1, Ll/dpg0;->f:Ll/xsg0;

    .line 111
    .line 112
    iget-wide v6, v6, Ll/xsg0;->b:J

    .line 113
    .line 114
    invoke-virtual {v4, v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 115
    .line 116
    .line 117
    const-string v5, "log_id"

    .line 118
    .line 119
    iget-object v6, p1, Ll/dpg0;->f:Ll/xsg0;

    .line 120
    .line 121
    iget-object v6, v6, Ll/xsg0;->c:Ljava/lang/String;

    .line 122
    .line 123
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 124
    .line 125
    .line 126
    const-string v5, "start_time"

    .line 127
    .line 128
    iget-object v6, p1, Ll/dpg0;->f:Ll/xsg0;

    .line 129
    .line 130
    iget-wide v6, v6, Ll/xsg0;->d:J

    .line 131
    .line 132
    invoke-virtual {v4, v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 133
    .line 134
    .line 135
    const-string v5, "audio_start_time"

    .line 136
    .line 137
    iget-object v6, p1, Ll/dpg0;->f:Ll/xsg0;

    .line 138
    .line 139
    iget-wide v6, v6, Ll/xsg0;->e:J

    .line 140
    .line 141
    invoke-virtual {v4, v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 142
    .line 143
    .line 144
    const-string v5, "audio_end_time"

    .line 145
    .line 146
    iget-object p1, p1, Ll/dpg0;->f:Ll/xsg0;

    .line 147
    .line 148
    iget-wide v6, p1, Ll/xsg0;->f:J

    .line 149
    .line 150
    invoke-virtual {v4, v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 151
    .line 152
    .line 153
    const-string p1, "metrics"

    .line 154
    .line 155
    invoke-virtual {v3, p1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 156
    .line 157
    .line 158
    goto :goto_0

    .line 159
    :catch_0
    move-exception p0

    .line 160
    goto/16 :goto_2

    .line 161
    .line 162
    :cond_0
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    sget-object v3, Ll/utg0;->e:Ll/i0h0;

    .line 167
    .line 168
    const/4 v4, 0x0

    .line 169
    if-eqz v3, :cond_1

    .line 170
    .line 171
    iget-object v3, v3, Ll/i0h0;->c:Ll/gvg0;

    .line 172
    .line 173
    if-eqz v3, :cond_1

    .line 174
    .line 175
    iget-object v3, v3, Ll/gvg0;->m:Ll/tfg0;

    .line 176
    .line 177
    if-eqz v3, :cond_1

    .line 178
    .line 179
    iget-object v3, v3, Ll/tfg0;->d:Ljava/lang/String;

    .line 180
    .line 181
    goto :goto_1

    .line 182
    :cond_1
    move-object v3, v4

    .line 183
    :goto_1
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 184
    .line 185
    .line 186
    move-result-object v5

    .line 187
    invoke-virtual {v5}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v5

    .line 191
    invoke-static {v5}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v5

    .line 195
    new-instance v6, Ll/bxg0;

    .line 196
    .line 197
    invoke-direct {v6}, Ll/bxg0;-><init>()V

    .line 198
    .line 199
    .line 200
    const-string v7, "application/json; charset=utf-8"

    .line 201
    .line 202
    invoke-static {v7}, Ll/e7y;->c(Ljava/lang/String;)Ll/e7y;

    .line 203
    .line 204
    .line 205
    move-result-object v7

    .line 206
    invoke-static {v7, p1}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    invoke-static {v5, v6, v4}, Ll/uyg0;->e(Ljava/lang/String;Ll/bxg0;Ll/t4f;)Ll/x1d0$a;

    .line 211
    .line 212
    .line 213
    move-result-object v4

    .line 214
    invoke-virtual {v4, v3}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 215
    .line 216
    .line 217
    move-result-object v4

    .line 218
    invoke-virtual {v4, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    invoke-static {p1}, Ll/tsg0;->a(Ll/x1d0$a;)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {p1}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    sget-object v4, Ll/tsg0;->b:Ll/rg50;

    .line 230
    .line 231
    invoke-virtual {v4, p1}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    invoke-interface {p1}, Ll/ry3;->execute()Ll/i5d0;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    invoke-virtual {p1}, Ll/i5d0;->k()Ll/k5d0;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    invoke-virtual {p1}, Ll/k5d0;->string()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    new-instance v4, Ljava/lang/StringBuilder;

    .line 251
    .line 252
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object v4

    .line 268
    invoke-static {v1, v4}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 269
    .line 270
    .line 271
    sget-object v4, Ll/uyg0;->p:Ljava/lang/String;

    .line 272
    .line 273
    new-instance v6, Ljava/lang/StringBuilder;

    .line 274
    .line 275
    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 282
    .line 283
    .line 284
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object p0

    .line 291
    invoke-static {v4, p0}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 292
    .line 293
    .line 294
    new-instance p0, Lorg/json/JSONObject;

    .line 295
    .line 296
    invoke-direct {p0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    const-string p1, "ret_code"

    .line 300
    .line 301
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 302
    .line 303
    .line 304
    move-result v2

    .line 305
    const-string p1, "ret_msg"

    .line 306
    .line 307
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 311
    goto :goto_3

    .line 312
    :goto_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 313
    .line 314
    const-string v0, "fqs error :"

    .line 315
    .line 316
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 317
    .line 318
    .line 319
    invoke-static {p0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 324
    .line 325
    .line 326
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 327
    .line 328
    .line 329
    move-result-object p1

    .line 330
    sget-object v0, Ll/uyg0;->p:Ljava/lang/String;

    .line 331
    .line 332
    invoke-static {v0, p1}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 333
    .line 334
    .line 335
    invoke-static {v1, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 336
    .line 337
    .line 338
    if-nez v2, :cond_2

    .line 339
    .line 340
    invoke-static {p0}, Ll/oeg0;->a(Ljava/lang/Throwable;)I

    .line 341
    .line 342
    .line 343
    move-result v2

    .line 344
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 345
    .line 346
    .line 347
    move-result-object p0

    .line 348
    goto :goto_3

    .line 349
    :cond_2
    const-string p0, "success"

    .line 350
    .line 351
    :goto_3
    new-instance p1, Ll/gyg0;

    .line 352
    .line 353
    invoke-direct {p1, v2, p2, p0}, Ll/gyg0;-><init>(ILl/yug0;Ljava/lang/String;)V

    .line 354
    .line 355
    .line 356
    invoke-static {p1}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 357
    .line 358
    .line 359
    return-void
.end method

.method public final declared-synchronized x(Ltech/sud/gip/core/ISudListenerInitSDK;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :cond_0
    :try_start_0
    iget-object v0, p0, Ll/uyg0;->k:Ljava/util/ArrayList;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/uyg0;->k:Ljava/util/ArrayList;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p1

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/uyg0;->k:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    monitor-exit p0

    .line 26
    return-void

    .line 27
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    throw p1
.end method

.method public final y(Ltech/sud/gip/core/ISudListenerInitSDK;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLl/bpg0;Ll/bpg0;)V
    .locals 9

    .line 1
    new-instance v0, Ll/eyg0;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v5, p4

    .line 8
    move v6, p5

    .line 9
    move-object v7, p6

    .line 10
    move-object/from16 v8, p7

    .line 11
    .line 12
    invoke-direct/range {v0 .. v8}, Ll/eyg0;-><init>(Ll/uyg0;Ltech/sud/gip/core/ISudListenerInitSDK;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLl/bpg0;Ll/bpg0;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
