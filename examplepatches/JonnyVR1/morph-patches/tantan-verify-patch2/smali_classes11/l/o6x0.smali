.class public final Ll/o6x0;
.super Ll/r6x0;
.source "SourceFile"


# instance fields
.field public final synthetic c:Ll/p6x0;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/Class;Ll/p6x0;)V
    .locals 0

    .line 1
    iput-object p3, p0, Ll/o6x0;->c:Ll/p6x0;

    .line 2
    .line 3
    const/4 p3, 0x0

    .line 4
    invoke-direct {p0, p1, p2, p3}, Ll/r6x0;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ll/q6x0;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final a(Ll/lxw0;)Ll/l7x0;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/o6x0;->c:Ll/p6x0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/p6x0;->a(Ll/lxw0;)Ll/l7x0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
