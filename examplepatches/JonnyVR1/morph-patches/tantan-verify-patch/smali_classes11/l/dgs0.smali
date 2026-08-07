.class public abstract Ll/dgs0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/String;Ljava/lang/Object;Ll/cgs0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/dgs0;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/dgs0;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/dgs0;->c:Ljava/lang/Object;

    .line 9
    .line 10
    invoke-static {}, Ll/jas0;->a()Ll/egs0;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1, p0}, Ll/egs0;->d(Ll/dgs0;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static f(ILjava/lang/String;F)Ll/dgs0;
    .locals 1

    .line 1
    new-instance p0, Ll/ags0;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    invoke-direct {p0, v0, p1, p2}, Ll/ags0;-><init>(ILjava/lang/String;Ljava/lang/Float;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public static g(ILjava/lang/String;I)Ll/dgs0;
    .locals 1

    .line 1
    new-instance p0, Ll/yfs0;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    invoke-direct {p0, v0, p1, p2}, Ll/yfs0;-><init>(ILjava/lang/String;Ljava/lang/Integer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public static h(ILjava/lang/String;J)Ll/dgs0;
    .locals 1

    .line 1
    new-instance p0, Ll/zfs0;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    invoke-direct {p0, v0, p1, p2}, Ll/zfs0;-><init>(ILjava/lang/String;Ljava/lang/Long;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public static i(ILjava/lang/String;Ljava/lang/Boolean;)Ll/dgs0;
    .locals 1

    .line 1
    new-instance v0, Ll/xfs0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/xfs0;-><init>(ILjava/lang/String;Ljava/lang/Boolean;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static j(ILjava/lang/String;Ljava/lang/String;)Ll/dgs0;
    .locals 1

    .line 1
    new-instance p0, Ll/bgs0;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-direct {p0, v0, p1, p2}, Ll/bgs0;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public static k(ILjava/lang/String;)Ll/dgs0;
    .locals 1

    .line 1
    const-string p0, "gads:sdk_core_constants:experiment_id"

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-static {v0, p0, p1}, Ll/dgs0;->j(ILjava/lang/String;Ljava/lang/String;)Ll/dgs0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Ll/jas0;->a()Ll/egs0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1, p0}, Ll/egs0;->c(Ll/dgs0;)V

    .line 14
    .line 15
    .line 16
    return-object p0
.end method


# virtual methods
.method public abstract a(Lorg/json/JSONObject;)Ljava/lang/Object;
.end method

.method public abstract b(Landroid/os/Bundle;)Ljava/lang/Object;
.end method

.method public abstract c(Landroid/content/SharedPreferences;)Ljava/lang/Object;
.end method

.method public abstract d(Landroid/content/SharedPreferences$Editor;Ljava/lang/Object;)V
.end method

.method public final e()I
    .locals 0

    .line 1
    iget p0, p0, Ll/dgs0;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public final l()Ljava/lang/Object;
    .locals 1

    .line 1
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final m()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dgs0;->c:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public final n()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dgs0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
