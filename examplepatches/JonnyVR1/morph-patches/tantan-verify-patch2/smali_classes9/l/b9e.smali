.class public final synthetic Ll/b9e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/f9e$a;


# direct methods
.method public synthetic constructor <init>(Ll/f9e$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b9e;->a:Ll/f9e$a;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b9e;->a:Ll/f9e$a;

    invoke-static {p0}, Ll/f9e;->a(Ll/f9e$a;)Lcom/p1/mobile/putong/live/base/data/Priority;

    move-result-object p0

    return-object p0
.end method
