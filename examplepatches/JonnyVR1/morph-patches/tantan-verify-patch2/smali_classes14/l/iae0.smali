.class public final synthetic Ll/iae0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Landroid/app/Activity;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iae0;->a:Landroid/app/Activity;

    iput-object p2, p0, Ll/iae0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iae0;->a:Landroid/app/Activity;

    iget-object p0, p0, Ll/iae0;->b:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroup;

    invoke-static {v0, p0, p1}, Ll/kae0;->e(Landroid/app/Activity;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    return-void
.end method
