.class public final synthetic Ll/vhm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/firebase/messaging/ImageDownload;

.field public final synthetic b:Ll/sni0;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/messaging/ImageDownload;Ll/sni0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vhm;->a:Lcom/google/firebase/messaging/ImageDownload;

    iput-object p2, p0, Ll/vhm;->b:Ll/sni0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vhm;->a:Lcom/google/firebase/messaging/ImageDownload;

    iget-object p0, p0, Ll/vhm;->b:Ll/sni0;

    invoke-static {v0, p0}, Lcom/google/firebase/messaging/ImageDownload;->b(Lcom/google/firebase/messaging/ImageDownload;Ll/sni0;)V

    return-void
.end method
