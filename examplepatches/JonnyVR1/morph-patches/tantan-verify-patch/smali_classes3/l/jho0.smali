.class public final synthetic Ll/jho0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/kho0;


# direct methods
.method public synthetic constructor <init>(Ll/kho0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jho0;->a:Ll/kho0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jho0;->a:Ll/kho0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    invoke-static {p0, p1}, Ll/kho0;->K3(Ll/kho0;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    return-void
.end method
