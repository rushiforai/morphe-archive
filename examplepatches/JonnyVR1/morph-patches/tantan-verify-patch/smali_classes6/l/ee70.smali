.class public final synthetic Ll/ee70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/je70;


# direct methods
.method public synthetic constructor <init>(Ll/je70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ee70;->a:Ll/je70;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ee70;->a:Ll/je70;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {p0, p1}, Ll/je70;->j0(Ll/je70;Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method
