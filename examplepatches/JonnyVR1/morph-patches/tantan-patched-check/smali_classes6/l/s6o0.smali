.class public final synthetic Ll/s6o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/Map;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/util/HashMap;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Map;ZLjava/util/HashMap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s6o0;->a:Ljava/util/Map;

    iput-boolean p2, p0, Ll/s6o0;->b:Z

    iput-object p3, p0, Ll/s6o0;->c:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s6o0;->a:Ljava/util/Map;

    iget-boolean v1, p0, Ll/s6o0;->b:Z

    iget-object p0, p0, Ll/s6o0;->c:Ljava/util/HashMap;

    check-cast p1, Ljava/util/Map$Entry;

    invoke-static {v0, v1, p0, p1}, Ll/w6o0;->f(Ljava/util/Map;ZLjava/util/HashMap;Ljava/util/Map$Entry;)V

    return-void
.end method
