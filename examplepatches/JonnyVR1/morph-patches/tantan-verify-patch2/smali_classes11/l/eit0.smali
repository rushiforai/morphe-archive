.class public final synthetic Ll/eit0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ifr0;


# static fields
.field public static final synthetic b:Ll/eit0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/eit0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/eit0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/eit0;->b:Ll/eit0;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final synthetic a(Landroid/net/Uri;Ljava/util/Map;)[Ll/per0;
    .locals 2

    .line 1
    sget p0, Ll/hfr0;->a:I

    .line 2
    .line 3
    sget p0, Ll/fit0;->w:I

    .line 4
    .line 5
    new-instance p0, Ll/cnr0;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/cnr0;-><init>()V

    .line 8
    .line 9
    .line 10
    new-instance p1, Ll/zkr0;

    .line 11
    .line 12
    const/4 p2, 0x0

    .line 13
    invoke-direct {p1, p2}, Ll/zkr0;-><init>(I)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ll/xmr0;

    .line 17
    .line 18
    invoke-direct {v0}, Ll/xmr0;-><init>()V

    .line 19
    .line 20
    .line 21
    const/4 v1, 0x3

    .line 22
    new-array v1, v1, [Ll/per0;

    .line 23
    .line 24
    aput-object p0, v1, p2

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    aput-object p1, v1, p0

    .line 28
    .line 29
    const/4 p0, 0x2

    .line 30
    aput-object v0, v1, p0

    .line 31
    .line 32
    return-object v1
.end method
