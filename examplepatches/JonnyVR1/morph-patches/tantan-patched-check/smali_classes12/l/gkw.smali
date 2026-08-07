.class public Ll/gkw;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static b:Ll/gkw;


# instance fields
.field private a:Ll/ivl;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b()Ll/gkw;
    .locals 1

    .line 1
    sget-object v0, Ll/gkw;->b:Ll/gkw;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/gkw;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/gkw;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/gkw;->b:Ll/gkw;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/gkw;->b:Ll/gkw;

    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public a()Ll/ivl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gkw;->a:Ll/ivl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "\u8bf7\u521d\u59cb\u5316IHttpRequester"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public c(Ll/ivl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gkw;->a:Ll/ivl;

    .line 2
    .line 3
    return-void
.end method
