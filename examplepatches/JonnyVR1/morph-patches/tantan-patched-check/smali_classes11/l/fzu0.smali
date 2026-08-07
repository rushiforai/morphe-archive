.class public final synthetic Ll/fzu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/lzu0;

.field public final synthetic b:Ll/lss0;


# direct methods
.method public synthetic constructor <init>(Ll/lzu0;Ll/lss0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fzu0;->a:Ll/lzu0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/fzu0;->b:Ll/lss0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fzu0;->a:Ll/lzu0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/fzu0;->b:Ll/lss0;

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {v0}, Ll/lzu0;->g()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {p0, v0}, Ll/lss0;->m0(Ljava/util/List;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catch_0
    move-exception p0

    .line 14
    const-string v0, ""

    .line 15
    .line 16
    invoke-static {v0, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
