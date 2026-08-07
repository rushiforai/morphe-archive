.class public Ll/ach$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ach;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ach;


# direct methods
.method public constructor <init>(Ll/ach;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ach$a;->a:Ll/ach;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/ach$a;->a:Ll/ach;

    .line 6
    .line 7
    iget-object v0, v0, Ll/ach;->b:Ll/pbh;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/p7;->j()V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 13
    .line 14
    iget-object p0, p0, Ll/ach$a;->a:Ll/ach;

    .line 15
    .line 16
    invoke-static {p0}, Ll/ach;->e(Ll/ach;)Ljava/lang/Runnable;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-wide/32 v1, 0xea60

    .line 21
    .line 22
    .line 23
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method
