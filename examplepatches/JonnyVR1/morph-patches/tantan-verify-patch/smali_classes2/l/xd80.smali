.class public final synthetic Ll/xd80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/d0c$c;


# direct methods
.method public synthetic constructor <init>(Ll/d0c$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xd80;->a:Ll/d0c$c;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xd80;->a:Ll/d0c$c;

    invoke-static {p0}, Ll/zd80;->c(Ll/d0c$c;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
