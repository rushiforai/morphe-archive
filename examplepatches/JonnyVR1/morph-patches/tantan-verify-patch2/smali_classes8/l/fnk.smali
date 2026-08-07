.class public final synthetic Ll/fnk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w30$d;


# instance fields
.field public final synthetic a:Ll/jnk;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/core/data/ChatGroup;


# direct methods
.method public synthetic constructor <init>(Ll/jnk;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fnk;->a:Ll/jnk;

    iput-object p2, p0, Ll/fnk;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/fnk;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/fnk;->d:Lcom/p1/mobile/putong/core/data/ChatGroup;

    return-void
.end method


# virtual methods
.method public final a(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/fnk;->a:Ll/jnk;

    iget-object v1, p0, Ll/fnk;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/fnk;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/fnk;->d:Lcom/p1/mobile/putong/core/data/ChatGroup;

    move-object v4, p1

    move-object v5, p2

    move v6, p3

    invoke-static/range {v0 .. v6}, Ll/jnk;->i0(Ll/jnk;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method
