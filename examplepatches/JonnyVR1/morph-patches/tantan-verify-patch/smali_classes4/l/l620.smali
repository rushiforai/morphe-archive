.class public final synthetic Ll/l620;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/m620;


# direct methods
.method public synthetic constructor <init>(Ll/m620;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l620;->a:Ll/m620;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l620;->a:Ll/m620;

    check-cast p1, Lcom/p1/mobile/putong/core/data/MyTabTask;

    invoke-static {p0, p1}, Ll/m620;->C0(Ll/m620;Lcom/p1/mobile/putong/core/data/MyTabTask;)V

    return-void
.end method
