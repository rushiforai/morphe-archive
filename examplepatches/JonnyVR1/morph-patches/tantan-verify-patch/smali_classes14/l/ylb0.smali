.class public final synthetic Ll/ylb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/cmb0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/data/PushMessage;

.field public final synthetic d:Lcom/p1/mobile/putong/api/push/PushTrackData;


# direct methods
.method public synthetic constructor <init>(Ll/cmb0;Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ylb0;->a:Ll/cmb0;

    iput-object p2, p0, Ll/ylb0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/ylb0;->c:Lcom/p1/mobile/putong/data/PushMessage;

    iput-object p4, p0, Ll/ylb0;->d:Lcom/p1/mobile/putong/api/push/PushTrackData;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ylb0;->a:Ll/cmb0;

    iget-object v1, p0, Ll/ylb0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/ylb0;->c:Lcom/p1/mobile/putong/data/PushMessage;

    iget-object p0, p0, Ll/ylb0;->d:Lcom/p1/mobile/putong/api/push/PushTrackData;

    invoke-static {v0, v1, v2, p0}, Ll/cmb0;->c(Ll/cmb0;Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)V

    return-void
.end method
