.class public Ll/ykw;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:Ll/ykw;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Ll/ykw;
    .locals 1

    .line 1
    sget-object v0, Ll/ykw;->a:Ll/ykw;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/ykw;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/ykw;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/ykw;->a:Ll/ykw;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/ykw;->a:Ll/ykw;

    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public b(Ljava/lang/Throwable;)V
    .locals 0
    .param p1    # Ljava/lang/Throwable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    return-void
.end method
