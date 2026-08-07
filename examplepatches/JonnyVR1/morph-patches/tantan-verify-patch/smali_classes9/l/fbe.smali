.class public final synthetic Ll/fbe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/Integer;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fbe;->a:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fbe;->a:Ljava/lang/Integer;

    check-cast p1, Ll/y20;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->k0(Ljava/lang/Integer;Ll/y20;)V

    return-void
.end method
