.class public final synthetic Ll/v5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/x5f;

.field public final synthetic b:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Ll/x5f;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v5f;->a:Ll/x5f;

    iput-object p2, p0, Ll/v5f;->b:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v5f;->a:Ll/x5f;

    iget-object p0, p0, Ll/v5f;->b:Landroid/content/Context;

    invoke-static {v0, p0}, Ll/x5f;->k(Ll/x5f;Landroid/content/Context;)V

    return-void
.end method
