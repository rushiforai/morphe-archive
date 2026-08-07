.class public final synthetic Ll/gks;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jks;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/jks;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gks;->a:Ll/jks;

    iput-object p2, p0, Ll/gks;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gks;->a:Ll/jks;

    iget-object p0, p0, Ll/gks;->b:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomWindown;

    invoke-static {v0, p0, p1}, Ll/jks;->D(Ll/jks;Ljava/util/List;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomWindown;)V

    return-void
.end method
