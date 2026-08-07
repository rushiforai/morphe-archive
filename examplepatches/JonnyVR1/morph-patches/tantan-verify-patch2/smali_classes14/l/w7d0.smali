.class public final synthetic Ll/w7d0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/x20;ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w7d0;->a:Ll/x20;

    iput-boolean p2, p0, Ll/w7d0;->b:Z

    iput-object p3, p0, Ll/w7d0;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/w7d0;->d:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    iput-object p5, p0, Ll/w7d0;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/w7d0;->a:Ll/x20;

    iget-boolean v1, p0, Ll/w7d0;->b:Z

    iget-object v2, p0, Ll/w7d0;->c:Lcom/p1/mobile/android/app/Act;

    iget-object v3, p0, Ll/w7d0;->d:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    iget-object v4, p0, Ll/w7d0;->e:Ljava/lang/String;

    move-object v5, p1

    check-cast v5, Ll/uxj0;

    invoke-static/range {v0 .. v5}, Ll/a8d0;->f0(Ll/x20;ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method
