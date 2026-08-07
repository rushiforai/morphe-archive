.class public final synthetic Ll/n8k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/p8k0;


# direct methods
.method public synthetic constructor <init>(Ll/p8k0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n8k0;->a:Ll/p8k0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n8k0;->a:Ll/p8k0;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {p0, p1}, Ll/p8k0;->j4(Ll/p8k0;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
