.class public final synthetic Ll/n2a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/util/HashSet;


# direct methods
.method public synthetic constructor <init>(Ljava/util/HashSet;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n2a;->a:Ljava/util/HashSet;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n2a;->a:Ljava/util/HashSet;

    check-cast p1, Lcom/p1/mobile/putong/data/Tag;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->l(Ljava/util/HashSet;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
