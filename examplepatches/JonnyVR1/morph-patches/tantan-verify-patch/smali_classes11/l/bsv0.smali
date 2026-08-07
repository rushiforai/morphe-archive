.class public final Ll/bsv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vuv0;


# instance fields
.field public final a:Ll/p6w0;


# direct methods
.method public constructor <init>(Ll/p6w0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bsv0;->a:Ll/p6w0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final bridge synthetic a(Ljava/lang/Object;)V
    .locals 2

    .line 1
    check-cast p1, Landroid/os/Bundle;

    .line 2
    .line 3
    iget-object v0, p0, Ll/bsv0;->a:Ll/p6w0;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/sgs0;->nb:Ll/dgs0;

    .line 8
    .line 9
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Ll/bsv0;->a:Ll/p6w0;

    .line 26
    .line 27
    const-string v1, "render_in_browser"

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/p6w0;->d()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/bsv0;->a:Ll/p6w0;

    .line 37
    .line 38
    const-string v0, "disable_ml"

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/p6w0;->c()Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    invoke-virtual {p1, v0, p0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method
