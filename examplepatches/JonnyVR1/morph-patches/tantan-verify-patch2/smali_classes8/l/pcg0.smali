.class public final Ll/pcg0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/pcg0$a;
    }
.end annotation


# static fields
.field public static final a:Ll/pcg0$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/pcg0$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/pcg0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/pcg0;->a:Ll/pcg0$a;

    .line 7
    .line 8
    return-void
.end method

.method public static a(Ll/x20;)Ll/kcg0;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/k63;->b(Ll/x20;)Ll/k63;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static b()Ll/kcg0;
    .locals 1

    .line 1
    invoke-static {}, Ll/k63;->a()Ll/k63;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static varargs c([Ll/kcg0;)Ll/ft5;
    .locals 1

    .line 1
    new-instance v0, Ll/ft5;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ft5;-><init>([Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static d()Ll/kcg0;
    .locals 1

    .line 1
    sget-object v0, Ll/pcg0;->a:Ll/pcg0$a;

    .line 2
    .line 3
    return-object v0
.end method
