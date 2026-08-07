.class public final synthetic Ll/kzu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/yzu;


# direct methods
.method public synthetic constructor <init>(Ll/yzu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kzu;->a:Ll/yzu;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kzu;->a:Ll/yzu;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    invoke-static {p0, p1}, Ll/yzu;->K3(Ll/yzu;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
