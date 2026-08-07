.class public Ll/ypy$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ypy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ypy;


# direct methods
.method public constructor <init>(Ll/ypy;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ypy$a;->a:Ll/ypy;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ypy$a;->a:Ll/ypy;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ioi0;->o()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/ypy$a;->a:Ll/ypy;

    .line 11
    .line 12
    invoke-static {v0}, Ll/ypy;->t(Ll/ypy;)Ll/wpy;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v1, p0, Ll/ypy$a;->a:Ll/ypy;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/ypy;->j()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ll/eoi0;->a(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/ypy$a;->a:Ll/ypy;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Ll/ioi0;->q(Ll/eoi0;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    iget-object v0, p0, Ll/ypy$a;->a:Ll/ypy;

    .line 33
    .line 34
    invoke-static {v0}, Ll/ypy;->u(Ll/ypy;)Ll/rpy;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ll/rpy;->g()J

    .line 39
    .line 40
    .line 41
    move-result-wide v0

    .line 42
    invoke-static {p0, v0, v1}, Ll/u21;->c(Ljava/lang/Runnable;J)V

    .line 43
    .line 44
    .line 45
    return-void
.end method
