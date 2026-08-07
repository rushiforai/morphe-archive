.class public final Ll/c2s0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rjw0;


# instance fields
.field public final synthetic a:Ll/qhw0;


# direct methods
.method public constructor <init>(Ll/o2s0;Ll/qhw0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/c2s0;->a:Ll/qhw0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ljava/io/File;)Z
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/c2s0;->a:Ll/qhw0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qhw0;->a(Ljava/io/File;)Z

    .line 4
    .line 5
    .line 6
    move-result p0
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return p0

    .line 8
    :catch_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method
