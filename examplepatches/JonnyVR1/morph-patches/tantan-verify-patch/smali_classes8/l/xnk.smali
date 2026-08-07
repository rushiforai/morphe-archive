.class public final synthetic Ll/xnk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w30$d;


# instance fields
.field public final synthetic a:Ll/tnk$b;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

.field public final synthetic c:I

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Ll/tnk$b;Lcom/p1/mobile/putong/core/data/ChatGroupMember;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xnk;->a:Ll/tnk$b;

    iput-object p2, p0, Ll/xnk;->b:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    iput p3, p0, Ll/xnk;->c:I

    iput-boolean p4, p0, Ll/xnk;->d:Z

    return-void
.end method


# virtual methods
.method public final a(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/xnk;->a:Ll/tnk$b;

    iget-object v1, p0, Ll/xnk;->b:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    iget v2, p0, Ll/xnk;->c:I

    iget-boolean v3, p0, Ll/xnk;->d:Z

    move-object v4, p1

    move-object v5, p2

    move v6, p3

    invoke-static/range {v0 .. v6}, Ll/tnk$b;->G(Ll/tnk$b;Lcom/p1/mobile/putong/core/data/ChatGroupMember;IZLv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method
