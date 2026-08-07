.class public final synthetic Ll/daf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/eaf0;


# direct methods
.method public synthetic constructor <init>(Ll/eaf0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/daf0;->a:Ll/eaf0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/daf0;->a:Ll/eaf0;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {p0, p1}, Ll/eaf0;->f0(Ll/eaf0;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
