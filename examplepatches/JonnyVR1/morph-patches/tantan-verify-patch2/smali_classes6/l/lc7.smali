.class public final synthetic Ll/lc7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lc7;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lc7;->a:Ljava/lang/String;

    invoke-static {p0}, Lcom/p1/mobile/putong/feed/api/a;->I0(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DbLinks;

    move-result-object p0

    return-object p0
.end method
