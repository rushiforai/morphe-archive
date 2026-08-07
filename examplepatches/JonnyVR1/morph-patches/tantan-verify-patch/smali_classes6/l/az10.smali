.class public final synthetic Ll/az10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hz10;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/MusicCategory;


# direct methods
.method public synthetic constructor <init>(Ll/hz10;Lcom/p1/mobile/putong/feed/data/MusicCategory;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/az10;->a:Ll/hz10;

    iput-object p2, p0, Ll/az10;->b:Lcom/p1/mobile/putong/feed/data/MusicCategory;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/az10;->a:Ll/hz10;

    iget-object p0, p0, Ll/az10;->b:Lcom/p1/mobile/putong/feed/data/MusicCategory;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {v0, p0, p1}, Ll/hz10;->j0(Ll/hz10;Lcom/p1/mobile/putong/feed/data/MusicCategory;Landroid/os/Bundle;)V

    return-void
.end method
