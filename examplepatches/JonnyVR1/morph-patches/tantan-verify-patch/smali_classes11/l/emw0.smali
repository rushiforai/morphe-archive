.class public final Ll/emw0;
.super Ll/anw0;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/anw0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Ll/anw0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/emw0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b(Ljava/lang/String;)Ll/anw0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/emw0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Ll/bnw0;
    .locals 3

    .line 1
    new-instance v0, Ll/jmw0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/emw0;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Ll/emw0;->b:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-direct {v0, v1, p0, v2}, Ll/jmw0;-><init>(Ljava/lang/String;Ljava/lang/String;Ll/fmw0;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method
