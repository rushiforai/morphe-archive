.class public final Ll/dlg0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static c:Ll/dlg0;


# instance fields
.field public final a:Ll/cmg0;

.field public final b:Ll/glg0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/olg0;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/olg0;-><init>(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/cmg0;

    .line 10
    .line 11
    invoke-direct {v1, p1, v0}, Ll/cmg0;-><init>(Landroid/content/Context;Ll/olg0;)V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Ll/dlg0;->a:Ll/cmg0;

    .line 15
    .line 16
    new-instance v1, Ll/glg0;

    .line 17
    .line 18
    invoke-direct {v1, p1, v0}, Ll/glg0;-><init>(Landroid/content/Context;Ll/olg0;)V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Ll/dlg0;->b:Ll/glg0;

    .line 22
    .line 23
    return-void
.end method
