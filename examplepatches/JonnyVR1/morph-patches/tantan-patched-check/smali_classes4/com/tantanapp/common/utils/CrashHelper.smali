.class public Lcom/tantanapp/common/utils/CrashHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;
    }
.end annotation


# static fields
.field public static a:Ll/a30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a30<",
            "Ljava/lang/Throwable;",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;",
            ">;"
        }
    .end annotation
.end field

.field public static b:Ll/a30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a30<",
            "Ljava/lang/Throwable;",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;",
            ">;"
        }
    .end annotation
.end field

.field public static c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public static d:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/tantanapp/common/utils/CrashHelper;->c:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-static {}, Ll/icg0;->a()Ll/gcg0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lcom/tantanapp/common/utils/CrashHelper;->d:Ll/gcg0;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/tantanapp/common/utils/CrashHelper;->d:Ll/gcg0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/gcg0;->isUnsubscribed()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    sget-object p0, Lcom/tantanapp/common/utils/CrashHelper;->d:Ll/gcg0;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static b(Ll/a30;Ll/a30;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Ljava/lang/Throwable;",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;",
            ">;",
            "Ll/a30<",
            "Ljava/lang/Throwable;",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;",
            ">;)V"
        }
    .end annotation

    .line 1
    sput-object p0, Lcom/tantanapp/common/utils/CrashHelper;->a:Ll/a30;

    .line 2
    .line 3
    sput-object p1, Lcom/tantanapp/common/utils/CrashHelper;->b:Ll/a30;

    .line 4
    .line 5
    sget-object p0, Lcom/tantanapp/common/utils/CrashHelper;->c:Lrx/subjects/a;

    .line 6
    .line 7
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static c(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/tantanapp/common/utils/CrashHelper;->a:Ll/a30;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {v0, p0, v1, v1}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public static d(Ljava/lang/Throwable;I)V
    .locals 1

    .line 1
    sget-boolean v0, Ll/kmk0;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    invoke-static {v0, p1}, Ll/gkc0;->a(II)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_1

    .line 15
    .line 16
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public static e(Ljava/lang/Throwable;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/common/utils/CrashHelper;->a:Ll/a30;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0, p1, p2}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static f(Ljava/lang/Throwable;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;I)V
    .locals 1

    .line 1
    sget-boolean v0, Ll/kmk0;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p0, p1, p2}, Lcom/tantanapp/common/utils/CrashHelper;->e(Ljava/lang/Throwable;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    invoke-static {v0, p3}, Ll/gkc0;->a(II)I

    .line 11
    .line 12
    .line 13
    move-result p3

    .line 14
    if-nez p3, :cond_1

    .line 15
    .line 16
    invoke-static {p0, p1, p2}, Lcom/tantanapp/common/utils/CrashHelper;->e(Ljava/lang/Throwable;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public static g(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/tantanapp/common/utils/CrashHelper;->c:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget-object v0, Lcom/tantanapp/common/utils/CrashHelper;->d:Ll/gcg0;

    .line 14
    .line 15
    sget-object v1, Lcom/tantanapp/common/utils/CrashHelper;->c:Lrx/subjects/a;

    .line 16
    .line 17
    new-instance v2, Ll/vtb;

    .line 18
    .line 19
    invoke-direct {v2, p0}, Ll/vtb;-><init>(Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v0, p0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static h(Ljava/lang/Throwable;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/common/utils/CrashHelper;->b:Ll/a30;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0, p1, p2}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static i(Ljava/lang/Throwable;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;I)V
    .locals 1

    .line 1
    sget-boolean v0, Ll/kmk0;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p0, p1, p2}, Lcom/tantanapp/common/utils/CrashHelper;->h(Ljava/lang/Throwable;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    invoke-static {v0, p3}, Ll/gkc0;->a(II)I

    .line 11
    .line 12
    .line 13
    move-result p3

    .line 14
    if-nez p3, :cond_1

    .line 15
    .line 16
    invoke-static {p0, p1, p2}, Lcom/tantanapp/common/utils/CrashHelper;->h(Ljava/lang/Throwable;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method
