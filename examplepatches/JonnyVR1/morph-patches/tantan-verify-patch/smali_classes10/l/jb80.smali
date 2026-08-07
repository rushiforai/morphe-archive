.class public final synthetic Ll/jb80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jb80;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jb80;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->d(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;)V

    return-void
.end method
