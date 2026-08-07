.class public abstract Ll/dyd0;
.super Ll/hxd0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ll/hxd0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private cloned:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;ZLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "TT;Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 11
    invoke-direct/range {p0 .. p5}, Ll/hxd0;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;ZLjava/lang/String;)V

    const/4 p1, 0x0

    .line 12
    iput-object p1, p0, Ll/dyd0;->cloned:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TT;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    const-string v1, "preferences"

    .line 3
    .line 4
    invoke-direct {p0, p1, p2, v0, v1}, Ll/hxd0;-><init>(Ljava/lang/String;Ljava/lang/Object;ZLjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-object p1, p0, Ll/dyd0;->cloned:Ljava/lang/Object;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;ZLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TT;Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 13
    invoke-direct {p0, p1, p2, p3, p4}, Ll/hxd0;-><init>(Ljava/lang/String;Ljava/lang/Object;ZLjava/lang/String;)V

    const/4 p1, 0x0

    .line 14
    iput-object p1, p0, Ll/dyd0;->cloned:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public abstract checkEquals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)Z"
        }
    .end annotation
.end method

.method public clear()Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/hxd0;->cached:Ljava/lang/Object;

    .line 3
    .line 4
    iput-object v0, p0, Ll/dyd0;->cloned:Ljava/lang/Object;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    iput-boolean v1, p0, Ll/hxd0;->empty:Z

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/hxd0;->pref()Landroid/content/SharedPreferences;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p0, Ll/hxd0;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-boolean v2, p0, Ll/hxd0;->async:Z

    .line 24
    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 28
    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    :goto_0
    iget-object p0, p0, Ll/hxd0;->subj:Lrx/subjects/a;

    .line 37
    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    return v1
.end method

.method public abstract copyed(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)TT;"
        }
    .end annotation
.end method

.method public final get()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/hxd0;->empty:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/hxd0;->retrieveValue()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/hxd0;->cached:Ljava/lang/Object;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/hxd0;->empty:Z

    .line 13
    .line 14
    iget-object v0, p0, Ll/hxd0;->cached:Ljava/lang/Object;

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Ll/dyd0;->cloned:Ljava/lang/Object;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v0, p0, Ll/dyd0;->cloned:Ljava/lang/Object;

    .line 23
    .line 24
    iget-object v1, p0, Ll/hxd0;->cached:Ljava/lang/Object;

    .line 25
    .line 26
    invoke-virtual {p0, v0, v1}, Ll/dyd0;->copyed(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Ll/dyd0;->cloned:Ljava/lang/Object;

    .line 31
    .line 32
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/dyd0;->cloned:Ljava/lang/Object;

    .line 33
    .line 34
    return-object p0
.end method

.method public put(Ljava/lang/Object;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/hxd0;->cached:Ljava/lang/Object;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/hxd0;->cached:Ljava/lang/Object;

    .line 6
    .line 7
    invoke-virtual {p0, v0, p1}, Ll/dyd0;->checkEquals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    invoke-virtual {p0, p1}, Ll/hxd0;->saveValue(Ljava/lang/Object;)Landroid/content/SharedPreferences$Editor;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-nez p1, :cond_2

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    iput-object p1, p0, Ll/hxd0;->cached:Ljava/lang/Object;

    .line 24
    .line 25
    iput-object p1, p0, Ll/dyd0;->cloned:Ljava/lang/Object;

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_2
    iget-object v1, p0, Ll/hxd0;->cached:Ljava/lang/Object;

    .line 29
    .line 30
    invoke-virtual {p0, v1, p1}, Ll/dyd0;->copyed(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, p0, Ll/hxd0;->cached:Ljava/lang/Object;

    .line 35
    .line 36
    iget-object v1, p0, Ll/dyd0;->cloned:Ljava/lang/Object;

    .line 37
    .line 38
    invoke-virtual {p0, v1, p1}, Ll/dyd0;->copyed(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Ll/dyd0;->cloned:Ljava/lang/Object;

    .line 43
    .line 44
    :goto_1
    const/4 p1, 0x0

    .line 45
    iput-boolean p1, p0, Ll/hxd0;->empty:Z

    .line 46
    .line 47
    iget-boolean v1, p0, Ll/hxd0;->async:Z

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 52
    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_3
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    :goto_2
    iget-object v0, p0, Ll/hxd0;->subj:Lrx/subjects/a;

    .line 60
    .line 61
    if-eqz v0, :cond_4

    .line 62
    .line 63
    iget-object p0, p0, Ll/dyd0;->cloned:Ljava/lang/Object;

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    :cond_4
    return p1
.end method
