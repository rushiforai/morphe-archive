.class public Ll/pzm;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/pzm$a;
    }
.end annotation


# instance fields
.field public a:Ll/qzs;

.field public b:Ll/fbt;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/qzs;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/qzs;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/pzm;->a:Ll/qzs;

    .line 10
    .line 11
    new-instance v0, Ll/fbt;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/fbt;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/pzm;->b:Ll/fbt;

    .line 17
    .line 18
    return-void
.end method

.method public synthetic constructor <init>(Ll/qzm;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ll/pzm;-><init>()V

    return-void
.end method

.method public static c()Ll/pzm;
    .locals 1

    .line 1
    invoke-static {}, Ll/pzm$a;->a()Ll/pzm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public a(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzm;->d(Z)Ll/kwl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/kwl;->dismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/pzm;->d(Z)Ll/kwl;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-interface {v0}, Ll/kwl;->dismiss()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Ll/pzm;->d(Z)Ll/kwl;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0}, Ll/kwl;->dismiss()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public d(Z)Ll/kwl;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/pzm;->a:Ll/qzs;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    iget-object p0, p0, Ll/pzm;->b:Ll/fbt;

    .line 7
    .line 8
    return-object p0
.end method

.method public e(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzm;->d(Z)Ll/kwl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/kwl;->q()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f(Ll/hti;Z)Z
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "showFloatingWindow:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "live_float_window"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p2}, Ll/pzm;->d(Z)Ll/kwl;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-interface {p0, p1}, Ll/kwl;->p(Ll/hti;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0
.end method
