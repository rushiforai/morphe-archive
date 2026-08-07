.class public final synthetic Ll/o1x0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/v5x0;


# static fields
.field public static final synthetic a:Ll/o1x0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/o1x0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/o1x0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/o1x0;->a:Ll/o1x0;

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
.method public final a(Ll/lxw0;Ljava/lang/Integer;)Ll/xww0;
    .locals 0

    .line 1
    check-cast p1, Ll/r1x0;

    .line 2
    .line 3
    sget-object p0, Ll/p1x0;->a:Ll/v6x0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/r1x0;->b()Ll/q1x0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/16 p1, 0x20

    .line 10
    .line 11
    invoke-static {p1}, Ll/xfx0;->c(I)Ll/xfx0;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/4 p2, 0x0

    .line 16
    invoke-static {p0, p1, p2}, Ll/m1x0;->a(Ll/q1x0;Ll/xfx0;Ljava/lang/Integer;)Ll/m1x0;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method
