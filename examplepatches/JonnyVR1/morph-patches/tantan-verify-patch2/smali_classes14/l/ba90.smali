.class public final synthetic Ll/ba90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fa90;


# direct methods
.method public synthetic constructor <init>(Ll/fa90;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ba90;->a:Ll/fa90;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ba90;->a:Ll/fa90;

    check-cast p1, Lcom/p1/mobile/putong/data/PayMethod;

    invoke-static {p0, p1}, Ll/fa90;->r(Ll/fa90;Lcom/p1/mobile/putong/data/PayMethod;)V

    return-void
.end method
