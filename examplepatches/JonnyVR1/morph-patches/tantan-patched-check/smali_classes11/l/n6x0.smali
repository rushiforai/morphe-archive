.class public abstract Ll/n6x0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/wfx0;

.field public final b:Ljava/lang/Class;


# direct methods
.method public synthetic constructor <init>(Ll/wfx0;Ljava/lang/Class;Ll/m6x0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/n6x0;->a:Ll/wfx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/n6x0;->b:Ljava/lang/Class;

    .line 7
    .line 8
    return-void
.end method

.method public static b(Ll/l6x0;Ll/wfx0;Ljava/lang/Class;)Ll/n6x0;
    .locals 1

    .line 1
    new-instance v0, Ll/k6x0;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p0}, Ll/k6x0;-><init>(Ll/wfx0;Ljava/lang/Class;Ll/l6x0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public abstract a(Ll/l7x0;)Ll/lxw0;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation
.end method

.method public final c()Ll/wfx0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n6x0;->a:Ll/wfx0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Ljava/lang/Class;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n6x0;->b:Ljava/lang/Class;

    .line 2
    .line 3
    return-object p0
.end method
