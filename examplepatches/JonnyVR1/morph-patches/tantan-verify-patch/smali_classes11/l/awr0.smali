.class public final synthetic Ll/awr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/w2i0;

.field public final synthetic b:Landroid/os/Bundle;

.field public final synthetic c:Ll/yvb0;


# direct methods
.method public synthetic constructor <init>(Ll/w2i0;Landroid/os/Bundle;Ll/yvb0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/awr0;->a:Ll/w2i0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/awr0;->b:Landroid/os/Bundle;

    .line 7
    .line 8
    iput-object p3, p0, Ll/awr0;->c:Ll/yvb0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/awr0;->a:Ll/w2i0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/awr0;->b:Landroid/os/Bundle;

    .line 4
    .line 5
    iget-object p0, p0, Ll/awr0;->c:Ll/yvb0;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Ll/w2i0;->b(Landroid/os/Bundle;Ll/yvb0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
