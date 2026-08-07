.class public final synthetic Ll/z1b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Envelope;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;

.field public final synthetic d:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreSuggested;Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z1b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iput-object p2, p0, Ll/z1b;->b:Lcom/p1/mobile/putong/data/Envelope;

    iput-object p3, p0, Ll/z1b;->c:Lcom/p1/mobile/putong/data/User;

    iput-object p4, p0, Ll/z1b;->d:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iput-boolean p5, p0, Ll/z1b;->e:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/z1b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-object v1, p0, Ll/z1b;->b:Lcom/p1/mobile/putong/data/Envelope;

    iget-object v2, p0, Ll/z1b;->c:Lcom/p1/mobile/putong/data/User;

    iget-object v3, p0, Ll/z1b;->d:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iget-boolean p0, p0, Ll/z1b;->e:Z

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->e4(Lcom/p1/mobile/putong/core/api/CoreSuggested;Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Z)V

    return-void
.end method
