.class Ll/ob4$n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zow;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ob4;->x1(Ll/sow;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/ob4;


# direct methods
.method public constructor <init>(Ll/ob4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ob4$n;->a:Ll/ob4;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(I)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ob4$n;->a:Ll/ob4;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ob4;->v(Ll/ob4;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/ob4$n;->a:Ll/ob4;

    .line 10
    .line 11
    invoke-static {v0}, Ll/ob4;->I0(Ll/ob4;)Ll/ia4;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/ob4$n;->a:Ll/ob4;

    .line 18
    .line 19
    invoke-static {p0}, Ll/ob4;->I0(Ll/ob4;)Ll/ia4;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0, p1}, Ll/ia4;->t(I)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :cond_1
    const/4 p0, 0x1

    .line 31
    return p0
.end method
