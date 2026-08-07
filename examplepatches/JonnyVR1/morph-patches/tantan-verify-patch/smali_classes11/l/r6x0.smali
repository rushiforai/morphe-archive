.class public abstract Ll/r6x0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Class;

.field public final b:Ljava/lang/Class;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Class;Ljava/lang/Class;Ll/q6x0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/r6x0;->a:Ljava/lang/Class;

    .line 5
    .line 6
    iput-object p2, p0, Ll/r6x0;->b:Ljava/lang/Class;

    .line 7
    .line 8
    return-void
.end method

.method public static b(Ll/p6x0;Ljava/lang/Class;Ljava/lang/Class;)Ll/r6x0;
    .locals 1

    .line 1
    new-instance v0, Ll/o6x0;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p0}, Ll/o6x0;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ll/p6x0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public abstract a(Ll/lxw0;)Ll/l7x0;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation
.end method

.method public final c()Ljava/lang/Class;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r6x0;->a:Ljava/lang/Class;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Ljava/lang/Class;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r6x0;->b:Ljava/lang/Class;

    .line 2
    .line 3
    return-object p0
.end method
