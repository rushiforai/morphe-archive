.class public final synthetic Ll/qtx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/nyx0;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/nyx0;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qtx0;->a:Ll/nyx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/qtx0;->b:Landroid/content/Context;

    .line 7
    .line 8
    const-string p1, "admob"

    .line 9
    .line 10
    iput-object p1, p0, Ll/qtx0;->c:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qtx0;->a:Ll/nyx0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/qtx0;->b:Landroid/content/Context;

    .line 4
    .line 5
    iget-object p0, p0, Ll/qtx0;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Ll/nyx0;->x(Landroid/content/Context;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
