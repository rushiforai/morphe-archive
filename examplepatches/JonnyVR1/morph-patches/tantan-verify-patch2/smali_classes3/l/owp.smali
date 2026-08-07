.class public final synthetic Ll/owp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/xwp;


# direct methods
.method public synthetic constructor <init>(Ll/xwp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/owp;->a:Ll/xwp;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/owp;->a:Ll/xwp;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/xwp;->o4(Ll/xwp;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManagerInvite;

    move-result-object p0

    return-object p0
.end method
