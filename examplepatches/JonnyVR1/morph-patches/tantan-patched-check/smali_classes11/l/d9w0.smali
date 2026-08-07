.class public final Ll/d9w0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/caw0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/d9w0;->a:Ll/caw0;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d9w0;->a:Ll/caw0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/caw0;->a:Ll/haw0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/haw0;->f()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final b(Ll/caw0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/d9w0;->a:Ll/caw0;

    .line 2
    .line 3
    return-void
.end method
