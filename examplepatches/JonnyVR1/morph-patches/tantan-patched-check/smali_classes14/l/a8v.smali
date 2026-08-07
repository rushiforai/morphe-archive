.class public final synthetic Ll/a8v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/h8v;


# direct methods
.method public synthetic constructor <init>(Ll/h8v;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a8v;->a:Ll/h8v;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a8v;->a:Ll/h8v;

    check-cast p1, Lcom/p1/mobile/putong/data/PushMessage;

    invoke-static {p0, p1}, Ll/h8v;->C2(Ll/h8v;Lcom/p1/mobile/putong/data/PushMessage;)V

    return-void
.end method
