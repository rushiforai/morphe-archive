.class public final synthetic Ll/g170;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/i170;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/i170;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g170;->a:Ll/i170;

    iput-object p2, p0, Ll/g170;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g170;->a:Ll/i170;

    iget-object p0, p0, Ll/g170;->b:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/data/AccountErrorResponse;

    invoke-static {v0, p0, p1}, Ll/i170;->e0(Ll/i170;Ljava/lang/String;Lcom/p1/mobile/putong/data/AccountErrorResponse;)V

    return-void
.end method
