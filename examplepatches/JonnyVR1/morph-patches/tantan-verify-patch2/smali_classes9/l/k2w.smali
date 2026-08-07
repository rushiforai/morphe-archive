.class public final synthetic Ll/k2w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/l2w;


# direct methods
.method public synthetic constructor <init>(Ll/l2w;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k2w;->a:Ll/l2w;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k2w;->a:Ll/l2w;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;

    invoke-static {p0, p1}, Ll/l2w;->a(Ll/l2w;Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;)V

    return-void
.end method
