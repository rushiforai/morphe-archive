.class public final synthetic Ll/pfi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vfi;


# direct methods
.method public synthetic constructor <init>(Ll/vfi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pfi;->a:Ll/vfi;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pfi;->a:Ll/vfi;

    check-cast p1, Lcom/p1/mobile/putong/core/data/VipSetting;

    invoke-static {p0, p1}, Ll/vfi;->g(Ll/vfi;Lcom/p1/mobile/putong/core/data/VipSetting;)V

    return-void
.end method
