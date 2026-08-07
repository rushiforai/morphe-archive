.class public final synthetic Ll/vlc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ljava/util/HashMap;

.field public final synthetic b:Ljava/util/ArrayList;

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/home/b;


# direct methods
.method public synthetic constructor <init>(Ljava/util/HashMap;Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vlc;->a:Ljava/util/HashMap;

    iput-object p2, p0, Ll/vlc;->b:Ljava/util/ArrayList;

    iput-object p3, p0, Ll/vlc;->c:Lcom/p1/mobile/putong/core/newui/home/b;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vlc;->a:Ljava/util/HashMap;

    iget-object v1, p0, Ll/vlc;->b:Ljava/util/ArrayList;

    iget-object p0, p0, Ll/vlc;->c:Lcom/p1/mobile/putong/core/newui/home/b;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/util/DebugUtil;->d9(Ljava/util/HashMap;Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/newui/home/b;)V

    return-void
.end method
