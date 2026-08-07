.class public final synthetic Ll/t2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v2;


# direct methods
.method public synthetic constructor <init>(Ll/v2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t2;->a:Ll/v2;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t2;->a:Ll/v2;

    check-cast p1, Lcom/p1/mobile/putong/data/AiTranslateResultData;

    invoke-static {p0, p1}, Ll/v2;->H(Ll/v2;Lcom/p1/mobile/putong/data/AiTranslateResultData;)V

    return-void
.end method
