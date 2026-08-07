.class public Ll/c09$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/c09;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/c09;


# direct methods
.method public constructor <init>(Ll/c09;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/c09$a;->a:Ll/c09;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c09$a;->a:Ll/c09;

    .line 2
    .line 3
    invoke-static {v0}, Ll/c09;->i3(Ll/c09;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/c09$a;->a:Ll/c09;

    .line 14
    .line 15
    invoke-static {v0}, Ll/c09;->i3(Ll/c09;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v0, v1}, Ll/c09;->j3(Ll/c09;Ljava/util/List;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/c09$a;->a:Ll/c09;

    .line 23
    .line 24
    invoke-static {p0}, Ll/c09;->i3(Ll/c09;)Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method
