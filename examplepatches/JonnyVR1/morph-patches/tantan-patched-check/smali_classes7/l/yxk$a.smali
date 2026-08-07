.class Ll/yxk$a;
.super Landroid/database/ContentObserver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/yxk;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/yxk;


# direct methods
.method public constructor <init>(Ll/yxk;Landroid/os/Handler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yxk$a;->a:Ll/yxk;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yxk$a;->a:Ll/yxk;

    .line 2
    .line 3
    invoke-static {p0}, Ll/yxk;->b(Ll/yxk;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Ll/yxk;->c(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-static {p0, p1}, Ll/yxk;->a(Ll/yxk;Z)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method
