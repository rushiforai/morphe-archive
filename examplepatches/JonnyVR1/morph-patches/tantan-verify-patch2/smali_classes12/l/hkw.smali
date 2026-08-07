.class public Ll/hkw;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static b:Ll/hkw;


# instance fields
.field private a:Ll/nvl;


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

.method public static a()Ll/hkw;
    .locals 1

    .line 1
    sget-object v0, Ll/hkw;->b:Ll/hkw;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/hkw;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/hkw;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/hkw;->b:Ll/hkw;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/hkw;->b:Ll/hkw;

    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public b(Ll/nvl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hkw;->a:Ll/nvl;

    .line 2
    .line 3
    return-void
.end method

.method public c(Ljava/lang/String;Landroid/widget/ImageView;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hkw;->a:Ll/nvl;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0, p1, p2, p3}, Ll/nvl;->a(Ljava/lang/String;Landroid/widget/ImageView;I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public d(Ljava/lang/String;Ll/vim;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hkw;->a:Ll/nvl;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0, p1, p2}, Ll/nvl;->b(Ljava/lang/String;Ll/vim;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
