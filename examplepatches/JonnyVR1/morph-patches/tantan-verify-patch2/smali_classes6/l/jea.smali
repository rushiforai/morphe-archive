.class public final synthetic Ll/jea;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/HashMap;

.field public final synthetic b:Ljava/util/HashMap;


# direct methods
.method public synthetic constructor <init>(Ljava/util/HashMap;Ljava/util/HashMap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jea;->a:Ljava/util/HashMap;

    iput-object p2, p0, Ll/jea;->b:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jea;->a:Ljava/util/HashMap;

    iget-object p0, p0, Ll/jea;->b:Ljava/util/HashMap;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/OnVoiceCall;

    invoke-static {v0, p0, p1}, Ll/jka;->c5(Ljava/util/HashMap;Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/OnVoiceCall;)V

    return-void
.end method
