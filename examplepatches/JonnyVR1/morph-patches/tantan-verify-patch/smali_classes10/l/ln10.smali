.class public final synthetic Ll/ln10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/sn10;


# direct methods
.method public synthetic constructor <init>(Ll/sn10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ln10;->a:Ll/sn10;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ln10;->a:Ll/sn10;

    invoke-static {p0}, Ll/sn10;->N3(Ll/sn10;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
