.class public final synthetic Ll/ox40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/px40;


# direct methods
.method public synthetic constructor <init>(Ll/px40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ox40;->a:Ll/px40;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ox40;->a:Ll/px40;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/px40;->e0(Ll/px40;Landroid/os/Bundle;)V

    return-void
.end method
