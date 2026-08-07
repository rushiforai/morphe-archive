.class public final synthetic Ll/thw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Ll/sni0;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Ll/sni0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/thw0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/thw0;->b:Ll/sni0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/thw0;->a:Landroid/content/Context;

    .line 2
    .line 3
    iget-object p0, p0, Ll/thw0;->b:Ll/sni0;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const-string v2, "GLAS"

    .line 7
    .line 8
    invoke-static {v0, v2, v1}, Ll/xjw0;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ll/xjw0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Ll/sni0;->c(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
