.class public final synthetic Ll/x1x0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/t6x0;


# static fields
.field public static final synthetic a:Ll/x1x0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/x1x0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/x1x0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/x1x0;->a:Ll/x1x0;

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
.method public final a(Ll/xww0;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/e2x0;

    .line 2
    .line 3
    sget-object p0, Ll/z1x0;->a:Ll/v6x0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/e2x0;->b()Ll/f2x0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/f2x0;->c()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ll/jxw0;->a(Ljava/lang/String;)Ll/ixw0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1}, Ll/e2x0;->b()Ll/f2x0;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Ll/f2x0;->c()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    invoke-interface {p0}, Ll/ixw0;->zzb()Ll/jww0;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method
