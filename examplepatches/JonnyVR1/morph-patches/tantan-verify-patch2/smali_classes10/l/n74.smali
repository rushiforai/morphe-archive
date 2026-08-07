.class public final synthetic Ll/n74;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/z74;

.field public final synthetic b:Ll/j2s;


# direct methods
.method public synthetic constructor <init>(Ll/z74;Ll/j2s;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n74;->a:Ll/z74;

    iput-object p2, p0, Ll/n74;->b:Ll/j2s;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n74;->a:Ll/z74;

    iget-object p0, p0, Ll/n74;->b:Ll/j2s;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    invoke-static {v0, p0, p1}, Ll/z74;->a4(Ll/z74;Ll/j2s;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Ll/d3q;

    move-result-object p0

    return-object p0
.end method
