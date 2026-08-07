.class public final synthetic Ll/vgk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vgk0;->a:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vgk0;->a:Ljava/lang/Runnable;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedBaseLayout;->k1(Ljava/lang/Runnable;Ljava/lang/Throwable;)V

    return-void
.end method
