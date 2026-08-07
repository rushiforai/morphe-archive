.class public final synthetic Ll/f3e0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f3e0;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/f3e0;->b:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f3e0;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/f3e0;->b:Landroid/content/Context;

    check-cast p1, Lcom/p1/mobile/putong/data/CommonData;

    invoke-static {v0, p0, p1}, Ll/h3e0;->f(Ljava/lang/String;Landroid/content/Context;Lcom/p1/mobile/putong/data/CommonData;)V

    return-void
.end method
