.class public final synthetic Ll/ia80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ja80;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/ja80;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ia80;->a:Ll/ja80;

    iput-object p2, p0, Ll/ia80;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ia80;->a:Ll/ja80;

    iget-object p0, p0, Ll/ia80;->b:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;

    invoke-static {v0, p0, p1}, Ll/ja80;->e0(Ll/ja80;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;)Ll/ka80;

    move-result-object p0

    return-object p0
.end method
