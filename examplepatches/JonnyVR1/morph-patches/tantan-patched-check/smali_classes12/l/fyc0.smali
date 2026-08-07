.class public final synthetic Ll/fyc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/el90;

.field public final synthetic b:Lcom/google/firebase/remoteconfig/ConfigUpdate;


# direct methods
.method public synthetic constructor <init>(Ll/el90;Lcom/google/firebase/remoteconfig/ConfigUpdate;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fyc0;->a:Ll/el90;

    iput-object p2, p0, Ll/fyc0;->b:Lcom/google/firebase/remoteconfig/ConfigUpdate;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fyc0;->a:Ll/el90;

    iget-object p0, p0, Ll/fyc0;->b:Lcom/google/firebase/remoteconfig/ConfigUpdate;

    invoke-static {v0, p0}, Lcom/google/firebase/remoteconfig/RemoteConfigKt$configUpdates$1$registration$1;->a(Ll/el90;Lcom/google/firebase/remoteconfig/ConfigUpdate;)V

    return-void
.end method
