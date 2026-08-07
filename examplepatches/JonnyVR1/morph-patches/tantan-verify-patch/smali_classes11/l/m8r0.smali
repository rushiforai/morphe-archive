.class public final Ll/m8r0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/j8r0;

.field public static volatile b:Ll/j8r0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/l8r0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/l8r0;-><init>(Ll/k8r0;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/m8r0;->a:Ll/j8r0;

    .line 8
    .line 9
    sput-object v0, Ll/m8r0;->b:Ll/j8r0;

    .line 10
    .line 11
    return-void
.end method

.method public static a()Ll/j8r0;
    .locals 1

    .line 1
    sget-object v0, Ll/m8r0;->b:Ll/j8r0;

    .line 2
    .line 3
    return-object v0
.end method
