.class public final synthetic Ll/bok;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/Map;

.field public final synthetic b:Ljava/util/Map;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Map;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bok;->a:Ljava/util/Map;

    iput-object p2, p0, Ll/bok;->b:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bok;->a:Ljava/util/Map;

    iget-object p0, p0, Ll/bok;->b:Ljava/util/Map;

    check-cast p1, Ll/mqk;

    invoke-static {v0, p0, p1}, Ll/fok;->f(Ljava/util/Map;Ljava/util/Map;Ll/mqk;)V

    return-void
.end method
