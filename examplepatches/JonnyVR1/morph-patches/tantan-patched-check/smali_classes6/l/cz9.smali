.class public final synthetic Ll/cz9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/Map;

.field public final synthetic b:Ljava/util/HashMap;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Map;Ljava/util/HashMap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cz9;->a:Ljava/util/Map;

    iput-object p2, p0, Ll/cz9;->b:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cz9;->a:Ljava/util/Map;

    iget-object p0, p0, Ll/cz9;->b:Ljava/util/HashMap;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/OnVoiceCall;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->m2(Ljava/util/Map;Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/OnVoiceCall;)V

    return-void
.end method
