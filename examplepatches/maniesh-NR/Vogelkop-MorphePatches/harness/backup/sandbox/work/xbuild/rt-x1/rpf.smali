.class public final Lrpf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lorg/chromium/content_public/browser/WebContents;

.field public final b:Lorg/chromium/content_public/browser/RenderFrameHost;

.field public final c:Ltu;

.field public d:Z


# direct methods
.method public constructor <init>(Lorg/chromium/content_public/browser/WebContents;Lorg/chromium/content_public/browser/RenderFrameHost;Ltu;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrpf;->a:Lorg/chromium/content_public/browser/WebContents;

    iput-object p2, p0, Lrpf;->b:Lorg/chromium/content_public/browser/RenderFrameHost;

    iput-object p3, p0, Lrpf;->c:Ltu;

    sget-object p1, Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge;->a:Ljava/util/ArrayList;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-boolean v0, p0, Lrpf;->d:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lrpf;->d:Z

    sget-object v0, Lcom/opera/android/browser/webauth/OperaWebAuthnCredentialsDelegateBridge;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Lrpf;->a:Lorg/chromium/content_public/browser/WebContents;

    iget-object p0, p0, Lrpf;->b:Lorg/chromium/content_public/browser/RenderFrameHost;

    invoke-static {v0, p0}, LJ/N;->M5laEdWk(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method
