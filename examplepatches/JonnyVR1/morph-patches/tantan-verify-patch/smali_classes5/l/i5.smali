.class public final synthetic Ll/i5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/l5;


# direct methods
.method public synthetic constructor <init>(Ll/l5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i5;->a:Ll/l5;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i5;->a:Ll/l5;

    check-cast p1, Lcom/p1/mobile/putong/data/PayMethod;

    invoke-static {p0, p1}, Ll/l5;->g(Ll/l5;Lcom/p1/mobile/putong/data/PayMethod;)V

    return-void
.end method
