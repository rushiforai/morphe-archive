.class public final Ll/iuv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vuv0;


# instance fields
.field public final a:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final b:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final c:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final d:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final e:Ljava/lang/Long;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/lang/Long;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/iuv0;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/iuv0;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/iuv0;->c:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Ll/iuv0;->d:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p5, p0, Ll/iuv0;->e:Ljava/lang/Long;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final bridge synthetic a(Ljava/lang/Object;)V
    .locals 3

    .line 1
    check-cast p1, Landroid/os/Bundle;

    .line 2
    .line 3
    const-string v0, "gmp_app_id"

    .line 4
    .line 5
    iget-object v1, p0, Ll/iuv0;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, v0, v1}, Ll/b8w0;->c(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-string v0, "fbs_aiid"

    .line 11
    .line 12
    iget-object v1, p0, Ll/iuv0;->b:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {p1, v0, v1}, Ll/b8w0;->c(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const-string v0, "fbs_aeid"

    .line 18
    .line 19
    iget-object v1, p0, Ll/iuv0;->c:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p1, v0, v1}, Ll/b8w0;->c(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string v0, "apm_id_origin"

    .line 25
    .line 26
    iget-object v1, p0, Ll/iuv0;->d:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {p1, v0, v1}, Ll/b8w0;->c(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/iuv0;->e:Ljava/lang/Long;

    .line 32
    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    const-string v0, "sai_timeout"

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 38
    .line 39
    .line 40
    move-result-wide v1

    .line 41
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method
