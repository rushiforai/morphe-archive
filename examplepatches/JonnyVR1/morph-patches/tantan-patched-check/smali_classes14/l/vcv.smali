.class public final synthetic Ll/vcv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/wcv;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/wcv;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vcv;->a:Ll/wcv;

    iput-object p2, p0, Ll/vcv;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vcv;->a:Ll/wcv;

    iget-object p0, p0, Ll/vcv;->b:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;

    invoke-static {v0, p0, p1}, Ll/wcv;->b(Ll/wcv;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;)V

    return-void
.end method
