.class public final synthetic Ll/hjo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jjo0;


# direct methods
.method public synthetic constructor <init>(Ll/jjo0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hjo0;->a:Ll/jjo0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hjo0;->a:Ll/jjo0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    invoke-static {p0, p1}, Ll/jjo0;->O3(Ll/jjo0;Lcom/p1/mobile/putong/live/base/data/BLiveOperation;)V

    return-void
.end method
