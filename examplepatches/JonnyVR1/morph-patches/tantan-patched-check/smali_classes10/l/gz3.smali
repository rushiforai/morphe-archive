.class public final synthetic Ll/gz3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hz3;


# direct methods
.method public synthetic constructor <init>(Ll/hz3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gz3;->a:Ll/hz3;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gz3;->a:Ll/hz3;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    invoke-static {p0, p1}, Ll/hz3;->R3(Ll/hz3;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    return-void
.end method
