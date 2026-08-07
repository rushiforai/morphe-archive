.class Ll/ow5$a;
.super Ll/q1r0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ow5;->k(Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Ll/ow5;


# direct methods
.method public constructor <init>(Ll/ow5;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ow5$a;->d:Ll/ow5;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ow5$a;->c:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/q1r0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .line 1
    const-string v0, "md5"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/ow5$a;->c:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-super {p0, p1}, Ll/q1r0;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method
