.class public Ll/o6g;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Ll/aeg;


# direct methods
.method public constructor <init>(ZLl/aeg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Ll/o6g;->a:Z

    .line 5
    .line 6
    iput-object p2, p0, Ll/o6g;->b:Ll/aeg;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Ll/aeg;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o6g;->b:Ll/aeg;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/o6g;->a:Z

    .line 2
    .line 3
    return p0
.end method
