.class public final synthetic Ll/b1t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/f1t;


# direct methods
.method public synthetic constructor <init>(Ll/f1t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b1t;->a:Ll/f1t;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b1t;->a:Ll/f1t;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {p0, p1}, Ll/f1t;->M3(Ll/f1t;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
