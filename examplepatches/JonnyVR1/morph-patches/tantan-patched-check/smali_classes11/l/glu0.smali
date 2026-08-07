.class public final Ll/glu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lvw0;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/ilu0;


# direct methods
.method public constructor <init>(Ll/ilu0;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    const-string p2, "Google"

    .line 2
    .line 3
    iput-object p2, p0, Ll/glu0;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p1, p0, Ll/glu0;->b:Ll/ilu0;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object p0, Ll/sgs0;->b5:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const-string p0, "omid native display exp"

    .line 20
    .line 21
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, p1, p0}, Ll/ebt0;->v(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/glu0;->b:Ll/ilu0;

    .line 2
    .line 3
    check-cast p1, Ll/wit0;

    .line 4
    .line 5
    invoke-static {v0}, Ll/ilu0;->P(Ll/ilu0;)Ll/ulu0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p1}, Ll/ulu0;->t(Ll/wit0;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/glu0;->b:Ll/ilu0;

    .line 13
    .line 14
    invoke-static {p1}, Ll/ilu0;->P(Ll/ilu0;)Ll/ulu0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/ulu0;->c0()Ll/tct0;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object p0, p0, Ll/glu0;->a:Ljava/lang/String;

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-virtual {p1, p0, v1}, Ll/ilu0;->R(Ljava/lang/String;Z)Ll/hfw0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-virtual {v0, p0}, Ll/tct0;->b(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    :goto_0
    if-eqz v0, :cond_2

    .line 39
    .line 40
    const/4 p0, 0x0

    .line 41
    invoke-virtual {v0, p0}, Ll/tct0;->cancel(Z)Z

    .line 42
    .line 43
    .line 44
    :cond_2
    return-void
.end method
