.class Ll/mx3$b;
.super Ll/ysd0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/mx3;->g(Landroid/content/Context;Ll/ysd0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic c:Ll/ysd0;

.field final synthetic d:Ll/mx3;


# direct methods
.method public constructor <init>(Ll/mx3;Ll/ysd0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mx3$b;->d:Ll/mx3;

    .line 2
    .line 3
    iput-object p2, p0, Ll/mx3$b;->c:Ll/ysd0;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/ysd0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mx3$b;->c:Ll/ysd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ysd0;->b()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mx3$b;->c:Ll/ysd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ysd0;->c()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mx3$b;->c:Ll/ysd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ysd0;->d()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/mx3$b;->d:Ll/mx3;

    .line 14
    .line 15
    iget-object v1, p0, Ll/mx3$b;->c:Ll/ysd0;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/ysd0;->d()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v0, v1}, Ll/mx3;->a(Ll/mx3;Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p0, p0, Ll/mx3$b;->c:Ll/ysd0;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/ysd0;->d()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mx3$b;->c:Ll/ysd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ysd0;->f()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mx3$b;->c:Ll/ysd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ysd0;->g()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
