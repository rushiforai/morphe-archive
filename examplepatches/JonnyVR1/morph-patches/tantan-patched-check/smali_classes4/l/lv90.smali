.class public final synthetic Ll/lv90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Media;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lv90;->a:Ll/y20;

    iput-object p2, p0, Ll/lv90;->b:Lcom/p1/mobile/putong/data/Media;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lv90;->a:Ll/y20;

    iget-object p0, p0, Ll/lv90;->b:Lcom/p1/mobile/putong/data/Media;

    invoke-static {v0, p0}, Ll/aw90;->v(Ll/y20;Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method
