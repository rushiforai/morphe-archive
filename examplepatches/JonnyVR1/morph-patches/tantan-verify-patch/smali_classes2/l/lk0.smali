.class public final synthetic Ll/lk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/sk0;

.field public final synthetic b:Ljava/util/Map;


# direct methods
.method public synthetic constructor <init>(Ll/sk0;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lk0;->a:Ll/sk0;

    iput-object p2, p0, Ll/lk0;->b:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lk0;->a:Ll/sk0;

    iget-object p0, p0, Ll/lk0;->b:Ljava/util/Map;

    invoke-static {v0, p0}, Ll/sk0;->b(Ll/sk0;Ljava/util/Map;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method
