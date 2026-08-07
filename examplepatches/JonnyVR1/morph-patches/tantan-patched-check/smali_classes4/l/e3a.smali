.class public final synthetic Ll/e3a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/g3a;


# direct methods
.method public synthetic constructor <init>(Ll/g3a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e3a;->a:Ll/g3a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e3a;->a:Ll/g3a;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Ll/g3a;->a(Ll/g3a;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
