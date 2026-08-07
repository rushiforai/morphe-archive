.class public final synthetic Ll/ic60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jc60;


# direct methods
.method public synthetic constructor <init>(Ll/jc60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ic60;->a:Ll/jc60;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ic60;->a:Ll/jc60;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;

    invoke-static {p0, p1}, Ll/jc60;->J3(Ll/jc60;Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;)V

    return-void
.end method
