.class public Ll/x1k0$a;
.super Ll/gk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/x1k0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public c:Ll/jjs;

.field public d:Ll/qxj;


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gk2;-><init>(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic a(Ll/x1k0$a;)Ll/jjs;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x1k0$a;->c:Ll/jjs;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/x1k0$a;)Ll/qxj;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x1k0$a;->d:Ll/qxj;

    return-object p0
.end method


# virtual methods
.method public c()Ll/x1k0;
    .locals 2

    .line 1
    new-instance v0, Ll/x1k0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/x1k0;-><init>(Ll/x1k0$a;Ll/y1k0;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public d(Ll/jjs;)Ll/x1k0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x1k0$a;->c:Ll/jjs;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ll/qxj;)Ll/x1k0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x1k0$a;->d:Ll/qxj;

    .line 2
    .line 3
    return-object p0
.end method
