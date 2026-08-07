.class public final Ll/vpx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;
.implements Ll/kpx0;


# static fields
.field public static final b:Ll/vpx0;


# instance fields
.field public final a:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/vpx0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/vpx0;-><init>(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/vpx0;->b:Ll/vpx0;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vpx0;->a:Ljava/lang/Object;

    .line 5
    .line 6
    return-void
.end method

.method public static a(Ljava/lang/Object;)Ll/upx0;
    .locals 2

    .line 1
    new-instance v0, Ll/vpx0;

    .line 2
    .line 3
    const-string v1, "instance cannot be null"

    .line 4
    .line 5
    invoke-static {p0, v1}, Ll/cqx0;->a(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/vpx0;-><init>(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static b(Ljava/lang/Object;)Ll/upx0;
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Ll/vpx0;->b:Ll/vpx0;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    new-instance v0, Ll/vpx0;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/vpx0;-><init>(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method


# virtual methods
.method public final zzb()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vpx0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method
