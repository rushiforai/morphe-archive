.class public final synthetic Ll/qhy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public synthetic a:Ll/pgy0;

.field public synthetic b:I

.field public synthetic c:Ll/d6x0;

.field public synthetic d:Landroid/content/Intent;


# direct methods
.method public synthetic constructor <init>(Ll/pgy0;ILl/d6x0;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qhy0;->a:Ll/pgy0;

    .line 5
    .line 6
    iput p2, p0, Ll/qhy0;->b:I

    .line 7
    .line 8
    iput-object p3, p0, Ll/qhy0;->c:Ll/d6x0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/qhy0;->d:Landroid/content/Intent;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qhy0;->a:Ll/pgy0;

    .line 2
    .line 3
    iget v1, p0, Ll/qhy0;->b:I

    .line 4
    .line 5
    iget-object v2, p0, Ll/qhy0;->c:Ll/d6x0;

    .line 6
    .line 7
    iget-object p0, p0, Ll/qhy0;->d:Landroid/content/Intent;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, p0}, Ll/pgy0;->d(ILl/d6x0;Landroid/content/Intent;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
