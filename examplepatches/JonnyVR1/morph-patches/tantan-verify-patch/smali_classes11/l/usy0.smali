.class public final synthetic Ll/usy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public synthetic a:Ll/atx0;


# direct methods
.method public synthetic constructor <init>(Ll/atx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/usy0;->a:Ll/atx0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/usy0;->a:Ll/atx0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/atx0;->G()Ll/hny0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/hny0;->R0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/atx0;->zzj()Ll/d6x0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/d6x0;->F()Ll/l8x0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "registerTrigger called but app not eligible"

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    new-instance v0, Ljava/lang/Thread;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/atx0;->C()Lcom/google/android/gms/measurement/internal/g;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    new-instance v1, Ll/luy0;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/luy0;-><init>(Lcom/google/android/gms/measurement/internal/g;)V

    .line 39
    .line 40
    .line 41
    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 45
    .line 46
    .line 47
    return-void
.end method
