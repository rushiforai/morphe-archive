.class public final synthetic Ll/w4b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/CommonData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/CommonData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w4b;->a:Lcom/p1/mobile/putong/data/CommonData;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w4b;->a:Lcom/p1/mobile/putong/data/CommonData;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->J4(Lcom/p1/mobile/putong/data/CommonData;)V

    return-void
.end method
