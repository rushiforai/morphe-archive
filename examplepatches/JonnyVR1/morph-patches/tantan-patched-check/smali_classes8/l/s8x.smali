.class public final synthetic Ll/s8x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v8x;


# direct methods
.method public synthetic constructor <init>(Ll/v8x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s8x;->a:Ll/v8x;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s8x;->a:Ll/v8x;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {p0, p1}, Ll/v8x;->I0(Ll/v8x;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method
