.class public Ll/qyj;
.super Ll/qf2;
.source "SourceFile"


# instance fields
.field public b:Ljava/lang/String;

.field public c:Z


# direct methods
.method public constructor <init>(IZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qf2;-><init>(I)V

    .line 2
    .line 3
    .line 4
    iput-boolean p2, p0, Ll/qyj;->c:Z

    .line 5
    .line 6
    iput-object p3, p0, Ll/qyj;->b:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qyj;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/qyj;->c:Z

    .line 2
    .line 3
    return p0
.end method
