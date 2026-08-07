.class public final synthetic Ll/hzv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/izv0;


# direct methods
.method public synthetic constructor <init>(Ll/izv0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hzv0;->a:Ll/izv0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    new-instance v0, Ll/jzv0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/hzv0;->a:Ll/izv0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/izv0;->b:Ljava/util/List;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/jzv0;-><init>(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method
