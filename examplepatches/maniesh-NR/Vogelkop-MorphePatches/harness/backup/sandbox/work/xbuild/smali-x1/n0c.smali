.class public final Ln0c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw7e;


# instance fields
.field public final a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Ln0c;->a:Landroid/content/Context;

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Z)V
    .registers 3

    .line 10
    iput-object p1, p0, Ln0c;->a:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final w(Ld5o;)Lv7e;
    .registers 3

    new-instance p1, Lbsd;

    iget-object p0, p0, Ln0c;->a:Landroid/content/Context;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lbsd;-><init>(Landroid/content/Context;B)V

    return-object p1
.end method
