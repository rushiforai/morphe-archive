.class public final synthetic Ll/ryd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Ljava/util/Map;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ryd;->a:Landroid/content/Context;

    iput-object p2, p0, Ll/ryd;->b:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ryd;->a:Landroid/content/Context;

    iget-object p0, p0, Ll/ryd;->b:Ljava/util/Map;

    invoke-static {v0, p0}, Ll/uyd;->a(Landroid/content/Context;Ljava/util/Map;)V

    return-void
.end method
