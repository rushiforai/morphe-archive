.class public Ll/n55$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/n55;->O()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/n55;


# direct methods
.method public constructor <init>(Ll/n55;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/n55$c;->a:Ll/n55;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public call()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/n55$c;->a:Ll/n55;

    .line 2
    .line 3
    invoke-static {v0}, Ll/n55;->D(Ll/n55;)Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->h()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/n55$c;->a:Ll/n55;

    .line 11
    .line 12
    iget-object v0, p0, Ll/n55;->s:Lcom/p1/mobile/putong/core/data/CityCData;

    .line 13
    .line 14
    iget-object v1, p0, Ll/n55;->t:Lcom/p1/mobile/putong/core/data/CityCBanner;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    const/4 v3, 0x5

    .line 18
    invoke-static {p0, v3, v0, v1, v2}, Ll/n55;->E(Ll/n55;ILcom/p1/mobile/putong/core/data/CityCData;Lcom/p1/mobile/putong/core/data/CityCBanner;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
