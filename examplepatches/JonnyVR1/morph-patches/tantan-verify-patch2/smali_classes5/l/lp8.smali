.class public final synthetic Ll/lp8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Ll/x20;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Lcom/p1/mobile/putong/core/data/Conversation;

.field public final synthetic g:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/x20;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Conversation;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lp8;->a:Ll/y20;

    iput-object p2, p0, Ll/lp8;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/lp8;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/lp8;->d:Ll/x20;

    iput-object p5, p0, Ll/lp8;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/lp8;->f:Lcom/p1/mobile/putong/core/data/Conversation;

    iput-object p7, p0, Ll/lp8;->g:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/lp8;->a:Ll/y20;

    iget-object v1, p0, Ll/lp8;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/lp8;->c:Lcom/p1/mobile/android/app/Act;

    iget-object v3, p0, Ll/lp8;->d:Ll/x20;

    iget-object v4, p0, Ll/lp8;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/lp8;->f:Lcom/p1/mobile/putong/core/data/Conversation;

    iget-object v6, p0, Ll/lp8;->g:Ll/x20;

    move-object v7, p1

    check-cast v7, Ll/pf60;

    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->B(Ll/y20;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/x20;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Conversation;Ll/x20;Ll/pf60;)V

    return-void
.end method
