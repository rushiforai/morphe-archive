.class public Ll/u1r0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/u1r0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private a:Ll/z1r0;

.field private b:Ll/d2r0;


# direct methods
.method public constructor <init>(Ll/z1r0;Ll/d2r0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/u1r0$a;->a:Ll/z1r0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/u1r0$a;->b:Ll/d2r0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ll/w0r0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1r0$a;->a:Ll/z1r0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/z1r0;->a(Ll/w0r0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ll/g2r0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u1r0$a;->b:Ll/d2r0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/d2r0;->a(Ll/g2r0;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/u1r0$a;->a:Ll/z1r0;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ll/z1r0;->a(Ll/g2r0;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
