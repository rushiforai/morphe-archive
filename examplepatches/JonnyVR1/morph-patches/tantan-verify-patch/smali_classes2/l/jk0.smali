.class public final synthetic Ll/jk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/sk0;

.field public final synthetic b:Ljava/util/HashMap;

.field public final synthetic c:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ll/sk0;Ljava/util/HashMap;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jk0;->a:Ll/sk0;

    iput-object p2, p0, Ll/jk0;->b:Ljava/util/HashMap;

    iput-object p3, p0, Ll/jk0;->c:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jk0;->a:Ll/sk0;

    iget-object v1, p0, Ll/jk0;->b:Ljava/util/HashMap;

    iget-object p0, p0, Ll/jk0;->c:Ljava/util/ArrayList;

    invoke-static {v0, v1, p0}, Ll/sk0;->j(Ll/sk0;Ljava/util/HashMap;Ljava/util/ArrayList;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method
