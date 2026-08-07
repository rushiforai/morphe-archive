.class public final synthetic Ll/i5v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/l5v;


# direct methods
.method public synthetic constructor <init>(Ll/l5v;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i5v;->a:Ll/l5v;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i5v;->a:Ll/l5v;

    invoke-static {p0}, Ll/l5v;->d(Ll/l5v;)Lcom/p1/mobile/putong/core/newui/home/views/SuperLikeBanner;

    move-result-object p0

    return-object p0
.end method
