.class public final synthetic Ll/n0n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/p0n;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Ll/zzm;


# direct methods
.method public synthetic constructor <init>(Ll/p0n;Landroid/view/View;Ll/zzm;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n0n;->a:Ll/p0n;

    iput-object p2, p0, Ll/n0n;->b:Landroid/view/View;

    iput-object p3, p0, Ll/n0n;->c:Ll/zzm;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n0n;->a:Ll/p0n;

    iget-object v1, p0, Ll/n0n;->b:Landroid/view/View;

    iget-object p0, p0, Ll/n0n;->c:Ll/zzm;

    check-cast p1, Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-static {v0, v1, p0, p1}, Ll/p0n;->o(Ll/p0n;Landroid/view/View;Ll/zzm;Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    return-void
.end method
