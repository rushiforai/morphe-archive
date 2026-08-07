.class public final synthetic Ll/zgb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/dkb;

.field public final synthetic b:Ll/pcj;


# direct methods
.method public synthetic constructor <init>(Ll/dkb;Ll/pcj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zgb;->a:Ll/dkb;

    iput-object p2, p0, Ll/zgb;->b:Ll/pcj;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zgb;->a:Ll/dkb;

    iget-object p0, p0, Ll/zgb;->b:Ll/pcj;

    invoke-static {v0, p0}, Ll/dkb;->p3(Ll/dkb;Ll/pcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
