.class public final synthetic Ll/f2f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/share/ShareHelper;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/share/ShareHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f2f0;->a:Lcom/p1/mobile/putong/ui/share/ShareHelper;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f2f0;->a:Lcom/p1/mobile/putong/ui/share/ShareHelper;

    invoke-static {p0}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->x(Lcom/p1/mobile/putong/ui/share/ShareHelper;)V

    return-void
.end method
