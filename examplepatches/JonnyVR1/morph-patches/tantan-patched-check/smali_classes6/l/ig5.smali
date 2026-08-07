.class public final synthetic Ll/ig5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/sg5;

.field public final synthetic b:Landroid/os/Bundle;


# direct methods
.method public synthetic constructor <init>(Ll/sg5;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ig5;->a:Ll/sg5;

    iput-object p2, p0, Ll/ig5;->b:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ig5;->a:Ll/sg5;

    iget-object p0, p0, Ll/ig5;->b:Landroid/os/Bundle;

    invoke-static {v0, p0}, Ll/sg5;->J(Ll/sg5;Landroid/os/Bundle;)V

    return-void
.end method
