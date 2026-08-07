.class public Ll/gbe0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/gbe0$a;
    }
.end annotation


# instance fields
.field public final a:Ll/vxd0;

.field public final b:Ll/wyd0;

.field public c:Z

.field public final d:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/vxd0;

    .line 5
    .line 6
    const-string v1, "school_downloaded_version"

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/gbe0;->a:Ll/vxd0;

    .line 13
    .line 14
    new-instance v0, Ll/wyd0;

    .line 15
    .line 16
    const-string v1, "school_list_json_Sp"

    .line 17
    .line 18
    const-string v3, ""

    .line 19
    .line 20
    invoke-direct {v0, v1, v3}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/gbe0;->b:Ll/wyd0;

    .line 24
    .line 25
    iput-boolean v2, p0, Ll/gbe0;->c:Z

    .line 26
    .line 27
    new-instance v0, Ljava/util/HashSet;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/gbe0;->d:Ljava/util/Set;

    .line 33
    .line 34
    new-instance v0, Ljava/util/HashSet;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ll/gbe0;->e:Ljava/util/HashSet;

    .line 40
    .line 41
    return-void
.end method

.method public synthetic constructor <init>(Ll/hbe0;)V
    .locals 0

    .line 42
    invoke-direct {p0}, Ll/gbe0;-><init>()V

    return-void
.end method

.method public static b()Ll/gbe0;
    .locals 1

    .line 1
    invoke-static {}, Ll/gbe0$a;->a()Ll/gbe0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public final a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gbe0;->d:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Set;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gbe0;->e:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/gbe0;->a()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/fbe0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/fbe0;-><init>(Ll/gbe0;)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
