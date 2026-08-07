.class public final synthetic Ll/ns50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/z20;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/z20;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ns50;->a:Ll/z20;

    iput-object p2, p0, Ll/ns50;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ns50;->a:Ll/z20;

    iget-object p0, p0, Ll/ns50;->b:Ljava/util/List;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/OnlineMatchDlgView;->S(Ll/z20;Ljava/util/List;)V

    return-void
.end method
