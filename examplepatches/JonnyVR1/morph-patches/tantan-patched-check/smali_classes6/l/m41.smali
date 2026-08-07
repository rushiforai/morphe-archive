.class public final synthetic Ll/m41;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantListtem;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantListtem;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m41;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantListtem;

    iput-object p2, p0, Ll/m41;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/m41;->c:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m41;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantListtem;

    iget-object v1, p0, Ll/m41;->b:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/m41;->c:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantListtem;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantListtem;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method
