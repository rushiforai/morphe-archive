.class public final Ll/jyw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/txw0;


# static fields
.field public static final a:Ll/jyw0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/jyw0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jyw0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/jyw0;->a:Ll/jyw0;

    .line 7
    .line 8
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

.method public static b()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    sget-object v0, Ll/jyw0;->a:Ll/jyw0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zxw0;->f(Ll/txw0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final synthetic a(Ll/sxw0;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    new-instance p0, Ll/iyw0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, p1, v0}, Ll/iyw0;-><init>(Ll/sxw0;Ll/hyw0;)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public final zza()Ljava/lang/Class;
    .locals 0

    .line 1
    const-class p0, Ll/jww0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzb()Ljava/lang/Class;
    .locals 0

    .line 1
    const-class p0, Ll/jww0;

    .line 2
    .line 3
    return-object p0
.end method
