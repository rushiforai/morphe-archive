.class public final synthetic Ll/jh3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ljava/lang/Object;

.field public final synthetic b:Ll/mh3;

.field public final synthetic c:Ll/by3;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ll/mh3;Ll/by3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jh3;->a:Ljava/lang/Object;

    iput-object p2, p0, Ll/jh3;->b:Ll/mh3;

    iput-object p3, p0, Ll/jh3;->c:Ll/by3;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jh3;->a:Ljava/lang/Object;

    iget-object v1, p0, Ll/jh3;->b:Ll/mh3;

    iget-object p0, p0, Ll/jh3;->c:Ll/by3;

    invoke-static {v0, v1, p0}, Ll/mh3;->b(Ljava/lang/Object;Ll/mh3;Ll/by3;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method
