.class public final synthetic Ll/u3b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public final synthetic d:Z

.field public final synthetic e:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreSuggested;ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u3b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iput-boolean p2, p0, Ll/u3b;->b:Z

    iput-object p3, p0, Ll/u3b;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iput-boolean p4, p0, Ll/u3b;->d:Z

    iput-object p5, p0, Ll/u3b;->e:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/u3b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-boolean v1, p0, Ll/u3b;->b:Z

    iget-object v2, p0, Ll/u3b;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iget-boolean v3, p0, Ll/u3b;->d:Z

    iget-object v4, p0, Ll/u3b;->e:Lcom/p1/mobile/putong/data/User;

    move-object v5, p1

    check-cast v5, Lrx/Notification;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->D3(Lcom/p1/mobile/putong/core/api/CoreSuggested;ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ZLcom/p1/mobile/putong/data/User;Lrx/Notification;)Lrx/Notification;

    move-result-object p0

    return-object p0
.end method
