.class public final synthetic Ll/srr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ifr0;


# static fields
.field public static final synthetic b:Ll/srr0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/srr0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/srr0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/srr0;->b:Ll/srr0;

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
    .locals 0

    .line 1
    sget p0, Ll/hfr0;->a:I

    .line 2
    .line 3
    new-instance p0, Ll/trr0;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-direct {p0, p1}, Ll/trr0;-><init>(I)V

    .line 7
    .line 8
    .line 9
    const/4 p2, 0x1

    .line 10
    new-array p2, p2, [Ll/per0;

    .line 11
    .line 12
    aput-object p0, p2, p1

    .line 13
    .line 14
    return-object p2
.end method
