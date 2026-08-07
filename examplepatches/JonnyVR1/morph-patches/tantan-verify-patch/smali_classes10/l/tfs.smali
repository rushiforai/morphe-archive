.class public Ll/tfs;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/tfs$a;
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic a(Ll/tfs;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tfs;->i:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic b(Ll/tfs;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tfs;->d:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic c(Ll/tfs;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tfs;->e:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic d(Ll/tfs;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tfs;->f:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic e(Ll/tfs;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tfs;->b:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic f(Ll/tfs;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tfs;->g:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic g(Ll/tfs;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tfs;->a:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic h(Ll/tfs;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tfs;->c:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic i(Ll/tfs;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tfs;->h:Ljava/lang/String;

    return-void
.end method

.method public static k()Ll/tfs$a;
    .locals 2

    .line 1
    new-instance v0, Ll/tfs$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/tfs$a;-><init>(Ll/rfs;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method


# virtual methods
.method public j()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "anchorId"

    .line 7
    .line 8
    iget-object v2, p0, Ll/tfs;->i:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    const-string v1, "liveFollow_from"

    .line 14
    .line 15
    iget-object v2, p0, Ll/tfs;->d:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    const-string v1, "liveId"

    .line 21
    .line 22
    iget-object v2, p0, Ll/tfs;->e:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    const-string v1, "liveStatus"

    .line 28
    .line 29
    iget-object v2, p0, Ll/tfs;->f:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    const-string v1, "moment_id"

    .line 35
    .line 36
    iget-object v2, p0, Ll/tfs;->b:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    const-string v1, "moment_type"

    .line 42
    .line 43
    iget-object v2, p0, Ll/tfs;->g:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    const-string v1, "owner_id"

    .line 49
    .line 50
    iget-object v2, p0, Ll/tfs;->a:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    const-string v1, "receiver_user_id"

    .line 56
    .line 57
    iget-object v2, p0, Ll/tfs;->c:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    const-string v1, "window_name"

    .line 63
    .line 64
    iget-object p0, p0, Ll/tfs;->h:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    return-object v0
.end method
