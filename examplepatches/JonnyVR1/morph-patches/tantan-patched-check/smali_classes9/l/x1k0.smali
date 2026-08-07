.class public Ll/x1k0;
.super Ll/fk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/x1k0$a;
    }
.end annotation


# instance fields
.field public final c:Ll/jjs;

.field public final d:Ll/qxj;


# direct methods
.method public constructor <init>(Ll/x1k0$a;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/fk2;-><init>(Ll/gk2;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/x1k0$a;->a(Ll/x1k0$a;)Ll/jjs;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/x1k0;->c:Ll/jjs;

    .line 9
    .line 10
    invoke-static {p1}, Ll/x1k0$a;->b(Ll/x1k0$a;)Ll/qxj;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/x1k0;->d:Ll/qxj;

    .line 15
    .line 16
    return-void
.end method

.method public synthetic constructor <init>(Ll/x1k0$a;Ll/y1k0;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Ll/x1k0;-><init>(Ll/x1k0$a;)V

    return-void
.end method


# virtual methods
.method public b()Ll/jjs;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x1k0;->c:Ll/jjs;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ll/qxj;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x1k0;->d:Ll/qxj;

    .line 2
    .line 3
    return-object p0
.end method
