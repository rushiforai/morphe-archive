.class public final Ll/zkx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kdx0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/kdx0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    new-instance v0, Ll/zmx0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/zmx0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/zkx0;->a:Landroid/content/Context;

    .line 14
    .line 15
    iput-object v0, p0, Ll/zkx0;->b:Ll/kdx0;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final bridge synthetic zza()Ll/fex0;
    .locals 2

    .line 1
    new-instance v0, Ll/cmx0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/zkx0;->b:Ll/kdx0;

    .line 4
    .line 5
    check-cast v1, Ll/zmx0;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/zmx0;->f()Ll/wqx0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object p0, p0, Ll/zkx0;->a:Landroid/content/Context;

    .line 12
    .line 13
    invoke-direct {v0, p0, v1}, Ll/cmx0;-><init>(Landroid/content/Context;Ll/fex0;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method
