.class public final synthetic Ll/pkd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/wkd0;


# direct methods
.method public synthetic constructor <init>(Ll/wkd0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pkd0;->a:Ll/wkd0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pkd0;->a:Ll/wkd0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    invoke-static {p0, p1}, Ll/wkd0;->T3(Ll/wkd0;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    return-void
.end method
