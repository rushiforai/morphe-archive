.class public final synthetic Ll/uz00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/c010;


# direct methods
.method public synthetic constructor <init>(Ll/c010;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uz00;->a:Ll/c010;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uz00;->a:Ll/c010;

    invoke-static {p0}, Ll/c010;->k0(Ll/c010;)Lcom/p1/mobile/putong/feed/data/Moment;

    move-result-object p0

    return-object p0
.end method
