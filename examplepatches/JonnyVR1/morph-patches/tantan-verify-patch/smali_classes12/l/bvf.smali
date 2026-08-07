.class public Ll/bvf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jtl;


# instance fields
.field private a:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x14

    .line 5
    .line 6
    iput-wide v0, p0, Ll/bvf;->a:J

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/immomo/components/interfaces/IProcessOutput;)Z
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    invoke-interface {p1}, Lcom/immomo/components/interfaces/IProcessOutput;->a()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-gtz v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-interface {p1, p0}, Lcom/immomo/components/interfaces/IProcessOutput;->b(I)Ll/ftl;

    .line 12
    .line 13
    .line 14
    :cond_1
    :goto_0
    return p0
.end method
