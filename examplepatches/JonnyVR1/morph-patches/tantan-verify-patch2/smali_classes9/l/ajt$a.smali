.class public final Ll/ajt$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ajt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Ll/ajt;


# direct methods
.method public constructor <init>(Ll/ajt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ajt$a;->a:Ll/ajt;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ajt$a;->a:Ll/ajt;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ajt;->a(Ll/ajt;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ajt$a;->a:Ll/ajt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ajt;->e()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ajt$a;->a:Ll/ajt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ajt;->g()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ajt$a;->a:Ll/ajt;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ajt;->b:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public e()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ajt$a;->a:Ll/ajt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ajt;->i()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public f()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ajt$a;->a:Ll/ajt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ajt;->j()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ajt$a;->a:Ll/ajt;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ajt;->b(Ll/ajt;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ajt$a;->a:Ll/ajt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ajt;->x()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
