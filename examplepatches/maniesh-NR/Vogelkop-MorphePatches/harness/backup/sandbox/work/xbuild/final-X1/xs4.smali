.class public abstract Lxs4;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lc5o;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lc5o;

    sget-object v1, Lht5;->a:Landroid/content/SharedPreferences;

    new-instance v2, Lws4;

    invoke-static {}, Lwub;->D()Lwub;

    move-result-object v3

    sget-object v4, Lt8;->a:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lws4;-><init>(Lwub;Landroid/content/res/Resources;)V

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lc5o;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    sput-object v0, Lxs4;->a:Lc5o;

    return-void
.end method
