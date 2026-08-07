.class public final synthetic Ll/m5k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m5k;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/m5k;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/m5k;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/m5k;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/m5k;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/m5k;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/m5k;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/m5k;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/m5k;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/m5k;->e:Ljava/lang/String;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRealVoiceLive;

    invoke-static/range {v0 .. v5}, Ll/o5k;->r(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRealVoiceLive;)V

    return-void
.end method
