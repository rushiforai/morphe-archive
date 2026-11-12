.class public final Lahd;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public b:Z

.field public c:Lh61;

.field public d:S

.field public e:Landroid/os/Handler;

.field public f:Lmi8;

.field public g:B


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lahd;->a:Landroid/content/Context;

    new-instance v0, Lh61;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lh61;-><init>(Landroid/content/Context;Z)V

    iput-object v0, p0, Lahd;->c:Lh61;

    return-void
.end method
