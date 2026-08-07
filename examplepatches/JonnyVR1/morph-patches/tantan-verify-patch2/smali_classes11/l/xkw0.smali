.class public final Ll/xkw0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/vkw0;

.field public static final b:Ll/xkw0;

.field public static volatile c:Ll/xkw0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/wkw0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/wkw0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/xkw0;->a:Ll/vkw0;

    .line 7
    .line 8
    new-instance v0, Ll/xkw0;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/xkw0;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/xkw0;->b:Ll/xkw0;

    .line 14
    .line 15
    sput-object v0, Ll/xkw0;->c:Ll/xkw0;

    .line 16
    .line 17
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

.method public static a()Ll/xkw0;
    .locals 1

    .line 1
    sget-object v0, Ll/xkw0;->c:Ll/xkw0;

    .line 2
    .line 3
    return-object v0
.end method
