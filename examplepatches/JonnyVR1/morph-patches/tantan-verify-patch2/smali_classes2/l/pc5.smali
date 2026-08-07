.class public final synthetic Ll/pc5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Landroid/os/Bundle;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pc5;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/pc5;->b:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pc5;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/pc5;->b:Landroid/os/Bundle;

    invoke-static {v0, p0}, Ll/qc5;->a(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method
