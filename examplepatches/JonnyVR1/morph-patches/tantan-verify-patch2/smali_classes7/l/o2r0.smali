.class public Ll/o2r0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:Ll/vsq0;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/vsq0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/16 v2, 0x14

    .line 5
    .line 6
    invoke-direct {v0, v1, v2}, Ll/vsq0;-><init>(ZI)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Ll/o2r0;->a:Ll/vsq0;

    .line 10
    .line 11
    return-void
.end method

.method public static a(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    sget-object v0, Ll/o2r0;->a:Ll/vsq0;

    .line 2
    .line 3
    new-instance v1, Ll/o2r0$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/o2r0$a;-><init>(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/vsq0;->e(Ll/vsq0$d;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static b(Ll/vsq0$d;)V
    .locals 1

    .line 1
    sget-object v0, Ll/o2r0;->a:Ll/vsq0;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ll/vsq0;->e(Ll/vsq0$d;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static c(Ll/vsq0$d;J)V
    .locals 1

    .line 1
    sget-object v0, Ll/o2r0;->a:Ll/vsq0;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1, p2}, Ll/vsq0;->f(Ll/vsq0$d;J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
