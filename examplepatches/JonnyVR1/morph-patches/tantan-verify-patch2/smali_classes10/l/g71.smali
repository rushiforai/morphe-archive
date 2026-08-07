.class public final synthetic Ll/g71;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/i71;


# direct methods
.method public synthetic constructor <init>(Ll/i71;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g71;->a:Ll/i71;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g71;->a:Ll/i71;

    check-cast p1, Lcom/p1/mobile/putong/data/Meta;

    invoke-static {p0, p1}, Ll/i71;->N3(Ll/i71;Lcom/p1/mobile/putong/data/Meta;)V

    return-void
.end method
