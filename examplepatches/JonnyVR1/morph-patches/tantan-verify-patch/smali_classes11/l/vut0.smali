.class public final Ll/vut0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ll/fws0;

.field public final c:Ljava/util/concurrent/Executor;

.field public d:Ll/hvt0;

.field public final e:Ll/bqs0;

.field public final f:Ll/bqs0;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ll/fws0;Ljava/util/concurrent/Executor;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/sut0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/sut0;-><init>(Ll/vut0;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/vut0;->e:Ll/bqs0;

    .line 10
    .line 11
    new-instance v0, Ll/uut0;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/uut0;-><init>(Ll/vut0;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/vut0;->f:Ll/bqs0;

    .line 17
    .line 18
    iput-object p1, p0, Ll/vut0;->a:Ljava/lang/String;

    .line 19
    .line 20
    iput-object p2, p0, Ll/vut0;->b:Ll/fws0;

    .line 21
    .line 22
    iput-object p3, p0, Ll/vut0;->c:Ljava/util/concurrent/Executor;

    .line 23
    .line 24
    return-void
.end method

.method public static bridge synthetic a(Ll/vut0;)Ll/hvt0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vut0;->d:Ll/hvt0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic b(Ll/vut0;)Ljava/util/concurrent/Executor;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vut0;->c:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic g(Ll/vut0;Ljava/util/Map;)Z
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    const-string v0, "hashCode"

    .line 5
    .line 6
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Ll/vut0;->a:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method


# virtual methods
.method public final c(Ll/hvt0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/vut0;->b:Ll/fws0;

    .line 2
    .line 3
    const-string v1, "/updateActiveView"

    .line 4
    .line 5
    iget-object v2, p0, Ll/vut0;->e:Ll/bqs0;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/fws0;->b(Ljava/lang/String;Ll/bqs0;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/vut0;->b:Ll/fws0;

    .line 11
    .line 12
    const-string v1, "/untrackActiveViewUnit"

    .line 13
    .line 14
    iget-object v2, p0, Ll/vut0;->f:Ll/bqs0;

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Ll/fws0;->b(Ljava/lang/String;Ll/bqs0;)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Ll/vut0;->d:Ll/hvt0;

    .line 20
    .line 21
    return-void
.end method

.method public final d(Ll/wit0;)V
    .locals 2

    .line 1
    const-string v0, "/updateActiveView"

    .line 2
    .line 3
    iget-object v1, p0, Ll/vut0;->e:Ll/bqs0;

    .line 4
    .line 5
    invoke-interface {p1, v0, v1}, Ll/wit0;->j0(Ljava/lang/String;Ll/bqs0;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "/untrackActiveViewUnit"

    .line 9
    .line 10
    iget-object p0, p0, Ll/vut0;->f:Ll/bqs0;

    .line 11
    .line 12
    invoke-interface {p1, v0, p0}, Ll/wit0;->j0(Ljava/lang/String;Ll/bqs0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final e()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/vut0;->b:Ll/fws0;

    .line 2
    .line 3
    const-string v1, "/updateActiveView"

    .line 4
    .line 5
    iget-object v2, p0, Ll/vut0;->e:Ll/bqs0;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/fws0;->c(Ljava/lang/String;Ll/bqs0;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/vut0;->b:Ll/fws0;

    .line 11
    .line 12
    const-string v1, "/untrackActiveViewUnit"

    .line 13
    .line 14
    iget-object p0, p0, Ll/vut0;->f:Ll/bqs0;

    .line 15
    .line 16
    invoke-virtual {v0, v1, p0}, Ll/fws0;->c(Ljava/lang/String;Ll/bqs0;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final f(Ll/wit0;)V
    .locals 2

    .line 1
    const-string v0, "/updateActiveView"

    .line 2
    .line 3
    iget-object v1, p0, Ll/vut0;->e:Ll/bqs0;

    .line 4
    .line 5
    invoke-interface {p1, v0, v1}, Ll/wit0;->Q(Ljava/lang/String;Ll/bqs0;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "/untrackActiveViewUnit"

    .line 9
    .line 10
    iget-object p0, p0, Ll/vut0;->f:Ll/bqs0;

    .line 11
    .line 12
    invoke-interface {p1, v0, p0}, Ll/wit0;->Q(Ljava/lang/String;Ll/bqs0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
