.class public final synthetic Ll/go20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/Map;

.field public final synthetic b:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Map;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/go20;->a:Ljava/util/Map;

    iput-object p2, p0, Ll/go20;->b:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/go20;->a:Ljava/util/Map;

    iget-object p0, p0, Ll/go20;->b:Ljava/util/ArrayList;

    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    invoke-static {v0, p0, p1}, Ll/ho20;->a(Ljava/util/Map;Ljava/util/ArrayList;Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method
