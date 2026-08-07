.class public final synthetic Ll/f9v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/g9v;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/g9v;Ljava/util/List;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f9v;->a:Ll/g9v;

    iput-object p2, p0, Ll/f9v;->b:Ljava/util/List;

    iput-object p3, p0, Ll/f9v;->c:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f9v;->a:Ll/g9v;

    iget-object v1, p0, Ll/f9v;->b:Ljava/util/List;

    iget-object p0, p0, Ll/f9v;->c:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;

    invoke-static {v0, v1, p0, p1}, Ll/g9v;->k(Ll/g9v;Ljava/util/List;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;)V

    return-void
.end method
