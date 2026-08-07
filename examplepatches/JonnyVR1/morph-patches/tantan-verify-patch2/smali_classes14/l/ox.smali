.class public final synthetic Ll/ox;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/tx$a;


# direct methods
.method public synthetic constructor <init>(Ll/tx$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ox;->a:Ll/tx$a;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ox;->a:Ll/tx$a;

    invoke-static {p0}, Ll/tx$a;->a(Ll/tx$a;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
