.class public final synthetic Ll/lzh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ozh;


# direct methods
.method public synthetic constructor <init>(Ll/ozh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lzh;->a:Ll/ozh;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lzh;->a:Ll/ozh;

    check-cast p1, Lcom/p1/mobile/putong/data/Emotion;

    invoke-static {p0, p1}, Ll/ozh;->c(Ll/ozh;Lcom/p1/mobile/putong/data/Emotion;)V

    return-void
.end method
