.class public final synthetic Ll/em8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w30$d;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Conversation;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Lcom/p1/mobile/android/app/Act;

.field public final synthetic f:[Ll/w30;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;[Ll/w30;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/em8;->a:Ll/y20;

    iput-object p2, p0, Ll/em8;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    iput-object p3, p0, Ll/em8;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/em8;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/em8;->e:Lcom/p1/mobile/android/app/Act;

    iput-object p6, p0, Ll/em8;->f:[Ll/w30;

    return-void
.end method


# virtual methods
.method public final a(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/em8;->a:Ll/y20;

    iget-object v1, p0, Ll/em8;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    iget-object v2, p0, Ll/em8;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/em8;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/em8;->e:Lcom/p1/mobile/android/app/Act;

    iget-object v5, p0, Ll/em8;->f:[Ll/w30;

    move-object v6, p1

    move-object v7, p2

    move v8, p3

    invoke-static/range {v0 .. v8}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->v0(Ll/y20;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;[Ll/w30;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method
