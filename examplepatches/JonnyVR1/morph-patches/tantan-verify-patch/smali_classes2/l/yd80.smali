.class public final synthetic Ll/yd80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/d0c$c;


# direct methods
.method public synthetic constructor <init>(Ll/d0c$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yd80;->a:Ll/d0c$c;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yd80;->a:Ll/d0c$c;

    check-cast p1, Ljava/lang/Exception;

    invoke-static {p0, p1}, Ll/zd80;->d(Ll/d0c$c;Ljava/lang/Exception;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
