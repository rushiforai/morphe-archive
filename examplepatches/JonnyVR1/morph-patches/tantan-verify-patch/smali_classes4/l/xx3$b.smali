.class public Ll/xx3$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/xx3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:Ll/xx3;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/xx3;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Ll/xx3;-><init>(Ll/xx3$a;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/xx3$b;->a:Ll/xx3;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()Ll/xx3;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xx3$b;->a:Ll/xx3;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Ljava/lang/String;)Ll/xx3$b;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xx3$b;->a:Ll/xx3;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/xx3;->a(Ll/xx3;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
