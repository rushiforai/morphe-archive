.class public final synthetic Ll/ztr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ifr0;


# static fields
.field public static final synthetic b:Ll/ztr0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/ztr0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ztr0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ztr0;->b:Ll/ztr0;

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
    .locals 7

    .line 1
    sget p0, Ll/hfr0;->a:I

    .line 2
    .line 3
    new-instance v0, Ll/cur0;

    .line 4
    .line 5
    sget-object v3, Ll/vor0;->a:Ll/vor0;

    .line 6
    .line 7
    new-instance v4, Ll/nnw0;

    .line 8
    .line 9
    const-wide/16 p0, 0x0

    .line 10
    .line 11
    invoke-direct {v4, p0, p1}, Ll/nnw0;-><init>(J)V

    .line 12
    .line 13
    .line 14
    new-instance v5, Ll/vrr0;

    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    invoke-direct {v5, p0}, Ll/vrr0;-><init>(I)V

    .line 18
    .line 19
    .line 20
    const v6, 0x1b8a0

    .line 21
    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    const/4 v2, 0x1

    .line 25
    invoke-direct/range {v0 .. v6}, Ll/cur0;-><init>(IILl/vor0;Ll/nnw0;Ll/fur0;I)V

    .line 26
    .line 27
    .line 28
    const/4 p1, 0x1

    .line 29
    new-array p1, p1, [Ll/per0;

    .line 30
    .line 31
    aput-object v0, p1, p0

    .line 32
    .line 33
    return-object p1
.end method
