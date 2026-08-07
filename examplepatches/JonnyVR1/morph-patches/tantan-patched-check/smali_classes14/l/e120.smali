.class public final synthetic Ll/e120;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/i120;

.field public final synthetic b:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ll/i120;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e120;->a:Ll/i120;

    iput-object p2, p0, Ll/e120;->b:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e120;->a:Ll/i120;

    iget-object p0, p0, Ll/e120;->b:Ljava/util/ArrayList;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    invoke-static {v0, p0, p1}, Ll/i120;->f(Ll/i120;Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    return-void
.end method
