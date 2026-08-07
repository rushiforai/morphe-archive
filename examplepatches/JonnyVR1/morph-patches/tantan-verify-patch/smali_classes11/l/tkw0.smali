.class public final Ll/tkw0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/qkw0;

.field public static volatile b:Ll/qkw0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/skw0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/skw0;-><init>(Ll/rkw0;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/tkw0;->a:Ll/qkw0;

    .line 8
    .line 9
    sput-object v0, Ll/tkw0;->b:Ll/qkw0;

    .line 10
    .line 11
    return-void
.end method

.method public static a()Ll/qkw0;
    .locals 1

    .line 1
    sget-object v0, Ll/tkw0;->b:Ll/qkw0;

    .line 2
    .line 3
    return-object v0
.end method
