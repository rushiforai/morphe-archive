.class public abstract Ll/b1w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bxl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/b1w$a;
    }
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/bxl;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ll/bxl;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/b1w;->a:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public static c(Lcom/p1/mobile/android/app/Act;)Ll/b1w;
    .locals 1

    .line 1
    new-instance v0, Ll/b1w$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/b1w$a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public a(Landroid/content/Context;IILandroid/content/Intent;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/b1w;->b:Ll/bxl;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/b1w;->d()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/b1w;->b:Ll/bxl;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Ll/b1w;->b:Ll/bxl;

    .line 17
    .line 18
    invoke-interface {p0, p1, p2, p3, p4}, Ll/bxl;->a(Landroid/content/Context;IILandroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public b()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public d()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/b1w;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/bxl;

    .line 18
    .line 19
    const-string v2, "account"

    .line 20
    .line 21
    sget-object v3, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p9:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 22
    .line 23
    invoke-static {v1, v2, v3}, Lcom/tantanapp/common/utils/NullChecker;->c(Ljava/lang/Object;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    invoke-interface {v1}, Ll/bxl;->b()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    iput-object v1, p0, Ll/b1w;->b:Ll/bxl;

    .line 36
    .line 37
    :cond_1
    return-void
.end method
