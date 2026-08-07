.class public final synthetic Ll/pj00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/nk00;


# direct methods
.method public synthetic constructor <init>(Ll/nk00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pj00;->a:Ll/nk00;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pj00;->a:Ll/nk00;

    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    invoke-static {p0, p1}, Ll/nk00;->j(Ll/nk00;Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method
