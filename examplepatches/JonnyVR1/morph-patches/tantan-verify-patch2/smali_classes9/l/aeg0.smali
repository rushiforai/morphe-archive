.class public Ll/aeg0;
.super Ll/x8e;
.source "SourceFile"


# instance fields
.field public a:Ll/x20;


# direct methods
.method public constructor <init>(Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/x8e;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/aeg0;->a:Ll/x20;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/x8e;->a(Ljava/io/File;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/aeg0;->a:Ll/x20;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Ll/x20;->call()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
