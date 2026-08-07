.class public final Ll/k3z0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lorg/jspecify/nullness/NullMarked;
.end annotation


# instance fields
.field public final a:Ll/mky0;

.field public final b:Z

.field public final c:Ll/pyy0;


# direct methods
.method public constructor <init>(Ll/pyy0;ZLl/mky0;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/k3z0;->c:Ll/pyy0;

    .line 5
    .line 6
    iput-boolean p2, p0, Ll/k3z0;->b:Z

    .line 7
    .line 8
    iput-object p3, p0, Ll/k3z0;->a:Ll/mky0;

    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic a(Ll/k3z0;)Ll/mky0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k3z0;->a:Ll/mky0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static c(Ll/mky0;)Ll/k3z0;
    .locals 4

    .line 1
    new-instance v0, Ll/k3z0;

    .line 2
    .line 3
    new-instance v1, Ll/pyy0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/pyy0;-><init>(Ll/mky0;)V

    .line 6
    .line 7
    .line 8
    sget-object p0, Ll/vgy0;->b:Ll/mky0;

    .line 9
    .line 10
    const v2, 0x7fffffff

    .line 11
    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-direct {v0, v1, v3, p0, v2}, Ll/k3z0;-><init>(Ll/pyy0;ZLl/mky0;I)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public static bridge synthetic e(Ll/k3z0;Ljava/lang/CharSequence;)Ljava/util/Iterator;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k3z0;->h(Ljava/lang/CharSequence;)Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static bridge synthetic g(Ll/k3z0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/k3z0;->b:Z

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public final b()Ll/k3z0;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/k3z0;->a:Ll/mky0;

    .line 2
    .line 3
    new-instance v1, Ll/k3z0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/k3z0;->c:Ll/pyy0;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    const v3, 0x7fffffff

    .line 9
    .line 10
    .line 11
    invoke-direct {v1, p0, v2, v0, v3}, Ll/k3z0;-><init>(Ll/pyy0;ZLl/mky0;I)V

    .line 12
    .line 13
    .line 14
    return-object v1
.end method

.method public final d(Ljava/lang/CharSequence;)Ljava/lang/Iterable;
    .locals 1

    .line 1
    new-instance v0, Ll/i0z0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/i0z0;-><init>(Ll/k3z0;Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final f(Ljava/lang/CharSequence;)Ljava/util/List;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/k3z0;->h(Ljava/lang/CharSequence;)Ljava/util/Iterator;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    new-instance p1, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/String;

    .line 24
    .line 25
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public final h(Ljava/lang/CharSequence;)Ljava/util/Iterator;
    .locals 2

    .line 1
    new-instance v0, Ll/xwy0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/k3z0;->c:Ll/pyy0;

    .line 4
    .line 5
    invoke-direct {v0, v1, p0, p1}, Ll/xwy0;-><init>(Ll/pyy0;Ll/k3z0;Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method
